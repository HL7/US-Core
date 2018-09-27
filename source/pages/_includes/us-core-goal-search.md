
`GET /Goal?patient=[id]`

**Example:** GET [base]/Goal?patient=1137192

*Support:* Mandatory to support search by patient.

*Implementation Notes:* Search for all goals for a patient. Fetches a bundle of all Goal resources for the specified patient. [(how to search by reference)].


-----------

`GET /Goal?patient=[id]&date=[date]{&date=[date]}`

**Example:**

- GET [base]/Goal?patient=1137192&date=ge2015-01-14
- GET [base]/Goal?patient=1137192&date=ge2015-01-14&date=le2016-01-14

*Support:* Mandatory to support search by date.

*Implementation Notes:* Search for all goals for a patient within a time period. Fetches a bundle of all Goal resources for the specified patient with a specified time period. [(how to search by reference)] and [(how to search by date)].


  [(how to search by reference)]: {{site.data.fhir.path}}search.html#reference
  [(how to search by token)]: {{site.data.fhir.path}}search.html#token
  [Composite Search Parameters]: {{site.data.fhir.path}}search.html#combining
  [(how to search by date)]: {{site.data.fhir.path}}search.html#date
