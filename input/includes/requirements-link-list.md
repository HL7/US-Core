
<!-- ==================================================================
This liquid script creates a US Core requirements reference list using input data from input/data/requirements.csv
which is manually updated when new narrative requirements are added to the guide.  Note that this table is used to create the Requirements Resources as well.
with the following columns:

- Is_New: Flag for new or updated content for the current version. Defult is "FALSE"  or empty and set to "TRUE" for new or updated content for the current version. It is used for QA review and published ballot versions of the guide. It set to empty before publishing new versions of the guide.
- key: A requirement key that identifies the requirement and links it to the statement in the guide. The format is "CONF-NNN" where NNN is a sequentially increasing zero padded integer.
- context: The page or section topic that pertains to the requirement, For example, US Core Medication Request Profile, or Clinical Notes.  Usually derived from the source location.
- actor: The roles to which this requirement applies. The actors are: "Server|Client|Both"
- certifiers_only: Flag to indicate whether the requirement is an additional USCDI certification requirement.  Default is empty or "FALSE" and set to "TRUE" for additional USCDI certification requirements. This is
- conformance: Conformance Verb(s) as defined in RFC 2119 that are used in the requirement.  Note that there may be several conformance verbs in a single statement. The format is "<CONF>|<CONF>|etc" where "<CONF>" is on of "SHALL|SHALL-NOT|SHOULD|SHOULD-NOT|MAY"
- requirement: The actual requirements statement. The format is Markdown and is either a sentence, one of more bullets, or even a paragraph to express a single requirement.
- source: Url of the page from where the requirements statement came from, this is use to create a link back to the page.
-
================================================================== -->


{% assign rows = site.data.us_core_reqs -%}
{% for item in rows %}
[{{item.key}}]: requirements.html#{{item.key}} "{{item.key}}"
{: #{{item.key}}}
{% endfor %}

<!-- =============================== end liquid =================================== -->
