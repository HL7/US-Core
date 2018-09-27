

`GET [base]/DiagnosticReport?patient=[id]&category=LAB`

**Example:** GET [base]/DiagnosticReport?patient=f201&category=LAB

*Support:* Mandatory to support search by patient and category code = 'LAB'.

*Implementation Notes:* Search based on diagnostic report category code = 'LAB'. This fetches a bundle of all lab related DiagnosticReport resources for the specified patient  [(how to search by reference)] and [(how to search by token)].


-----------

`GET [base]/DiagnosticReport?patient=[id]&code=[LOINC{,LOINC2,LOINC3,...}]`

**Example:**
-  Search for all metabolic panel reports (LOINC = 24323-8 *Comprehensive metabolic 2000 panel - Serum or Plasma*) for a patient
  - GET [base]/DiagnosticReport?patient=1032702&code=24323-8


- Search for all cbc (LOINC = 58410-2 *Complete blood count (hemogram) panel - Blood by Automated count*), metabolic panel, and urinalysis panels (LOINC = 24356-8 *Urinalysis complete panel - Urine*) for a patient
  - GET [base]/DiagnosticReport?patient=1032702&code=24323-8,58410-2,24356-8

*Support:* Mandatory support search by a laboratory order code. SHOULD support search by multiple order codes.

*Implementation Notes:* Search based on DiagnosticReport code(s). This fetches a bundle of all DiagnosticReport resources for a specific diagnostic order code(s) for the specified patient  [(how to search by reference)] and [(how to search by token)].


-----------

`GET [base]/DiagnosticReport?patient=[id]&category=LAB&date=[date]{&date=[date]}`

**Example:** Find all the lab reports issued after 2010-01-14

- GET [base]/DiagnosticReport?patient=f201&category=LAB&date=ge2010-01-14

*Support:*  Mandatory support search by category code = 'LAB' and date or period.

*Implementation Notes:*  Search based on laboratory category code and date. This fetches a bundle of all DiagnosticReport resources with category 'LAB' for the specified patient for a specified time period   [(how to search by reference)], [(how to search by token)] amd [(how to search by date)].



  [(how to search by reference)]: {{site.data.fhir.path}}search.html#reference
  [(how to search by token)]: {{site.data.fhir.path}}search.html#token
  [Composite Search Parameters]: {{site.data.fhir.path}}search.html#combining
  [(how to search by date)]: {{site.data.fhir.path}}search.html#date
