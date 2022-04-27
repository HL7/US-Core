{% include quickstart-intro.md %}

#### Mandatory Search Parameters:

The following search parameters and search parameter combinations SHALL be supported:

1. **SHALL** support fetching a RelatedPerson using the **[`_id`](SearchParameter-us-core-relatedperson-id.html)** search parameter:

    `GET [base]/RelatedPerson[id]`

    Example:
    
      1. GET [base]/RelatedPerson/shaw-niece
      1. GET [base]/RelatedPerson?_id=shaw-niece

    *Implementation Notes:*  ([how to search by the logical id] of the resource)


#### Optional Search Parameters:

The following search parameter combinations SHOULD be supported:

1. **SHOULD** support searching using the **[`patient`](SearchParameter-us-core-relatedperson-patient.html)** search parameter:

     `GET [base]/RelatedPerson?patient={Type/}[id]`

    Example:
    
      1. GET [base]/RelatedPerson?patient=1032702

     *Implementation Notes:* Fetches a bundle of all RelatedPerson resources for the specified patient ([how to search by reference])



{% include link-list.md %}