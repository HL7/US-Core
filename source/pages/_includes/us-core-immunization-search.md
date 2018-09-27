
`GET /Immunization?patient=[id]`

**Example:** GET [base]/Immunization?patient=1032702

*Support:* Mandatory to support search by patient.

*Implementation Notes:* Search for all Immunization resources for a patient. Fetches a bundle of all Immunization resources for the specified patient  [(how to search by reference)].


  [(how to search by reference)]: {{site.data.fhir.path}}search.html#reference
  [(how to search by token)]: {{site.data.fhir.path}}search.html#token
  [Composite Search Parameters]: {{site.data.fhir.path}}search.html#combining
  [(how to search by date)]: {{site.data.fhir.path}}search.html#date
