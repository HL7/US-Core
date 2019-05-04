


#### Mandatory Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators], [chains] and [composites] SHALL be supported.  the  modifiers, comparators, chains and composites that are listed as optional SHOULD be supported.:


1. **SHALL** support searching for all prescriptions for a patient. The server application represents the medication using either an inline code or a contained or external reference to the Medication resource. using the **[`patient`](SearchParameter-us-core-medicationrequest-patient.html)** search parameter:

    - including optional support of these `_include` parameters: `MedicationRequest:medication`    `GET [base]/MedicationRequest?patient=[reference]`

    Example:
    
    1. GET [base]/MedicationRequest?patient=14676
    1. GET [base]/MedicationRequest?patient=14676&amp;_include=MedicationRequest:medication

    *Implementation Notes:* Fetches a bundle of all MedicationRequest resources for the specified patient. Mandatory for client to support the _include parameter. Optional for server to support the _include parameter. ([how to search by reference])

1. **SHALL** support searching using the combination of the **[`patient`](SearchParameter-us-core-medicationrequest-patient.html)** and **[`status`](SearchParameter-us-core-medicationrequest-status.html)** search parameters:
    - including optional support of these `_include` parameters: `MedicationRequest:medication`

    `GET [base]/MedicationRequest?patient=[reference]&status={[system]}|[code]`

    Example:
    
    1. GET [base]/MedicationRequest?patient=1137192&amp;status=active
    1. GET [base]/MedicationRequest?patient=1137192&amp;status=active&amp;_include=MedicationRequest:medication

    *Implementation Notes:* Fetches a bundle of all MedicationRequest resources for the specified patient and status ([how to search by reference] and [how to search by token])



#### Optional Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators], [chains] and [composites] SHOULD be supported.

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-medicationrequest-patient.html)** and **[`authoredon`](SearchParameter-us-core-medicationrequest-authoredon.html)** search parameters:
    - including optional support of these `_include` parameters: `MedicationRequest:medication`
    - including support for these `authoredon` comparators: `gt,lt,ge,le`
    - optional support for composite *AND* search on `authoredon` (e.g.`authoredon=&authoredon=&...`)

    `GET [base]/MedicationRequest?patient=[reference]&authoredon={gt|lt|ge|le}[date]{&authoredon={gt|lt|ge|le}[date]&...}`

    Example:
    
    1. GET [base]/MedicationRequest?patient=1137192&amp;effective=ge2019
    1. GET [base]/MedicationStatement?patient=1137192&amp;effective=ge2019&amp;_include=MedicationRequest:medication

    *Implementation Notes:* Fetches a bundle of all MedicationRequest resources for the specified patient and date ([how to search by reference] and [how to search by date])


{% include link-list.md %}