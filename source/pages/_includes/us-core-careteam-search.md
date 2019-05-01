


#### Mandatory Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators] and [chained parameters] SHALL be supported.  the  modifiers, comparators and chained parameters that are listed as optional SHOULD be supported.:


1. **SHALL** support searching using the combination of the **[`patient`](SearchParameter-us-core-careteam-patient.html)** and **[`status`](SearchParameter-us-core-careteam-status.html)** search parameters:

    `GET [base]/CareTeam?patient=[reference]&status=active`

    Example:
    
    1. GET [base]/CareTeam?patient=1137192&amp;status=active

    *Implementation Notes:* Fetches a bundle of all CareTeam resources for the specified patient and status =`active` ([how to search by reference] and [how to search by token])





{% include link-list.md %}