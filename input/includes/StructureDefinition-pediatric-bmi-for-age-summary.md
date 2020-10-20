
**Observation**

#### Summary of the Mandatory Requirements
1.  A Patient Reference  in `Observation.subject`
1.  A  CodeableConcept  in `Observation.code`
with an [extensible](http://hl7.org/fhir/R4/terminologies.html#extensible)
 binding to [Vital Signs](http://hl7.org/fhir/ValueSet/observation-vitalsignresult)
      - which must have one or more  Coding values  in `Observation.code.coding`
      - which must have at least  a  Coding value  in `Observation.code.coding`
         - which must have a fixed `Observation.code.coding.system` = `http://loinc.org`
         - which must have a fixed `Observation.code.coding.code` = `59576-9`

#### Summary of the Must Support Requirements         
1.  A  Quantity  in `Observation.valueQuantity`
      - which must have a  decimal value  in `Observation.valueQuantity.value`
      - which must have a  string value  in `Observation.valueQuantity.unit`
      - which must have a fixed `Observation.valueQuantity.system` = `http://unitsofmeasure.org`
      - which must have a fixed `Observation.valueQuantity.code` = `%`

#### Summary of Constraints
1. If Observation.code is the same as an Observation.component.code then the value element associated with the code SHALL NOT be present
1. dataAbsentReason SHALL only be present if Observation.value[x] is not present
1. If there is no component or hasMember element then either a value[x] or a data absent reason must be present.
