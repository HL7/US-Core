
`GET /Device?patient=[id]`

**Example:** GET [base]/Device?patient=1032702


*Support:* Mandatory to support search by patient.

*Implementation Notes:* Fetches a bundle of all Device resources for the specified patient [(how to search by reference)]. This search will return both implantable and non-implantable devices.  

`GET /Device?patient=[id]&type=[device type (SNOMED)]`


**Example:** GET /Device?patient=1032702&type=14106009

*Support:* Recommended to support search by patient and device type.

*Implementation Notes:* Fetches a bundle of Device resources for the specified patient of a specific Device type.  




  [(how to search by reference)]: {{site.data.fhir.path}}search.html#reference
  [(how to search by token)]: {{site.data.fhir.path}}search.html#token
  [Composite Search Parameters]: {{site.data.fhir.path}}search.html#combining
  [(how to search by date)]: {{site.data.fhir.path}}search.html#date
