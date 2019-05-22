**Observation**

#### Summary of the Mandatory Requirements
1.  A  code  in `Observation.status`
with a [required](http://hl7.org/fhir/R4/terminologies.html#required)
 binding to [ObservationStatus](http://hl7.org/fhir/ValueSet/observation-status)
1. One or more  CodeableConcepts  in `Observation.category`
   - which must have at least a Observation.category = {"coding": [{"code": "laboratory", "system": "	http://terminology.hl7.org/CodeSystem/observation-category"}]}
1.  A  CodeableConcept  in `Observation.code`
with an [extensible](http://hl7.org/fhir/R4/terminologies.html#extensible)
 binding to [LOINC Codes](http://hl7.org/fhir/ValueSet/observation-codes)
1.  A Patient Reference  in `Observation.subject`

#### Summary of the Must Support Requirements
1.  A  dateTime  in `Observation.effective[x]`
 with the following constraints: *Datetime must be at least to day.*
1.  A  Quantity  in `Observation.value[x]`
 with the following constraints: *SHOULD use Snomed CT for coded Results, SHALL use UCUM for coded quantity units.*
1.  A  CodeableConcept  in `Observation.dataAbsentReason`
with an [extensible](http://hl7.org/fhir/R4/terminologies.html#extensible)
 binding to [DataAbsentReason](http://hl7.org/fhir/ValueSet/data-absent-reason)

#### Summary of Constraints
1. If Observation.code is the same as an Observation.component.code then the value element associated with the code SHALL NOT be present
1. dataAbsentReason SHALL only be present if Observation.value[x] is not present
1. If there is no component or related element then either a value[x] or a data absent reason must be present
1. Datetime must be at least to day.
1. SHOULD use Snomed CT for coded Results
1. SHALL use UCUM for coded quantity units.
