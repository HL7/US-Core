**Immunization**

#### Summary of the Mandatory Requirements
1.  A  code  in `Immunization.status`
with a [required](http://hl7.org/fhir/R4/terminologies.html#required)
 binding to [Immunization Status Codes](http://hl7.org/fhir/ValueSet/immunization-status)
1.  A  CodeableConcept  in `Immunization.vaccineCode`
with an [extensible](http://hl7.org/fhir/R4/terminologies.html#extensible)\+ [MaxValueSet](general-guidance.html#max-binding)
 binding to [Vaccine Administered Value Set (CVX)](http://hl7.org/fhir/us/core/ValueSet/us-core-cvx) with the following constraints: *SHOULD have a translation to the NDC value set*
1.  A Patient Reference  in `Immunization.patient`
1.  A  dateTime  in `Immunization.occurrence[x]`
1.  A  boolean  in `Immunization.primarySource`

#### Summary of the Must Support Requirements
1.  A  CodeableConcept  in `Immunization.statusReason`
with an [example](http://hl7.org/fhir/R4/terminologies.html#example)
 binding to [Immunization Status Reason Codes](http://hl7.org/fhir/ValueSet/immunization-status-reason)

#### Summary of Constraints
1. SHOULD have a translation to the NDC value set