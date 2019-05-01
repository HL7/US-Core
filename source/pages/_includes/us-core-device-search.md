


#### Mandatory Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators] and [chained parameters] SHALL be supported.  the  modifiers, comparators and chained parameters that are listed as optional SHOULD be supported.:


1. **SHALL** support searching for all devices for a patient, including implantable devices using the **[`patient`](SearchParameter-us-core-device-patient.html)** search parameter:

    `GET [base]/Device?patient=[reference]`

  Example: GET [base]/Device?patient=1137192

  *Implementation Notes:* Fetches a bundle of all Device resources for the specified patient ([how to search by reference])





{% include link-list.md %}