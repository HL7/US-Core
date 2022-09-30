{% include new_page.md %}

**Example Usage Scenarios:**

The following are example usage scenarios for the this profile:

- Query for a patient's work history
- [Record or update] past or present jobs belonging to a patient

### Mandatory and Must Support Data Elements

The following data-elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.

**Each Observation must have:**

1.  a status
2.  a code for job history
3.  a patient
4.  when the job occurred
5.  the job code or text 

**Each Observation must support:**

1. a category code of ‘social-history’
2. a code for job history industry
3. the industry code or text 

**Profile specific implementation guidance:**

- A person can have more than one job at the same time and many jobs over time. Therefore,  See the [Occupational Data for Health (ODH) Usual Work Profile](#.html) for a stand-alone observation to communicate the concept of “usual or longest-held work” This can also be determined by reviewing all known occupations.

{% include link-list.md %}
