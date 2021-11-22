
This profile sets minimum expectations for the [Procedure] resource to record, search, and fetch procedures associated with a patient. It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core-Procedure profile:

-   Query for procedures performed on a Patient
-  [Record or update]  a procedure performed on a Patient


### Mandatory and Must Support Data Elements


The following data-elements must always be present ([Mandatory] definition]) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.  

**Each Procedure must have:**

1.  a status
1.  a code that identifies the type of procedure performed on the patient
1.  a patient
1.  when the procedure was performed

**Profile specific implementation guidance:**

- {:.new-content}This profile can be used to record a completed service or intervention. When exchanging Social Determinants of Health (SDOH) Procedures, servers **SHOULD** use the [SDOH Procedure](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.789/expansion) concepts provided by Gravity. See [SDOH Guidance] for more information. 
- Procedure codes can be taken from SNOMED-CT, CPT, HCPCS II, ICD-10-PCS, CDT. LOINC.
    - Only LOINC concepts that reflect actual procedures **SHOULD** be used
- A procedure including an implantable device **SHOULD** use `Procedure.focalDevice` with a reference to the [US Core Implantable Device Profile].

### Examples

- [procedure-rehab](Procedure-rehab.html)
- [procedure-implant](Procedure-defib-implant.html)

{% include link-list.md %}
