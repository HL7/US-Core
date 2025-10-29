{% include grayed-out.html %}
**Example Usage Scenarios:**

The following are example usage scenarios for the US Core-SmokingStatus
profile:

- Query for the Smoking Status of a patient
- [Record or update] the Smoking Status of a patient

### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile-specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.

**Each Observation Must Have:**

1.  a status
1.  a category code of "social-history"
1.  a code for smoking observation*
1.  a patient
1.  when the observation occurred
2.  a result value*

\* see guidance below

**Profile Specific Implementation Guidance:**

- \*The US Core Smoking Status Observation Codes Value Set is a ‘starter set’ of concepts to capture smoking status and is composed of a single code -72166-2 *Tobacco smoking status NHIS*.  The binding on `Observation.code` is [extensible], and all `Observation.value[x]` data types are available to encourage the use of this profile for other smoking questions such as the code - 67741-9 *Smoking tobacco use duration*.

{% include link-list.md %}

</div><!-- grayed-out -->