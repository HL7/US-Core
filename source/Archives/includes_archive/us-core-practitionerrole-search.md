

`GET [base]/PractitionerRole?practitioner.identifier=[system]|[code]`

**Example:** GET [base]/PractitionerRole?practitioner.identifier=http://hl7.org/fhir/sid/us-npi%7C14\|97860456

*Support:* Mandatory to support search by Practitioner identifier.

*Implementation Notes:* Search based on Practitioner identifier (NPI) [(how to search by token)].


-----------

`GET [base]/PractitionerRole?practitioner.family=[string]&given=[string]`

**Example:** GET [base]/PractitionerRole?practitioner.name=Henry

*Support:* Mandatory to support search by Practitioner name.

*Implementation Notes:* Search based on text name [(how to search by string)].

-----------

`GET [base]/PractitionerRole?specialty=[system]|[code]`

**Example:** GET [base]/PractitionerRole?specialty=http://hl7.org/fhir/practitioner-specialty%7Ccardio

*Support:* Mandatory to support search by Specialty.

*Implementation Notes:*  Search based on specialty [(how to search by token)].

-----------
**Searches to consider for future**

  `GET [base]/PractitionerRole?location.address-city=[city]`
  
  `GET [base]/PractitionerRole?location.address-city=[city]&specialty=[string]`
  
  `GET [base]/PractitionerRole?location.near=-72.519854,42.373222&near-distance=2m`


*Implementation Notes:*  Search based on location [(how to search by reference)].



  [(how to search by reference)]: http://hl7.org/fhir/search.html#reference
  [(how to search by token)]: http://hl7.org/fhir/search.html#token
 [(how to search by date)]: http://hl7.org/fhir/search.html#date
 [(how to search by string)]: http://hl7.org/fhir/search.html#string
