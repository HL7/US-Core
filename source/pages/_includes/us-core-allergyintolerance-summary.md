**AllergyIntolerance**

#### Summary of the Mandatory Requirements
1.  A  CodeableConcept  in `AllergyIntolerance.code`
with an [extensible](http://hl7.org/fhir/R4/terminologies.html#extensible)
 binding to [](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1186.8/expansion)
1.  A Patient Reference  in `AllergyIntolerance.patient`

#### Summary of the Must Support Requirements
1.  A  CodeableConcept  in `AllergyIntolerance.clinicalStatus`
with a [required](http://hl7.org/fhir/R4/terminologies.html#required)
 binding to [AllergyIntolerance Clinical Status Codes](http://hl7.org/fhir/ValueSet/allergyintolerance-clinical)
1.  A  CodeableConcept  in `AllergyIntolerance.verificationStatus`
with a [required](http://hl7.org/fhir/R4/terminologies.html#required)
 binding to [AllergyIntolerance Verification Status Codes](http://hl7.org/fhir/ValueSet/allergyintolerance-verification)

#### Summary of Constraints
1. AllergyIntolerance.clinicalStatus SHALL be present if verificationStatus is not entered-in-error.
1. AllergyIntolerance.clinicalStatus SHALL NOT be present if verification Status is entered-in-error