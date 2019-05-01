


#### Mandatory Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators] and [chained parameters] SHALL be supported.  the  modifiers, comparators and chained parameters that are listed as optional SHOULD be supported.:


1. **SHALL** support searching by organization name using the **[`name`](SearchParameter-us-core-organization-name.html)** search parameter:

    `GET [base]/Organization?name=[string]`

    Example:
    
    1. GET [base]/Location?name=Health

    *Implementation Notes:* Fetches a bundle of all Organization resources that match the name ([how to search by string])

1. **SHALL** support searching organization based on text address using the **[`address`](SearchParameter-us-core-organization-address.html)** search parameter:

    `GET [base]/Organization?address=[string]`

    Example:
    
    1. GET [base]/Location?address=Arbor

    *Implementation Notes:* Fetches a bundle of all Organization resources that match the address string ([how to search by string])





{% include link-list.md %}