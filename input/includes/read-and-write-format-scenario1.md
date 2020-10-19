
System A accepts contentType `text/plain` in a create transaction and returns `text/html` in a read transaction.

**Request for Write contentType**

~~~
GET [base]/ValueSet/$expand?context=DocumentReference.content.attachment.contentType&contextDirection=incoming
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
  "id": "scenario1-server-write-contenttype",
  "url": "http://acme.org/fhir/ValueSet/in-mimetypes-1",
  "version": "3.0.1",
  "name": "ArgonautServerWriteMimeTypes",
  "title": "Argonaut Server Write Mime Types Value Set",
  "status": "draft",
  "date": "2018-11-08T20:29:00+00:00",
  "expansion": {
    "identifier": "urn:uuid:5fc51f5a-4dbc-44f8-8fe5-203d261222f0",
    "timestamp": "2018-11-13T02:55:48.405Z",
    "parameter": [
      {
        "name": "context",
        "valueString": "DocumentReference.content.attachment.contentType"
      },
      {
        "name": "contextDirection",
        "valueString": "incoming"
      }
    ],
    "contains": [
      {
        "system": "urn:ietf:bcp:13",
        "code": "text/plain"
      }
    ]
  }
}
~~~

**Request for Read contentType**

~~~
GET [base]/ValueSet/$expand?context=DocumentReference.content.attachment.contentType&contextDirection=outgoing
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
  "id": "scenario1-server-read-contenttype",
  "url": "http://acme.org/fhir/ValueSet/out-mimetypes-1",
  "version": "3.0.1",
  "name": "ArgonautServerReadMimeTypes",
  "title": "Argonaut Server Read Mime Types Value Set",
  "status": "draft",
  "date": "2018-11-08T20:29:00+00:00",
  "expansion": {
    "identifier": "urn:uuid:5fc51f5a-4dbc-44f8-8fe5-203d261222f0",
    "timestamp": "2018-11-13T02:55:48.405Z",
    "parameter": [
      {
        "name": "context",
        "valueString": "DocumentReference.content.attachment.contentType"
      },
      {
        "name": "contextDirection",
        "valueString": "outgoing"
      }
    ],
    "contains": [
      {
        "system": "urn:ietf:bcp:13",
        "code": "text/html"
      }
    ]
  }
}
~~~
