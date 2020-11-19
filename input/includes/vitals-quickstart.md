
---

**Quick Start**{:#search style="font-size: 20px;"}

---

Below is an overview of the required set of Server RESTful FHIR interactions - for example, search and read operations - for this profile. See the [Capability Statements] for a complete list of supported RESTful interactions for this IG.

- The syntax used to describe the interactions is described [here](general-guidance.html#search-syntax).
- See the [General Guidance] section for additional rules and expectations when a server requires status parameters.
- See the [General Guidance] section for additional guidance on searching for multiple patients.

#### Mandatory Search Parameters:

The following search parameters and search parameter combinations SHALL be supported.:

1. **SHALL** support searching using the combination of the **[`patient`](SearchParameter-us-core-observation-patient.html)** and **[`category`](SearchParameter-us-core-observation-category.html)** search parameters:

    `GET [base]/Observation?patient=[reference]&category=http://terminology.hl7.org/CodeSystem/observation-category|vital-signs`

    Example:

      1. GET [base]/Observation?patient=1134281&amp;category=http://terminology.hl7.org/CodeSystem/observation-category\|vital-signs

    *Implementation Notes:* Fetches a bundle of all Observation resources for the specified patient and a category code = `vital-signs` ([how to search by reference] and [how to search by token])

1. **SHALL** support searching using the combination of the **[`patient`](SearchParameter-us-core-observation-patient.html)** and **[`code`](SearchParameter-us-core-observation-code.html)** search parameters:
    - including optional support for composite *OR* search on `code` (e.g.`code={system|}[code],{system|}[code],...`)

    `GET [base]/Observation?patient=[reference]&code={system|}[code]{,{system|}[code],...}`

    Example:

      1. GET [base]/Observation?patient=1186747&amp;code=http://loinc.org\|8867-4,http://loinc.org\|9279-1,http://loinc.org\|85354-9

    *Implementation Notes:* Fetches a bundle of all Observation resources for the specified patient and observation code(s).  SHOULD support search by multiple codes. The Observation `code` parameter searches `Observation.code only. ([how to search by reference] and [how to search by token])

1. **SHALL** support searching using the combination of the **[`patient`](SearchParameter-us-core-observation-patient.html)** and **[`category`](SearchParameter-us-core-observation-category.html)** and **[`date`](SearchParameter-us-core-observation-date.html)** search parameters:
    - including support for these `date` comparators: `gt,lt,ge,le`
    - including optional support for composite *AND* search on `date` (e.g.`date=[date]&date=[date]]&...`)

    `GET [base]/Observation?patient=[reference]&category=http://terminology.hl7.org/CodeSystem/observation-category|vital-signs&date={gt|lt|ge|le}[date]{&date={gt|lt|ge|le}[date]&...}`

    Example:

      1. GET [base]/Observation?patient=1134281&amp;category=http://terminology.hl7.org/CodeSystem/observation-category\|vital-signs&amp;date=ge2019

    *Implementation Notes:* Fetches a bundle of all Observation resources for the specified patient and date and a category code = `vital-signs` ([how to search by reference] and [how to search by token] and [how to search by date])


#### Optional Search Parameters:

The following search parameter combinations SHOULD be supported.:

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-observation-patient.html)** and **[`category`](SearchParameter-us-core-observation-category.html)** and **[`status`](SearchParameter-us-core-observation-status.html)** search parameters:
    - including support for composite *OR* search on `status` (e.g.`status={system|}[code],{system|}[code],...`)

    `GET [base]/Observation?patient=[reference]&category=http://terminology.hl7.org/CodeSystem/observation-category|vital-signs&status={system|}[code]{,{system|}[code],...}`

    Example:

      1. GET [base]/Observation?patient=1134281&amp;category=http://terminology.hl7.org/CodeSystem/observation-category\|vital-signs&amp;status=final

    *Implementation Notes:* Fetches a bundle of all Observation resources for the specified patient and category and status ([how to search by reference] and [how to search by token])

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-observation-patient.html)** and **[`code`](SearchParameter-us-core-observation-code.html)** and **[`date`](SearchParameter-us-core-observation-date.html)** search parameters:
    - including optional support for composite *OR* search on `code` (e.g.`code={system|}[code],{system|}[code],...`)
    - including support for these `date` comparators: `gt,lt,ge,le`
    - including optional support for composite *AND* search on `date` (e.g.`date=[date]&date=[date]]&...`)

    `GET [base]/Observation?patient=[reference]&code={system|}[code]{,{system|}[code],...}&date={gt|lt|ge|le}[date]{&date={gt|lt|ge|le}[date]&...}`

    Example:

      1. GET [base]/Observation?patient=1186747&amp;code=http://loinc.org\|8867-4,http://loinc.org\|9279-1,http://loinc.org\|85354-9&amp;date=ge2019

    *Implementation Notes:* Fetches a bundle of all Observation resources for the specified patient and date and report code(s).  SHOULD support search by multiple codes. ([how to search by reference] and [how to search by token] and [how to search by date])



{% include link-list.md %}
