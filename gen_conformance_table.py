#!/usr/bin/env python3
"""Generate a by-actor conformance table for a narrative page, and audit the
hand-written quick-reference matrix against the rules found on the page.

    ./gen_conformance_table.py                 # writing-documents, write + audit
    ./gen_conformance_table.py --check         # write nothing; exit 1 if stale
    ./gen_conformance_table.py --page foo      # another page under input/pagecontent

What it does

1. Parses the page for normative bullets: a "**Client Requirements**",
   "**Server Requirements**" or "**Requirements**" block sets the actor, and any
   bullet under it carrying a bolded RFC 2119 verb is a rule. Bullets in the
   per-mode "Additional Rules and Guidance for X" subsections use a different
   shape -- the verb sits mid-sentence -- so the actor is read from the sentence.
2. Assigns each rule a stable ID from an append-only registry
   (input/data/<page>-requirements.csv). IDs are never renumbered: a reworded
   rule keeps its ID through a close-match lookup, a deleted rule's row is kept
   and marked retired, and only an unseen rule draws a new number. Sequential
   numbering at generation time would silently invalidate every tracker or test
   plan citing an ID.
3. Rewrites the table between the generated markers in the page.
4. Audits the hand-written quick-reference matrix, which is deliberately NOT
   generated: deciding that a rule is solicited-only is judgment about scope,
   and nothing in the markup states it. The audit reports mode-specific rules
   with no matrix row, and matrix rows whose code tokens have left the page.

Table and matrix cells escape "|" because kramdown splits a table row on pipes
before inline code spans are parsed (see ../CLAUDE.md).
"""

import argparse
import csv
import difflib
import re
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parent

VERB_RE = re.compile(r"\*\*(SHALL NOT|SHALL|SHOULD NOT|SHOULD|MAY NOT|MAY)\*\*")
BULLET_RE = re.compile(r"^\s*[-*]\s+(\S.*)$")
HEADING_RE = re.compile(r"^(#{1,6})\s+(.*?)\s*$")
REQ_BLOCK_RE = re.compile(r"^\*\*(?:(Client|Server)\s+)?Requirements\*\*\s*$")
BOLD_ONLY_RE = re.compile(r"^\*\*[^*].*?\*\*\s*$")
MODE_HEADING_RE = re.compile(r"^Additional Rules and Guidance for\s+(.*)$")
CODE_SPAN_RE = re.compile(r"`([^`]+)`")

# A statement is flagged conditional when its text carries a precondition: a
# "when"/"if"/"unless"/"where" clause, a purpose clause ("To supersede a
# document, clients SHOULD ..."), or a qualified subject ("Servers that allow
# status correction ... SHALL ..."). The flag is a seed, not an oracle -- it is
# written to the registry once and a hand-edited value there is never
# overwritten, so a wrong call is corrected in one place and stays corrected.
CONDITIONAL_RES = [
    re.compile(r"\bwhen\b", re.I),
    re.compile(r"\bif\b", re.I),
    re.compile(r"\bunless\b", re.I),
    re.compile(r"\bwhere\b", re.I),
    re.compile(r"^To\s+\w+", re.I),
    re.compile(r"\b(?:Servers?|Clients?)\s+that\b", re.I),
]


def detect_conditional(text):
    # Code spans first: "conditional create (`If-None-Exist`)" is not a
    # conditional statement, it just contains the word in a header name.
    bare = CODE_SPAN_RE.sub(" ", text)
    return any(rx.search(bare) for rx in CONDITIONAL_RES)

# Matches the green check already used for the IPA/IPS ratings on
# relationship-with-other-igs.md, so the glyph is consistent across the IG.
CHECK = '<span style="color:green; font-size:1.5em">&#10004;</span>'

# Short mode codes for the conformance table. A rule picks up a code only from
# the per-mode section it sits in; a rule stated in a general section is ALL
# even when a reader would scope it tighter, because nothing in the markup says
# so. Override "mode_code" in the registry to scope one by hand.
MODE_CODES = {
    "Provider Write": "PROV",
    "Solicited Patient Write": "SPAT",
    "Unsolicited Patient Write": "UPAT",
}

# PAT covers both patient modes. No section derives it -- a statement that
# spans the two patient modes always sits in a general section -- so it only
# ever arrives as a hand-set "mode_code" in the registry.
VALID_MODE_CODES = {"ALL", "PROV", "SPAT", "UPAT", "PAT"}

