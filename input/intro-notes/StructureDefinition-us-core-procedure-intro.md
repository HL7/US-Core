
**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-   Query for procedures performed on a Patient
-  [Record or update]  a procedure performed on a Patient


### Mandatory and Must Support Data Elements


The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.  

**Each Procedure Must Have:**

1. a status
2. a code that identifies the type of procedure performed on the patient*
3. a patient
4. when the procedure was performed*

**Each Procedure Must Support:**


1. the encounter associated with the procedure

{% include additional-requirements-intro.md type="Procedure" %}

1. who was involved in the procedure*
2. a reason or indication for referral or consultation*

*see guidance below

**Profile Specific Implementation Guidance:**

- \*The `Procedure.performed` is mandatory if `Procedure.status` is "completed" or "in-progress".
- \*The `Procedure.code` has an *additional binding* of "[current]" and a base "preferred" binding.
   - For the conformance rules on the current binding for coded data, review [this section](general-requirements.html#current-binding-for-coded-elements) in the General Requirements page.
   - Procedure codes can be taken from SNOMED-CT, CPT, HCPCS II, ICD-10-PCS, CDT, or LOINC.
      - Only LOINC concepts that reflect actual procedures **SHOULD** be used
- A procedure including an implantable device **SHOULD** use `Procedure.focalDevice` referencing the [US Core Implantable Device Profile].
- See the [Screening and Assessments] guidance page for more information when exchanging Social Determinants of Health (SDOH) Procedures



- *Servers and Clients **SHALL** support both US Core ServiceRequest and US Core Procedure Profiles for communicating the reason or justification for a referral as Additional USCDI Requirements. Typically, the reason or justification for a referral or consultation is communicated through `Procedure.basedOn` linking the Procedure to the US Core ServiceRequest Profile that includes either `ServiceRequest.reasonCode` or `ServiceRequest.reasonReference`. When the Procedure does not have an associated ServiceRequest, it is communicated through the US Core Procedure Profile's `Procedure.reasonCode` or `Procedure.reasonReference`. Depending on the procedure being documented, a Server will select the appropriate Profile to use.
  - Although both `Procedure.reasonCode` and `Procedure.reasonReference` are marked as Additional USCDI Requirements, the certifying Server system is not required to support both, but **SHALL** support at least one of these elements. The certifying Client application **SHALL** support both elements.
     - when using  `Procedure.reasonReference`:
       - Servers **SHALL** support *at least one* target resource in `Procedure.reasonReference`. Clients **SHALL** support all target resources in `Procedure.reasonReference`.
       - The referenced resources **SHOULD** be a US Core Profile as documented in [Referencing US Core Profiles].
{% include provenance-author-bullet-generator.md %}

{% include link-list.md %}
