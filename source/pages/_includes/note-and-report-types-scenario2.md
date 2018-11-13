
A client determines the types of note or reports they can access through DocumentReference.  The server responds with the five "Common Clinical Notes" types:

**Request for DocumentReference note or report type**

~~~
GET [base]/ValueSet/$expand?context=DocumentReference.type&contextDirection=outgoing
~~~

**Response**

~~~
HTTP/1.1 200 OK
[other headers]
~~~

**Response body**

~~~
{
  "resourceType": "ValueSet",
  "id": "scenario2-server-clinical-note-type",
  "url": "http://fhir.org/guides/argonaut-clinicalnotes/ValueSet/argonaut-clinical-note-type",
  "version": "3.0.1",
  "name": "ArgonautClinicalNotes",
  "title": "Argonaut DocumentReferences Type Value Set",
  "status": "draft",
  "date": "2018-11-08T20:29:00+00:00",
  "expansion": {
    "identifier": "urn:uuid:5fc51f5a-4dbc-44f8-8fe5-203d261222f0",
    "timestamp": "2018-11-13T02:55:48.405Z",
    "parameter": [
      {
        "name": "DocumentReference.type",
        "valueString": "DiagnosticReport.codes"
      },
      {
        "name": "contextDirection",
        "valueString": "outgoing"
      }
    ],
    "contains": [
      {
        "system": "http://loinc.org",
        "code": "18842-5",
        "display": "Discharge Summary"
      },
      {
        "system": "http://loinc.org",
        "code": "11488-4",
        "display": "Consultation Note"
      },
      {
        "system": "http://loinc.org",
        "code": "34117-2",
        "display": "History & Physical Note"
      },
      {
        "system": "http://loinc.org",
        "code": "11506-3",
        "display": "Progress Note"
      },
      {
        "system": "http://loinc.org",
        "code": "28570-0",
        "display": "Procedures Note"
      }
    ]
  }
}
~~~
