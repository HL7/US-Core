{% include quickstart-intro.md %}

#### Mandatory Search Parameters:

The following search parameters and search parameter combinations SHALL be supported:

1. **SHALL** support searching for all goals for a patient using the **[`patient`](SearchParameter-us-core-goal-patient.html)** search parameter:

    `GET [base]/Goal?patient={Type/}[id]`

    Example:

      1. GET [base]/Goal?patient=1137192

    *Implementation Notes:* Fetches a bundle of all Goal resources for the specified patient ([how to search by reference])


#### Optional Search Parameters:

The following search parameter combinations **SHOULD** be supported:

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-goal-patient.html)** and **[`lifecycle-status`](SearchParameter-us-core-goal-lifecycle-status.html)** search parameters:

    `GET [base]/Goal?patient={Type/}[id]&lifecycle-status={system|}[code]`

    Example:

      1. GET [base]/Goal?patient=1137192&amp;lifecycle-status=active

    *Implementation Notes:* Fetches a bundle of all Goal resources for the specified patient and lifecycle-status ([how to search by reference] and [how to search by token])

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-goal-patient.html)** and **[`target-date`](SearchParameter-us-core-goal-target-date.html)** search parameters:
    - including support for these `target-date` comparators: `gt,lt,ge,le`
    - including optional support for *AND* search on `target-date` (e.g.`target-date=[date]&target-date=[date]]&...`)

    `GET [base]/Goal?patient={Type/}[id]&target-date={gt|lt|ge|le}[date]{&target-date={gt|lt|ge|le}[date]&...}`

    Example:

      1. GET [base]/Goal?patient=1137192&amp;target-date=ge2015-01-14&amp;target-date=le2019-01-14

    *Implementation Notes:* Fetches a bundle of all Goal resources for the specified patient and target-date ([how to search by reference] and [how to search by date])

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-goal-patient.html)** and **[`description`](SearchParameter-us-core-goal-description.html)** search parameters:

    `GET [base]/Goal?patient={Type/}[id]&description={system|}[code]`

    Example:

      1. GET [base]/Goal?patient=1137192&amp;description=http://snomed.info/sct\|1078229009

    *Implementation Notes:* Fetches a bundle of all Goal resources for the specified patient and description ([how to search by reference] and [how to search by token])



{% include link-list.md %}
