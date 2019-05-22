**Extension**

#### Summary of the Mandatory Requirements
   -  a *Text* Extension value
      - which must have a fixed `Extension.extension.url` = `text`
      - which must have a  string value  in `Extension.extension.valueString`
   - which must have a fixed `Extension.url` = `http://hl7.org/fhir/us/core/StructureDefinition/us-core-race`

#### Summary of the Must Support Requirements
1. One or more *Ombcategory* Extensions
   - which must have a fixed `Extension.extension.url` = `ombCategory`
   - which must have a  Coding value  in `Extension.extension.valueCoding`
with a [required](http://hl7.org/fhir/R4/terminologies.html#required)
 binding to [OMB Race Categories](ValueSet-omb-race-category.html)
