
This profile sets minimum expectations for the [Observation] resource to record, search, and fetch smoking status data associated with a patient. It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core-SmokingStatus
profile:

- Query for the Smoking Status of a patient
- [Record or update] the Smoking Status of a patient

### Mandatory and Must Support Data Elements

The following data-elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.  

**Each Observation must have:**

1.  a status
1.  a category code of ‘social-history’
1.  a code for smoking observation
1.  a patient
1.  when the observation occurred
1.  a result value code for smoking status

**Profile specific implementation guidance:**

 - Smoking observation LOINC = 72166-2 *Tobacco smoking status NHIS*

{% include link-list.md %}
