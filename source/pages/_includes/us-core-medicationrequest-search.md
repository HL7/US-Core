


#### Mandatory Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators] and [chained parameters] SHALL be supported.  the  modifiers, comparators and chained parameters that are listed as optional SHOULD be supported.:


1. **SHALL** support searching for all prescriptions for a patient. The server application represents the medication using either an inline code or a contained or external reference to the Medication resource. using the **[`patient`](SearchParameter-us-core-medicationrequest-patient.html)** search parameter:

  - including optional support of the `_include` parameter to indicate that these resources be included in the results: `MedicationRequest:medication`

    `GET [base]/MedicationRequest?patient=[reference]`

    Example:
    
    1. GET [base]/MedicationRequest?patient=14676
    1. GET [base]/MedicationRequest?patient=14676&amp;_include=MedicationRequest:medication

    *Implementation Notes:* Fetches a bundle of all MedicationRequest resources for the specified patient. Mandatory for client to support the _include parameter. Optional for server to support the _include parameter. ([how to search by reference])

1. **SHALL** support searching practitioner role by specialty using the **[`specialty`](SearchParameter-us-core-practitionerrole-specialty.html)** search parameter:

  - including optional support of the `_include` parameter to indicate that these resources be included in the results: `PractitionerRole:endpoint, PractitionerRole:practitioner`

    `GET [base]/PractitionerRole?specialty={[system]}|[code]`

    Example:
    
    1. GET [base]/PractitionerRole?specialty=http://nucc.org/provider-taxonomy\|208D0000X

    *Implementation Notes:* Fetches a bundle containing  PractitionerRole resources matching the specialty ([how to search by token])

1. **SHALL** support searching practitioner role by practitioner name and identifier using chained parameters using the **[`practitioner`](SearchParameter-us-core-practitionerrole-practitioner.html)** search parameter:

  - including support for these chained parameters: `identifier, name`
  - including optional support of the `_include` parameter to indicate that these resources be included in the results: `PractitionerRole:endpoint, PractitionerRole:practitioner`

    `GET [base]/PractitionerRole?practitioner=[reference]`

    Example:
    
    1. GET [base]/PractitionerRole?practitioner.identifier=http://hl7.org/fhir/sid/us-npi\|97860456&amp;_include=PractitionerRole:practitioner&amp;_include=PractitionerRole?endpoint
    1. GET [base]/PractitionerRole?practitioner.name=Henry&amp;_include=PractitionerRole:practitioner&amp;_include=PractitionerRole?endpoint

    *Implementation Notes:* Fetches a bundle containing  PractitionerRole resources matching the chained parameter practitioner.name or practitioner.identifier. SHOULD support the _include for PractionerRole.practitioner and PractitionerRole.endpoint. ([how to search by reference])

1. **SHALL** support searching using the combination of the **[`patient`](SearchParameter-us-core-medicationrequest-patient.html)** and **[`status`](SearchParameter-us-core-medicationrequest-status.html)** search parameters:
  - including optional support of the `_include` parameter to indicate that these resources be included in the results: `MedicationRequest:medication`


    `GET [base]/MedicationRequest?patient=[reference]&status={[system]}|[code]`

    Example:
    
    1. GET [base]/MedicationRequest?patient=1137192&amp;status=active

    *Implementation Notes:* Fetches a bundle of all MedicationRequest resources for the specified patient and status ([how to search by reference] and [how to search by token])



#### Optional Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators] and [chained parameters] SHOULD be supported.

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-medicationrequest-patient.html)** and **[`authoredon`](SearchParameter-us-core-medicationrequest-authoredon.html)** search parameters:
  - including optional support of the `_include` parameter to indicate that these resources be included in the results: `MedicationRequest:medication`

  - including support for these comparators: `gt, lt, ge, le`

    `GET [base]/MedicationRequest?patient=[reference]&authoredon={gt|lt|ge|le}[date]`

    Example:
    
    1. GET [base]/MedicationStatement?patient=1137192&amp;effective=ge2019

    *Implementation Notes:* Fetches a bundle of all MedicationRequest resources for the specified patient and date ([how to search by reference] and [how to search by date])


{% include link-list.md %}