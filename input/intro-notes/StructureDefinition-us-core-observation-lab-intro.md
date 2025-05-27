
**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-   Query for lab results belonging to a Patient
-  [Record or update] lab results belonging to a Patient

### Mandatory and Must Support Data Elements

*In addition* to the Mandatory and Must Support data elements in the [US Core Observation Clinical Result Profile], the following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views]  section below provides the formal summary, definitions, and terminology requirements. {% include diff-display-note.md parent_profile='US Core Observation Clinical Result Profile' %}

**Each Observation Must Have:**

1.   a category code of 'laboratory'
2.   a laboratory [LOINC] code, if available, which tells you what is being measured

**Each Observation Must Support:**

1. a timestamp when the resource last changed*
2. a result value*
   - if the result value is a numeric quantity, a standard [UCUM] unit
   - if the result value is a coded quantity, a standard [SNOMED CT]
3. result interpretation
   -  if the result value is a numeric quantity, a standard [UCUM] unit
4. result reference range
5. a specimen type (e.g., blood, serum, urine)*

{% include additional-requirements-intro.md type="ServiceRequest" %}

1. the name of the test that was performed

\* see guidance below

**Profile Specific Implementation Guidance:**

- For USCDI, systems are required to use SNOMED CT for coded results if the SCT code exists.
- The [CLIA/USCDI/HL7 Elements Crossmapping Table] provides a crosswalk of [Clinical Laboratory Improvement Amendments (CLIA)] data elements to corresponding FHIR fields, terminology standards, and naming conventions used in HL7 CDA and HL7 V2 standards. Implementers can use this mapping to help comply with CLIA requirements when using the US Core Laboratory Result Observation Profile.
{% include observation_guidance_1.md category="laboratory" example1=" such as 'chemistry'" example2=" (for example, a 24-Hour Urine Collection test)" %}
- \*This profile inherits the invariant "us-core-3" from the US Core Observation Clinical Result Profile that requires UCUM to be used as a unit type for `Observation.valeQuantity.code`.
-  *Even when the specimen type is already implied by the LOINC code used in `Observation.code` (e.g., a LOINC code for Blood Glucose), the `Observation.specimen` element **SHOULD** also be populated with the referenced Specimen resource to explicitly communicate the collected specimen type. The type of specimen **SHOULD** not conflict with the LOINC code. 
- \* See the US Core General Guidance page for [Searching Using lastUpdated]. Updates to `.meta.lastUpdated` **SHOULD** reflect:
  - New laboratory observations
  - Changes in the status of laboratory observations, including events that trigger the same status (e.g., amended → amended).


{% include link-list.md %}
