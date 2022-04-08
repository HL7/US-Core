
`GET [base]/Observation?patient=[id]&category=vital-signs`

**Example:** GET [base]/Observation?patient=1186747&category=vital-signs

*Support:*  Mandatory to support search by category code.

*Implementation Notes:*   Search based on vital sign category code. This search fetches a bundle of all Observation resources with category 'vital-signs' for the specified patient  [(how to search by reference)] and [(how to search by token)].  The table above is the minimum set, additional vital signs are allowed.


-----------

`GET [base]/Observation?patient=[id]&code=[vital sign LOINC{,LOINC2,LOINC3,...}]`

**Example:**

- Search for all heart rate observations for a patient:
  - GET [base]/Observation?patient=1186747&code=8867-4


- Search for all heart rate, respiratory rate and blood pressure observations for a patient
  - GET [base]/Observation?patient=1186747&code=8867-4,9279-1,55284-4

*Support:*  Mandatory to support search by vital sign LOINC(s) listed above.

*Implementation Notes:*   1)Search based on vital sign LOINC code(s). This fetches a bundle of all Observation resources for specific vital sign(s) listed in the table above for the specified patient [(how to search by reference)] and [how to search by token)]. 2) The Observation "code" parameter searches both in both Observation.code and Observation.component.code. For example when fetching blood pressures the same resources will be returned whether the search is based on 55284-4(Systolic and Diastolic BP), or the component codes 8480-6(Systolic BP) or 8462-4 (Diastolic BP).


-----------

`GET [base]/Observation?patient=[id]&category=vital-signs&date=[date]{&date=[date]}`

**Example:**

- Find all the blood pressures after 2013-03-14
  - GET [base]Observation?patient=555580&code=55284-4&date=ge2015-01-14

*Support:*  Mandatory to support search by category code and date

*Implementation Notes:*  Search based on vital sign category code and date. This fetches a bundle of all Observation resources with category 'vital-signs' for the specified patient for a specified time period  [(how to search by reference)] and [(how to search by token)].


--------


  [(how to search by reference)]: {{site.data.fhir.path}}search.html#reference
  [(how to search by token)]: {{site.data.fhir.path}}search.html#token
  [Composite Search Parameters]: {{site.data.fhir.path}}search.html#combining
  [(how to search by date)]: {{site.data.fhir.path}}search.html#date
  [(how to search by string)]: {{site.data.fhir.path}}search.html#string
