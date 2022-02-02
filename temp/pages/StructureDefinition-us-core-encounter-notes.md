{% include quickstart-intro.md %}

- The syntax used to describe the interactions is described [here](general-guidance.html#search-syntax).
- See the [General Guidance] section for additional rules and expectations when a server requires status parameters.
- See the [General Guidance] section for additional guidance on searching for multiple patients.

#### Mandatory Search Parameters:

The following search parameters and search parameter combinations SHALL be supported:

1. **SHALL** support fetching an encounter using the **[`_id`](SearchParameter-us-core-encounter-id.html)** search parameter:

    `GET [base]/Encounter[id]`

    Example:
    
      1. GET [base]/Encounter/12354
      1. GET [base]/Encounter?_id=12354

    *Implementation Notes:* Fetches a single Encounter ([how to search by the logical id] of the resource)

1. **SHALL** support searching for all encounters for a patient using the **[`patient`](SearchParameter-us-core-encounter-patient.html)** search parameter:

    `GET [base]/Encounter?patient={Type/}[id]`

    Example:
    
      1. GET [base]/Encounter?patient=1137192

    *Implementation Notes:* Fetches a bundle of all Encounter resources for the specified patient ([how to search by reference])

1. **SHALL** support searching using the combination of the **[`date`](SearchParameter-us-core-encounter-date.html)** and **[`patient`](SearchParameter-us-core-encounter-patient.html)** search parameters:
    - including support for these `date` comparators: `gt,lt,ge,le`
    - including optional support for *AND* search on `date` (e.g.`date=[date]&date=[date]]&...`)

    `GET [base]/Encounter?date={gt|lt|ge|le}[date]{&date={gt|lt|ge|le}[date]&...}&patient={Type/}[id]`

    Example:
    
      1. GET [base]/Encounter?patient=example1&amp;date=ge2019-01-01T00:00:00Z

    *Implementation Notes:* Fetches a bundle of all Encounter resources matching the specified date and patient ([how to search by date] and [how to search by reference])


#### Optional Search Parameters:

The following search parameter combinations SHOULD be supported:

1. **SHOULD** support searching using the **[`identifier`](SearchParameter-us-core-encounter-identifier.html)** search parameter:

     `GET [base]/Encounter?identifier={system|}[code]`

    Example:
    
      1. GET [base]/Encounter?identifier=http://hospital.smarthealthit.org\|1032702

     *Implementation Notes:* Fetches a bundle containing any Encounter resources matching the identifier ([how to search by token])

1. **SHOULD** support searching using the combination of the **[`class`](SearchParameter-us-core-encounter-class.html)** and **[`patient`](SearchParameter-us-core-encounter-patient.html)** search parameters:

    `GET [base]/Encounter?class={system|}[code]&patient={Type/}[id]`

    Example:
    
      1. GET [base]/Encounter?patient=example1&amp;class= http://terminology.hl7.org/CodeSystem/v3-ActCode code\|AMB

    *Implementation Notes:* Fetches a bundle of all Encounter resources matching the specified class and patient ([how to search by reference] and [how to search by token])

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-encounter-patient.html)** and **[`type`](SearchParameter-us-core-encounter-type.html)** search parameters:

    `GET [base]/Encounter?patient={Type/}[id]&type={system|}[code]`

    Example:
    
      1. GET [base]/Encounter?patient=1137192&amp;type=http://www.ama-assn.org/go/cpt code\|99201

    *Implementation Notes:* Fetches a bundle of all Encounter resources matching the specified patient and type ([how to search by reference] and [how to search by token])

1. {:.new-content}**SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-encounter-patient.html)** and **[`location`](SearchParameter-us-core-encounter-location.html)** search parameters:

    `GET [base]/Encounter?patient={Type/}[id]&location={Type/}[id]`

    Example:
    
      1. GET [base]/Encounter?patient=1137192&amp;location=Location/hospital

    *Implementation Notes:* Fetches a bundle of all Encounter resources matching the specified patient and location ([how to search by reference])

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-encounter-patient.html)** and **[`status`](SearchParameter-us-core-encounter-status.html)** search parameters:

    `GET [base]/Encounter?patient={Type/}[id]&status={system|}[code]`

    Example:
    
      1. GET [base]/Encounter?patient=example1&amp;status=finished

    *Implementation Notes:* Fetches a bundle of all Encounter resources matching the specified patient and status ([how to search by reference] and [how to search by token])

1. {:.new-content}**SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-encounter-patient.html)** and **[`discharge-disposition`](SearchParameter-us-core-encounter-discharge-disposition.html)** search parameters:

    `GET [base]/Encounter?patient={Type/}[id]&discharge-disposition={system|}[code]`

    Example:
    
      1. GET [base]/Encounter?patient=example1&amp;discharge-disposition=01

    *Implementation Notes:* Fetches a bundle of all Encounter resources matching the specified patient and discharge-disposition ([how to search by reference] and [how to search by token])



{% include link-list.md %}