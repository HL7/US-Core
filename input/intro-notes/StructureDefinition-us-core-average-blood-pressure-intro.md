

**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

- Query for average blood pressure observations belonging to a patient
- [Record or update] average blood pressure observations belonging to a patient

### Mandatory and Must Support Data Elements


The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.


**Each Observation Must Have:**

1. a status
2. a category code of "vital-signs"
3. a fixed code for average systolic and diastolic blood pressure panel
4. a fixed *component* code for average systolic blood pressure
5. a fixed *component* code for average diastolic blood pressure
6. a patient
7. clinically relevant time-period for the average of blood pressure readings

**Each Observation Must Support:**

1.  a performer*
3. a result value for the average systolic blood pressure
4. a result value for the average diastolic blood pressure
5.  a reason if the value is absent*
  
*see guidance below

**Profile Specific Implementation Guidance:**

- The category "vital-signs" aligns with the USCDI Data Class and Elements and provides a convenient and consistent grouping of the clinical concepts. Implementers can group them differently based on their clinical needs.
- The observations **MAY** have additional codes that translate or map to the Observation code or category codes. For example:
   -  providing a local system-specific code
   -  providing more specific codes

  a code system value **SHOULD** be supplied for each additional code.
{% include provenance-author-bullet-generator.md %}
- \*Because the blood pressure values are communicated in the *mandatory* systolic and diastolic components:
  - the `Observation.value[x]` element **SHALL** be omitted
  - An Observation without a systolic or diastolic result value **SHALL** include a reason why the data is absent in `Observation.component.dataAbsentReason`
  - *All Server systems* - including those that never provide a component observation without a value - **SHALL** support `Observation.component.dataAbsentReason` for the components.
- This Profile is not dependent on any specific protocol. Information about the protocol used **SHOULD** be supplied in either:
  - `Observation.note.text` (for example, "Average blood pressure is calculated from 12 measurements taken by the patient over three days.")
  - The standard FHIR extension <http://hl7.org/fhir/StructureDefinition/workflow-adheresTo>
- Information about the number of measurements used to determine the average **SHOULD** be supplied as an `Observation.component` using the SNOMED CT code "246432004 \| Number of occurrences (qualifier value)". The example shows how this component can be used.
- The observation **MAY** use an [extension] defined by other profiles such as [Vital Signs with Qualifying Elements: Average Blood Pressure Profile].

{% include link-list.md %}
