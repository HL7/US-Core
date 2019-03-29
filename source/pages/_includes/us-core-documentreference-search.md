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

**`GET [base]/DocumentReference?patient=[id]&class=clinical-note`**

Example: GET [base]/DocumentReference?patient=1235541&class=clinical-note


*Support:* Mandatory to support search by patient to locate all Clinical Notes.

*Implementation Notes:* Search for all Clinical Notes for a patient [(how to search by reference)] fetches a bundle of all DocumentReference resources for the specified patient. Retrieving specific Notes will require a secondary request on the Binary resource.


Retrieve a Patient's Clinical Notes by Searching with a date range:

----

**`GET [base]/DocumentReference?patient=[id]&class=clinical-note&created=[date]`**

Example: GET [base]/DocumentReference?patient=1316024&class=clinical-note&created=ge2018-04-11


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

This operation differs from the above query in that:

1. If not otherwise specified, the returned DocumentReference provides the url for the most current CCD by default
1. The returned DocumentReference may reference virtual documents that are generated on demand when the location provided by the `DocumentReference.content.attachment.url` is accessed.  The $docref operation should return DocumentReferences for *existing documents* as well.

<!--

Functional behavior of Server when responding to the $docref operation:

1. SHALL return at least a reference to CCD document, if available, but MAY provide references to other document types as well.
2. If a context date range is supplied the server SHOULD provide references to any document that falls within the date range
3. If no date range is supplied, then the server SHALL provide references to last or current encounter
-->

-----

**`GET [base]/DocumentReference/$docref?patient=[id]`**

Example: see [$docref operation]

*Support:* Mandatory to support response to operation.

*Implementation Notes:* Search for CCD document from the last encounter and MAY search for other document types from the last encounter as well. Fetches a bundle of DocumentReference resources for the specified patient. The document itself is retrieved using the link provided from the DocumentQuery search results.

{% include link-list.md %}
