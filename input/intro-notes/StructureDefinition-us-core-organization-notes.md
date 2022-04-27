{% include quickstart-intro.md %}

#### Mandatory Search Parameters:

The following search parameters and search parameter combinations SHALL be supported:

1. **SHALL** support searching by organization name using the **[`name`](SearchParameter-us-core-organization-name.html)** search parameter:

    `GET [base]/Organization?name=[string]`

    Example:
    
      1. GET [base]/Organization?name=Health

    *Implementation Notes:* Fetches a bundle of all Organization resources that match the name ([how to search by string])

1. **SHALL** support searching organization based on text address using the **[`address`](SearchParameter-us-core-organization-address.html)** search parameter:

    `GET [base]/Organization?address=[string]`

    Example:
    
      1. GET [base]/Organization?address=Arbor

    *Implementation Notes:* Fetches a bundle of all Organization resources that match the address string ([how to search by string])





{% include link-list.md %}