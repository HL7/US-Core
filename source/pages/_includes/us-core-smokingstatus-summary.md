**Observation**

#### Summary of the Mandatory Requirements
1.  A  code  in `Observation.status`
with a [required](http://hl7.org/fhir/R4/terminologies.html#required)
 binding to [US Core Observation Status for Smoking Status Value Set](ValueSet-us-core-observation-smoking-status-status.html)
1.  A  CodeableConcept  in `Observation.code`
with an [extensible](http://hl7.org/fhir/R4/terminologies.html#extensible)
 binding to [US Core Observation Smoking Status Codes Value Set](ValueSet-us-core-smoking-status-observation-codes.html)
1.  A Patient Reference  in `Observation.subject`
1.  An  instant  in `Observation.issued`
1.  A  CodeableConcept  in `Observation.valueCodeableConcept`
with an [extensible](http://hl7.org/fhir/R4/terminologies.html#extensible)\+ [MaxValueSet](general-guidance.html#max-binding)
 binding to [Smoking Status](ValueSet-us-core-observation-smokingstatus.html)

#### Summary of Constraints
1. If Observation.code is the same as an Observation.component.code then the value element associated with the code SHALL NOT be present
1. dataAbsentReason SHALL only be present if Observation.value[x] is not present