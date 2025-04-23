

**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

- Query for a patient's pregnancy intention
- [Record or update] a past or present pregnancy intention

### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.

**Each Observation Must Have:**

1. a status
2. a code for pregnancy intention observation
3. a patient
4. when the observation occurred
5. the pregnancy intention

**Each Observation Must Support:**

1. a category code of "social-history"



{% include additional-requirements-intro.md type="Observation" plural="false" %}

1. a performer*


**Profile Specific Implementation Guidance:**

- To represent the patient's *pregnancy status*, use the [US Core Observation Pregnancy Status Profile].
{% include provenance-author-bullet-generator.md %}
- The [US Core Pregnancy Intent Codes] value set includes SNOMED CT codes and the HL7 V3 code for the concept "unknown". These codes have historically been used to communicate a patient's intent regarding pregnancy.

{% include link-list.md %}
