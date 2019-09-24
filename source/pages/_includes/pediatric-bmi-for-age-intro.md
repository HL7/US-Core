This profile sets minimum expectations for the [Observation] resource to record, search and fetch pediatric body mass index (BMI) per age and gender observations associated with a patient. It is based on the FHIR [Vital Signs Profile] and identifies the *additional* mandatory core elements, extensions, vocabularies and value sets which **SHALL** be present in the Observation resource when using this profile.

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core Pediatric BMI for Age Observation Profile:

- Query for BMI observations belonging to a pediatric patient
- [Record or update]  BMI observations belonging to a pediatric patient

### Mandatory and Must Support Data Elements

In addition to the mandatory and must support data elements in the FHIR Vital Signs Profile, the following data-elements are mandatory (i.e data MUST be present) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.

**Each Observation must have:**

1.  a fixed code for pediatric BMI per age and gender measurement
1.  a result value

**Profile specific implementation guidance:**

- none

### Examples

- [Pediatric BMI for Age Example](Observation-pediatric-bmi-example.html)

{% include link-list.md %}
