<!-- ==================================================================
This liquid script creates the US Core requirements reference list - the
reference-style link definitions that resolve a requirement key cited in the
narrative, for example:

  Servers **SHOULD** return an `OperationOutcome` on failed writes.<sup>[§][CONF-WD-06]</sup>

It reads two collections, both of which are manually updated when new narrative
requirements are added to the guide:

- input/data/us_core_requirements.csv - the main specification's requirements,
  keyed "CONF-NNNN". Each key also gets a `{: #key}` line below its definition.
  That is a kramdown attribute list for the link reference, not a block
  anchor: it puts id="CONF-NNNN" on every <a> the reference generates, so the
  footnote anchor in the narrative becomes the target that the context link in
  the requirements.html table points back to.
- input/data/writing_documents_requirements.csv - the Writing Documents page's
  requirements, keyed "CONF-WD-NN". No `{: #key}` line is emitted for these.
  Their table is on writing-documents.html, the same page the statements are
  written on, and the table row already carries the key as its id. Emitting
  the attribute list would put that id on the footnote anchor too, ahead of
  the row in document order, so the footnote would link to itself instead of
  to the table row.

input/includes/link-list.md includes this file, and every page includes
link-list.md at the bottom, so a key can be cited from any page.

The columns of each collection are documented where its table is rendered:
input/pagecontent/requirements.md and input/pagecontent/writing-documents.md.
Both use "key" for the requirement key and drop a row from the published table
once it is withdrawn - us_core_requirements.csv by setting conformance to
DEPRECATED, writing_documents_requirements.csv by setting status to retired.
A withdrawn key gets no link definition here either.
================================================================== -->


{% assign rows = site.data.us_core_requirements
  | where_exp: "item", "item.key.size > 0"
  | where_exp: "item", "item.conformance != 'DEPRECATED'" -%}
{% for item in rows -%}
[{{item.key}}]: requirements.html#{{item.key}} "{{item.key}}"
{: #{{item.key}}}
{% endfor %}

{% assign wd_rows = site.data.writing_documents_requirements
  | where_exp: "item", "item.key.size > 0"
  | where: "status", "active" -%}
{% for item in wd_rows -%}
[{{item.key}}]: writing-documents.html#{{item.key}} "{{item.key}}"
{% endfor %}

<!-- =============================== end liquid =================================== -->
