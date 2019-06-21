- See the [General Guidance] section for a discussion of how Servers expose "Hidden Server Default Values".



#### Mandatory Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators], [chains] and [composites] SHALL be supported.  the  modifiers, comparators, chains and composites that are listed as optional SHOULD be supported.:

1. **SHALL** support searching for all immunizations for a patient using the **[`patient`](SearchParameter-us-core-immunization-patient.html)** search parameter:

    `GET [base]/Immunization?patient=[reference]`

    Example:
    
      1. GET [base]/Immunization?patient=1137192

    *Implementation Notes:* Fetches a bundle of all Immunization resources for the specified patient ([how to search by reference])


#### Optional Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators], [chains] and [composites] SHOULD be supported.

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-immunization-patient.html)** and **[`date`](SearchParameter-us-core-immunization-date.html)** search parameters:
    - including support for these `date` comparators: `gt,lt,ge,le`
    - including optional support for composite *AND* search on `date` (e.g.`date=[date]&date=[date]]&...`)

    `GET [base]/Immunization?patient=[reference]&date={gt|lt|ge|le}[date]{&date={gt|lt|ge|le}[date]&...}`

    Example:
    
      1. GET [base]/Immunization?patient=1137192&amp;date=ge2019-01-14

    *Implementation Notes:* Fetches a bundle of all Immunization resources for the specified patient and date ([how to search by date] and [how to search by reference])

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-immunization-patient.html)** and **[`status`](SearchParameter-us-core-immunization-status.html)** search parameters:

    `GET [base]/Immunization?patient=[reference]&status={[system]}|[code]`

    Example:
    
      1. GET [base]/Immunization?patient=1137192&amp;status=completed

    *Implementation Notes:* Fetches a bundle of all Immunization resources for the specified patient and status ([how to search by reference] and [how to search by date])

{% include link-list.md %}