
**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

- Query for BMI observations belonging to a pediatric patient
- [Record or update]  BMI observations belonging to a pediatric patient

### Mandatory and Must Support Data Elements

*In addition* to the Mandatory and Must Support data elements in the US Core Vital Signs Profile, the following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.  {% include diff-display-note.md parent_profile='US Core Vital Signs Profile' %}

**Each Observation Must Have:**

1. a patient
1. a fixed code for pediatric BMI per age and sex measurement

**Each Observation Must Support:**

1. a result value

**Profile Specific Implementation Guidance:**

- - Note that this profile also conforms to the base FHIR [Vital Signs Profile].
{% include vitals-guidance.md %}
- Information about the growth chart tables used to determine percentiles **SHOULD** be supplied in `Observation.note.text` (for example, 'CDC Males, 2-20 years Chart').

{% include link-list.md %}
