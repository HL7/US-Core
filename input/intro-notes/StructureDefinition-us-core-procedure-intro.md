
**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-   Query for procedures performed on a Patient
-  [Record or update]  a procedure performed on a Patient


### Mandatory and Must Support Data Elements


The following data-elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Views] below provides the  formal summary, definitions, and  terminology requirements.  

**Each Procedure Must Have:**

1.  a status
2.  a code that identifies the type of procedure performed on the patient*
3.  a patient
4.  when the procedure was performed*

**Each Procedure Must Support:**

1. the encounter associated with the procedure

{% include additional-requirements-intro.md type="Procedure" %}

1. a reason or indication for referral or consultation*

*see guidance below

**Profile Specific Implementation Guidance:**

- \*The `Procedure.code` is mandatory if `Procedure.status` is 'completed' or 'in-progress'.
- <span class="bg-success" markdown="1">\*The `Procedure.code` has an *additional binding* of "current" and a base "preferred" binding.</span><!-- new-content -->
   - <span class="bg-success" markdown="1">For the conformance rules on current binding for coded data, review [this section](general-requirements.html#current-binding-for-coded-elements) in the General Requirements page.</span><!-- new-content -->
   - Procedure codes can be taken from SNOMED-CT, CPT, HCPCS II, ICD-10-PCS, CDT, or LOINC.
      - Only LOINC concepts that reflect actual procedures **SHOULD** be used
- A procedure including an implantable device **SHOULD** use `Procedure.focalDevice` with a reference to the [US Core Implantable Device Profile].
- See the [Screening and Assessments] guidance page for more information when exchanging Social Determinants of Health (SDOH) Procedures


{% include reason-for-referral.md type="Procedure" %}

{% include link-list.md %}
