
**Example Usage Scenarios:**

The following are example usage scenarios for the this profile:

-   Query for procedures performed on a Patient
-  [Record or update]  a procedure performed on a Patient


### Mandatory and Must Support Data Elements


The following data-elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.  

**Each Procedure must have:**

1.  a status
1.  a code that identifies the type of procedure performed on the patient
1.  a patient

**Each Procedure must support:**

1.  <span class="bg-success" markdown="1">when the procedure was performed</span><!-- new-content -->

**Profile specific implementation guidance:**

- Procedure codes can be taken from SNOMED-CT, CPT, HCPCS II, ICD-10-PCS, CDT. LOINC.
    - Only LOINC concepts that reflect actual procedures **SHOULD** be used
- A procedure including an implantable device **SHOULD** use `Procedure.focalDevice` with a reference to the [US Core Implantable Device Profile].
- See the [SDOH] guidance page for more information when exchanging Social Determinants of Health (SDOH) Procedures
- <span class="bg-success" markdown="1">The Reason or justification for a referral or consultation is communicated through the [US Core ServiceRequest Profile] which can be linked to the ServiceRequest through the `Procedure.basedOn' element.</span><!-- new-content -->

{% include link-list.md %}
