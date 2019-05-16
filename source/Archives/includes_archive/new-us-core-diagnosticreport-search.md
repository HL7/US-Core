

`GET [base]/DiagnosticReport?patient=[id]&category=[system]|[code]`

**Example:** GET [base]/DiagnosticReport?patient=f201&category=http://loinc.org&#124;LP29684-5

*Support:* Mandatory to support search by patient and category codes specified in [Argonaut DiagnosticReport Category Codes].

*Implementation Notes:* Search based on diagnostic report category code, for example Radiology (LP29684-5). This fetches a bundle of all LP29684-5 related DiagnosticReport resources for the specified patient  [(how to search by reference)] and [(how to search by token)].


-----------

`GET [base]/DiagnosticReport?patient=[id]&code=[LOINC{,LOINC2,LOINC3,...}]`

**Example:** GET [base]/DiagnosticReport?patient=1032702&code=84178-3  (LOINC =  84178-3 Interventional Radiology Note)

*Support:* Mandatory support search by a specific DiagnosticReport code. SHOULD support search by multiple report codes.

*Implementation Notes:* Search based on DiagnosticReport code(s). This fetches a bundle of all DiagnosticReport resources for a specific diagnostic order code(s) for the specified patient  [(how to search by reference)] and [(how to search by token)].


-----------

`GET [base]/DiagnosticReport?patient=[id]&category=[system]|[code]&date=[date]{&date=[date]}`

**Example:** GET [base]/DiagnosticReport?patient=f201&category=http://loinc.org&#124;LP29684-5&date=ge2010-01-14

*Support:*  Mandatory support search by category codes in [Argonaut DiagnosticReport Category Codes] and date or period.

*Implementation Notes:*  Search based on category code, for example Radiology (LP29684-5), and date. This fetches a bundle of all DiagnosticReport resources with category LP29684-5 for the specified patient for a specified time period   [(how to search by reference)], [(how to search by token)] and [(how to search by date)].


  [Argonaut DiagnosticReport Category Codes]: ValueSet-us-core-diagnosticreport-category.html
  [(how to search by reference)]: {{site.data.fhir.path}}search.html#reference
  [(how to search by token)]: {{site.data.fhir.path}}search.html#token
  [Composite Search Parameters]: {{site.data.fhir.path}}search.html#combining
  [(how to search by date)]: {{site.data.fhir.path}}search.html#date
