
**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

- Query for blood pressure observation belonging to a pediatric patient
- [Record or update] pressure belonging to a pediatric patient

### Mandatory and Must Support Data Elements

*In addition* to the mandatory and must support data elements in the US Core Vital Signs Profile, the following data-elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well.  The [Formal Views] below provides the  formal summary, definitions, and terminology requirements.  {% include diff-display-note.md parent_profile='US Core Vital Signs Profile' %}

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

- - Note that this profile also conforms to the base FHIR [Vital Signs Profile].
{% include vitals-guidance.md %}
<div class="bg-success" markdown="1">
- Because the blood pressure values are communicated in the *mandatory* systolic and diastolic components:
  - the `Observation.value[x]` element should be omitted
  - an Observation without a systolic or diastolic result value, **SHALL** include a reason why the data is absent in `Observation.component.dataAbsentReason`
  - *all server systems* - including those that never provide a component observation without a value - **SHALL** support `Observation.component.dataAbsentReason` for the components.
</div><!-- new-content -->

{% include link-list.md %}
