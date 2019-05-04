**Condition**

#### Summary of the Mandatory Requirements
1. One or more  CodeableConcepts  in `Condition.category`
with an [extensible](http://hl7.org/fhir/R4/terminologies.html#extensible)
 binding to [US Core Condition Category Codes](ValueSet-us-core-condition-category.html)
1.  A  CodeableConcept  in `Condition.code`
with an [extensible](http://hl7.org/fhir/R4/terminologies.html#extensible)
 binding to [Problem Value Set](ValueSet-us-core-problem.html)
1.  A Patient Reference  in `Condition.subject`

#### Summary of the Must Support Requirements
1.  A  CodeableConcept  in `Condition.clinicalStatus`
with a [required](http://hl7.org/fhir/R4/terminologies.html#required)
 binding to [Condition Clinical Status Codes](http://hl7.org/fhir/ValueSet/condition-clinical)
1.  A  CodeableConcept  in `Condition.verificationStatus`
with a [required](http://hl7.org/fhir/R4/terminologies.html#required)
 binding to [ConditionVerificationStatus](http://hl7.org/fhir/ValueSet/condition-ver-status)

#### Summary of Constraints
1. Condition.clinicalStatus SHALL NOT be present if verification Status is entered-in-error
1. If condition is abated, then clinicalStatus must be either inactive, resolved, or remission
1. Condition.clinicalStatus SHALL be present if verificationStatus is not entered-in-error and category is problem-list-item
1. A code in Condition.category SHOULD be from US Core Condition Category Codes value set.