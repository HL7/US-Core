**Observation**

#### Summary of the Mandatory Requirements
1.  A  code  in `Observation.status`
with a [required](http://hl7.org/fhir/R4/terminologies.html#required)
 binding to [ObservationStatus](http://hl7.org/fhir/ValueSet/observation-status)
1.  A  CodeableConcept  in `Observation.code`
with an [example](http://hl7.org/fhir/R4/terminologies.html#example)
 binding to [LOINC Codes](http://hl7.org/fhir/ValueSet/observation-codes)
1.  A Patient Reference  in `Observation.subject`
1.  An  instant  in `Observation.issued`
1.  A  CodeableConcept  in `Observation.valueCodeableConcept`
with an [extensible](http://hl7.org/fhir/R4/terminologies.html#extensible)\+ [MaxValueSet](general-guidance.html#max-binding)
 binding to [Smoking Status](http://hl7.org/fhir/us/core/ValueSet/us-core-observation-ccdasmokingstatus)

#### Summary of Constraints
1. If Observation.code is the same as an Observation.component.code then the value element associated with the code SHALL NOT be present
1. dataAbsentReason SHALL only be present if Observation.value[x] is not present