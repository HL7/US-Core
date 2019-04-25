
#### Mandatory Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators] and [chained parameters] SHALL be supported.  the  modifiers, comparators and chained parameters that are listed as optional SHOULD be supported.:


1. **SHALL** support fetching a Patient using the **`_id`** search parameter:

  `GET [base]/Patient[id]`

  Example: GET [base]/Patient/1032702

  *Implementation Notes:*  (how to search by the [logical id] of the resource)

1. **SHALL** support searching a Patient by an identifier such as a MPI using the **`identifier`** search parameter:

  `GET [base]/Patient?identifier={[system]}|[code]`

  Example: GET [base]/Patient?identifier=http://hospital.smarthealthit.org|1032702

  *Implementation Notes:*  (how to search by [token])

1. **SHALL** support searching using the **`name`** search parameter:

  `GET [base]/Patient?name=[string]`

  Example: See combination searches below

  *Implementation Notes:* Search based on at least name and another patient element  (how to search by [string])

1. **SHALL**  using the combination of the  **`birthdate and name`** search parameters:

  `GET [base]/Patient?birthdate=[date]&name=[string]`

  Example: 

  *Implementation Notes:*  (how to search by [string] and [date])

1. **SHALL**  using the combination of the  **`gender and name`** search parameters:

  `GET [base]/Patient?gender=[token]&name=[string]`

  Example: 

  *Implementation Notes:*  (how to search by [token] and [string])



#### Optional Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators] and [chained parameters] SHOULD be supported.

1. **SHOULD** support searching using the combination of the  **`birthdate and family`** search parameters:

  `GET [base]/Patient?birthdate=[date]&family=[string]`

  Example: 

  *Implementation Notes:* . (how to search by [string] and [date])

1. **SHOULD** support searching using the combination of the  **`family and gender`** search parameters:

  `GET [base]/Patient?family=[string]&gender=[token]`

  Example: 

  *Implementation Notes:* . (how to search by [token] and [string])


{% include link-list.md %}