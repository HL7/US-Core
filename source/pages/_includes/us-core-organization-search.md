- The syntax used to describe the interactions is described [here](general-guidance.html#search-syntax).
  - Variables surrounded by "\[\]" are mandatory for the client to supply
  - Variables surrounded by "\{\}" is optional *for the client* to supply
  - Servers must support token searches by `system|code` and `code` [(how to search by token)]
- See the [General Guidance] section for additional rules and expectations when a server requires status parameters.
- See the [General Guidance] section for additional guidance on searching for multiple patients.

#### Mandatory Search Parameters:

The following search parameters and search parameter combinations SHALL be supported.:

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