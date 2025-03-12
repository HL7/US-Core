
**Example Usage Scenarios:**

The following are example usage scenarios for the US Core-SmokingStatus
profile:

- Query for the Smoking Status of a patient
- [Record or update] the Smoking Status of a patient

### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile-specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.

**Each Observation Must Have:**

1. a status
1. a category code of "social-history"
1. a code for smoking observation*
1. a patient
1. when the observation occurred
3. a performer*
3. a result value*

\* see guidance below

**Profile Specific Implementation Guidance:**

- \* The *Smoking Status Type* Value Set on `Observation.code` is a "starter" set of concepts to capture smoking status, and the *Smoking Status Comprehensive* Value Set for `Observation.valueCodeableConcept` contains terms representing nicotine, smoking, vaping, chew, and snuff use to encourage the use of this profile for other smoking and nicotine questions.
{% include provenance-author-bullet-generator.md %}


{% include link-list.md %}