BEGIN = "<!-- BEGIN generated conformance table -- gen_conformance_table.py: edit the requirement bullets above, not this table -->"
END = "<!-- END generated conformance table -->"

STOPWORDS = {
    "the", "a", "an", "and", "or", "of", "to", "for", "in", "on", "with", "that",
    "their", "they", "it", "its", "is", "are", "be", "been", "when", "whether",
    "both", "at", "least", "one", "by", "as", "not", "no", "any", "all", "from",
    "servers", "server", "clients", "client", "shall", "should", "may",
}


def anchor(title):
    """kramdown's auto id: lowercase, drop punctuation, spaces to hyphens."""
    text = re.sub(r"[^a-z0-9 _-]", "", title.lower())
    return re.sub(r"-{2,}", "-", text.replace(" ", "-")).strip("-")


def norm(text):
    """Normalized key for registry lookup: wording-stable, markup-insensitive."""
    text = re.sub(r"[`*_\[\]]", "", text.lower())
    text = re.sub(r"\(#[^)]*\)", "", text)
    return re.sub(r"[^a-z0-9 ]", " ", text).strip()


def esc(cell):
    return cell.replace("|", r"\|")


def code_tokens(text):
    out = set()
    for span in CODE_SPAN_RE.findall(text):
        out.add(span.strip().lower())
    return out


def keywords(text):
    words = re.findall(r"[a-z0-9.]{3,}", norm(text))
    return {w for w in words if w not in STOPWORDS}


class Rule:
    def __init__(self, text, actor, verb, section, section_anchor, mode, flagged, line):
        self.text = text
        self.actor = actor
        self.verb = verb
        self.section = section
        self.section_anchor = section_anchor
        self.mode = mode
        self.flagged = flagged      # inside a bg-warning / bg-info block
        self.line = line
        # Scoped key: the same sentence appears verbatim under more than one
        # section or mode (the PATAST rules, for example), and a text-only key
        # would hand both occurrences the same ID and retire a live row.
        self.key = norm(text) + " :: " + norm(mode or section)
        self.conditional_auto = "Yes" if detect_conditional(text) else ""
        self.conditional = self.conditional_auto
        self.mode_code_auto = MODE_CODES.get(mode, "ALL")
        self.mode_code = self.mode_code_auto
        self.id = None


def parse(lines):
    """Walk the page, returning (rules, matrix_rows, heading_titles)."""
    rules, matrix_rows, titles = [], [], []
    headings = {}
    block_actor = None
    mode = None
    section = section_anchor = ""
    flagged = in_comment = in_mermaid = 0
    in_matrix = False

    for n, raw in enumerate(lines, start=1):
        line = raw.rstrip()
        stripped = line.strip()

        # --- raw-HTML and comment regions -------------------------------
        if in_comment:
            in_comment = 0 if "-->" in stripped else 1
            continue
        if stripped.startswith("<!--") and "-->" not in stripped:
            in_comment = 1
            continue
        if in_mermaid:
            if "</div>" in stripped:
                in_mermaid = 0
            continue
        if 'class="mermaid"' in stripped:
            in_mermaid = 1
            continue
        if 'class="bg-warning"' in stripped or 'class="bg-info"' in stripped:
            flagged = 1
            continue
        if stripped.startswith("</div>"):
            flagged = 0
            continue

        # --- headings ---------------------------------------------------
        m = HEADING_RE.match(line)
        if m:
            level, title = len(m.group(1)), m.group(2)
            headings[level] = title
            for deeper in [k for k in headings if k > level]:
                headings.pop(deeper)
            titles.append(title)
            block_actor = None
            in_matrix = title.lower().startswith("quick-reference")
            mm = MODE_HEADING_RE.match(title)
            mode = mm.group(1) if mm else None
            # Section cell: the deepest heading at h4 or h5 -- h6 is the
            # per-mode "Additional Rules" wrapper, whose h5 names the mode.
            for lvl in (5, 4, 3):
                if lvl in headings:
                    section = headings[lvl]
                    section_anchor = anchor(section)
                    break
            continue

        if in_matrix:
            if stripped.startswith("|") and not re.match(r"^\|[\s|:-]+\|?$", stripped):
                cells = [c.strip() for c in stripped.strip("|").split("|")]
                if cells and cells[0].lower() != "rule":
                    matrix_rows.append(cells)
            continue

        # Table rows and bold-only labels are never rules. A bold label such as
        # "**Guidance**" ends the current requirements block.
        if stripped.startswith("|") or stripped.startswith("{:"):
            continue
        if REQ_BLOCK_RE.match(stripped):
            block_actor = REQ_BLOCK_RE.match(stripped).group(1)
            continue
        if BOLD_ONLY_RE.match(stripped):
            block_actor = None
            continue
        if stripped in ("---", ""):
            continue

        b = BULLET_RE.match(line)
        if not b:
            continue
        text = b.group(1).strip()
        v = VERB_RE.search(text)
        if not v:
            continue

        actor = block_actor
        if actor is None:
            before = text[: v.start()]
            who = re.search(r"\b(Servers?|Clients?)\b", before, re.I) or re.search(
                r"\b(Servers?|Clients?)\b", text, re.I
            )
            actor = who.group(1).rstrip("s").capitalize() if who else "Unspecified"

        plain = VERB_RE.sub(lambda mo: mo.group(1), text)
        rules.append(
            Rule(plain, actor, v.group(1), section, section_anchor, mode, bool(flagged), n)
        )

    return rules, matrix_rows, titles


