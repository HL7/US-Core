
- See the [General Guidance] section for additional rules and expectations when a server requires status parameters.
- See the [General Guidance] section for additional guidance on searching for multiple patients.

#### Mandatory Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators], [chains] and [composites] SHALL be supported.  the  modifiers, comparators, chains and composites that are listed as optional SHOULD be supported.:

1. **SHALL** support fetching a Patient using the **[`_id`](SearchParameter-us-core-patient-id.html)** search parameter:

    `GET [base]/Patient[id]`

    Example:
    
      1. GET [base]/Patient/1032702
      1. GET [base]/Patient?_id=1032702

    *Implementation Notes:*  ([how to search by the logical id] of the resource)

1. **SHALL** support searching a patient by an identifier such as a MPI using the **[`identifier`](SearchParameter-us-core-patient-identifier.html)** search parameter:

    `GET [base]/Patient?identifier={[system]}|[code]`

    Example:
    
      1. GET [base]/Patient?identifier=http://hospital.smarthealthit.org\|1032702

    *Implementation Notes:* Fetches a bundle containing any Patient resources matching the identifier ([how to search by token])

1. **SHALL** support searching for a patient by a string match of any part of name using the **[`name`](SearchParameter-us-core-patient-name.html)** search parameter:

    `GET [base]/Patient?name=[string]`

    Example:
    
      1. GET [base]/Patient?name=Shaw

    *Implementation Notes:* Fetches a bundle of all Patient resources matching the name ([how to search by string])

1. **SHALL** support searching using the combination of the **[`birthdate`](SearchParameter-us-core-patient-birthdate.html)** and **[`name`](SearchParameter-us-core-patient-name.html)** search parameters:

    `GET [base]/Patient?birthdate=[date]&name=[string]`

    Example:
    
      1. GET [base]/Patient?name=Shaw&amp;birthdate=2007-03-20

    *Implementation Notes:* Fetches a bundle of all Patient resources matching the specified birthdate and name ([how to search by date] and [how to search by string])

1. **SHALL** support searching using the combination of the **[`gender`](SearchParameter-us-core-patient-gender.html)** and **[`name`](SearchParameter-us-core-patient-name.html)** search parameters:

    `GET [base]/Patient?gender={[system]}|[code]&name=[string]`

    Example:
    
      1. GET [base]/Patient?name=Shaw&amp;gender=female

    *Implementation Notes:* Fetches a bundle of all Patient resources matching the specified gender and name ([how to search by string] and [how to search by token])


#### Optional Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators], [chains] and [composites] SHOULD be supported.

1. **SHOULD** support searching using the combination of the **[`birthdate`](SearchParameter-us-core-patient-birthdate.html)** and **[`family`](SearchParameter-us-core-patient-family.html)** search parameters:

    `GET [base]/Patient?birthdate=[date]&family=[string]`

    Example:
    
      1. GET [base]/Patient?family=Shaw&amp;birthdate=2007-03-20

    *Implementation Notes:* Fetches a bundle of all Patient resources matching the specified birthdate and family ([how to search by date] and [how to search by string])

1. **SHOULD** support searching using the combination of the **[`family`](SearchParameter-us-core-patient-family.html)** and **[`gender`](SearchParameter-us-core-patient-gender.html)** search parameters:

    `GET [base]/Patient?family=[string]&gender={[system]}|[code]`

    Example:
    
      1. GET [base]/Patient?family=Shaw&amp;gender=female

    *Implementation Notes:* Fetches a bundle of all Patient resources matching the specified family and gender ([how to search by string] and [how to search by token])

{% include link-list.md %}