### Purpose and Scope

This page defines a US Core approach to writing **clinical notes** using the FHIR R4 `DocumentReference` resource.

It complements the US Core **[Clinical Notes (read)][1]** guidance (which exposes notes via `DocumentReference` and certain `DiagnosticReport` categories) and adopts conventions used in **[Writing Vital Signs][2]** (SMART scopes, CapabilityStatement documentation, error semantics).

**In scope**

* Create (and optional update) of notes as `DocumentReference`.
* Two modes:
  * **Direct Write** (provider-initiated; immediate filing).
  * **Mediated Submission** (patient-asserted; server-governed review/promotion).
* Interoperable note typing (LOINC; at least the ten “Common Clinical Notes”).
* MIME and size expectations.
* “Little-p provenance” via native `DocumentReference` fields.
* SMART scopes and server capability discovery.

**Out of scope**

* Stateful/draft workflows (e.g., ambient scribing, continuous audio capture).
* No requirement for FHIR `transaction` support; a single `POST` suffices. FHIR Bundle transactions (type='transaction') are out of scope for this specification; clients SHALL rely on individual `POST`/`PUT` operations. However, servers MAY support transactions extensionally (e.g., for creating paired resources like `DocumentReference` + `DiagnosticReport`), and clients MAY use them where available.

---

### Relationship to US Core Clinical Notes (read)

US Core **Clinical Notes** requires servers to expose notes through `DocumentReference` and, for some content, also via `DiagnosticReport`.

This write guidance standardizes **writes via `DocumentReference`**. Servers **MAY** also create a paired `DiagnosticReport.presentedForm` to maintain read parity. ([US Core Clinical Notes][1])

---

### Modes of Operation

#### Direct Write

* Client `POST`s a `DocumentReference`.
* On success, the note **SHALL** be discoverable through normal search/read.

#### Mediated Submission (patient-asserted)

* Client `POST`s a `DocumentReference` with `meta.security` including **`PATAST`**.
* Server **MAY** hold the note for review/promotion.
* Server **MAY** inject `PATAST` by policy (e.g., based on authorization context), even if omitted by the client. Servers that inject **SHOULD** document the conditions.

---

### Required and Must-Support Elements (Expanded)

This write profile builds directly on the **US Core DocumentReference** profile.

#### References: Author and Encounter

* **Client requirement.** Clients **SHALL** be capable of populating `author` and `context.encounter` when known.
* **How to populate.** The `reference.reference` element SHALL contain either:

  * a **resolvable relative reference** to a resource on the target server (e.g., `"Practitioner/123"`), or
  * a **contained resource** reference (e.g., `"#prac1"`) when a resolvable reference is not possible.
* **Display.** Clients **SHOULD** also provide a `display` string for usability.
* **Server handling.** Servers **SHALL** accept either approach. They **SHOULD** attempt to match to existing entities, and **MAY** persist contained resource content at their discretion.
* **Non-blocking.** Servers **SHALL NOT** reject a submission solely because the reference cannot be resolved.

#### Author

* Acceptable resource types: `Practitioner`, `PractitionerRole`, `Organization`, `Device`, `Patient`, `RelatedPerson`.

#### Context.encounter

* Servers SHALL accept either a resolvable encounter reference or a contained `Encounter` reference.
* Business rules MAY require an encounter association, but servers SHALL NOT reject merely because the reference is not resolvable.

#### Date handling

* `DocumentReference.date` represents the **time the reference was created** (an `instant`).
* There is **no distinct “authored date”** element in R4. This specification does not attempt to introduce one.
* The **clinically relevant timeframe** SHALL be expressed using `context.period`.

#### Identifier

* Clients **SHOULD** supply a stable `identifier`.
* Servers **SHALL** support conditional create (`If-None-Exist`) for idempotency.
* Servers **MAY** deduplicate using identifiers, hashes, or other heuristics.

#### Content.format

* Clients **SHOULD** populate `content.format` for additional detail.
* Servers **SHALL** persist and round-trip when provided.

#### Other context elements

* Clients MAY populate other `context.*` elements.
* Servers SHALL NOT reject because they are present.

#### Patient-asserted signaling

* Clients **SHALL** include `meta.security` with code `PATAST` when data are patient-supplied.
* Servers **MAY** inject `PATAST` by policy.

#### MIME support

* Servers **SHALL** accept: `text/plain; charset=utf-8`, `application/pdf`.
* Servers **SHOULD** accept: `application/cda+xml` or `text/xml` when paired with CDA `content.format` codes.

#### Size limits

* Servers **SHALL** accept inline attachments up to at least **5 MiB**.
* Servers **MAY** support submission via `.attachment.url` that point to larger files than this
* Servers **SHALL NOT** link to client-supplied URLs for subsequent readers.
* Servers **SHALL** document size limits in their API documentation.

#### Error handling

* On failed writes, servers **SHOULD** return an `OperationOutcome`.

#### Status correction

