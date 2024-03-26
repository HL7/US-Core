{% include new_page.md %}

**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

- Query for average blood pressure observations belonging to a patient
- [Record or update] average blood pressure observations belonging to a patient

### Mandatory and Must Support Data Elements

*In addition* to the Mandatory and Must Support data elements in the US Core Blood Pressure Profile, the following data-elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well.  The [Formal Views] below provides the  formal summary, definitions, and terminology requirements.  {% include diff-display-note.md parent_profile='US Core Blood Pressure Profile' %}

**Each Observation Must Have:**

1.a status
1.a category code of “vital-signs”
1. a fixed code for average systolic and average diastolic blood pressure panel
1. a fixed *componen*t code for average systolic blood pressure
1. a fixed *component* code for average diastolic blood pressure
2. a patient

**Each Observation Must Support:**

1.  <span class="bg-success" markdown="1">clinically relevant time-period for the average of blood pressure (BP) readings</span><!-- new-content -->
2.  a result value for the average systolic blood pressure
3.  a result value for the average diastolic blood pressure
4.  a reason if the value is absent*
  
* see guidance below

**Profile Specific Implementation Guidance:**

- Note that this profile also conforms to the base FHIR [Vital Signs Profile].
- The observations **MAY** have additional codes that translate or map to the Observation code or category codes. For example:
   -  providing a local system specific code
   -  <span class="bg-success" markdown="1">providing more specific codes</span><!-- new-content -->
  a code system value **SHOULD** be supplied for each additional code.
- \*Because the blood pressure values are communicated in the *mandatory* systolic and diastolic components:
  - <span class="bg-success" markdown="1">the `Observation.value[x]` element **SHALL** be omitted</span><!-- new-content -->
  - an Observation without a systolic or diastolic result value, **SHALL** include a reason why the data is absent in `Observation.component.dataAbsentReason`
  - *all server systems* - including those that never provide a component observation without a value - **SHALL** support `Observation.component.dataAbsentReason` for the components.
- <span class="bg-success" markdown="1">The observation **MAY** have additional [component] observations to qualify it.</span><!-- new-content -->
- The observation **MAY** use [extensions] defined by other profiles such as [Vital Signs with Qualifying Elements: Average Blood Pressure Profile].
- Information about the protocol or number of measurements used to determine the averages **SHOULD** be supplied in either:
  - `Observation.note.text` (for example, "24-hour ambulatory measurement.")
  - a component observation in `Observation.component`
  - an extension

{% include link-list.md %}