def load_registry(path):
    if not path.exists():
        return []
    with path.open(newline="", encoding="utf-8") as fh:
        return list(csv.DictReader(fh))


def assign_ids(rules, registry, prefix):
    """Append-only ID assignment. Exact key, then close match, then a new number."""
    by_key = {r["key"]: r for r in registry}
    used = set()
    seen_ids = set()
    report = {"new": [], "reworded": [], "retired": []}

    for rule in rules:
        row = by_key.get(rule.key)
        if row is not None and row["key"] in used:
            row = None
        if row is None:
            pool = [
                r for r in registry
                if r["actor"] == rule.actor and r["key"] not in used
            ]
            match = difflib.get_close_matches(
                rule.key, [r["key"] for r in pool], n=1, cutoff=0.9
            )
            if match:
                row = next(r for r in pool if r["key"] == match[0])
                report["reworded"].append((row["id"], row["requirement"], rule.text))
        if row is not None:
            rule.id = row["id"]
            # The registry keeps both the effective flag and the value the
            # detector produced when the row was written. Equal means nobody
            # touched it, so it is re-seeded from the current detection;
            # different means a human edited "conditional", and that edit wins
            # for good. No "manual" bookkeeping column for the author to set.
            stored = (row.get("conditional") or "").strip()
            stored_auto = (row.get("conditional_auto") or "").strip()
            if stored != stored_auto:
                rule.conditional = (
                    "" if stored.lower() in ("no", "-", "none", "") else stored
                )
            m_stored = (row.get("mode_code") or "").strip().upper()
            m_auto = (row.get("mode_code_auto") or "").strip().upper()
            if m_stored and m_stored != m_auto:
                rule.mode_code = m_stored
            used.add(row["key"])
            seen_ids.add(row["id"])

    letter = {"Client": "C", "Server": "S"}
    nums = []
    for r in registry:
        m = re.search(r"-(\d+)$", r["id"])
        if m:
            nums.append(int(m.group(1)))
    nxt = max(nums, default=0) + 1
    for rule in rules:
        if rule.id is None:
            rule.id = f"{prefix}-{letter.get(rule.actor, 'X')}-{nxt:02d}"
            nxt += 1
            report["new"].append((rule.id, rule.text))
            seen_ids.add(rule.id)

    rows = []
    for rule in rules:
        rows.append({
            "id": rule.id,
            "actor": rule.actor,
            "conformance": rule.verb,
            "conditional": rule.conditional,
            "conditional_auto": rule.conditional_auto,
            "mode_code": rule.mode_code,
            "mode_code_auto": rule.mode_code_auto,
            "requirement": rule.text,
            "section": rule.section,
            "mode": rule.mode or "",
            "status": "active",
            "key": rule.key,
        })
    for r in registry:
        if r["id"] not in seen_ids:
            r["status"] = "retired"
            rows.append(r)
            report["retired"].append((r["id"], r["requirement"]))
    return rows, report


