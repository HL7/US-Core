


#### Mandatory Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators] and [chained parameters] SHALL be supported.  the  modifiers, comparators and chained parameters that are listed as optional SHOULD be supported.:


1. **SHALL** support searching for all conditions including problems, health concerns, and encounter diagnosis for a patient using the **[`patient`](SearchParameter-us-core-condition-patient.html)** search parameter:

    `GET [base]/Condition?patient=[reference]`

    Example:
    
    1. GET [base]/Condition?patient=1137192

    *Implementation Notes:* Fetches a bundle of all Condition resources for the specified patient ([how to search by reference])

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



#### Optional Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators] and [chained parameters] SHOULD be supported.

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-condition-patient.html)** and **[`clinical-status`](SearchParameter-us-core-condition-clinical-status.html)** search parameters:

    `GET [base]/Condition?patient=[reference]&clinical-status=http://terminology.hl7.org/CodeSystem/condition-clinical|active,http://terminology.hl7.org/CodeSystem/condition-clinical|recurrance,http://terminology.hl7.org/CodeSystem/condition-clinical|remission`

    Example:
    
    1. GET [base/Condition?patient=1032702&amp;clinical-status=http://terminology.hl7.org/CodeSystem/condition-clinical\|active,http://terminology.hl7.org/CodeSystem/condition-clinical\|recurrance,http://terminology.hl7.org/CodeSystem/condition-clinical\|remission

    *Implementation Notes:* Fetches a bundle of all Condition resources for the specified patient and all &#34;active&#34; statuses (active,relapse,remission). This will not return any &#34;entered in error&#34; resources because of the conditional presence of the clinicalStatus element. ([how to search by reference] and [how to search by token])

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-condition-patient.html)** and **[`category`](SearchParameter-us-core-condition-category.html)** search parameters:

    `GET [base]/Condition?patient=[reference]&category={[system]}|[code]`

    Example:
    
    1. GET [base]/Condition?patient=1032702&amp;category=http://terminology.hl7.org/CodeSystem/condition-category\|problem
    1. GET [base]/Condition?patient=1032702&amp;category=http://terminology.hl7.org/CodeSystem/condition-category\|health-concern
    1. GET [base]/Condition?patient=1032702&amp;category=http://terminology.hl7.org/CodeSystem/condition-category\|encounter-diagnosis

    *Implementation Notes:* Fetches a bundle of all Condition resources for the specified patient and category. ([how to search by reference] and [how to search by token])

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-condition-patient.html)** and **[`code`](SearchParameter-us-core-condition-code.html)** search parameters:

    `GET [base]/Condition?patient=[reference]&code={[system]}|[code]`

    Example:
    
    1. GET [base]/Condition?patient=1032702&amp;code=[http://snomed.info/sct\|442311008]

    *Implementation Notes:* Fetches a bundle of all Condition resources for the specified patient and code. ([how to search by reference] and [how to search by token])

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-condition-patient.html)** and **[`onset-date`](SearchParameter-us-core-condition-onset-date.html)** search parameters:
  - including support for these comparators: `gt, lt, ge, le`

    `GET [base]/Condition?patient=[reference]&onset-date={gt|lt|ge|le}[date]`

    Example:
    
    1. GET [base]Condition?patient=555580&amp;date=ge2018-01-14

    *Implementation Notes:* Fetches a bundle of all Condition resources for the specified patient and date.  ([how to search by reference] and [how to search by date])


{% include link-list.md %}