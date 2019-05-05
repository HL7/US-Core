

#### Mandatory Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators], [chains] and [composites] SHALL be supported.  the  modifiers, comparators, chains and composites that are listed as optional SHOULD be supported.:

1. **SHALL** support searching using the combination of the **[`patient`](SearchParameter-us-core-careplan-patient.html)** and **[`category`](SearchParameter-us-core-careplan-category.html)** search parameters:

    `GET [base]/CarePlan?patient=[reference]&category=http://hl7.org/fhir/us/core/CodeSystem/careplan-category|assess-plan`

    Example:
    
      1. GET [base]/CarePlan?patient=1137192&amp;category=http://hl7.org/fhir/us/core/CodeSystem/careplan-category\|assess-plan

    *Implementation Notes:* Fetches a bundle of all CarePlan resources for the specified patient and category=`assess-plan` ([how to search by reference] and [how to search by token])


#### Optional Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators], [chains] and [composites] SHOULD be supported.

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-careplan-patient.html)** and **[`category`](SearchParameter-us-core-careplan-category.html)** and **[`date`](SearchParameter-us-core-careplan-date.html)** search parameters:
    - including support for these `date` comparators: `gt,lt,ge,le`
    - including optional support for composite *AND* search on `date` (e.g.`date=[date]&date=[date]]&...`)

    `GET [base]/CarePlan?patient=[reference]&category=http://hl7.org/fhir/us/core/CodeSystem/careplan-category|assess-plan&date={gt|lt|ge|le}[date]{&date={gt|lt|ge|le}[date]&...}`

    Example:
    
      1. GET [base]/CarePlan?patient=1137192&amp;category=http://hl7.org/fhir/us/core/CodeSystem/careplan-category\|assess-plan&amp;date=ge2019
      1. GET [base]/CarePlan?patient=1137192&amp;category=http://hl7.org/fhir/us/core/CodeSystem/careplan-category\|assess-plan&amp;date=ge2018&amp;date=le2018

    *Implementation Notes:* Fetches a bundle of all CarePlan resources for the specified patient and category=`assess-plan` and date ([how to search by reference] and [how to search by token] and [how to search by date])

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-careplan-patient.html)** and **[`category`](SearchParameter-us-core-careplan-category.html)** and **[`status`](SearchParameter-us-core-careplan-status.html)** search parameters:

    `GET [base]/CarePlan?patient=[reference]&category=http://hl7.org/fhir/us/core/CodeSystem/careplan-category|assess-plan&status={[system]}|[code]`

    Example:
    
      1. GET [base]/CarePlan?patient=1137192&amp;category=http://hl7.org/fhir/us/core/CodeSystem/careplan-category\|assess-plan&amp;status=active

    *Implementation Notes:* Fetches a bundle of all CarePlan resources for the specified patient and category=`assess-plan` and status=`active` ([how to search by reference] and [how to search by token])

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-careplan-patient.html)** and **[`category`](SearchParameter-us-core-careplan-category.html)** and **[`status`](SearchParameter-us-core-careplan-status.html)** and **[`date`](SearchParameter-us-core-careplan-date.html)** search parameters:
    - including support for these `date` comparators: `gt,lt,ge,le`
    - including optional support for composite *AND* search on `date` (e.g.`date=[date]&date=[date]]&...`)

    `GET [base]/CarePlan?patient=[reference]&category=http://hl7.org/fhir/us/core/CodeSystem/careplan-category|assess-plan&status={[system]}|[code]&date={gt|lt|ge|le}[date]{&date={gt|lt|ge|le}[date]&...}`

    Example:
    
      1. GET [base]/CarePlan?patient=1137192&amp;category=http://hl7.org/fhir/us/core/CodeSystem/careplan-category\|assess-plan&amp;status=active&amp;date=ge2019
      1. GET [base]/CarePlan?patient=1137192&amp;category=http://hl7.org/fhir/us/core/CodeSystem/careplan-category\|assess-plan&amp;status=active&amp;date=ge2018&amp;date=le2019

    *Implementation Notes:* Fetches a bundle of all CarePlan resources for the specified patient and category=`assess-plan` and status=`active` and date ([how to search by reference] and [how to search by token] and [how to search by date])

{% include link-list.md %}