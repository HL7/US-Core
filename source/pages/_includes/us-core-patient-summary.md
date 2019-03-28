##### Complete Summary of the Mandatory Requirements


1.  One or more medical record numbers in `Patient.identifier`
    -   each Patient.identifier must have:
        -   an `identifier.system`
        -   an `identifier.value` that is unique within the system.

1.  One or more names in `Patient.name`
    -   each Patient.name must have:
        -   a `name.family`
        -   a `name.given`

1.  One administrative gender in `Patient.gender`
    -   Patient.gender is bound to [AdministrativeGender] Value set

##### Summary of the Must Support Requirements

Additionally your system must Support:

1.  One or more contact details in `Patient.telecom`
1.  A date of birth in `Patient.birthDate`
1.  One or more addresses in `Patient.address`
1.  One or more languages spoken in `Patient.communication.language` which has a [extensible + max valueset] binding to the [All Language codes with language and optionally a region modifier] valueset
1.  One or more race codes in  `Patient.extension`= [US Core Race Extension] which:
    - Must include at least one code from [OMB Race Categories]
    - May include additional race codes from [CDC Race Codes]

1.  One or more ethnicity codes in  `Patient.extension`=[US Core ethnicity Extension] which:
    - Must include one code from [OMB Ethnicity Categories]
    - May include additional race codes from [CDC Ethnicity Codes]

1.  One Birth Sex in `Patient.extension`= [US Core Patient Birth Sex] which has a [required] binding to [US Core Birth Sex] valueset


{% include link-list.md %}
