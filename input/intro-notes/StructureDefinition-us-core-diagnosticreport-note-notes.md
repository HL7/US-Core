{% include quickstart-intro.md %}

- The syntax used to describe the interactions is described [here](general-guidance.html#search-syntax).
- See the [General Guidance] section for additional rules and expectations when a server requires status parameters.
- See the [General Guidance] section for additional guidance on searching for multiple patients.

#### Mandatory Search Parameters:

The following search parameters and search parameter combinations SHALL be supported:

1. **SHALL** support searching for all diagnosticreports for a patient using the **[`patient`](SearchParameter-us-core-diagnosticreport-patient.html)** search parameter:

    `GET [base]/DiagnosticReport?patient={Type/}[id]`

    Example:
    
      1. GET [base]/DiagnosticReport?patient=1137192

    *Implementation Notes:* Fetches a bundle of all DiagnosticReport resources for the specified patient ([how to search by reference])

1. **SHALL** support searching using the combination of the **[`patient`](SearchParameter-us-core-diagnosticreport-patient.html)** and **[`category`](SearchParameter-us-core-diagnosticreport-category.html)** search parameters:

    `GET [base]/DiagnosticReport?patient={Type/}[id]&category={system|}[code]`

    Example:
    
      1. GET [base]/DiagnosticReport?patient=f201&amp;category=http://loinc.org\|LP29684-5

    *Implementation Notes:* Fetches a bundle of all DiagnosticReport resources for the specified patient and  a category code specified in US Core DiagnosticReport Category Codes ([how to search by reference] and [how to search by token])

1. **SHALL** support searching using the combination of the **[`patient`](SearchParameter-us-core-diagnosticreport-patient.html)** and **[`code`](SearchParameter-us-core-diagnosticreport-code.html)** search parameters:
    - including optional support for composite *OR* search on `code` (e.g.`code={system|}[code],{system|}[code],...`)

    `GET [base]/DiagnosticReport?patient={Type/}[id]&code={system|}[code]{,{system|}[code],...}`

    Example:
    
      1. GET [base]/DiagnosticReport?patient=1032702&amp;code=http://loinc.org\|24323-8

    *Implementation Notes:* Fetches a bundle of all DiagnosticReport resources for the specified patient and  report code(s).  SHOULD support search by multiple report codes. ([how to search by reference] and [how to search by token])

1. **SHALL** support searching using the combination of the **[`patient`](SearchParameter-us-core-diagnosticreport-patient.html)** and **[`category`](SearchParameter-us-core-diagnosticreport-category.html)** and **[`date`](SearchParameter-us-core-diagnosticreport-date.html)** search parameters:
    - including support for these `date` comparators: `gt,lt,ge,le`
    - including optional support for composite *AND* search on `date` (e.g.`date=[date]&date=[date]]&...`)

    `GET [base]/DiagnosticReport?patient={Type/}[id]&category={system|}[code]&date={gt|lt|ge|le}[date]{&date={gt|lt|ge|le}[date]&...}`

    Example:
    
      1. GET [base]/DiagnosticReport?patient=f201&amp;category=http://loinc.org\|LP29684-5&amp;date=ge2010-01-14T00:00:00Z

    *Implementation Notes:* Fetches a bundle of all DiagnosticReport resources for the specified patient and date and a category code specified in US Core DiagnosticReport Category Codes ([how to search by reference] and [how to search by token] and [how to search by date])


#### Optional Search Parameters:

The following search parameter combinations SHOULD be supported:

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-diagnosticreport-patient.html)** and **[`status`](SearchParameter-us-core-diagnosticreport-status.html)** search parameters:
    - including support for composite *OR* search on `status` (e.g.`status={system|}[code],{system|}[code],...`)

    `GET [base]/DiagnosticReport?patient={Type/}[id]&status={system|}[code]{,{system|}[code],...}`

    Example:
    
      1. GET [base]/DiagnosticReport?patient=1137192&amp;status=completed

    *Implementation Notes:* Fetches a bundle of all DiagnosticReport resources for the specified patient and status ([how to search by reference] and [how to search by token])

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-diagnosticreport-patient.html)** and **[`code`](SearchParameter-us-core-diagnosticreport-code.html)** and **[`date`](SearchParameter-us-core-diagnosticreport-date.html)** search parameters:
    - including optional support for composite *OR* search on `code` (e.g.`code={system|}[code],{system|}[code],...`)
    - including support for these `date` comparators: `gt,lt,ge,le`
    - including optional support for composite *AND* search on `date` (e.g.`date=[date]&date=[date]]&...`)

    `GET [base]/DiagnosticReport?patient={Type/}[id]&code={system|}[code]{,{system|}[code],...}&date={gt|lt|ge|le}[date]{&date={gt|lt|ge|le}[date]&...}`

    Example:
    
      1. GET [base]/DiagnosticReport?patient=f201&amp;code=http://loinc.org\|24323-8&amp;date=ge2019-01-14T00:00:00Z

    *Implementation Notes:* Fetches a bundle of all DiagnosticReport resources for the specified patient and date and report code(s).  SHOULD support search by multiple report codes. ([how to search by reference] and [how to search by token] and [how to search by date])



{% include link-list.md %}