**Provenance**

#### Summary of the Mandatory Requirements
1. One or more Target References  in `Provenance.target`
1.  An  instant  in `Provenance.recorded`
1. One or more  Agents  in `Provenance.agent`
      - which should have a  CodeableConcept value  in `Provenance.agent.type`
with an [extensible](http://hl7.org/fhir/R4/terminologies.html#extensible)
 binding to [US Core Provenance Participant Type Codes](ValueSet-us-core-provenance-participant-type.html)
      - which must have a Who Reference value  in `Provenance.agent.who`
      - which should have an Onbehalfof Reference value  in `Provenance.agent.onBehalfOf`

#### Summary of the Must Support Requirements
1. One or more  Agents  in `Provenance.agent`
   - which must have a `Provenance.agent.type` = `{"coding": [{"code": "author", "system": "http://terminology.hl7.org/CodeSystem/provenance-participant-type"}]}`
1.  An  Agent  in `Provenance.agent`
   - which must have a `Provenance.agent.type` = `{"coding": [{"code": "transmitter", "system": "http://hl7.org/fhir/us/core/CodeSystem/us-core-provenance-participant-type"}]}`

#### Summary of Constraints
1. onBehalfOf SHALL be present when Provenance.agent.who is a Practitioner or Device
