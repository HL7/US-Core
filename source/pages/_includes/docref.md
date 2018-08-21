source file: pages/_includes/docref/md

The operation can be invoked using the GET Syntax if the complex type parameter is omitted:

`GET [base]/DocumentReference/$docref?{parameters}`

Otherwise the POST transaction is used as follows:

`POST [base]/DocumentReference/$docref}`

---

##### Example

~~~
##### 1. Request the latest CCD for a patient #####

GET [base]/DocumentReference/$docref?patient=123

or

POST [base]/DocumentReference/$docref}

    **payload:**

    {
      "resourceType": "Parameters",
      "id": "get-ccd123",
      "parameter": [
        {
          "name": "patient",
          "valueId" : "123"
        }
      ]
    }


##### 1. Response #####

    {
      "resourceType": "Bundle",
      "id": "get-ccd123-response",
      "type": "searchset",
      "total": 1,
      "entry": [{
        "fullUrl": "http://server/path/DocumentReference/get-ccd123",
        "resource":{
        "resourceType" : "DocumentReference",
        "id" : "get-ccd123",
        "meta" : {
          "profile" : [
            "http://fhir.org/guides/argonaut/StructureDefinition/argo-documentreference"
          ]
        },
        "identifier" : [
          {
            "system" : "urn:ietf:rfc:3986",
            "value" : "urn:oid:2.16.840.1.113883.19.5.99999.1"
          }
        ],
        "status" : "current",
        "type" : {
          "coding" : [
            {
              "system" : "http://loinc.org",
              "code" : "34133-9",
              "display" : "Summary of episode note"
            }
          ],
          "text" : "CCD Document"
        },
        "subject" : {
          "reference" : "Patient/example",
          "display" : "Amy Shaw"
        },
        "created" : "2006-09-01",
        "indexed" : "2016-03-09T15:29:46Z",
        "author" : [
          {
            "reference" : "Practitioner/practitioner-1",
            "display" : "Ronald Bone, MD"
          }
        ],
        "description" : "Pulmonology clinic acute visit",
        "content" : [
          {
            "attachment" : {
              "contentType" : "text/plain",
              "url" : "/Binary/1-note",
              "title" : "Uri where the data can be found: [base]/Binary/1-note"
            },
            "format" : {
              "system" : "urn:oid:1.3.6.1.4.1.19376.1.2.3",
              "code" : "urn:hl7-org:sdwg:ccda-structuredBody:2.1",
              "display" : "Documents following C-CDA constraints using a structured body"
            }
          }
        ],
        "context" : {
          "period" : {
            "start" : "2004-12-23T08:00:00+11:00",
            "end" : "2004-12-23T08:01:00+11:00"
          }
        }
      }
      }
      ]
    }
~~~
