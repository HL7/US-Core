
`GET /Device?patient=[id]`

**Example:** GET [base]/Device?patient=1032702


*Support:* Mandatory to support search by patient.

*Implementation Notes:* Search for all implantable device UDIs for a patient. Fetches a bundle of all Device resources for the specified patient [(how to search by reference)].




  [(how to search by reference)]: {{site.data.fhir.path}}search.html#reference
  [(how to search by token)]: {{site.data.fhir.path}}search.html#token
  [Composite Search Parameters]: {{site.data.fhir.path}}search.html#combining
  [(how to search by date)]: {{site.data.fhir.path}}search.html#date
