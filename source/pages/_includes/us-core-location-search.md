


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