{% include quickstart-intro.md %}

#### Mandatory Search Parameters:

The following search parameters and search parameter combinations SHALL be supported:

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

The following search parameter combinations **SHOULD** be supported:

1. **SHOULD** support searching using the **[`address-city`](SearchParameter-us-core-location-address-city.html)** search parameter:

     `GET [base]/Location?address-city=[string]`

    Example:
    
      1. GET [base]/Location?address-city=Ann Arbor

     *Implementation Notes:* Fetches a bundle of all Location resources for the city ([how to search by string])

1. **SHOULD** support searching using the **[`address-state`](SearchParameter-us-core-location-address-state.html)** search parameter:

     `GET [base]/Location?address-state=[string]`

    Example:
    
      1. GET [base]/Location?address-state=MI

     *Implementation Notes:* Fetches a bundle of all Location resources for the state ([how to search by string])

1. **SHOULD** support searching using the **[`address-postalcode`](SearchParameter-us-core-location-address-postalcode.html)** search parameter:

     `GET [base]/Location?address-postalcode=[string]`

    Example:
    
      1. GET [base]/Location?address-postalcode=48104

     *Implementation Notes:* Fetches a bundle of all Location resources for the ZIP code ([how to search by string])



{% include link-list.md %}