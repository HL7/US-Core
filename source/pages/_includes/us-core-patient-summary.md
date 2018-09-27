#### Complete Summary of the Mandatory Requirements


1.  One or more medical record numbers in `Patient.identifier`
    -   each Patient.identifier must have:
        -   an `identifier.system`
        -   an `identifier.value` that is unique within the system.

2.  One or more names in `Patient.name`
    -   each Patient.name must have:
        -   a `name.family`
        -   a `name.given`

3.  One administrative gender in `Patient.gender`
    -   Patient.gender is bound to [AdministrativeGender] Value set

  [AdministrativeGender]: {{site.data.fhir.path}}valueset-administrative-gender.html


#### Summary of the Must Support Requirements

Additionally your system must Support:

1.  A date of birth in `Patient.birthDate`
2.  One or more languages spoken in `Patient.communication.language` which has a [extensible + max valueset](guidance.html#extensible--max-valueset-binding-for-codeableconcept-datatype)  binding to the [All Language codes with language and optionally a region modifier] valueset
3.  One or more race codes in  `Patient.extension`= [US Core Race Extension] which:
    - Must include at least one code from [OMB Race Categories]
    - May include additional race codes from [CDC Race Codes]

4.  One or more ethnicity codes in  `Patient.extension`=[US Core ethnicity Extension] which:
    - Must include one code from [OMB Ethnicity Categories]
    - May include additional race codes from [CDC Ethnicity Codes]

5.  One Birth Sex in `Patient.extension`= [US Core Patient Birth Sex] which has a [required]({{site.data.fhir.path}}terminologies.html#required) binding to [US Core Birth Sex] valueset


  [Patient.birthDate]: {{site.data.fhir.path}}us/daf/daf-patient-guidance.html#daf-patient.Patient.birthDate
  [Patient.communication.language]: {{site.data.fhir.path}}us/daf/daf-patient-guidance.html#daf-patient.Patient.communication.language
  [All Language codes with language and optionally a region modifier]: ValueSet-simple-language.html
  [All Languages]: {{site.data.fhir.path}}valueset-all-languages.html
  [US Core Patient Birth Sex]:StructureDefinition-us-core-birthsex.html
  [US Core Birth Sex]: ValueSet-us-core-birthsex.html
  [US Core Patient Race]: StructureDefinition-us-core-race.html
  [OMB Race Categories]: ValueSet-omb-race-category.html
  [US Core Race Extension]:StructureDefinition-us-core-race.html
  [CDC Race Codes]:ValueSet-detailed-race.html
 [CDC Ethnicity Codes]: ValueSet-detailed-ethnicity.html
 [US Core ethnicity Extension]:StructureDefinition-us-core-ethnicity.html
 [OMB Ethnicity Categories]: ValueSet-omb-ethnicity-category.html
