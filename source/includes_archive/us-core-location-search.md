
`GET [base]/Location?name=[string]`

**Example:** GET [base]/Location?name=Health


*Support:* Mandatory

*Implementation Notes:*  Search based on text name [(how to search by string)]. 

*Response Class:*

-   (Status 200): successful operation
-   (Status 400): invalid parameter
-   (Status 401/4xx): unauthorized request
-   (Status 403): insufficient scope


-----------


`GET [base]/Location?address=[string]`

**Example:** GET [base]/Location?address=Arbor

**Example:** GET [base]/Location?address-postalcode=48104

*Support:* Mandatory

*Implementation Notes:* Search based on text address [(how to search by string)].

SHOULD support:

   - address-city
   - address-state
   - address-postalcode

*Response Class:*

-   (Status 200): successful operation
-   (Status 400): invalid parameter
-   (Status 401/4xx): unauthorized request
-   (Status 403): insufficient scope

  [(how to search by reference)]: {{site.data.fhir.path}}search.html#reference
  [(how to search by token)]: {{site.data.fhir.path}}search.html#token
 [(how to search by date)]: {{site.data.fhir.path}}search.html#date
 [(how to search by string)]: {{site.data.fhir.path}}search.html#string
