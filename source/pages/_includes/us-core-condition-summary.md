#### Complete Summary of the Mandatory Requirements

1.  Conditionally One clinical status in `Condition.clinicalStatus`
    -   [Invariants]
    -   Condition.clinicalStatus is bound to [Condition Clinical Status Codes]
1.  One code in `Condition.verificationStatus` which is bound to [ConditionVerificationStatus] value set
1.  At least on code in `Condition.category` which has an [extensible]({{site.data.fhir.path}}terminologies.html#extensible) binding to [US Core Condition Category Codes] value set
1.  One Identification of the problem or health concern in `Condition.code` which has an [extensible]({{site.data.fhir.path}}terminologies.html#extensible) binding to [Problem Value Set]
1.  One patient reference in `Condition.patient`


  [extensible]: {{site.data.fhir.path}}terminologies.html#extensible
  [Problem Value Set]: ValueSet-us-core-problem.html
  [Invariants]: {{site.data.fhir.path}}condition.html#invs
  [Condition Clinical Status Codes]: {{site.data.fhir.path}}valueset-condition-clinical.html
  [ConditionVerificationStatus]: {{site.data.fhir.path}}valueset-condition-ver-status.html
  [US Core Condition Profile]:StructureDefinition-us-core-condition.html
 [US Core Condition Category Codes]: ValueSet-us-core-condition-category.html
