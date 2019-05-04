**CareTeam**

#### Summary of the Mandatory Requirements
1.  A Patient Reference  in `CareTeam.subject`
1. One or more  Participants  in `CareTeam.participant`
 with the following constraints: *CareTeam.participant.onBehalfOf can only be populated when CareTeam.participant.member is a Practitioner*
      - which must have a  CodeableConcept value  in `CareTeam.participant.role`
with an [extensible](http://hl7.org/fhir/R4/terminologies.html#extensible)\+ [MaxValueSet](general-guidance.html#max-binding)
 binding to [CareTeam Provider Roles](ValueSet-us-core-careteam-provider-roles.html)
      - which must have a Member Reference value  in `CareTeam.participant.member`

#### Summary of the Must Support Requirements
1.  A  code  in `CareTeam.status`
with a [required](http://hl7.org/fhir/R4/terminologies.html#required)
 binding to [CareTeamStatus](http://hl7.org/fhir/ValueSet/care-team-status)

#### Summary of Constraints
1. CareTeam.participant.onBehalfOf can only be populated when CareTeam.participant.member is a Practitioner