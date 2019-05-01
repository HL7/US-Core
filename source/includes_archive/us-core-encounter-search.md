
#### Mandatory Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators] and [chained parameters] SHALL be supported.  the  modifiers, comparators and chained parameters that are listed as optional SHOULD be supported.:


1. **SHALL** support fetching an Encounter using the **`_id`** search parameter:

  `GET [base]/Encounter[id]`

  Example: GET [base]/Encounter/12354

  *Implementation Notes:*  (how to search by the [logical id] of the resource)

1. **SHALL** support searching for all encounters for a patient using the **`patient`** search parameter:

  `GET [base]/Encounter?patient=[reference]`

  Example: GET [base]/Encounter?patient=1137192

  *Implementation Notes:* Fetches a bundle of all Encounter resources for the specified patient (how to search by [reference])

1. **SHALL** support searching for all encounters by date using the **`date`** search parameter:
  - including support for these comparators: `gt, lt, ge, le`

  `GET [base]/Encounter?date={gt|lt|ge|le}[date]`

  Example: See combination searches below

  *Implementation Notes:* Search based on date and patient parameter (how to search by [date])

1. **SHALL**  using the combination of the  **`date and patient`** search parameters:

  `GET [base]/Encounter?date={gt|lt|ge|le}[date]&patient=[reference]`

  Example: 

  *Implementation Notes:*  (how to search by [reference] and [date])



#### Optional Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators] and [chained parameters] SHOULD be supported.

1. **SHOULD** support searching using the **`identifier`** search parameter:

  `GET [base]/Encounter?identifier={[system]}|[code]`

  Example: GET [base]/Encounter?identifier=http://hospital.smarthealthit.org|1032702

  *Implementation Notes:*  (how to search by [token])

1. **SHOULD** support searching using the **`status`** search parameter:

  `GET [base]/Encounter?status={[system]}|[code]`

  Example: GET [base]/Encounter?status=completed

  *Implementation Notes:* Fetches a bundle of all Encounter resources for the specified patient (how to search by [token])

1. **SHOULD** support searching using the **`class`** search parameter:

  `GET [base]/Encounter?class={[system]}|[code]`

  Example: GET [base]/Encounter?status=http://terminology.hl7.org/CodeSystem/v3-ActCode|AMB

  *Implementation Notes:* Fetches a bundle of all Encounter resources for the specified patient (how to search by [token])

1. **SHOULD** support searching using the **`type`** search parameter:

  `GET [base]/Encounter?type={[system]}|[code]`

  Example: GET [base]/Encounter?http://www.ama-assn.org/go/cpt|99201

  *Implementation Notes:* Fetches a bundle of all Encounter resources for the specified patient (how to search by [token])

1. **SHOULD** support searching using the combination of the  **`class and date`** search parameters:

  `GET [base]/Encounter?class=[token]&date={gt|lt|ge|le}[date]`

  Example: 

  *Implementation Notes:* . (how to search by [token] and [date])

1. **SHOULD** support searching using the combination of the  **`class and date and patient`** search parameters:

  `GET [base]/Encounter?class=[token]&date={gt|lt|ge|le}[date]&patient=[reference]`

  Example: 

  *Implementation Notes:* . (how to search by [token] and [reference] and [date])

1. **SHOULD** support searching using the combination of the  **`class and date and patient and type`** search parameters:

  `GET [base]/Encounter?class=[token]&date={gt|lt|ge|le}[date]&patient=[reference]&type=[token]`

  Example: 

  *Implementation Notes:* . (how to search by [token] and [reference] and [date])

1. **SHOULD** support searching using the combination of the  **`class and date and type`** search parameters:

  `GET [base]/Encounter?class=[token]&date={gt|lt|ge|le}[date]&type=[token]`

  Example: 

  *Implementation Notes:* . (how to search by [token] and [date])

1. **SHOULD** support searching using the combination of the  **`class and patient`** search parameters:

  `GET [base]/Encounter?class=[token]&patient=[reference]`

  Example: 

  *Implementation Notes:* . (how to search by [token] and [reference])

1. **SHOULD** support searching using the combination of the  **`class and patient and status`** search parameters:

  `GET [base]/Encounter?class=[token]&patient=[reference]&status=[token]`

  Example: 

  *Implementation Notes:* . (how to search by [token] and [reference])

1. **SHOULD** support searching using the combination of the  **`class and patient and status and type`** search parameters:

  `GET [base]/Encounter?class=[token]&patient=[reference]&status=[token]&type=[token]`

  Example: 

  *Implementation Notes:* . (how to search by [token] and [reference])

1. **SHOULD** support searching using the combination of the  **`class and patient and type`** search parameters:

  `GET [base]/Encounter?class=[token]&patient=[reference]&type=[token]`

  Example: 

  *Implementation Notes:* . (how to search by [token] and [reference])

1. **SHOULD** support searching using the combination of the  **`class and status`** search parameters:

  `GET [base]/Encounter?class=[token]&status=[token]`

  Example: 

  *Implementation Notes:* . (how to search by [token])

1. **SHOULD** support searching using the combination of the  **`class and status and type`** search parameters:

  `GET [base]/Encounter?class=[token]&status=[token]&type=[token]`

  Example: 

  *Implementation Notes:* . (how to search by [token])

1. **SHOULD** support searching using the combination of the  **`class and type`** search parameters:

  `GET [base]/Encounter?class=[token]&type=[token]`

  Example: 

  *Implementation Notes:* . (how to search by [token])

1. **SHOULD** support searching using the combination of the  **`date and patient and type`** search parameters:

  `GET [base]/Encounter?date={gt|lt|ge|le}[date]&patient=[reference]&type=[token]`

  Example: 

  *Implementation Notes:* . (how to search by [token] and [reference] and [date])

1. **SHOULD** support searching using the combination of the  **`date and type`** search parameters:

  `GET [base]/Encounter?date={gt|lt|ge|le}[date]&type=[token]`

  Example: 

  *Implementation Notes:* . (how to search by [token] and [date])

1. **SHOULD** support searching using the combination of the  **`patient and status`** search parameters:

  `GET [base]/Encounter?patient=[reference]&status=[token]`

  Example: 

  *Implementation Notes:* . (how to search by [token] and [reference])

1. **SHOULD** support searching using the combination of the  **`patient and status and type`** search parameters:

  `GET [base]/Encounter?patient=[reference]&status=[token]&type=[token]`

  Example: 

  *Implementation Notes:* . (how to search by [token] and [reference])

1. **SHOULD** support searching using the combination of the  **`patient and type`** search parameters:

  `GET [base]/Encounter?patient=[reference]&type=[token]`

  Example: 

  *Implementation Notes:* . (how to search by [token] and [reference])

1. **SHOULD** support searching using the combination of the  **`status and type`** search parameters:

  `GET [base]/Encounter?status=[token]&type=[token]`

  Example: 

  *Implementation Notes:* . (how to search by [token])


{% include link-list.md %}