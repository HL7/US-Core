**Provenance**

SOME PORTION OF THIS IS GENERATED

#### Summary of the Mandatory Requirements
1.  A  code  in `Goal.lifecycleStatus`
with a [required](http://hl7.org/fhir/R4/terminologies.html#required)
 binding to [GoalLifecycleStatus](http://hl7.org/fhir/ValueSet/goal-status)
1.  A  CodeableConcept  in `Goal.description`
with an [example](http://hl7.org/fhir/R4/terminologies.html#example)
 binding to [SNOMED CT Clinical Findings](http://hl7.org/fhir/ValueSet/clinical-findings)
1.  A Patient Reference  in `Goal.subject`

#### Summary of the Must Support Requirements
1. One or more  Targets  in `Goal.target`
 with the following constraints: *Goal.target.measure is required if Goal.target.detail is populated*
   - which should have a  date value  in `Goal.target.dueDate`

#### Summary of Constraints
1. Goal.target.measure is required if Goal.target.detail is populated