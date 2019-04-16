
### Summary of the Mandatory Requirements



1.  A  CodeableConcept  in `Observation.code`
with a [extensible](http://hl7.org/fhir/R4/terminologies.html#extensible)
 binding to [Vital Signs](http://hl7.org/fhir/ValueSet/observation-vitalsignresult)
    - which must have one or more Coding values  in `Observation.code.coding`
    - which must have a  Coding value  in `Observation.code.coding`
    - which must have a fixed `Observation.code.coding.system` = `http://loinc.org`
    - which must have a fixed `Observation.code.coding.code` = `59576-9`

1.  A  Quantity  in `Observation.valueQuantity`

    - which must have a  decimal value  in `Observation.valueQuantity.value`
    - which must have a  string value  in `Observation.valueQuantity.unit`
    - which must have a fixed `Observation.valueQuantity.system` = `http://unitsofmeasure.org`
    - which must have a fixed `Observation.valueQuantity.code` = `%`



