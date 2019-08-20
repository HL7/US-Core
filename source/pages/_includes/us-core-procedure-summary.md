**Procedure**

#### Summary of the Mandatory Requirements
1.  A  code  in `Procedure.status`
with a [required](http://hl7.org/fhir/R4/terminologies.html#required)
 binding to [EventStatus](http://hl7.org/fhir/ValueSet/event-status)
1.  A  CodeableConcept  in `Procedure.code`
with an [extensible](http://hl7.org/fhir/R4/terminologies.html#extensible)\+ [MaxValueSet](general-guidance.html#max-binding)
 binding to [US Core Procedure Codes](ValueSet-us-core-procedure-code.html)
1.  A Patient Reference  in `Procedure.subject`
1.  A  dateTime  in `Procedure.performed[x]`
