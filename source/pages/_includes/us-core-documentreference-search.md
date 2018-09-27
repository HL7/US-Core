
Typically, DocumentReference resources are used with document indexing systems, such as [IHE XDS]. However, document references may also may be created "on-the-fly" in response to a Document Query request.  In other words there MAY NOT be pre-existing index of references to a patient's documents at the FHIR endpoint. This results in an empty bundle being returned when searching using a normal FHIR Query.  Therefore, the [$docref operation] has been defined to both create and fetch patient DocumentReference Resources.

The following search criteria describe fetching pre-indexed documents and those created "on-the-fly".

**Searching pre-indexed documents:**

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

**Searching documents using the [$docref operation]:**

Functional behavior of Server when responding to the $docref operation:

1. SHALL return at least a reference to CCD document, if available, but MAY provide references to other document types as well.
2. If a context date range is supplied the server SHOULD provide references to any document that falls within the date range
3. If no date range is supplied, then the server SHALL provide references to last or current encounter

-----

**`GET [base]/DocumentReference/$docref?patient=[id]`**

Example: see [$docref operation]

*Support:* Mandatory to support response to operation.

*Implementation Notes:* Search for CCD document from the last encounter and MAY search for other document types from the last encounter as well. Fetches a bundle of DocumentReference resources for the specified patient [(how to search by reference)].


[(how to search by reference)]: {{site.data.fhir.path}}search.html#reference
[(how to search by token)]: {{site.data.fhir.path}}search.html#token
[(how to search by date)]: {{site.data.fhir.path}}search.html#date
[IHE XDS]: https://wiki.ihe.net/index.php/Cross-Enterprise_Document_Sharing
[$docref operation]: OperationDefinition-docref.html
