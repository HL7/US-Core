


#### Mandatory Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators] and [chained parameters] SHALL be supported.  the  modifiers, comparators and chained parameters that are listed as optional SHOULD be supported.:


1. **SHALL** support searching by location name using the **[`name`](SearchParameter-us-core-location-name.html)** search parameter:

    `GET [base]/Location?name=[string]`

    Example:
    
    1. GET [base]/Location?name=Health

    *Implementation Notes:* Fetches a bundle of all Location resources that match the name ([how to search by string])

1. **SHALL** support searching location based on text address using the **[`address`](SearchParameter-us-core-location-address.html)** search parameter:

    `GET [base]/Location?address=[string]`

    Example:
    
    1. GET [base]/Location?address=Arbor

    *Implementation Notes:* Fetches a bundle of all Location resources that match the address string ([how to search by string])

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



#### Optional Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators] and [chained parameters] SHOULD be supported.

1. **SHOULD** support searching using the **[`address-city`](i.rel_url)** search parameter:

     `GET [base]/Location?address-city=[string]`

    Example:
    
    1. GET [base]/Location?address-city=Ann Arbor

     *Implementation Notes:* Fetches a bundle of all Location resources for the city ([how to search by string])

1. **SHOULD** support searching using the **[`address-state`](i.rel_url)** search parameter:

     `GET [base]/Location?address-state=[string]`

    Example:
    
    1. GET [base]/Location?address-state=MI

     *Implementation Notes:* Fetches a bundle of all Location resources for the state ([how to search by string])

1. **SHOULD** support searching using the **[`address-postalcode`](i.rel_url)** search parameter:

     `GET [base]/Location?address-postalcode=[string]`

    Example:
    
    1. GET [base]/Location?address-postalcode=48104

     *Implementation Notes:* Fetches a bundle of all Location resources for the ZIP code ([how to search by string])


{% include link-list.md %}