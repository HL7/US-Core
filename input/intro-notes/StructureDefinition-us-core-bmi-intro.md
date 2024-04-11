
**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

- Query for body mass index (BMI) observations
- [Record or update] body mass index (BMI) observations

### Mandatory and Must Support Data Elements

*In addition* to the Mandatory and Must Support data elements in the US Core Vital Signs Profile, the following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.  {% include diff-display-note.md parent_profile='US Core Vital Signs Profile' %}

**Each Observation Must Have:**

1. a patient
1. a fixed code for body mass index (BMI)

**Each Observation Must Support:**

1. a result value

**Profile Specific Implementation Guidance:**

- - Note that this profile also conforms to the base FHIR [Vital Signs Profile].
{% include vitals-guidance.md %}
- See the [US Core Pediatric BMI for Age Observation Profile] for representing pediatric BMI measurements as a percentile based upon growth chart tables.

{% include link-list.md %}
