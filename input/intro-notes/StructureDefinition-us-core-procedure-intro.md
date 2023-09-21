
**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-   Query for procedures performed on a Patient
-  [Record or update]  a procedure performed on a Patient


### Mandatory and Must Support Data Elements


The following data-elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Views] below provides the  formal summary, definitions, and  terminology requirements.  

**Each Procedure Must Have:**

1.  a status
1.  a code that identifies the type of procedure performed on the patient
1.  a patient
2.  when the procedure was performed*

\*This elements have the following constraints: **SHALL** be present if status is 'completed' or 'in-progress'.

**Each Procedure Must Support:**

1.  <span class="bg-success" markdown="1">the encounter associated with the procedure</span><!-- new-content -->


**Additional USCDI Requirements**

{% include additional-requirements-intro.md type="Procedure" %}

1.  A reference to the request for the procedure*

\*see guidance below

**Profile Specific Implementation Guidance:**

- Procedure codes can be taken from SNOMED-CT, CPT, HCPCS II, ICD-10-PCS, CDT. LOINC.
    - Only LOINC concepts that reflect actual procedures **SHOULD** be used
- A procedure including an implantable device **SHOULD** use `Procedure.focalDevice` with a reference to the [US Core Implantable Device Profile].
- See the [Screening and Assessments] guidance page for more information when exchanging Social Determinants of Health (SDOH) Procedures
- *The Reason or justification for a referral or consultation is communicated through the [US Core ServiceRequest Profile] which can be linked to the Procedure through the `Procedure.basedOn' element.

{% include link-list.md %}
