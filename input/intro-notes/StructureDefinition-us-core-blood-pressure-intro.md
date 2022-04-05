
This profile sets minimum expectations for the [Observation] resource to record, search, and fetch blood pressure observations. It is based on the [US Core Vital Signs Profile] and identifies the *additional* mandatory core elements, extensions, vocabularies and value sets which **SHALL** be present in the Observation resource when using this profile.

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core Blood Pressure Profile:

- Query for blood pressure observation belonging to a pediatric patient
- [Record or update] pressure belonging to a pediatric patient

### Mandatory and Must Support Data Elements

*In addition* to the mandatory and must support data elements in the US Core Vital Signs Profile, the following data-elements must always be present ([Mandatory] definition]) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and terminology requirements.  The "Snapshot Table (Must Support)" tab below displays all the mandatory and must support data elements for this profile and the those inherited from the US Core Vital Signs Profile.  Note that this profile also conforms to the base FHIR [Vital Signs Profile].

**Each Observation must have:**

1.  a patient
1.  a fixed code for systolic and diastolic blood pressure panel
1.  a fixed *component* code for systolic blood pressure
1.  a fixed *component* code for diastolic blood pressure

**Each Observation must support:**
healt
1.  a result value for systolic blood pressure
1.  a result value for diastolic blood pressure

**Profile specific implementation guidance:**

- See the implementation guidance section for the [US Core Vital Signs Profile]
- An Observation without a systolic or diastolic result value, **SHALL** include a reason why the data is absent in `Observation.component.dataAbsentReason`
   -  Because all the components are *mandatory* (in other words the minimum cardinality is =>1), all server systems - including those that never provide a component observation without a value - must to support `Observation.component.dataAbsentReason` for the components.

Even a server that always values diastolic and systolic  needs to support DAR

### Examples

- [Blood Pressure Example](Observation-blood-pressure.html)
- [Bp Data Absent Example](Observation-bp-data-absent.html)

{% include link-list.md %}
