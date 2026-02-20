This table lists the requirements defined in the US Core Implementation Guide’s narrative sections. These requirements represent the regulatory, business, functional, and technical specifications that design artifacts must meet to ensure interoperability. They are documented here to provide a clear, consolidated reference for implementers working with this guide. This table is based on the [US Core Server v8.0.0 Specification Requirements], created by [Inferno] and its open-source testing framework to support the ONC Health IT Certification Program. The table data is also available as a [CSV](tables/us_core_reqs.csv) or [Excel](tables/us_core_reqs.xlsx) file, and as [US Core Server Requirements] and [US Core Client Requirements] resources.

Legend:

* ID:  A requirement key that identifies the requirement and links it to the statement in the guide.
* Context: The page or section topic that pertains to the requirement, for example, US Core Medication Request Profile, or Clinical Notes.
* Actor: The roles to which this requirement applies. The actors are:
  * Server: US Core Responder (Servers including Certifying Systems)
  * Client: US Core Requester (Clients including Certifying Systems)
  * Both: Both US Core Responder and Requester (including Certifying System).
* Certifying Systems Only: A Flag to indicate whether the requirement is an additional USCDI certification requirement.
* Conformance: The conformance verb of the requirement: SHALL, SHOULD, MAY, SHOULD-NOT, SHALL NOT, and DEPRECATED*.  Note that there may be several conformance verbs in a single statement.
* Requirement: The actual requirements statement, which is a direct quote from the IG and may include helpful context in square brackets. Note that statements in the narrative section that contain multiple requirements in a single context are split into individual requirement statements.

*If a requirement is removed for some reason, its ID is retired and its Conformance is updated to DEPRECATED.

<!-- ==================================================================
This liquid script creates a US Core requirements table using input data from input/data/us_core_reqs.csv which derived from the US Core Server v8.0.0 Specification Requirements which can be downloaded here: https://github.com/inferno-framework/us-core-test-kit/blob/main/lib/us_core_test_kit/requirements/hl7.fhir.us.core_8.0.0_reqs.xlsx

This csv is manually updated when new narrative requirements are added to the guide.  Note that this table is used to create the Requirements Resources as well.


with the following columns:

inherited = from the ...us_core_test_kit/requirements/hl7.fhir.us.core_8.0.0_reqs.xlsx
added = added for US Core publication:

- Is_New: (added) Flag for new or updated content for the current version. Defult is "FALSE"  or empty and set to "TRUE" for new or updated content for the current version. It is used for QA review and published ballot versions of the guide. It set to empty before publishing new versions of the guide.
- ID*: (inherited) The unique identifier for the requirement. IDs are short, meaningless (they do not contain context like section numbers), and numeric. An approach is incrementing integers. See below for how to handle IDs for child requirements.
- key: (added) A requirement key that identifies the requirement and links it to the statement in the guide. The format is "CONF-NNNN" where NNNN is a sequentially increasing zero padded integer with the coresponding ID* value.  e.g, "CONF-0022" Mapping: key -> Requirements.statement.key"
- URL*: (inherited) "The URL of the deepest section that contains the requirement. The URL provides context for the requirement text.
Mapping: URL ->  Requirements.statement.reference"
- rel_url: (added) Url of the page from where the requirements statement came from, this is use to create a link back to the page.
- requirement: (inherited changed columm name from Requirement*) "A direct quote from the IG. Add any clarifications or interpretations in a helper column like the Test Plan column. May include helpful context in square brackets.
Mapping: requirement -> Requirements.statement.requirement" The format is Markdown and is either a sentence, one of more bullets, or even a paragraph to express a single requirement.
- conformance: (inherited changed columm name from Conformance*) "The conformance verb of the requirement: SHALL, SHOULD, MAY, SHOULD NOT [updated to SHOULD-NOT], SHALL NOT [updated to SHALL-NOT], and DEPRECATED [see  excel file]Further Consideration below for when to use DEPRECATED)."  Note that there may be several conformance verbs in a single statement. The format is "<CONF>|<CONF>|etc" where "<CONF>" is a conformance verb.
Mapping: conformance -> Requirements.statement.conformance.
- update_verb: a field to indicate that a tracker needs to be created to update the conformance verb in the IG. default is empty format old verb to new verb  for example, must to **SHALL**
- actor: (inherited changed columm name from Actors*) "The actor, or actors, that the requirement constrains. The values will depend on the target specification, e.g., for Subscriptions (https://hl7.org/fhir/uv/subscriptions-backport/STU1.1/actors.html), Client and Server.
Mapping: actor -> Requirements.actor"  NOTE updated to be "Server|Client|Both" since only a single actor supported in the R5 requirements resource.
- certifiers_only:  (added) Flag to indicate whether the requirement is an additional USCDI certification requirement.  Default is empty or "FALSE" and set to "TRUE" for additional USCDI certification requirements. Mapping: certifiers_only -> Requirements.statement.extension:uscdi-requirements = true
- Sub-Requirement(s): (inherited)  Not used
- Conditionality: (inherited)  Not used
- Conditionality Details: (inherited)  Not used
- Verifiable?: (inherited)  Not used
- Verifiability Details: (inherited)  Not used
- Planning To Test?: (inherited)  Not used
- Planning To Test Details: (inherited)  Not used
- Page: (inherited) "The page the requirement came from, extracted from the URL."
- Section: (inherited) "The section the requirement came from, extracted from the URL."  Useful for context
- context: (added) The page or section topic that pertains to the requirement, For example, US Core Medication Request Profile, or Clinical Notes.  Usually derived from the source location.\, but can be manually curated too. format = Page: Section
- Verb Guess: (inherited)  Not used
- Actor Guess: (inherited)  Not used
- Section #: (inherited)  Not used
- Grouping: (inherited)  Not used
- Priority: (inherited)  Not used
- Test Plan: (inherited)  Not used
- Questions: (inherited)  Not used
- Notes: (inherited)  Not used
- In Test: (inherited)  Not used

The script sorts and selects the table data and allows for highlighting new and updated content.
================================================================== -->

<table class="grid">
<thead>
<tr>
<th>ID</th>
<th>Context</th>
<th>Actor</th>
<th>Certifying Systems<br />
Only</th>
<th>Conformance</th>
<th>Requirement</th>
</tr>
</thead>
<tbody>
{% assign rows = site.data.us_core_reqs -%}
{% for item in rows %}
    {% assign cert=item.certifiers_only -%}
    {% assign source=item.rel_url -%}
  <tr id="{{item.key}}" {% if item.Is_New == "TRUE" %} class="bg-success"{% endif %}>
  <td><a href="{{item.Page}}.html#{{item.key}}">{{item.key}}</a></td>
  <td>{{item.context}}</td>
  <td>{{item.actor}}</td>
  <td style="text-align: center;">{% if cert == "TRUE" %}X{% endif %}</td>
  <td>{{item.conformance}}</td>
  <td>{{item.requirement | markdownify }}</td>
  </tr>
{% endfor %}
</tbody>
</table>

<!-- =============================== end liquid =================================== -->


{% include link-list.md %}
