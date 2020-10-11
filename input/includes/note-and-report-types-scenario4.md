
A client determines the category of reports they can access through DiagnosticReport. The server responds with Radiology, Pathology ,and Cardiology report categories:

**Request for DiagnosticReport report type**
 
~~~
GET [base]/ValueSet/$expand?context=DiagnosticReport.category&contextDirection=incoming
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
  "id": "scenario4-server-diagnosticreport-category",
  "url": "http://fhir.org/guides/argonaut-clinicalnotes/ValueSet/diagnosticreport-category",
  "version": "3.0.1",
  "name": "ArgonautDiagnosticReportCategoryCodes",
  "title": "Argonaut DiagnosticReport Category Value Set",
  "status": "draft",
  "date": "2018-11-08T20:29:00+00:00",
  "expansion": {
    "identifier": "urn:uuid:5fc51f5a-4dbc-44f8-8fe5-203d261222f0",
    "timestamp": "2018-11-13T02:55:48.405Z",
    "parameter": [
      {
        "name": "context",
        "valueString": "DiagnosticReport.category"
      },
      {
        "name": "contextDirection",
        "valueString": "outgoing"
      }
    ],
    "contains": [
      {
        "system": "http://loinc.org",
        "code": "LP29684-5",
        "display": "Radiology"
      },
      {
        "system": "http://loinc.org",
        "code": "LP29708-2",
        "display": "Cardiology"
      },
      {
        "system": "http://loinc.org",
        "code": "LP7839-6",
        "display": "Pathology"
      }
    ]
  }
}
~~~
