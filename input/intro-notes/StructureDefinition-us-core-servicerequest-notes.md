{% include quickstart-intro.md %}

- The syntax used to describe the interactions is described [here](general-guidance.html#search-syntax).
- See the [General Guidance] section for additional rules and expectations when a server requires status parameters.
- See the [General Guidance] section for additional guidance on searching for multiple patients.

#### Mandatory Search Parameters:

The following search parameters and search parameter combinations SHALL be supported:

1. {:.new-content}**SHALL** support searching for all servicerequests for a patient using the **[`patient`](SearchParameter-us-core-servicerequest-patient.html)** search parameter:

    `GET [base]/ServiceRequest?patient={Type/}[id]`

    Example:
    
      1. GET [base]/ServiceRequest?patient=1137192

    *Implementation Notes:* Fetches a bundle of all ServiceRequest resources for the specified patient ([how to search by reference])

1. {:.new-content}**SHALL** support fetching a ServiceRequest using the **[`_id`](SearchParameter-us-core-servicerequest-id.html)** search parameter:

    `GET [base]/ServiceRequest[id]`

    Example:
    
      1. GET [base]/ServiceRequest/1032702
      1. GET [base]/ServiceRequest?_id=1032702

    *Implementation Notes:*  ([how to search by the logical id] of the resource)





{% include link-list.md %}