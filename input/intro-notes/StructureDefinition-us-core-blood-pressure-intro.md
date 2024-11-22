
**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

- Query for blood pressure observations belonging to a patient
- [Record or update] blood pressure observations belonging to a patient

### Mandatory and Must Support Data Elements

*In addition* to the Mandatory and Must Support data elements in the US Core Vital Signs Profile, the following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.  {% include diff-display-note.md parent_profile='US Core Vital Signs Profile' %}

**Each Observation Must Have:**

1. a patient
1. a fixed code for systolic and diastolic blood pressure panel
1.  a fixed *component* code for systolic blood pressure
1.  a fixed *component* code for diastolic blood pressure

**Each Observation Must Support:**

1. a result value for systolic blood pressure
2. a result value for diastolic blood pressure

**Profile Specific Implementation Guidance:**

- Note that this profile also conforms to the base FHIR [Vital Signs Profile].
- The observations **MAY** have additional codes that translate or map to the Observation code or category codes. For example:
   -  providing a local system-specific code
   -  providing more specific codes such as 8306-3 - *Body height - lying* in addition to 8302-2 - *Body height*. Several additional observation codes are provided in the FHIR core specification [vital signs table].

  A code system value **SHOULD** be supplied for each additional code.
- The observations **MAY** have [component] observations. For example, to qualify the vital sign observation, 8310-5 - *Body temperature*, 8327-9 - *Body temperature measurement site* (oral, forehead, rectal, etc.) may be used as a component observation. Several of these are provided in the FHIR core specification [vital signs table].
- Implementers may use this profile as a base for other vital signs in addition to those in this guide.
- Because the blood pressure values are communicated in the *mandatory* systolic and diastolic components:
  - the `Observation.value[x]` element **SHOULD** be omitted
  - an Observation without a systolic or diastolic result value, **SHALL** include a reason why the data is absent in `Observation.component.dataAbsentReason`
  - *All Server systems* - including those that never provide a component observation without a value - **SHALL** support `Observation.component.dataAbsentReason` for the components.


{% include link-list.md %}
