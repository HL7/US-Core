
<!-- source file = /Users/ehaas/Documents/FHIR/US-Core/input/images-source/additional-uscdi-requirements.xlsx, Do not edit directly. Convert using MyNotebooks/utils/simple_excel_to_markdown_tabler.ipynb -->

| Additional USCDI Requirements                                     | Profile                             | FHIR Element                        |
|-------------------------------------------------------------------|-------------------------------------|-------------------------------------|
| Contact Detail                                                    | [US Core Patient Profile]           | Patient.telecom                     |
| A Communication Language                                          | [US Core Patient Profile]           | Patient.communication               |
| A Race                                                            | [US Core Patient Profile]           | Patient.extension:race              |
| An Ethnicity                                                      | [US Core Patient Profile]           | Patient.extension:ethnicity         |
| A Tribal Affiliation                                              | [US Core Patient Profile]           | Patient.extension:tribalAffiliation |
| A Birth Sex                                                       | [US Core Patient Profile]           | Patient.extension:birthsex          |
| Gender Identity                                                   | [US Core Patient Profile]           | Patient.extension:genderIdentity    |
| Date Of Death                                                     | [US Core Patient Profile]           | Patient.deceased[x]                 |
| Previous Address                                                  | [US Core Patient Profile]           | Patient.address.use                 |
| Previous Name                                                     | [US Core Patient Profile]           | Patient.name.use                    |
| Suffix                                                            | [US Core Patient Profile]           | Patient.name.suffix                 |
| A Reason Or Indication For Referral Or Consultation               | [US Core ServiceRequest Profile]    | ServiceRequest.reasonCode           |
| A Reason Or Indication For Referral Or Consultation               | [US Core ServiceRequest Profile]    | ServiceRequest.reasonReference      |
| The Reason Or Indication For The Prescription                     | [US Core MedicationRequest Profile] | MedicationRequest.reasonCode        |
| The Reason Or Indication For The Prescription                     | [US Core MedicationRequest Profile] | MedicationRequest.reasonReference   |
| A Reference To The Request For The Procedure                      | [US Core Procedure Profile]         | Procedure.basedOn                   |
| US Core Document Category                                         | [US Core DocumentReference Profile] | DocumentReference.category:uscore   |
| References To An Associated Survey, Assessment, Or Screening Tool | [US Core Simple Observation Profile]       | Observation.derivedFrom             |
{:.grid}