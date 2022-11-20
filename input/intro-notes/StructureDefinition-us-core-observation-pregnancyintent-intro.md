{% include new_page.md %}

**Example Usage Scenarios:**

The following are example usage scenarios for the this profile:

- Query for a patient's pregnancy intention
- [Record or update] a past or present pregnancy intention

### Mandatory and Must Support Data Elements

The following data-elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Views] below provides the  formal summary, definitions, and  terminology requirements.

**Each Observation must have:**

1.  a status
2.  a code for pregnancy intention observation
3.  a patient
4.  when the observation occurred
5.  the pregnancy intention

**Each Observation must support:**

1. a category code of "social-history"


**Profile specific implementation guidance:**

- For representing the patient's *pregnancy status* use the [US Core Pregnancy Status Observation Profile].

{% include link-list.md %}
