**MedicationRequest**

#### Summary of the Mandatory Requirements
1.  A  code  in `MedicationRequest.status`
with a [required](http://hl7.org/fhir/R4/terminologies.html#required)
 binding to [Medicationrequest  status](http://hl7.org/fhir/ValueSet/medicationrequest-status)
1.  A  CodeableConcept  in `MedicationRequest.medication[x]`
with an [extensible](http://hl7.org/fhir/R4/terminologies.html#extensible)
 binding to [Medication Clinical Drug (RxNorm)](http://hl7.org/fhir/us/core/ValueSet/us-core-medication-codes)
1.  A Patient Reference  in `MedicationRequest.subject`
1.  A  dateTime  in `MedicationRequest.authoredOn`
1.  A Requester Reference  in `MedicationRequest.requester`

#### Summary of the Must Support Requirements
1. One or more  Dosages  in `MedicationRequest.dosageInstruction`
   - which should have a  string value  in `MedicationRequest.dosageInstruction.text`