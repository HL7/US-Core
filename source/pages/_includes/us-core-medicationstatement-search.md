

#### Mandatory Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators], [chains] and [composites] SHALL be supported.  the  modifiers, comparators, chains and composites that are listed as optional SHOULD be supported.:

1. **SHALL** support searching for all medication statements for a patient. The server application represents the medication using either an inline code or a contained or external reference to the Medication resource. using the **[`patient`](SearchParameter-us-core-medicationstatement-patient.html)** search parameter:

    - including optional support for these `_include` parameters: `MedicationStatement:medication`

    `GET [base]/MedicationStatement?patient=[reference]`

    Example:
    
      1. GET [base]/MedicationStatement?patient=14676
      1. GET [base]/MedicationStatement?patient=14676&amp;_include=MedicationStatement:medication

    *Implementation Notes:* Fetches a bundle of all MedicationStatement resources for the specified patient. Mandatory for client to support the _include parameter. Optional for server to support the _include parameter. ([how to search by reference])


#### Optional Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators], [chains] and [composites] SHOULD be supported.

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-medicationstatement-patient.html)** and **[`status`](SearchParameter-us-core-medicationstatement-status.html)** search parameters:
    - including optional support for these `_include` parameters: `MedicationStatement:medication`

    `GET [base]/MedicationStatement?patient=[reference]&status={[system]}|[code]`

    Example:
    
      1. GET [base]/MedicationStatement?patient=1137192&amp;status=active
      1. GET [base]/MedicationStatement?patient=1137192&amp;status=active&amp;_include=MedicationStatement:medication

    *Implementation Notes:* Fetches a bundle of all MedicationStatement resources for the specified patient and status ([how to search by reference] and [how to search by token])

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-medicationstatement-patient.html)** and **[`effective`](SearchParameter-us-core-medicationstatement-effective.html)** search parameters:
    - including optional support for these `_include` parameters: `MedicationStatement:medication`
    - including support for these `effective` comparators: `gt,lt,ge,le`
    - including optional support for composite *AND* search on `effective` (e.g.`effective=[date]&effective=[date]]&...`)

    `GET [base]/MedicationStatement?patient=[reference]&effective={gt|lt|ge|le}[date]{&effective={gt|lt|ge|le}[date]&...}`

    Example:
    
      1. GET [base]/MedicationStatement?patient=1137192&amp;date=ge2019
      1. GET [base]/MedicationRequest?patient=1137192&amp;date=ge2019&amp;_include=MedicationStatement:medication

    *Implementation Notes:* Fetches a bundle of all MedicationStatement resources for the specified patient and date ([how to search by reference] and [how to search by date])

{% include link-list.md %}