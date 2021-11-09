{% include quickstart-intro.md %}

- The syntax used to describe the interactions is described [here](general-guidance.html#search-syntax).
- See the [General Guidance] section for additional rules and expectations when a server requires status parameters.
- See the [General Guidance] section for additional guidance on searching for multiple patients.

#### Mandatory Search Parameters:

The following search parameters and search parameter combinations SHALL be supported:

1. {:.new-content}**SHALL** support searching using the combination of the **[`patient`](SearchParameter-us-core-careteam-patient.html)** and **[`status`](SearchParameter-us-core-careteam-status.html)** search parameters:
    - including optional support for these `_include` parameters: `CareTeam:participant:Practitioner,CareTeam:participant:Patient,CareTeam:participant:RelatedPerson,`
    - including optional support for composite *OR* search on `status` (e.g.`status={system|}[code],{system|}[code],...`)

    `GET [base]/CareTeam?patient={Type/}[id]&status=active`

    Example:
    
      1. GET [base]/CareTeam?patient=1137192&amp;status=active
      1. GET [base]/CareTeam?patient=1137192&amp;status=active&amp;_include=CareTeam:participant:Practitioner&amp;_include=CareTeam:participant:Patient&amp;_include=CareTeam:participant:RelatedPerson

    *Implementation Notes:* Fetches a bundle of all CareTeam resources for the specified patient and status =`active` and may include CareTeam Patient, RelatedPerson and Practitioner participants ([how to search by reference] and [how to search by token])


#### Optional Search Parameters:

The following search parameter combinations SHOULD be supported:

1. {:.new-content}**SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-careteam-patient.html)** and **[`role`](SearchParameter-us-core-careteam-role.html)** search parameters:
    - including optional support for these `_include` parameters: `CareTeam:participant:Practitioner,CareTeam:participant:Patient,CareTeam:participant:RelatedPerson,`
    - including optional support for composite *OR* search on `role` (e.g.`role={system|}[code],{system|}[code],...`)

    `GET [base]/CareTeam?patient={Type/}[id]&role={system|}[code]{,{system|}[code],...}`

    Example:
    
      1. GET [base]/CareTeam?patient=1137192&amp;role=http://snomed.info/sct\|17561000

    *Implementation Notes:* Fetches a bundle of all CareTeam resources for the specified patient and participant role ([how to search by reference] and [how to search by token])



{% include link-list.md %}