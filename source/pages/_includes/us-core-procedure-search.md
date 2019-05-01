


#### Mandatory Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators] and [chained parameters] SHALL be supported.  the  modifiers, comparators and chained parameters that are listed as optional SHOULD be supported.:


1. **SHALL** support searching for all procedures for a patient using the **[`patient`](SearchParameter-us-core-procedure-patient.html)** search parameter:

    `GET [base]/Procedure?patient=[reference]`

    Example:
    
    1. GET [base]/Procedure?patient=1291938

    *Implementation Notes:* Fetches a bundle of all Procedure resources for the specified patient ([how to search by reference])

1. **SHALL** support searching using the combination of the **[`patient`](SearchParameter-us-core-procedure-patient.html)** and **[`date`](SearchParameter-us-core-procedure-date.html)** search parameters:
  - including support for these comparators: `gt, lt, ge, le`

    `GET [base]/Procedure?patient=[reference]&date={gt|lt|ge|le}[date]`

    Example:
    
    1. GET [base]/Procedure?patient=1137192&amp;date=ge2019-01-14

    *Implementation Notes:* Fetches a bundle of all Procedure resources for the specified patient and date ([how to search by reference] and [how to search by token])



#### Optional Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators] and [chained parameters] SHOULD be supported.

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-procedure-patient.html)** and **[`status`](SearchParameter-us-core-procedure-status.html)** search parameters:

    `GET [base]/Procedure?patient=[reference]&status={[system]}|[code]`

    Example:
    
    1. GET [base]/Procedure?patient=1137192&amp;status=completed

    *Implementation Notes:* Fetches a bundle of all Procedure resources for the specified patient and status ([how to search by reference] and [how to search by token])

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-procedure-patient.html)** and **[`code`](SearchParameter-us-core-procedure-code.html)** and **[`date`](SearchParameter-us-core-procedure-date.html)** search parameters:
  - including support for these comparators: `gt, lt, ge, le`

    `GET [base]/Procedure?patient=[reference]&code={[system]}|[code]&date={gt|lt|ge|le}[date]`

    Example:
    
    1. GET [base]/Procedure?patient=1137192&amp;date=ge2019-01-14&amp;code=http://snomed.info/sct\|35637008

    *Implementation Notes:* Fetches a bundle of all Procedure resources for the specified patient and date and procedure code(s).  SHOULD support search by multiple codes. ([how to search by reference] and [how to search by token] and [how to search by date])


{% include link-list.md %}