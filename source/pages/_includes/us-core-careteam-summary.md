#### Complete Summary of the Mandatory Requirements

1.  One status in `CareTeam.status`
-   CareTeam.status is bound to [CareTeamStatus] value set
1.  One reference to a patient in `CareTeam.subject`
1.  One participant role for each careteam member in
    `CareTeam.participant.role`which which has:
    -   a [extensible + max valueset](guidance.html#extensible--max-valueset-binding-for-codeableconcept-datatype)  binding to the [CareTeam Provider Role
Value Set] value set.
1.  Careteam members in `CareTeam.participant.member`

 [CareTeamStatus]: {{site.data.fhir.path}}valueset-care-team-status.html
 [CareTeam Provider Role Value Set]: ValueSet-us-core-careteam-provider-roles.html
