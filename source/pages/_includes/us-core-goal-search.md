
- See the [General Guidance] section for additional rules and expectations when a server requires status parameters.
- See the [General Guidance] section for additional guidance on searching for multiple patients.

#### Mandatory Search Parameters:

The following search parameters, search parameter combinations SHALL be supported.  Any listed search parameter [modifiers], [comparators], [chains] and [composites] SHALL also be supported UNLESS they are listed as "optional" in which case they SHOULD be supported.:

1. **SHALL** support searching for all goals for a patient using the **[`patient`](SearchParameter-us-core-goal-patient.html)** search parameter:

    `GET [base]/Goal?patient=[reference]`

    Example:
    
      1. GET [base]/Goal?patient=1137192

    *Implementation Notes:* Fetches a bundle of all Goal resources for the specified patient ([how to search by reference])


#### Optional Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators], [chains] and [composites] SHOULD be supported.

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-goal-patient.html)** and **[`lifecycle-status`](SearchParameter-us-core-goal-lifecycle-status.html)** search parameters:

    `GET [base]/Goal?patient=[reference]&lifecycle-status={[system]}|[code]`

    Example:
    
      1. GET [base]/Goal?patient=1137192&amp;lifecycle-status=active

    *Implementation Notes:* Fetches a bundle of all Goal resources for the specified patient and lifecycle-status ([how to search by reference] and [how to search by token])

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-goal-patient.html)** and **[`target-date`](SearchParameter-us-core-goal-target-date.html)** search parameters:
    - including support for these `target-date` comparators: `gt,lt,ge,le`
    - including optional support for composite *AND* search on `target-date` (e.g.`target-date=[date]&target-date=[date]]&...`)

    `GET [base]/Goal?patient=[reference]&target-date={gt|lt|ge|le}[date]{&target-date={gt|lt|ge|le}[date]&...}`

    Example:
    
      1. GET [base]/Goal?patient=1137192&amp;target-date=ge2015-01-14&amp;target-date=le2019-01-14

    *Implementation Notes:* Fetches a bundle of all Goal resources for the specified patient and target-date ([how to search by reference] and [how to search by date])

{% include link-list.md %}