
`GET [base]/Observation?patient=[id]&code=72166-2`

*Support:* Mandatory to support search by patient and code = '72166-2'.

**Example:** GET [base]/Observation?patient=1032702&code=72166-2

*Implementation Notes:*  Search based on smoking status LOINC code. Fetches a bundle of all Observation resources with Observation.code of Tobacco Smoking Status for the specified patient [(how to search by reference)] and [(how to search by token)].

  [(how to search by reference)]: {{site.data.fhir.path}}search.html#reference
  [(how to search by token)]: {{site.data.fhir.path}}search.html#token
  [Composite Search Parameters]: {{site.data.fhir.path}}search.html#combining
  [(how to search by date)]: {{site.data.fhir.path}}search.html#date
  [(how to search by string)]: {{site.data.fhir.path}}search.html#string

