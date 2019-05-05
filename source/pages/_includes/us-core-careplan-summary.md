**CarePlan**

#### Summary of the Mandatory Requirements
1.  A  Narrative  in `CarePlan.text`
      - which must have a  code value  in `CarePlan.text.status`
with a [required](http://hl7.org/fhir/R4/terminologies.html#required)
 binding to [US Core Narrative Status](ValueSet-us-core-narrative-status.html)
1.  A  code  in `CarePlan.status`
with a [required](http://hl7.org/fhir/R4/terminologies.html#required)
 binding to [RequestStatus](http://hl7.org/fhir/ValueSet/request-status)
1.  A  code  in `CarePlan.intent`
with a [required](http://hl7.org/fhir/R4/terminologies.html#required)
 binding to [Care Plan Intent](http://hl7.org/fhir/ValueSet/care-plan-intent)
1. One or more  CodeableConcepts  in `CarePlan.category`
with an [example](http://hl7.org/fhir/R4/terminologies.html#example)
 binding to [Care Plan Category](http://hl7.org/fhir/ValueSet/care-plan-category)
   - which must have at least  a `CarePlan.category` = `{"coding": [{"code": "assess-plan", "system": "http://hl7.org/fhir/us/core/CodeSystem/careplan-category"}]}`
1.  A Patient Reference  in `CarePlan.subject`