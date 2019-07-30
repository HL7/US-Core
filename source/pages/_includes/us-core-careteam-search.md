
- See the [General Guidance] section for additional rules and expectations when a server requires status parameters.
- See the [General Guidance] section for additional guidance on searching for multiple patients.

#### Mandatory Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators], [chains] and [composites] SHALL be supported.  the  modifiers, comparators, chains and composites that are listed as optional SHOULD be supported.:

1. **SHALL** support searching using the combination of the **[`patient`](SearchParameter-us-core-careteam-patient.html)** and **[`status`](SearchParameter-us-core-careteam-status.html)** search parameters:
    - including optional support for composite *OR* search on `patient` (e.g.`patient=[reference],[reference],...`)
    - including support for composite *OR* search on `status` (e.g.`status={[system]}|[code],{[system]}|[code],...`)

    `GET [base]/CareTeam?patient=[reference]{,[reference],...}&status=active`

    Example:
    
      1. GET [base]/CareTeam?patient=1137192&amp;status=active

    *Implementation Notes:* Fetches a bundle of all CareTeam resources for the specified patient and status =`active` ([how to search by reference] and [how to search by token])



{% include link-list.md %}