
`GET /AllergyIntolerance?patient=[id]`

**Example:** GET [base]/AllergyIntolerance?patient=1137192


*Support:* Mandatory to support search by patient.

*Implementation Notes:* Search for all allergies for a patient. Fetches a bundle of all AllergyIntolerance resources for the specified patient [(how to search by reference)].




  [(how to search by reference)]: {{site.data.fhir.path}}search.html#reference
  [`https://fhir-open-api-dstu2.smarthealthit.org/AllergyIntolerance?patient=1137192`]: https://fhir-open-api-dstu2.smarthealthit.org/AllergyIntolerance?patient=1137192
  [(how to search by token)]: {{site.data.fhir.path}}search.html#token
  [Composite Search Parameters]: {{site.data.fhir.path}}search.html#combining
  [`https://fhir-open-api-dstu2.smarthealthit.org/AllergyIntolerance?patient=1137192&status=active,unconfirmed,confirmed`]: https://fhir-open-api-dstu2.smarthealthit.org/AllergyIntolerance?patient=1137192&status=active,unconfirmed,confirmed
