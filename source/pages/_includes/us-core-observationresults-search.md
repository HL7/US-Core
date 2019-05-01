


#### Mandatory Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators] and [chained parameters] SHALL be supported.  the  modifiers, comparators and chained parameters that are listed as optional SHOULD be supported.:


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

1. **SHALL** support searching using the combination of the **[`patient`](SearchParameter-us-core-observation-patient.html)** and **[`category`](SearchParameter-us-core-observation-category.html)** search parameters:

    `GET [base]/Observation?patient=[reference]&category=http://hl7.org/fhir/observation-category|laboratory`

    Example:
    
    1. GET [base]/Observation?patient=1134281&amp;category=http://hl7.org/fhir/observation-category\|laboratory

    *Implementation Notes:* Fetches a bundle of all Observation resources for the specified patient and a category code = `laboratory` ([how to search by reference] and [how to search by token])

1. **SHALL** support searching using the combination of the **[`patient`](SearchParameter-us-core-observation-patient.html)** and **[`code`](SearchParameter-us-core-observation-code.html)** search parameters:

    `GET [base]/Observation?patient=[reference]&code={[system]}|[code]`

    Example:
    
    1. GET [base]/Observation?patient=1134281&amp;code=http://loinc.org\|2339-0
    1. GET [base]/Observation?patient=1134281&amp;code=http://loinc.org\|2339-0,http://loinc.org\|25428-4,2514-8

    *Implementation Notes:* Fetches a bundle of all Observation resources for the specified patient and observation code(s).  SHOULD support search by multiple report codes. The Observation `code` parameter searches `Observation.code only. ([how to search by reference] and [how to search by token])

1. **SHALL** support searching using the combination of the **[`patient`](SearchParameter-us-core-observation-patient.html)** and **[`category`](SearchParameter-us-core-observation-category.html)** and **[`date`](SearchParameter-us-core-observation-date.html)** search parameters:
  - including support for these comparators: `gt, lt, ge, le`

    `GET [base]/Observation?patient=[reference]&category=http://hl7.org/fhir/observation-category|laboratory&date={gt|lt|ge|le}[date]`

    Example:
    
    1. GET [base]Observation?patient=555580&amp;category=http://hl7.org/fhir/observation-category\|laboratory&amp;date=ge2018-03-14

    *Implementation Notes:* Fetches a bundle of all Observation resources for the specified patient and date and a category code = `laboratory` ([how to search by reference] and [how to search by token] and [how to search by date])



#### Optional Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators] and [chained parameters] SHOULD be supported.

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-observation-patient.html)** and **[`category`](SearchParameter-us-core-observation-category.html)** and **[`status`](SearchParameter-us-core-observation-status.html)** search parameters:

    `GET [base]/Observation?patient=[reference]&category=http://hl7.org/fhir/observation-category|laboratory&status={[system]}|[code]`

    Example:
    
    1. GET [base]/Observation?patient=1134281&amp;category=http://hl7.org/fhir/observation-category\|laboratory&amp;status=final

    *Implementation Notes:* Fetches a bundle of all Observation resources for the specified patient and category = `laboratory` and status ([how to search by reference] and [how to search by token])

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-observation-patient.html)** and **[`code`](SearchParameter-us-core-observation-code.html)** and **[`date`](SearchParameter-us-core-observation-date.html)** search parameters:
  - including support for these comparators: `gt, lt, ge, le`

    `GET [base]/Observation?patient=[reference]&code={[system]}|[code]&date={gt|lt|ge|le}[date]`

    Example:
    
    1. GET [base]Observation?patient=555580&amp;code=http://loinc.org\|2339-0&amp;date=ge2019

    *Implementation Notes:* Fetches a bundle of all Observation resources for the specified patient and date and report code(s).  SHOULD support search by multiple report codes. ([how to search by reference] and [how to search by token] and [how to search by date])

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-observation-patient.html)** and **[`status`](SearchParameter-us-core-observation-status.html)** search parameters:

    `GET [base]/Observation?patient=[reference]&status={[system]}|[code]`

    Example:
    
    1. GET [base]/Observation?patient=1137192&amp;status=final

    *Implementation Notes:* Fetches a bundle of all !Observation resources for the specified patient and status ([how to search by reference] and [how to search by token])


{% include link-list.md %}