* Servers **SHOULD** allow updates of `status` to `entered-in-error`.
* Clients MAY submit a partial `PUT` request to a `DocumentReference` resource, including only the `id`, `status` (set to 'entered-in-error'), `subject` (for verification), and other top-level fields as needed—omitting the full content or context. Servers SHALL accept such partial updates without requiring the original document content and SHOULD transition the resource's status accordingly. Servers MAY subsequently exclude the resource from search results (e.g., to limit visibility), but SHALL still support read access via direct ID lookup if authorized.

#### Capability discovery

* Servers **SHOULD** support the FHIR `ValueSet/$expand` operation with `contextDirection=incoming` to enable client discovery of supported note and report categories/codes (e.g., LOINC for `DocumentReference.type`). See the US Core Clinical Notes IG for details on invocation (e.g., contexts for `us-core-documentreference` category/type and equivalent `DiagnosticReport` elements): https://build.fhir.org/ig/HL7/US-Core/clinical-notes.html#using-expand. Note that discovery of supported MIME types (section 4.9) and content formats (section 4.6) is separate and out-of-band: Servers SHALL document these in their API documentation, including any limits or extensions beyond the minima in this specification.

#### Correction and Replacement

* Clients have two distinct mechanisms for corrections: entered-in-error for full retractions (see 4.12) and replacement for supersessions (below). These provide technical signals of "this was a mistake" or "this document replaces that one," respectively. Downstream handling (e.g., archiving, notifications, visibility to readers) is out of scope and a server policy decision.
* When a client needs to supersede an existing document (e.g., due to revisions without full retraction), they SHOULD create a new `DocumentReference` via `POST` and populate `relatesTo` with `code` = 'replaces' and `targetReference` to the original resource's ID. The new document SHALL include the updated content.
* Servers SHALL accept incoming `relatesTo` elements on create (and round-trip them) but MAY ignore the relationship for local policy decisions.

---

### Terminology

* **Type.** `DocumentReference.type` **SHALL** use LOINC and support at minimum the ten **Common Clinical Notes**. Servers SHALL support at minimum the following LOINC codes for `DocumentReference.type` (the 'Common Clinical Notes' from US Core):

  - 11488-4: Consultation note
  - 11535-2: Discharge summary note
  - 11502-2: Operative note
  - 11506-3: Progress note
  - 34133-9: Summary of episode note
  - 34132-1: Summary of death note
  - 28655-1: History and physical
  - 18842-5: Diagnostic imaging report
  - 34745-8: Continuity of care document
  - 51848-0: Functional status assessment note

  Clients SHALL use these where applicable. For other note types, clients SHOULD use LOINC codes when available; servers MAY accept additional terminology (e.g., SNOMED) if no suitable LOINC exists, but SHALL round-trip them. ([US Core Clinical Notes][1])
* **Category.** Servers **SHALL** support the US Core DocumentReference Category (`clinical-note`). ([US Core DocRef][3])

---

### Authorization (SMART on FHIR)

Servers **SHALL** support SMART v2 scopes for create/update and advertise them in `/.well-known/smart-configuration`. ([Writing Vital Signs][2])

**Recommended granular scopes**

* **Patient-facing:**

  * `patient/DocumentReference.c?category=clinical-note`
  * `patient/DocumentReference.u?category=clinical-note`
* **Provider/System-facing:**

  * `user/DocumentReference.c?category=clinical-note`
  * `system/DocumentReference.c?category=clinical-note`
  * `user/DocumentReference.u?category=clinical-note`
  * `system/DocumentReference.u?category=clinical-note`

---

### API Behavior

**Create**

* `POST [base]/DocumentReference`
* Response: `201 Created` (success), or `202 Accepted` (for Mediated Submission).

**Update**

* `PUT [base]/DocumentReference/{id}`
* Supported for correcting status (e.g., `entered-in-error`) via partial updates (see 4.12) or other changes. Clients SHOULD use `POST` with `relatesTo` (code='replaces') for document supersessions instead of in-place content updates (see 4.14).

---

### Examples

#### Direct Write — Provider authored (resolvable Encounter)

```json
{
  "resourceType": "DocumentReference",
  "identifier": [{ "system": "https://ehr.example.org/doc-ids", "value": "CONS-2025-08-21-987" }],
  "status": "current",
  "type": { "coding": [{ "system": "http://loinc.org", "code": "11488-4", "display": "Consultation note" }] },
  "category": [{ "coding": [{ "system": "http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category", "code": "clinical-note" }] }],
  "subject": { "reference": "Patient/123" },
  "author": [{ "reference": "PractitionerRole/456", "display": "Dr. Rivera (Endocrinology)" }],
  "date": "2025-08-22T16:00:00Z",
  "content": [{
    "attachment": {
      "contentType": "text/plain; charset=utf-8",
      "data": "VmlzaXQgc3VtbWFyeS4uLg==",
      "size": 21
    }
  }],
  "context": {
    "encounter": [{ "reference": "Encounter/enc-789", "display": "Office visit 2025-08-21" }],
    "period": { "start": "2025-08-21", "end": "2025-08-21" }
  }
}
```

#### Direct Write — Provider authored (contained Encounter)

