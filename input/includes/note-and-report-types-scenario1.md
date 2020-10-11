A client determines the types of reports they can access through DiagnosticReport. The server responds with 'foo','bar' ,and 'baz' report types:

**Request for DiagnosticReport report type**

~~~
GET [base]/ValueSet/$expand?context=DiagnosticReport.codes&contextDirection=incoming
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
 "id": "scenario1-server-diagnosticreport-codes",
 "url": "http://acme.org/ValueSet/diagnosticreport-codes",
 "version": "3.0.1",
 "name": "acme-diagnosticreport-codes",
 "title": "Acme DiagnosticReport Codes",
 "status": "draft",
 "date": "2018-11-08T20:29:00+00:00",
 "expansion": {
   "identifier": "urn:uuid:5fc51f5a-4dbc-44f8-8fe5-203d261222f0",
   "timestamp": "2018-11-13T02:55:48.405Z",
   "parameter": [
     {
       "name": "DiagnosticReport.codes",
       "valueString": "DiagnosticReport.codes"
     },
     {
       "name": "contextDirection",
       "valueString": "outgoing"
     }
   ],
   "contains": [
     {
       "system": "http://acme.org",
       "code": "foo",
       "display": "Foo"
     },
     {
       "system": "http://acme.org",
       "code": "bar",
       "display": "Bar"
     },
     {
       "system": "http://acme.org",
       "code": "baz",
       "display": "baz"
     }
   ]
 }
}
~~~
