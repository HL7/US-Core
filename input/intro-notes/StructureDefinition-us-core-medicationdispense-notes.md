{% include quickstart-intro.md %}

#### Mandatory Search Parameters:

1. **SHALL** support searching using the **[`patient`](SearchParameter-us-core-medicationdispense-patient.html)** search parameter:

    - including optional support for these `_include` parameters: `MedicationDispense:medication`

    `GET [base]/MedicationDispense?patient={Type/}[id]`

    Example:
    
      1. GET [base]/MedicationDispense?patient=14676
      1. GET [base]/MedicationStatement?patient=14676&amp;_include=MedicationDispense:medication

    *Implementation Notes:* Fetches a bundle of all MedicationDispense resources for the specified patient. ([how to search by reference])


#### Optional Search Parameters:

The following search parameter combinations **SHOULD** be supported:

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-medicationdispense-patient.html)** and **[`status`](SearchParameter-us-core-medicationdispense-status.html)** search parameters:
    - including optional support for these `_include` parameters: `MedicationDispense:medication`
    - including support for *OR* search on `status` (e.g.`status={system|}[code],{system|}[code],...`)

    `GET [base]/MedicationDispense?patient={Type/}[id]&status={system|}[code]{,{system|}[code],...}`

    Example:
    
      1. GET [base]/MedicationDispense?patient=1137192&amp;status=completed
      1. GET [base]/MedicationDispense?patient=1137192&amp;status=completed&amp;_include=MedicationDispense:medication

    *Implementation Notes:* Fetches a bundle of all MedicationDispense resources for the specified patient that have a given dispense status (e.g., dispensed, not dispensed)). ([how to search by reference] and [how to search by token])

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-medicationdispense-patient.html)** and **[`status`](SearchParameter-us-core-medicationdispense-status.html)** and **[`type`](SearchParameter-us-core-medicationdispense-type.html)** search parameters:
    - including optional support for these `_include` parameters: `MedicationDispense:medication`
    - including support for *OR* search on `status` (e.g.`status={system|}[code],{system|}[code],...`)
    - including support for *OR* search on `type` (e.g.`type={system|}[code],{system|}[code],...`)

    `GET [base]/MedicationDispense?patient={Type/}[id]&status={system|}[code]{,{system|}[code],...}&type={system|}[code]{,{system|}[code],...}`

    Example:
    
      1. GET [base]/MedicationDispense?patient=1137192&amp;status=&amp;type=
      1. GET [base]/MedicationDispense?patient=1137192&amp;status=&amp;type=FFP&amp;_include=MedicationDispense:medication

    *Implementation Notes:* Fetches a bundle of all MedicationDispense resources for the specified patient that have a given dispense status (e.g., dispensed, not dispensed) and type of dispense (e.g., partially dispensed). ([how to search by reference] and [how to search by token])



{% include link-list.md %}