def render_table(rules):
    """The legend goes inside the generated block so it cannot drift from the
    columns it explains -- a legend edited by hand would survive a column
    change and start lying."""
    out = [
        "**Legend**",
        "",
        "* **Mode** - `ALL` applies to every submission mode. "
        "`PROV` [Provider Write](#provider-write), "
        "`SPAT` [Solicited Patient Write](#solicited-patient-write), "
        "`UPAT` [Unsolicited Patient Write](#unsolicited-patient-write), "
        "`PAT` both patient modes. "
        "A statement in a general section is `ALL` unless it is scoped tighter.",
        "* **Conformance** - the RFC 2119 verb as written in the statement.",
        "* **Conditional** - " + CHECK + " marks a statement with a precondition "
        "in its text, for example \"when it is held for review\". A \"-\" means "
        "the statement applies whenever its mode applies.",
    ]
    if any(r.flagged for r in rules):
        out.append(
            "* &dagger; - the statement sits in an unresolved block on this page "
            "and is not settled."
        )
    out += [
        "",
        "| ID | Actor | Mode | Conformance | Conditional | Requirement | Section |",
        "| --- | --- | --- | --- | --- | --- | --- |",
    ]
    order = {"Client": 0, "Server": 1, "Unspecified": 2}
    for rule in sorted(rules, key=lambda r: (order.get(r.actor, 9), r.id)):
        rid = f"{rule.id} &dagger;" if rule.flagged else rule.id
        out.append(
            f"| {rid} | {rule.actor} | {rule.mode_code} | **{rule.verb}** "
            f"| {CHECK if rule.conditional else '-'} | {esc(rule.text)} "
            f"| [{esc(rule.section)}](#{rule.section_anchor}) |"
        )
    out.append("{:.grid}")
    return "\n".join(out)


def splice(lines, table):
    """Replace the generated block, or create it in place of the stub."""
    text = "\n".join(lines)
    block = f"{BEGIN}\n\n{table}\n\n{END}"
    if BEGIN in text and END in text:
        head, rest = text.split(BEGIN, 1)
        _, tail = rest.split(END, 1)
        return (head + block + tail).split("\n")

    out, i, done = [], 0, False
    while i < len(lines):
        line = lines[i]
        out.append(line)
        m = HEADING_RE.match(line)
        if not done and m and m.group(2).strip().lower() == "conformance requirements":
            i += 1
            # keep the intro prose; drop a stub blockquote and stub table
            while i < len(lines):
                nxt = lines[i].strip()
                if HEADING_RE.match(lines[i]) or nxt == "---":
                    break
                if nxt.startswith(">") or nxt.startswith("|") or nxt.startswith("{:"):
                    i += 1
                    continue
                out.append(lines[i])
                i += 1
            while out and out[-1].strip() == "":
                out.pop()
            out += ["", block, ""]
            done = True
            continue
        i += 1
    if not done:
        sys.exit("error: no '#### Conformance Requirements' heading and no markers")
    return out


