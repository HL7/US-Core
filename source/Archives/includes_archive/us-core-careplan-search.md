

`GET /CarePlan?patient=[id]&category=assess-plan`

**Example:** GET [base]/CarePlan?patient=1137192&category=assess-plan

*Support:* Mandatory to support search by patient.

*Implementation Notes:* Search for all patient assessments and plans of treatment for a patient. Fetches a bundle of all CarePlan resources for the specified patient [(how to search by reference)] and [(how to search by token)].


-----------

`GET /CarePlan?patient=[id]&category=assess-plan&date=[date]`

**Example:**

- GET [base]/CarePlan?patient=1137192&category=assess-plan&date=ge2015-01-14
- GET [base]/CarePlan?patient=1137192&category=assess-plan&date=ge2015-01-14&date=le2016-01-14

*Support:* Mandatory to support search by date

*Implementation Notes:* Search for all assessment and plan of treatment for a patient within a time period. Fetches a bundle of all CarePlan resources for the specified patient for a specified time period.  [(how to search by reference)], [(how to search by token)] and [(how to search by date)].


-----------

`GET /CarePlan?patient=[id]&category=assess-plan&status=active`

**Example:** GET [base]/CarePlan?patient=1137192&status=active

*Support:* SHOULD support search by patient and status = 'active'.

*Implementation Notes:* SHOULD support search by reference and status. [(how to search by reference)], [(how to search by token)].


-----------

`GET /CarePlan?patient=[id]&category=assess-plan&status=active&date=[date]`

**Example:** GET [base]/CarePlan?patient=1137192&category=assess-plan&datatus=active&date=ge2015-01-14

*Support:* SHOULD support search by patient and status = 'active' and date.

*Implementation Notes:* Search for all active assessment and plan of treatment for a patient within a time period. Fetches a bundle of all active (careplan = "active") CarePlan resources for the specified patient for a specified time period.  [(how to search by reference)], [(how to search by token)] and [(how to search by date)].




  [(how to search by reference)]: {{site.data.fhir.path}}search.html#reference
  [`https://fhir-open-api-dstu2.smarthealthit.org/AllergyIntolerance?patient=1137192`]: https://fhir-open-api-dstu2.smarthealthit.org/AllergyIntolerance?patient=1137192
  [(how to search by token)]: {{site.data.fhir.path}}search.html#token
  [Composite Search Parameters]: {{site.data.fhir.path}}search.html#combining
  [`https://fhir-open-api-dstu2.smarthealthit.org/AllergyIntolerance?patient=1137192&status=active,unconfirmed,confirmed`]: https://fhir-open-api-dstu2.smarthealthit.org/AllergyIntolerance?patient=1137192&status=active,unconfirmed,confirmed
   [(how to search by date)]: {{site.data.fhir.path}}search.html#date
