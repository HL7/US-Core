### Search for Clinical Notes

Retrieve a Clinical Note with a given DocumentReference id:

----

**`GET [base]/DocumentReference/[id]`**

Example: GET [base]/DocumentReference/2169591

*Support:* Mandatory to support retrieve by a specific DocumentReference id.

*Implementation Notes:* This will return a pointer to the Binary resource which then can be retrieved using:

**`GET [base]/Binary/[id]`**

All other searches expect this two step process of locating the Clinical Note, and then retrieving the Binary.

Retrieve all Clinical Notes for a given Patient:

----

**`GET [base]/DocumentReference?patient=[id]&category=clinical-note`**

Example: GET [base]/DocumentReference?patient=1235541&category=clinical-note


*Support:* Mandatory to support search by patient to locate all Clinical Notes.

*Implementation Notes:* Search for all Clinical Notes for a patient [(how to search by reference)] fetches a bundle of all DocumentReference resources for the specified patient. Retrieving specific Notes will require a secondary request on the Binary resource.


Retrieve a Patient's Clinical Notes by Searching with a date range:

----

**`GET [base]/DocumentReference?patient=[id]&category=clinical-note&created=[date]`**

Example: GET [base]/DocumentReference?patient=1316024&category=clinical-note&created=ge2018-04-11


*Support:* Mandatory to support search by date range.

*Implementation Notes:* Search for all Clinical Notes for a patient [(how to search by reference)] for a date range [(how to search by date)] fetches a bundle of all DocumentReference resources for the specified patient. Retrieving specific Notes will require a secondary request on the Binary resource.

Retrieve a specific Note type for a Patient:

----

**`GET [base]/DocumentReference?patient=[id]&type=[note type (LOINC)]`**

Example: GET [base]/DocumentReference?patient=1316024&type=http://loinc.org 18842-5

*Support:* Mandatory to support search by Note type.

*Implementation Notes:* Search for a specific Note type [(how to search by token)] for a patient [(how to search by reference)] fetches a bundle of all DocumentReference resources for the specified patient. Retrieving specific Notes will require a secondary request on the Binary resource.

Write new note to a Patient's Chart:

----

**`POST [base]/DocumentReference`**

{% include examplebutton.html example="clinical-note-post" %}

*Support:* Mandatory to support write capability.

-------

  [(how to search by reference)]: {{ site.data.fhir.path }}search.html#reference
  [(how to search by token)]: {{ site.data.fhir.path }}search.html#token
  [Composite Search Parameters]: {{ site.data.fhir.path }}search.html#combining
  [(how to search by date)]: {{ site.data.fhir.path }}search.html#date
  [(how to search by _include)]: {{ site.data.fhir.path }}search.html#_include


### General Document Search

----

**`GET [base]/DocumentReference?patient=[id]`**

Example: GET [base]/DocumentReference?patient=2169591


*Support:* Mandatory to support search by patient.

*Implementation Notes:* Search for all documents for a patient. Fetches a bundle of all DocumentReference resources for the specified patient [(how to search by reference)].

------

**`GET [base]/DocumentReference?patient=[id]&type=[type]&period=[date]`**

Example: GET [base]/DocumentReference?patient=2169591&type=34133-9&period=ge2016-01-01

*Support:* Optional to support search by patient and type and date range.

*Implementation Notes:* Fetches a bundle of all DocumentReference resources for the specified patient for a given time period and document type.  [(how to search by reference)], [(how to search by token)], and [(how to search by date)].

-----

### Searching documents using the [$docref operation]

This operation is used to request a server *generate* a document based on the specified parameters.  If no parameters are specified, the server SHALL return a DocumentReference to the patient's most current CCD.  See the [$docref operation] definition for details on how this operation differs from a FHIR RESTful search.

-----

**`GET [base]/DocumentReference/$docref?patient=[id]`**

Example: see [$docref operation]

*Support:* Mandatory to support search by $docref operation.


*Implementation Notes:* This operation returns DocumentReference resources. The document itself is retrieved using the link provided in the `DocumentReference.content.attachment.url` element.

{% include link-list.md %}