def audit(rules, matrix_rows, titles, page_text, preview):
    """Check the hand-written matrix against the rules, by cited ID.

    The matrix cites the IDs this script assigns, so coverage is an exact set
    comparison: every mode-scoped rule has to appear in the matrix, and every
    ID the matrix cites has to still exist. Nothing here infers which mode a
    rule belongs to -- that call stays with the author.
    """
    msgs = []
    by_id = {r.id: r for r in rules}
    cited = set()
    matrix_text = " ".join(" ".join(row) for row in matrix_rows)
    for token in re.findall(r"\b[A-Z]{2,4}-[A-Z]-\d+\b", matrix_text):
        cited.add(token)

    for rule in rules:
        if rule.mode_code != "ALL" and rule.id not in cited:
            msgs.append(
                "matrix: %s (%s) is mode-specific but the matrix does not cite it: %s"
                % (rule.id, rule.mode_code, rule.text[:70])
            )
    for token in sorted(cited):
        if token not in by_id:
            msgs.append(
                "matrix: cites %s, which no longer matches a rule on the page" % token
            )

    # Compare against the whole page with the matrix section itself removed --
    # a token that appears only inside the matrix is a stale citation.
    body = page_text
    head = body.find("#### Quick-reference Matrix")
    if head != -1:
        tail = body.find("\n---\n", head)
        body = body[:head] + (body[tail:] if tail != -1 else "")
    body_codes = code_tokens(body)
    for row in matrix_rows:
        for cell in row[1:]:
            stale = [t for t in code_tokens(cell) if t not in body_codes]
            if stale:
                msgs.append(
                    "matrix: row '%s' cites %s, not found elsewhere on the page"
                    % (row[1][:44], stale)
                )
                break

    for rule in rules:
        if rule.mode_code not in VALID_MODE_CODES:
            msgs.append(
                "invalid mode code '%s' on %s: expected one of %s"
                % (rule.mode_code, rule.id, ", ".join(sorted(VALID_MODE_CODES))))

    flagged_n = sum(1 for r in rules if r.conditional)
    msgs.append("conditional flags: %d of %d rules" % (flagged_n, len(rules)))
    for rule in rules:
        if rule.mode_code != rule.mode_code_auto:
            msgs.append(
                "mode override kept for %s (registry '%s', derived '%s')"
                % (rule.id, rule.mode_code, rule.mode_code_auto))
    for rule in rules:
        if rule.conditional != rule.conditional_auto:
            msgs.append(
                "conditional override kept for %s (registry '%s', detected '%s')"
                % (rule.id, rule.conditional or "-", rule.conditional_auto or "-"))

    seen_text = {}
    for rule in rules:
        seen_text.setdefault(norm(rule.text), []).append(rule)
    for text, group in sorted(seen_text.items()):
        if len(group) > 1:
            where = ", ".join("%s line %d" % (r.section, r.line) for r in group)
            msgs.append(
                "duplicate statement in %d places (%s): %s"
                % (len(group), where, group[0].text[:70]))

    for rule in rules:
        if rule.actor == "Unspecified":
            msgs.append("actor unresolved at line %d: %s" % (rule.line, rule.text[:80]))

    if preview.exists():
        html = preview.read_text(encoding="utf-8", errors="replace")
        for a in sorted(set(r.section_anchor for r in rules)):
            if 'id="%s"' % a not in html:
                msgs.append("anchor #%s is not in the rendered page" % a)
    else:
        msgs.append("note: no rendered page at %s, anchors unverified" % preview)
    return msgs


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--page", default="writing-documents")
    ap.add_argument("--prefix", default=None)
    ap.add_argument("--check", action="store_true", help="write nothing; exit 1 if stale")
    ap.add_argument("--no-audit", action="store_true")
    args = ap.parse_args()

    page = REPO / "input" / "pagecontent" / f"{args.page}.md"
    registry_path = REPO / "input" / "data" / f"{args.page}-requirements.csv"
    preview = REPO / "temp" / "jekyll-preview" / f"{args.page}.html"
    prefix = args.prefix or "".join(p[0] for p in args.page.split("-")).upper()

    data = page.read_bytes()
    eol = b"\r\n" if b"\r\n" in data else b"\n"
    lines = data.decode("utf-8").replace("\r\n", "\n").split("\n")

    rules, matrix_rows, titles = parse(lines)
    if not rules:
        sys.exit(f"error: no normative bullets found in {page}")

    registry = load_registry(registry_path)
    rows, report = assign_ids(rules, registry, prefix)
    table = render_table(rules)
    new_lines = splice(lines, table)
    new_page = eol.join(l.encode("utf-8") for l in new_lines)

    out = ["\n".join(f"{k}: {len(v)}" for k, v in report.items())]
    counts = {}
    for r in rules:
        counts[(r.actor, r.verb)] = counts.get((r.actor, r.verb), 0) + 1
    print(f"{len(rules)} rules: " + ", ".join(
        f"{a} {v} x{n}" for (a, v), n in sorted(counts.items())))
    for kind in ("new", "reworded", "retired"):
        for item in report[kind]:
            print(f"  {kind}: {item[0]} {str(item[1])[:70]}")

    stale = new_page != data
    if args.check:
        print("stale: table would change" if stale else "up to date")
    else:
        if stale:
            page.write_bytes(new_page)
            print(f"wrote {page}")
        else:
            print(f"{page} already current")
        fields = ["id", "actor", "conformance", "conditional", "conditional_auto",
                  "mode_code", "mode_code_auto", "requirement", "section",
                  "mode", "status", "key"]
        with registry_path.open("w", newline="", encoding="utf-8") as fh:
            w = csv.DictWriter(fh, fieldnames=fields, lineterminator="\n")
            w.writeheader()
            for row in sorted(rows, key=lambda r: r["id"]):
                w.writerow({k: row.get(k, "") for k in fields})
        print(f"wrote {registry_path} ({len(rows)} rows)")

    if not args.no_audit:
        msgs = audit(rules, matrix_rows, titles, "\n".join(lines), preview)
        print(f"\naudit: {len(msgs)} item(s)")
        for m in msgs:
            print(f"  {m}")

    if args.check and stale:
        sys.exit(1)


if __name__ == "__main__":
    main()
