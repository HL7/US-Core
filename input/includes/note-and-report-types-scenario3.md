
A client is only interested in retrieving notes by class (Note, DocumentReference.class is updated to DocumentReference.category in FHIR R4).  The server responds with the single category of 'Clinical Notes':

**Request for DocumentReference note categories**

~~~
GET [base]/ValueSet/$expand?context=DocumentReference.class&contextDirection=outgoing
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
  "id": "scenario3-server-documentreference-category",
  "url": "http://fhir.org/guides/argonaut-clinicalnotes/ValueSet/documentreference-category",
  "version": "3.0.1",
  "name": "ArgonautDocumentReferenceCategoryCodes",
  "title": "Argonaut DocumentReference Category Codes",
  "status": "draft",
  "date": "2018-11-08T20:29:00+00:00",
  "expansion": {
    "identifier": "urn:uuid:5fc51f5a-4dbc-44f8-8fe5-203d261222f0",
    "timestamp": "2018-11-13T02:55:48.405Z",
    "parameter": [{
        "name": "context",
        "valueString": "DocumentReference.class"
      },
      {
        "name": "contextDirection",
        "valueString": "outgoing"
      }
    ],
    "contains": [{
        "system": "http://fhir.org/guides/argonaut-clinicalnotes/CodeSystem/documentreference-category",
        "code": "clinical-note",
        "display": "Clinical Note"
      }
    ]
  }
}
~~~
