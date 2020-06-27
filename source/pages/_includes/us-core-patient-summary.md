**Patient**

#### Summary of the Mandatory Requirements
1. One or more  Identifiers  in `Patient.identifier`
      - which must have an  uri value  in `Patient.identifier.system`
      - which must have a  string value  in `Patient.identifier.value`
1. One or more  HumanNames  in `Patient.name`
 with the following constraints: *Patient.name.given or Patient.name.family or both SHALL be present*
      - which should have a  string value  in `Patient.name.family`
      - which should have one or more  string values  in `Patient.name.given`
1.  A  code  in `Patient.gender`
with a [required](http://hl7.org/fhir/R4/terminologies.html#required)
 binding to [AdministrativeGender](http://hl7.org/fhir/ValueSet/administrative-gender)

#### Summary of the Must Support Requirements
1.  A [Race](StructureDefinition-us-core-race.html) Extension  in `Patient.extension`
1.  An [Ethnicity](StructureDefinition-us-core-ethnicity.html) Extension  in `Patient.extension`
1.  A [Birthsex](StructureDefinition-us-core-birthsex.html) Extension  in `Patient.extension`
with a [required](http://hl7.org/fhir/R4/terminologies.html#required)
 binding to [Birth Sex](ValueSet-birthsex.html)
1. One or more  ContactPoints  in `Patient.telecom`
   - which must have a  code value  in `Patient.telecom.system`
with a [required](http://hl7.org/fhir/R4/terminologies.html#required)
 binding to [ContactPointSystem](http://hl7.org/fhir/ValueSet/contact-point-system)
   - which must have a  string value  in `Patient.telecom.value`
   - which should have a  code value  in `Patient.telecom.use`
with a [required](http://hl7.org/fhir/R4/terminologies.html#required)
 binding to [ContactPointUse](http://hl7.org/fhir/ValueSet/contact-point-use)
1.  A  date  in `Patient.birthDate`
1. One or more  Addresses  in `Patient.address`
   - which should have one or more  string values  in `Patient.address.line`
   - which should have a  string value  in `Patient.address.city`
   - which should have a  string value  in `Patient.address.state`
with an [extensible](http://hl7.org/fhir/R4/terminologies.html#extensible)
 binding to [USPS Two Letter Alphabetic Codes](ValueSet-us-core-usps-state.html)
   - which should have a  string value  in `Patient.address.postalCode`
   - which should have a  Period value  in `Patient.address.period`
1. One or more  Communications  in `Patient.communication`
   - which must have a  CodeableConcept value  in `Patient.communication.language`
with an [extensible](http://hl7.org/fhir/R4/terminologies.html#extensible)
 binding to [Language codes with language and optionally a region modifier](ValueSet-simple-language.html)

#### Summary of Constraints
1. Either Patient.name.given and/or Patient.name.family SHALL be present or a Data Absent Reason Extension SHALL be present.
