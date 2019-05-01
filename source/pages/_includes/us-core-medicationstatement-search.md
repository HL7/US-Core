


#### Mandatory Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators] and [chained parameters] SHALL be supported.  the  modifiers, comparators and chained parameters that are listed as optional SHOULD be supported.:


1. **SHALL** support searching for all medication statements for a patient. The server application represents the medication using either an inline code or a contained or external reference to the Medication resource. using the **[`patient`](SearchParameter-us-core-medicationstatement-patient.html)** search parameter:

    - including optional support of the `_include` parameter to indicate that these resources be included in the results: `MedicationRequest:medication`

    `GET [base]/MedicationStatement?patient=[reference]`

    Example:
    
    1. GET [base]/MedicationStatement?patient=14676
    1. GET [base]/MedicationStatement?patient=14676&amp;_include=MedicationStatement:medication

    *Implementation Notes:* Fetches a bundle of all MedicationStatement resources for the specified patient. Mandatory for client to support the _include parameter. Optional for server to support the _include parameter. ([how to search by reference])



#### Optional Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators] and [chained parameters] SHOULD be supported.

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-medicationstatement-patient.html)** and **[`status`](SearchParameter-us-core-medicationstatement-status.html)** search parameters:
    - including optional support of the `_include` parameter to indicate that these resources be included in the results: `MedicationRequest:medication`


    `GET [base]/MedicationStatement?patient=[reference]&status={[system]}|[code]`

    Example:
    
    1. GET [base]/MedicationStatement?patient=1137192&amp;status=active

    *Implementation Notes:* Fetches a bundle of all MedicationStatement resources for the specified patient and status ([how to search by reference] and [how to search by token])

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-medicationstatement-patient.html)** and **[`effective`](SearchParameter-us-core-medicationstatement-effective.html)** search parameters:
    - including optional support of the `_include` parameter to indicate that these resources be included in the results: `MedicationRequest:medication`

    - including support for these comparators: `gt, lt, ge, le`

    `GET [base]/MedicationStatement?patient=[reference]&effective={gt|lt|ge|le}[date]`

    Example:
    
    1. GET [base]/MeidcationRequest?patient=1137192&amp;date=ge2019

    *Implementation Notes:* Fetches a bundle of all MedicationStatement resources for the specified patient and date ([how to search by reference] and [how to search by date])


{% include link-list.md %}