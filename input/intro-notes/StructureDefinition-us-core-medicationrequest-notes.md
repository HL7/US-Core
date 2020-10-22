
- The syntax used to describe the interactions is described [here](general-guidance.html#search-syntax).
- See the [General Guidance] section for additional rules and expectations when a server requires status parameters.
- See the [General Guidance] section for additional guidance on searching for multiple patients.

#### Mandatory Search Parameters:

The following search parameters and search parameter combinations SHALL be supported.:

1. **SHALL** support searching using the combination of the **[`patient`](SearchParameter-us-core-medicationrequest-patient.html)** and **[`intent`](SearchParameter-us-core-medicationrequest-intent.html)** search parameters:
    - including support for composite *OR* search on `intent` (e.g.`intent={system|}[code],{system|}[code],...`)

    `GET [base]/MedicationRequest?patient=[reference]&intent=order,plan`

    Example:

      1. GET [base]/MedicationRequest?patient=14676&amp;intent=order,plan
      1. GET [base]/MedicationRequest?patient=14676&amp;intent=order,plan&amp;_include=MedicationRequest:medication

    *Implementation Notes:* Fetches a bundle of all MedicationRequest resources for the specified patient and intent code = `order,plan` ([how to search by reference] and [how to search by token])

1. **SHALL** support searching using the combination of the **[`patient`](SearchParameter-us-core-medicationrequest-patient.html)** and **[`intent`](SearchParameter-us-core-medicationrequest-intent.html)** and **[`status`](SearchParameter-us-core-medicationrequest-status.html)** search parameters:
    - including support for composite *OR* search on `intent` (e.g.`intent={system|}[code],{system|}[code],...`)
    - including support for composite *OR* search on `status` (e.g.`status={system|}[code],{system|}[code],...`)

    `GET [base]/MedicationRequest?patient=[reference]&intent=order,plan&status={system|}[code]{,{system|}[code],...}`

    Example:

      1. GET [base]/MedicationRequest?patient=1137192&amp;intent=order,plan&amp;status=active
      1. GET [base]/MedicationRequest?patient=1137192&amp;intent=order,plan&amp;status=active&amp;_include=MedicationRequest:medication

    *Implementation Notes:* Fetches a bundle of all MedicationRequest resources for the specified patient and intent  code = `order,plan` and status ([how to search by reference] and [how to search by token])


#### Optional Search Parameters:

The following search parameter combinations SHOULD be supported.:

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-medicationrequest-patient.html)** and **[`intent`](SearchParameter-us-core-medicationrequest-intent.html)** and **[`encounter`](SearchParameter-us-core-medicationrequest-encounter.html)** search parameters:
    - including support for composite *OR* search on `intent` (e.g.`intent={system|}[code],{system|}[code],...`)

    `GET [base]/MedicationRequest?patient=[reference]&intent=order,plan&encounter=[reference]`

    Example:

      1. GET [base]/MedicationRequest?patient=1137192&amp;intent=order,plan&amp;status=active&amp;encounter=Encounter/123
      1. GET [base]/MedicationRequest?patient=1137192&amp;intent=order,plan&amp;status=active&amp;&amp;encounter=Encounter/123&amp;_include=MedicationRequest:medication

    *Implementation Notes:* Fetches a bundle of all MedicationRequest resources for the specified patient and intent  code = `order,plan` and encounter ([how to search by reference] and [how to search by token])

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-medicationrequest-patient.html)** and **[`intent`](SearchParameter-us-core-medicationrequest-intent.html)** and **[`authoredon`](SearchParameter-us-core-medicationrequest-authoredon.html)** search parameters:
    - including support for composite *OR* search on `intent` (e.g.`intent={system|}[code],{system|}[code],...`)
    - including support for these `authoredon` comparators: `gt,lt,ge,le`
    - including optional support for composite *AND* search on `authoredon` (e.g.`authoredon=[date]&authoredon=[date]]&...`)

    `GET [base]/MedicationRequest?patient=[reference]&intent=order,plan&authoredon={gt|lt|ge|le}[date]{&authoredon={gt|lt|ge|le}[date]&...}`

    Example:

      1. GET [base]/MedicationRequest?patient=1137192&amp;intent=order,plan&amp;authoredon=ge2019
      1. GET [base]/MedicationRequest?patient=1137192&amp;intent=order,plan&amp;authoredon=ge2019&amp;_include=MedicationRequest:medication

    *Implementation Notes:* Fetches a bundle of all MedicationRequest resources for the specified patient and intent  code = `order,plan` and authoredon date ([how to search by reference] and [how to search by token] and [how to search by date])



{% include link-list.md %}
