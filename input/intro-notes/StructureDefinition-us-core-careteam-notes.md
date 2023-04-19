{% include quickstart-intro.md %}

#### Mandatory Search Parameters:

The following search parameters and search parameter combinations SHALL be supported:

1. **SHALL** support searching using the combination of the **[`patient`](SearchParameter-us-core-careteam-patient.html)** and **[`status`](SearchParameter-us-core-careteam-status.html)** search parameters:
    - including optional support for these `_include` parameters: `CareTeam:participant:PractitionerRole,CareTeam:participant:Practitioner,CareTeam:participant:Patient,CareTeam:participant:RelatedPerson`
    - including optional support for *OR* search on `status` (e.g.`status={system|}[code],{system|}[code],...`)

    `GET [base]/CareTeam?patient={Type/}[id]&status=active`

    Example:

      1. GET [base]/CareTeam?patient=1137192&amp;status=active
      1. GET [base]/CareTeam?patient=1137192&amp;status=active&amp;_include=CareTeam:participant:RelatedPerson&amp;_include=CareTeam:participant:Patient&amp;_include=CareTeam:participant:Practitioner&amp;_include=CareTeam:participant:PractitionerRole

    *Implementation Notes:* Fetches a bundle of all CareTeam resources for the specified patient and status =`active` and may include CareTeam Patient, RelatedPerson and Practitioner and PractitionerRole participants.  
To get Practitioner name and identifier using PractitionerRole:  
1) Search for the careteam PractitionerRole: GET [base]/CareTeam?patient=[id]&amp;status=active&amp;_include=CareTeam:participant:PractitionerRole
2) Use the FHIR _id from the `PractitionerRole.practitioner` element, to fetch the Practitioner resources using  GET [base]/Practitioner?_id=[id] ([how to search by reference] and [how to search by token])


#### Optional Search Parameters:

The following search parameter combinations **SHOULD** be supported:

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-careteam-patient.html)** and **[`role`](SearchParameter-us-core-careteam-role.html)** search parameters:
    - including optional support for these `_include` parameters: `CareTeam:participant:PractitionerRole,CareTeam:participant:Practitioner,CareTeam:participant:Patient,CareTeam:participant:RelatedPerson`
    - including optional support for *OR* search on `role` (e.g.`role={system|}[code],{system|}[code],...`)

    `GET [base]/CareTeam?patient={Type/}[id]&role={system|}[code]{,{system|}[code],...}`

    Example:

      1. GET [base]/CareTeam?patient=1137192&amp;role=http://snomed.info/sct\|17561000

    *Implementation Notes:* Fetches a bundle of all CareTeam resources for the specified patient and participant role ([how to search by reference] and [how to search by token])



{% include link-list.md %}
