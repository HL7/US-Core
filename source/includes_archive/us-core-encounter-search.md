
`GET /Encounter/[id]`

**Example:** GET [base]/Encounter/12354

*Support:* Mandatory.

*Implementation Notes:* Fetches a single Encounter.

------

`GET /Encounter?patient=[id]`

**Example:** GET [base]/Encounter?patient=1137192

*Support:* Mandatory to support search by patient.

*Implementation Notes:* Search for all Encounters for a patient. Fetches a bundle of all Encounter resources for the specified patient [(how to search by reference)].

------

**`GET [base]/Encounter?patient=[id]&period=[date]`**

Example: GET [base]/Encounter?patient=2169591&period=ge2016-01-01

*Support:* Mandatory to support search by date range.

*Implementation Notes:* Fetches a bundle of all Encounter resources for the specified patient for a given time period.  [(how to search by reference)], and [(how to search by date)].

-----



  [(how to search by reference)]: {{site.data.fhir.path}}search.html#reference
  [(how to search by token)]: {{site.data.fhir.path}}search.html#token
  [Composite Search Parameters]: {{site.data.fhir.path}}search.html#combining
  [(how to search by date)]: {{site.data.fhir.path}}search.html#date