{% include new_page.md %}

**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

- Query for a patient's work history
- [Record or update] past or present jobs belonging to a patient

### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.

**Each Observation must have:**

1. a status
2. a code for job history
3. a patient
5. the job code or text 

**Each Observation must support:**

1. a category code of "social-history"
2. when the job occurred
3. a code for the job history industry
4. the industry code or text 

**Profile specific implementation guidance:**

- Implementers may consider referring to [Occupational Data for Health (ODH)] FHIR IG  to convey additional details; data elements, such as Employer; or different topics, such as Usual (Longest-Held) Work. 

{% include link-list.md %}
