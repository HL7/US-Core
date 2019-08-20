
- See the [General Guidance] section for additional rules and expectations when a server requires status parameters.
- See the [General Guidance] section for additional guidance on searching for multiple patients.

#### Mandatory Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators], [chains] and [composites] SHALL be supported.  the  modifiers, comparators, chains and composites that are listed as optional SHOULD be supported.:

1. **SHALL** support searching using the combination of the **[`patient`](SearchParameter-us-core-observation-patient.html)** and **[`code`](SearchParameter-us-core-observation-code.html)** search parameters:
    - including optional support for composite *OR* search on `patient` (e.g.`patient=[reference],[reference],...`)
    - including optional support for composite *OR* search on `code` (e.g.`code={[system]}|[code],{[system]}|[code],...`)

    `GET [base]/Observation?patient=[reference]{,[reference],...}&code=http://loinc.org|72166-2`

    Example:
    
      1. GET [base]/Observation?patient=1032702&amp;code=http://loinc.org\|72166-2

    *Implementation Notes:* Fetches a bundle of all Observation resources for the specified patient and observation code. ([how to search by reference] and [how to search by token])



{% include link-list.md %}