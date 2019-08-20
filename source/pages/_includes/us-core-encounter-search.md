
- See the [General Guidance] section for additional rules and expectations when a server requires status parameters.
- See the [General Guidance] section for additional guidance on searching for multiple patients.

#### Mandatory Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators], [chains] and [composites] SHALL be supported.  the  modifiers, comparators, chains and composites that are listed as optional SHOULD be supported.:

1. **SHALL** support fetching an encounter using the **[`_id`](SearchParameter-us-core-encounter-id.html)** search parameter:

    `GET [base]/Encounter[id]`

    Example:
    
      1. GET [base]/Encounter/12354
      1. GET [base]/Encounter?_id=12354

    *Implementation Notes:* Fetches a single Encounter ([how to search by the logical id] of the resource)

1. **SHALL** support searching for all encounters for a patient using the **[`patient`](SearchParameter-us-core-encounter-patient.html)** search parameter:

    - including optional support for composite *OR* search on `patient` (e.g.`patient=[reference],[reference],...`)

    `GET [base]/Encounter?patient=[reference]{,[reference],...}`

    Example:
    
      1. GET [base]/Encounter?patient=1137192

    *Implementation Notes:* Fetches a bundle of all Encounter resources for the specified patient ([how to search by reference])

1. **SHALL** support searching using the combination of the **[`date`](SearchParameter-us-core-encounter-date.html)** and **[`patient`](SearchParameter-us-core-encounter-patient.html)** search parameters:
    - including support for these `date` comparators: `gt,lt,ge,le`
    - including optional support for composite *AND* search on `date` (e.g.`date=[date]&date=[date]]&...`)
    - including optional support for composite *OR* search on `patient` (e.g.`patient=[reference],[reference],...`)

    `GET [base]/Encounter?date={gt|lt|ge|le}[date]{&date={gt|lt|ge|le}[date]&...}&patient=[reference]{,[reference],...}`

    Example:
    
      1. GET [base]/Encounter?patient=example1&amp;date=ge2019

    *Implementation Notes:* Fetches a bundle of all Encounter resources matching the specified date and patient ([how to search by date] and [how to search by reference])


#### Optional Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators], [chains] and [composites] SHOULD be supported.

1. **SHOULD** support searching using the **[`identifier`](SearchParameter-us-core-encounter-identifier.html)** search parameter:

     `GET [base]/Encounter?identifier={[system]}|[code]`

    Example:
    
      1. GET [base]/Encounter?identifier=http://hospital.smarthealthit.org\|1032702

     *Implementation Notes:* Fetches a bundle containing any Encounter resources matching the identifier ([how to search by token])

1. **SHOULD** support searching using the combination of the **[`class`](SearchParameter-us-core-encounter-class.html)** and **[`patient`](SearchParameter-us-core-encounter-patient.html)** search parameters:
    - including optional support for composite *OR* search on `patient` (e.g.`patient=[reference],[reference],...`)

    `GET [base]/Encounter?class={[system]}|[code]&patient=[reference]{,[reference],...}`

    Example:
    
      1. GET [base]/Encounter?patient=example1&amp;class= http://terminology.hl7.org/CodeSystem/v3-ActCode code\|AMB

    *Implementation Notes:* Fetches a bundle of all Encounter resources matching the specified class and patient ([how to search by reference] and [how to search by token])

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-encounter-patient.html)** and **[`type`](SearchParameter-us-core-encounter-type.html)** search parameters:
    - including optional support for composite *OR* search on `patient` (e.g.`patient=[reference],[reference],...`)

    `GET [base]/Encounter?patient=[reference]{,[reference],...}&type={[system]}|[code]`

    Example:
    
      1. GET [base]/Encounter?patient=1137192&amp;type=http://www.ama-assn.org/go/cpt code\|99201

    *Implementation Notes:* Fetches a bundle of all Encounter resources matching the specified patient and type ([how to search by reference] and [how to search by token])

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-encounter-patient.html)** and **[`status`](SearchParameter-us-core-encounter-status.html)** search parameters:
    - including optional support for composite *OR* search on `patient` (e.g.`patient=[reference],[reference],...`)

    `GET [base]/Encounter?patient=[reference]{,[reference],...}&status={[system]}|[code]`

    Example:
    
      1. GET [base]/Encounter?patient=example1&amp;status=finished

    *Implementation Notes:* Fetches a bundle of all Encounter resources matching the specified patient and status ([how to search by reference] and [how to search by token])

{% include link-list.md %}