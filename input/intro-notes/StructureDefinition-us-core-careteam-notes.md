{% include quickstart-intro.md %}

- The syntax used to describe the interactions is described [here](general-guidance.html#search-syntax).
- See the [General Guidance] section for additional rules and expectations when a server requires status parameters.
- See the [General Guidance] section for additional guidance on searching for multiple patients.

#### Mandatory Search Parameters:

The following search parameters and search parameter combinations SHALL be supported:

1. **SHALL** support searching using the combination of the **[`patient`](SearchParameter-us-core-careteam-patient.html)** and **[`status`](SearchParameter-us-core-careteam-status.html)** search parameters:
    - including optional support for composite *OR* search on `status` (e.g.`status={system|}[code],{system|}[code],...`)

    `GET [base]/CareTeam?patient={Type/}[id]&status=active`

    Example:

      1. GET [base]/CareTeam?patient=1137192&amp;status=active

    *Implementation Notes:* Fetches a bundle of all CareTeam resources for the specified patient and status =`active` ([how to search by reference] and [how to search by token])


{% include link-list.md %}
