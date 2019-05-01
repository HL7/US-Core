


#### Mandatory Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators] and [chained parameters] SHALL be supported.  the  modifiers, comparators and chained parameters that are listed as optional SHOULD be supported.:


1. **SHALL** support searching for all goals for a patient using the **[`patient`](SearchParameter-us-core-goal-patient.html)** search parameter:

    `GET [base]/Goal?patient=[reference]`

    Example:
    
    1. GET [base]/Goal?patient=1137192

    *Implementation Notes:* Fetches a bundle of all Goal resources for the specified patient ([how to search by reference])



#### Optional Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators] and [chained parameters] SHOULD be supported.

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-goal-patient.html)** and **[`lifecycle-status`](SearchParameter-us-core-goal-lifecycle-status.html)** search parameters:

    `GET [base]/Goal?patient=[reference]&lifecycle-status={[system]}|[code]`

    Example:
    
    1. GET [base]/Goal?patient=1137192&amp;lifecycle-status=active

    *Implementation Notes:* Fetches a bundle of all Goal resources for the specified patient and lifecycle-status ([how to search by reference] and [how to search by token])

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-goal-patient.html)** and **[`start-date`](SearchParameter-us-core-goal-start-date.html)** search parameters:
    - including support for these comparators: `gt, lt, ge, le`

    `GET [base]/Goal?patient=[reference]&start-date={gt|lt|ge|le}[date]`

    Example:
    
    1. GET [base]/Goal?patient=1137192&amp;date=ge2015-01-14&amp;date=le2019-01-14

    *Implementation Notes:* Fetches a bundle of all Goal resources for the specified patient and start-date ([how to search by reference] and [how to search by date])


{% include link-list.md %}