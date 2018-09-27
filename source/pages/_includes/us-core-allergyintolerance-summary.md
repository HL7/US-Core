#### Summary of the Mandatory Requirements

1.  Conditionally One clinical status in `AllergyIntolerance.clinicalStatus`
    - [Invariants]({{site.data.fhir.path}}allergyintolerance.html#invs)
    - `AllergyIntolerance.clinicalStatus` has a [required]({{site.data.fhir.path}}terminologies.html#required) binding to [AllergyIntoleranceStatus]({{site.data.fhir.path}}valueset-allergy-clinical-status.html) value set
1.  One code in `AllergyIntolerance.verificationStatus` which has a [required]({{site.data.fhir.path}}terminologies.html#required) binding to:
    -   [AllergyIntoleranceVerificationStatus]({{site.data.fhir.path}}valueset-allergy-verification-status.html) value set
1.  One Identification of a substance, or a class of substances, that is considered to be responsible for the adverse reaction risk in `AllergyIntolerance.code` which has an [extensible]({{site.data.fhir.path}}terminologies.html#extensible) binding to:
    -    [US Core Core Substance-Reactant for Intolerance and Negation Codes](ValueSet-us-core-substance.html) value set
1.  One patient reference in `AllergyIntolerance.patient`