```json
{
  "resourceType": "DocumentReference",
  "status": "current",
  "type": { "coding": [{ "system": "http://loinc.org", "code": "11506-3", "display": "Progress note" }] },
  "category": [{ "coding": [{ "system": "http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category", "code": "clinical-note" }] }],
  "subject": { "reference": "Patient/123" },
  "author": [{ "display": "Dr. Alex Khan" }],
  "contained": [{
    "resourceType": "Encounter",
    "id": "e1",
    "identifier": [{ "system": "https://ehr.example.org/encounters", "value": "E-20250821-42" }],
    "period": { "start": "2025-08-21T09:00:00Z", "end": "2025-08-21T09:30:00Z" }
  }],
  "context": {
    "encounter": [{ "reference": "#e1", "display": "Office visit — identifier E-20250821-42" }],
    "period": { "start": "2025-08-21", "end": "2025-08-21" }
  },
  "content": [{
    "attachment": {
      "contentType": "application/pdf",
      "data": "JVBERi0xLjcKJcTl8uXrp/Og0MTGCg==",
      "size": 20480
    }
  }],
  "date": "2025-08-22T14:05:00Z"
}
```

#### Mediated Submission — Patient asserted

```json
{
  "resourceType": "DocumentReference",
  "meta": {
    "security": [{ "system": "http://terminology.hl7.org/CodeSystem/v3-ObservationValue", "code": "PATAST", "display": "patient asserted" }]
  },
  "status": "current",
  "type": { "coding": [{ "system": "http://loinc.org", "code": "11506-3", "display": "Progress note" }] },
  "category": [{ "coding": [{ "system": "http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category", "code": "clinical-note" }] }],
  "subject": { "reference": "Patient/123" },
  "contained": [{
    "resourceType": "Device",
    "id": "app1",
    "deviceName": [{ "name": "Wellness Coach App", "type": "manufacturer-name" }]
  }],
  "author": [{ "reference": "#app1", "display": "Wellness Coach App" }],
  "date": "2025-08-22T14:10:00Z",
  "content": [{
    "attachment": { "contentType": "application/pdf", "data": "JVBERi0xLjcKJcTl8uXrp/Og0MTGCg==", "size": 20480 }
  }],
  "context": { "period": { "start": "2025-08-20", "end": "2025-08-20" } },
  "identifier": [{ "system": "https://app.example.org/notes", "value": "p-note-20250820-001" }]
}
```

#### Status Correction

```
PUT [base]/DocumentReference/abc
```

```json
{ "resourceType": "DocumentReference", "id": "abc", "status": "entered-in-error", "subject": { "reference": "Patient/123" } }
```

---

### Conformance Checklist

**Servers**

☐ SHALL support create for `DocumentReference`; SHOULD support update.

☐ SHALL accept & persist all Mandatory and Must Support elements.

☐ SHALL accept inline content up to at least 5 MiB.

☐ SHALL accept `author` and `context.
  encounter` either as resolvable relative references or contained resources, with optional `display`.

☐ SHALL accept `text/plain; charset=utf-8` and `application/pdf`.

☐ SHALL support conditional create (`If-None-Exist`).

☐ SHALL document limits and mediated submission policy.

☐ SHALL accept partial `PUT`s for `status` = 'entered-in-error' without full content; SHOULD transition status and MAY suppress from searches.

☐ SHALL accept and round-trip `relatesTo` with `code` = 'replaces' on create; MAY ignore for policy.

☐ SHOULD return `OperationOutcome` on failed writes and when limits are exceeded.

☐ SHOULD allow `status` updates to `entered-in-error`.

☐ MAY support URLs for content with higher limits.

☐ MAY deduplicate using identifiers, hashes, or heuristics.


**Clients**

☐ SHALL supply `status`, `type`, `category`, `subject`, `content`, and `content.attachment.contentType`.

☐ SHALL support both inline and URL content.

☐ SHALL be capable of populating `author` and `context.encounter` with either resolvable or contained references.

☐ SHOULD provide stable identifiers.

☐ SHOULD populate `date`.

☐ SHOULD populate `content.format`.

☐ SHOULD populate `context.period`.

☐ SHOULD include `PATAST` for patient-asserted notes.

☐ SHOULD use `relatesTo` = 'replaces' for superseding documents instead of in-place updates.

☐ SHOULD use `ValueSet/$expand?contextDirection=incoming` for type discovery per US Core guidance.

---

### References

* [US Core Clinical Notes][1]
* [US Core Writing Vital Signs][2]
* [US Core DocumentReference Profile][3]
* [FHIR R4 DocumentReference][4]
* [SMART App Launch v2.2.0 Scopes][5]

---

[1]: clinical-notes.html
[2]: writing-vital-signs.html
[3]: StructureDefinition-us-core-documentreference.html
[4]: https://hl7.org/fhir/R4/documentreference.html
[5]: https://build.fhir.org/ig/HL7/smart-app-launch/scopes-and-launch-context.html
[formatcodes]: https://hl7.org/fhir/R4/valueset-formatcodes.html

---