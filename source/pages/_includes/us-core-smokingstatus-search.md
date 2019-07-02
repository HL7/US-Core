- See the [General Guidance] section for additional rules and expectations when a server requires status parameters.



#### Mandatory Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators], [chains] and [composites] SHALL be supported.  the  modifiers, comparators, chains and composites that are listed as optional SHOULD be supported.:

1. **SHALL** support searching using the combination of the **[`patient`](SearchParameter-us-core-observation-patient.html)** and **[`code`](SearchParameter-us-core-observation-code.html)** search parameters:

    `GET [base]/Observation?patient=[reference]&code=http://loinc.org|72166-2`

    Example:

      1. GET [base]/Observation?patient=1032702&amp;code=http://loinc.org\|72166-2

    *Implementation Notes:* Fetches a bundle of all Observation resources for the specified patient and observation code. ([how to search by reference] and [how to search by token])

{% include link-list.md %}
