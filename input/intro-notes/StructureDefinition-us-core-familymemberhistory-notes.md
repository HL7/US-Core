{% include quickstart-intro.md %}

#### Mandatory Search Parameters:

The following search parameters and search parameter combinations SHALL be supported:

1. {:.new-content}**SHALL** support searching for all family member’s relevant health history using the **[`patient`](SearchParameter-us-core-familymemberhistory-patient.html)** search parameter:

    `GET [base]/FamilyMemberHistory?patient={Type/}[id]`

    Example:

      1. GET [base]/FamilyMemberHistory?patient=1137192

    *Implementation Notes:* Fetches a bundle of all FamilyMemberHistory resources for the specified patient ([how to search by reference])


#### Optional Search Parameters:

The following search parameter combinations **SHOULD** be supported:

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-familymemberhistory-patient.html)** and **[`code`](SearchParameter-us-core-familymemberhistory-code.html)** search parameters:

    `GET [base]/FamilyMemberHistory?patient={Type/}[id]&code={system|}[code]`

    Example:

      1. GET [base]/FamilyMemberHistory?patient=1032702&amp;code={{include.code | default: '[code]'}}

    *Implementation Notes:* Fetches a bundle of all FamilyMemberHistory resources for the specified patient and condition ([how to search by reference] and [how to search by token])

{% include link-list.md %}