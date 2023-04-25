{% include quickstart-intro.md %}

#### Mandatory Search Parameters:

1. **SHALL** support searching for all coverages for a patient using the **[`patient`](SearchParameter-us-core-coverage-patient.html)** search parameter:

    `GET [base]/Coverage?patient={Type/}[id]`

    Example:
    
      1. GET [base]/Coverage?patient=1137192

    *Implementation Notes:* Fetches a bundle of all Coverage resources for the specified patient ([how to search by reference])





{% include link-list.md %}