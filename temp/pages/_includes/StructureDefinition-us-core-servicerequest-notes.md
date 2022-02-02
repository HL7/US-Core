{% include quickstart-intro.md %}

- The syntax used to describe the interactions is described [here](general-guidance.html#search-syntax).
- See the [General Guidance] section for additional rules and expectations when a server requires status parameters.
- See the [General Guidance] section for additional guidance on searching for multiple patients.

#### Mandatory Search Parameters:

The following search parameters and search parameter combinations SHALL be supported:

1. {:.new-content}**SHALL** support searching for all servicerequests for a patient using the **[`patient`](SearchParameter-us-core-servicerequest-patient.html)** search parameter:

    `GET [base]/ServiceRequest?patient={Type/}[id]`

    Example:

      1. GET [base]/ServiceRequest?patient=1137192

    *Implementation Notes:* Fetches a bundle of all ServiceRequest resources for the specified patient ([how to search by reference])

1. {:.new-content}**SHALL** support fetching a ServiceRequest using the **[`_id`](SearchParameter-us-core-servicerequest-id.html)** search parameter:

    `GET [base]/ServiceRequest[id]`

    Example:

      1. GET [base]/ServiceRequest/1032702
      1. GET [base]/ServiceRequest?_id=1032702

    *Implementation Notes:*  ([how to search by the logical id] of the resource)

1. {:.new-content}**SHALL** support searching using the combination of the **[`patient`](SearchParameter-us-core-servicerequest-patient.html)** and **[`category`](SearchParameter-us-core-servicerequest-category.html)** search parameters:

    `GET [base]/ServiceRequest?patient={Type/}[id]&category={system|}[code]`

    Example:

      1. GET [base]/ServiceRequest?patient=f201&amp;category=http://loinc.org\|LG41762-2

    *Implementation Notes:* Fetches a bundle of all ServiceRequest resources for the specified patient and  a category code ([how to search by reference] and [how to search by token])

1. {:.new-content}**SHALL** support searching using the combination of the **[`patient`](SearchParameter-us-core-servicerequest-patient.html)** and **[`code`](SearchParameter-us-core-servicerequest-code.html)** search parameters:
    - including optional support for *OR* search on `code` (e.g.`code={system|}[code],{system|}[code],...`)

    `GET [base]/ServiceRequest?patient={Type/}[id]&code={system|}[code]{,{system|}[code],...}`

    Example:

      1. GET [base]/ServiceRequest?patient=1032702&amp;code=http://snomed.info/sct\|35637008

    *Implementation Notes:* Fetches a bundle of all ServiceRequest resources for the specified patient and  report code(s).  SHOULD support search by multiple report codes. ([how to search by reference] and [how to search by token])

1. {:.new-content}**SHALL** support searching using the combination of the **[`patient`](SearchParameter-us-core-servicerequest-patient.html)** and **[`category`](SearchParameter-us-core-servicerequest-category.html)** and **[`authored`](SearchParameter-us-core-servicerequest-authored.html)** search parameters:
    - including support for these `authored` comparators: `gt,lt,ge,le`
    - including optional support for *AND* search on `authored` (e.g.`authored=[date]&authored=[date]]&...`)

    `GET [base]/ServiceRequest?patient={Type/}[id]&category={system|}[code]&authored={gt|lt|ge|le}[date]{&authored={gt|lt|ge|le}[date]&...}`

    Example:

      1. GET [base]/ServiceRequest?patient=f201&amp;category=http://loinc.org\|LG41762-2&amp;date=ge2010-01-14T00:00:00Z

    *Implementation Notes:* Fetches a bundle of all ServiceRequest resources for the specified patient and date and a category code ([how to search by reference] and [how to search by token] and [how to search by date])


#### Optional Search Parameters:

The following search parameter combinations SHOULD be supported:

1. {:.new-content}**SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-servicerequest-patient.html)** and **[`status`](SearchParameter-us-core-servicerequest-status.html)** search parameters:
    - including support for *OR* search on `status` (e.g.`status={system|}[code],{system|}[code],...`)

    `GET [base]/ServiceRequest?patient={Type/}[id]&status={system|}[code]{,{system|}[code],...}`

    Example:

      1. GET [base]/ServiceRequest?patient=1137192&amp;status=completed

    *Implementation Notes:* Fetches a bundle of all ServiceRequest resources for the specified patient and status ([how to search by reference] and [how to search by token])

1. {:.new-content}**SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-servicerequest-patient.html)** and **[`code`](SearchParameter-us-core-servicerequest-code.html)** and **[`authored`](SearchParameter-us-core-servicerequest-authored.html)** search parameters:
    - including optional support for *OR* search on `code` (e.g.`code={system|}[code],{system|}[code],...`)
    - including support for these `authored` comparators: `gt,lt,ge,le`
    - including optional support for *AND* search on `authored` (e.g.`authored=[date]&authored=[date]]&...`)

    `GET [base]/ServiceRequest?patient={Type/}[id]&code={system|}[code]{,{system|}[code],...}&authored={gt|lt|ge|le}[date]{&authored={gt|lt|ge|le}[date]&...}`

    Example:

      1. GET [base]/ServiceRequest?patient=f201&amp;code=http://snomed.info/sct\|35637008&amp;date=ge2019-01-14T00:00:00Z

    *Implementation Notes:* Fetches a bundle of all ServiceRequest resources for the specified patient and date and service code(s).  SHOULD support search by multiple report codes. ([how to search by reference] and [how to search by token] and [how to search by date])



{% include link-list.md %}
