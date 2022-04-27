{% include quickstart-intro.md %}

#### Mandatory Search Parameters:

The following search parameters and search parameter combinations SHALL be supported:

1. **SHALL** support searching using the combination of the **[`patient`](SearchParameter-us-core-observation-patient.html)** and **[`code`](SearchParameter-us-core-observation-code.html)** search parameters:
    - including optional support for *OR* search on `code` (e.g.`code={system|}[code],{system|}[code],...`)

    `GET [base]/Observation?patient={Type/}[id]&code=http://loinc.org|72166-2`

    Example:
    
      1. GET [base]/Observation?patient=1032702&amp;code=http://loinc.org\|72166-2

    *Implementation Notes:* Fetches a bundle of all Observation resources for the specified patient and observation code. ([how to search by reference] and [how to search by token])





{% include link-list.md %}