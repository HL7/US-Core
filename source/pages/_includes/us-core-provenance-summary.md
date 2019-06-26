**Provenance**

#### Summary of the Mandatory Requirements
1. One or more Target References  in `Provenance.target`
1.  An  instant  in `Provenance.recorded`
1. One or more  Agents  in `Provenance.agent`
   - which must have at least  a  Agent value  in `Provenance.agent`
      - which must have a  CodeableConcept value  in `Provenance.agent.type`
with an [extensible](http://hl7.org/fhir/R4/terminologies.html#extensible)
 binding to [Provenance participant type](http://hl7.org/fhir/ValueSet/provenance-agent-type)
         - which must have a  Coding value  in `Provenance.agent.type.coding`
            - which must have a fixed `Provenance.agent.type.coding.system` = `http://terminology.hl7.org/CodeSystem/provenance-participant-type`
            - which must have a fixed `Provenance.agent.type.coding.code` = `author`
      - which must have a Who Reference value  in `Provenance.agent.who`
      - which should have a Onbehalfof Reference value  in `Provenance.agent.onBehalfOf`
