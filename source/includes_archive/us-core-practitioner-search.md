


-----------

**`GET [base]/Practitioner?identifier=[system]|[code]`**

**Example:** GET [base]/Practitioner?identifier=http://hl7.org/fhir/sid/us-npi%7C1497860456

*Support:* Mandatory

*Implementation Notes:*  Search based on practitioner identifier  [(how to search by token)].

*Response Class:*

-   (Status 200): successful operation
-   (Status 400): invalid parameter
-   (Status 401/4xx): unauthorized request

-----------


**`GET [base]/Practitioner?family=[string]&given=[string]`**

**Example:** GET [base]/Practitioner?family=Smith&given=John

*Support:* Mandatory

*Implementation Notes:* Search based on text name [(how to search by string)].

*Response Class:*

-   (Status 200): successful operation
-   (Status 400): invalid parameter
-   (Status 401/4xx): unauthorized request

  [(how to search by reference)]: {{site.data.fhir.path}}search.html#reference
  [(how to search by token)]: {{site.data.fhir.path}}search.html#token
 [(how to search by date)]: {{site.data.fhir.path}}search.html#date
 [(how to search by string)]: {{site.data.fhir.path}}search.html#string
