This profile sets minimum expectations for the [Procedure] resource to record, search and fetch procedures associated with a patient. It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core-Procedure profile:

-   Query for procedures performed on a Patient
-  [Record or update]  a procedure performed on a Patient


### Mandatory and Must Support Data Elements


The following data-elements are mandatory (i.e data MUST be present) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.  

**Each Procedure must have:**

1.  a status
1.  a code that identifies the type of procedure performed on the patient
1.  a patient
1.  when the procedure was performed

**Profile specific implementation guidance:**

 - Either SNOMED-CT or CPT-4/HCPC procedure codes are required and [ICD-10-PCS codes] MAY be supported as translations to them. If choosing to primarily to dental procedures, the [Code on Dental Procedures and Nomenclature (CDT Code)] may be used.

 - A procedure including an implantable device **SHOULD** use `Procedure.focalDevice` with a reference to the [US Core Implantable Device Profile].

### Examples

- [procedure-rehab](Procedure-rehab.html)
- [procedure-implant](Procedure-defib-implant.html)

{% include link-list.md %}
