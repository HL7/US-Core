**MedicationRequest**

#### Summary of the Mandatory Requirements
1.  A  code  in `MedicationRequest.status`
with a [required](http://hl7.org/fhir/R4/terminologies.html#required)
 binding to [Medicationrequest  status](http://hl7.org/fhir/ValueSet/medicationrequest-status)
1.  A  code  in `MedicationRequest.intent`
with a [required](http://hl7.org/fhir/R4/terminologies.html#required)
 binding to [Medication request  intent](http://hl7.org/fhir/ValueSet/medicationrequest-intent)
1.  A  CodeableConcept or Medication Reference in `MedicationRequest.medication[x]`
with an [extensible](http://hl7.org/fhir/R4/terminologies.html#extensible)
 binding to [US Core Medication Codes (RxNorm)](ValueSet-us-core-medication-codes.html)
1.  A Patient Reference  in `MedicationRequest.subject`
1.  A  dateTime  in `MedicationRequest.authoredOn`
1.  A Requester Reference  in `MedicationRequest.requester`

#### Summary of the Must Support Requirements
1.  A  boolean or Reference in `MedicationRequest.reported[x]`
1.  A Encounter Reference  in `MedicationRequest.encounter`
1. One or more  Dosages  in `MedicationRequest.dosageInstruction`
   - which should have a  string value  in `MedicationRequest.dosageInstruction.text`
