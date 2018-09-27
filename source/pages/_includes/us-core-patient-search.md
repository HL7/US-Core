
`GET [base]/Patient/[id]`

**Example:** GET [base]/Patient/1032702


*Support:* Mandatory

*Implementation Notes:*  Fetches a single Patient


-----------

**`GET [base]/Patient/identifier=[system]|[code]`**

**Example:** GET [base]/Patient?identifier=http://hospital.smarthealthit.org|1032702

*Support:* Mandatory

*Implementation Notes:*  Fetches a single Patient by an Identifier such as a MPI


-----------

`GET [base]/Patient?name=[string]&birthdate=[date]`

**Example:** GET [base]/Patient?name=Shaw&birthdate=2007-03-20


*Support:* Mandatory

*Implementation Notes:*  Search based on at least 2 patient elements -text name [(how to search by string)] and birthdate [(how to search by date)]


-----------
`GET [base]/Patient?name=[string]&gender=[code]`

**Example:** GET [base]/Patient?name=Shaw&gender=female

*Support:* Mandatory

*Implementation Notes:*  Search based on at least 2 patient elements -text name [(how to search by string)] and gender [(how to search by token)].

-----------

`GET [base]/Patient?family=[string]&gender=[code]`

**Example:** GET [base]/Patient?family=shaw&gender=female

*Support:* SHOULD support Patient search by family name and gender

*Implementation Notes:*  Search based on at least 2 patient elements -text family name [(how to search by string)] and gender [(how to search by token)].


-----------

`GET [base]/Patient?given=[string]&gender=[code]`

**Example:** GET [base]/Patient?given=amy&gender=female

*Support:* SHOULD support Patient search by given name and gender

*Implementation Notes:*  Search based on at least 2 patient elements -text given name [(how to search by string)] and gender [(how to search by token)]


-----------

  [(how to search by reference)]: {{site.data.fhir.path}}search.html#reference
  [(how to search by token)]: {{site.data.fhir.path}}search.html#token
  [Composite Search Parameters]: {{site.data.fhir.path}}search.html#combining
  [(how to search by date)]: {{site.data.fhir.path}}search.html#date
  [(how to search by string)]: {{site.data.fhir.path}}search.html#string
