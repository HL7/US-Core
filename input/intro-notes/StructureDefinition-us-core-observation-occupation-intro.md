

**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

- Query for a patient's work history
- [Record or update] past or present jobs belonging to a patient

### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.

**Each Observation Must Have:**

1. a status
2. a code for job history
3. a patient
5. the job code or text 

**Each Observation Must Support:**

1. a category code of "social-history"
2. when the job occurred
3. a code for the job history industry
4. the industry code or text



{% include additional-requirements-intro.md type="Observation" plural="false" %}

1. a performer*


*see guidance below

**Profile Specific Implementation Guidance:**


{% include additional-codings.md %}
- For the current job, omit `observation.effectivePeriod.end` to indicate it is ongoing.
- When the industry is known, but the occupation is not,  use the value "unknown" from the [DataAbsentReason Code System]. However, when the occupation is known but the industry is not, omit the industry `Observation.component`. The guide provides examples for both scenarios.
- In the [Quick Start](#notes) section below, you can find instructions on searching for Occupations (Jobs) by `patient`, `date`, and other core search parameters. Refer to the FHIR [search] specification for more advanced queries using Observation.
- Refer to the [Occupational Data for Health (ODH)] FHIR IG  to convey additional details; data elements, such as Employer; or different topics, such as Usual (Longest-Held) Work.
{% include provenance-author-bullet-generator.md %}


{% include link-list.md %}
