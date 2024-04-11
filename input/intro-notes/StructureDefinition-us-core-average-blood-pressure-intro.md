{% include new_page.md %}

**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

- Query for average blood pressure observations belonging to a patient
- [Record or update] average blood pressure observations belonging to a patient

### Mandatory and Must Support Data Elements

<div class="bg-success" markdown="1">
The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.
</div><!-- new-content -->

**Each Observation Must Have:**

1. <span class="bg-success" markdown="1">a status</span><!-- new-content -->
2. a category code of "vital-signs"
3. <span class= "bg-success" markdown= "1">a fixed code for average systolic and diastolic blood pressure panel</span><!-- new-content -->
4. a fixed *component* code for average systolic blood pressure
5. a fixed *component* code for average diastolic blood pressure
6. <span class="bg-success" markdown="1">a patient</span><!-- new-content -->

**Each Observation Must Support:**

1.  <span class="bg-success" markdown="1">clinically relevant time-period for the average of blood pressure readings</span><!-- new-content -->
2. a result value for the average systolic blood pressure
3. a result value for the average diastolic blood pressure
4.  <span class="bg-success" markdown="1">a reason if the value is absent*</span><!-- new-content -->
  
*see guidance below

**Profile Specific Implementation Guidance:**

- <span class= "bg-success" markdown= "1">The category "vital-signs" aligns with the USCDI Data Class and Elements and provides a convenient and consistent grouping of the clinical concepts. Implementers can group them differently based on their clinical needs.</span><!-- new-content -->
- The observations **MAY** have additional codes that translate or map to the Observation code or category codes. For example:
   -  providing a local system-specific code
   -  <span class="bg-success" markdown="1">providing more specific codes</span><!-- new-content -->

  a code system value **SHOULD** be supplied for each additional code.
- \*Because the blood pressure values are communicated in the *mandatory* systolic and diastolic components:
  - <span class="bg-success" markdown="1">the `Observation.value[x]` element **SHALL** be omitted</span><!-- new-content -->
  - An Observation without a systolic or diastolic result value **SHALL** include a reason why the data is absent in `Observation.component.dataAbsentReason`
  - *All server systems* - including those that never provide a component observation without a value - **SHALL** support `Observation.component.dataAbsentReason` for the components.
- <span class="bg-success" markdown="1">This Profile is not dependent on any specific protocol. Information about the protocol used **SHOULD** be supplied in either</span><!-- new-content -->:
  - <span class= "bg-success" markdown= "1">`Observation.note.text` (for example, "Average blood pressure is calculated from 12 measurements taken by the patient over three days.")</span><!-- new-content -->
  - <span class="bg-success" markdown="1">The standard FHIR extension <http://hl7.org/fhir/StructureDefinition/workflow-adheresTo></span><!-- new-content -->
- <span class= "bg-success" markdown= "1">Information about the number of measurements used to determine the average **SHOULD** be supplied as an `Observation.component` using the SNOMED CT code "246432004 | Number of occurrences (qualifier value)". The example shows how this component can be used.</span><!-- new-content -->
- The observation **MAY** use an [extension] defined by other profiles such as [Vital Signs with Qualifying Elements: Average Blood Pressure Profile].

{% include link-list.md %}
