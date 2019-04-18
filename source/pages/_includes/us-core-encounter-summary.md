**Encounter**

#### Summary of the Mandatory Requirements
1.  A  code  in `Encounter.status`
with a [required](http://hl7.org/fhir/R4/terminologies.html#required)
 binding to [EncounterStatus](http://hl7.org/fhir/ValueSet/encounter-status|4.0.0)
1.  A  Coding  in `Encounter.class`
with an [extensible](http://hl7.org/fhir/R4/terminologies.html#extensible)
 binding to [V3 Value SetActEncounterCode](http://terminology.hl7.org/ValueSet/v3-ActEncounterCode)
1. One or more  CodeableConcepts  in `Encounter.type`
with an [extensible](http://hl7.org/fhir/R4/terminologies.html#extensible)
 binding to [US Core Encounter Type](ValueSet-us-core-encounter-type.html)
1.  A Patient Reference  in `Encounter.subject`

#### Summary of the Must Support Requirements
1. One or more  Identifiers  in `Encounter.identifier`
   - which must have an  uri value  in `Encounter.identifier.system`
   - which must have a  string value  in `Encounter.identifier.value`
1. One or more  Participants  in `Encounter.participant`
   - which should have one or more  CodeableConcept values  in `Encounter.participant.type`
with an [extensible](http://hl7.org/fhir/R4/terminologies.html#extensible)
 binding to [Participant type](http://hl7.org/fhir/ValueSet/encounter-participant-type)
   - which should have a  Period value  in `Encounter.participant.period`
   - which should have a Individual Reference value  in `Encounter.participant.individual`
1.  A  Period  in `Encounter.period`
1. One or more  CodeableConcepts  in `Encounter.reasonCode`
with a [preferred](http://hl7.org/fhir/R4/terminologies.html#preferred)
 binding to [Encounter Reason Codes](http://hl7.org/fhir/ValueSet/encounter-reason)
1.  A  Hospitalization  in `Encounter.hospitalization`
   - which should have a  CodeableConcept value  in `Encounter.hospitalization.dischargeDisposition`
with an [example](http://hl7.org/fhir/R4/terminologies.html#example)
 binding to [Discharge disposition](http://hl7.org/fhir/ValueSet/encounter-discharge-disposition)
1. One or more  Locations  in `Encounter.location`
   - which must have a Location Reference value  in `Encounter.location.location`