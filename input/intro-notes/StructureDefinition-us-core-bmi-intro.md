
This profile sets minimum expectations for the [Observation] resource to record, search, and fetch body mass index (BMI) observations associated with a patient. It is based on the [US Core Vital Signs Profile] and identifies the *additional* mandatory core elements, extensions, vocabularies and value sets which **SHALL** be present in the Observation resource when using this profile.

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core BMI Profile:

- Query for body mass index (BMI) observations
- [Record or update] body mass index (BMI) observations

### Mandatory and Must Support Data Elements

*In addition* to the mandatory and must support data elements in the US Core Vital Signs Profile, the following data-elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and terminology requirements.  The "Snapshot Table (Must Support)" tab below displays all the mandatory and must support data elements for this profile and the those inherited from the US Core Vital Signs Profile.  Note that this profile also conforms to the base FHIR [Vital Signs Profile].

**Each Observation must have:**

1. a patient
1. a fixed code for body mass index (BMI)

**Each Observation must support:**

1.  a result value

**Profile specific implementation guidance:**

- See the implementation guidance section for the [US Core Vital Signs Profile]
- See the [US Core Pediatric BMI for Age Observation Profile] for representing pediatric BMI measurements as a percentile based upon growth chart tables.

{% include link-list.md %}
