


#### Mandatory Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators] and [chained parameters] SHALL be supported.  the  modifiers, comparators and chained parameters that are listed as optional SHOULD be supported.:


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

1. **SHALL** support searching practitioner role by specialty using the **[`specialty`](SearchParameter-us-core-practitionerrole-specialty.html)** search parameter:

  - including optional support of the `_include` parameter to indicate that these resources be included in the results: `PractitionerRole:endpoint, PractitionerRole:practitioner`

    `GET [base]/PractitionerRole?specialty={[system]}|[code]`

    Example:
    
    1. GET [base]/PractitionerRole?specialty=http://nucc.org/provider-taxonomy\|208D0000X

    *Implementation Notes:* Fetches a bundle containing  PractitionerRole resources matching the specialty ([how to search by token])

1. **SHALL** support searching practitioner role by practitioner name and identifier using chained parameters using the **[`practitioner`](SearchParameter-us-core-practitionerrole-practitioner.html)** search parameter:

  - including support for these chained parameters: `identifier, name`
  - including optional support of the `_include` parameter to indicate that these resources be included in the results: `PractitionerRole:endpoint, PractitionerRole:practitioner`

    `GET [base]/PractitionerRole?practitioner=[reference]`

    Example:
    
    1. GET [base]/PractitionerRole?practitioner.identifier=http://hl7.org/fhir/sid/us-npi\|97860456&amp;_include=PractitionerRole:practitioner&amp;_include=PractitionerRole?endpoint
    1. GET [base]/PractitionerRole?practitioner.name=Henry&amp;_include=PractitionerRole:practitioner&amp;_include=PractitionerRole?endpoint

    *Implementation Notes:* Fetches a bundle containing  PractitionerRole resources matching the chained parameter practitioner.name or practitioner.identifier. SHOULD support the _include for PractionerRole.practitioner and PractitionerRole.endpoint. ([how to search by reference])

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

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators] and [chained parameters] SHOULD be supported.

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