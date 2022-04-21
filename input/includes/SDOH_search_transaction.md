
- Patient's FHIR_id = "example"
- Observation category = "sdoh"

**Request**

Request url using GET

GET `http://wildfhir4.aegis.net/fhir4-0-1/Observation?patient=Patient/example&category=sdoh`


Request Headers
~~~
User-Agent: python-requests/2.25.1
Accept-Encoding: gzip, deflate
Accept: application/fhir+json
Connection: keep-alive
Content-Type: application/fhir+json
~~~

**Response**

200 OK

Response Headers
~~~
Connection: keep-alive
Content-Location: http://wildfhir4.aegis.net/fhir4-0-1/Observation?patient=Patient%2Fexample&category=sdoh
Content-Type: application/fhir+json;charset=utf-8
Content-Length: 4112
Date: Sun, 21 Nov 2021 03:15:18 GMT
~~~
Response Body
~~~
{
  "resourceType": "Bundle",
  "id": "158f4b97-5b3a-4363-81da-19d454a6df30",
  "meta": {
    "versionId": "1",
    "lastUpdated": "2021-11-20T22:15:18.726-05:00"
  },
  "type": "searchset",
  "total": 1,
  "link": [
    {
      "relation": "self",
      "url": "http://wildfhir4.aegis.net/fhir4-0-1/Observation?patient=Patient%2Fexample&category=sdoh"
    }
  ],
  "entry": [
    {
      "fullUrl": "http://wildfhir4.aegis.net/fhir4-0-1/Observation/hunger-question-example",
      "resource": {
        "resourceType": "Observation",
        "id": "hunger-question-example",
        "meta": {
          "extension": [
            {
              "url": "http://hl7.org/fhir/StructureDefinition/instance-name",
              "valueString": "Hunger Question Example"
            },
            {
              "url": "http://hl7.org/fhir/StructureDefinition/instance-description",
              "valueMarkdown": "This is a Hunger Question Example for the *US Core Screening Response Observation Profile*."
            }
          ],
          "versionId": "1",
          "lastUpdated": "2021-11-20T22:13:54.070-05:00",
          "profile": [
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-screening-response"
          ]
        },
        "text": {
          "status": "generated",
          "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>Generated Narrative with Details</b></p><p><b>meta</b>:       \n      </p><p><b>status</b>: FINAL      \n      </p><p><b>category</b>: SDOH         \n        <span style=\"background: LightGoldenRodYellow\">(Details : {LOINC code 'sdoh' = 'sdoh', given as 'SDOH'})</span>, Survey         \n        <span style=\"background: LightGoldenRodYellow\">(Details : {http://terminology.hl7.org/CodeSystem/observation-category code 'survey' = 'Survey', given as 'Survey'})</span></p><p><b>code</b>: Within the past 12 months we worried whether our food would run out before we got money to buy more [U.S. FSS]         \n        <span style=\"background: LightGoldenRodYellow\">(Details : {LOINC code '88122-7' = 'Within the past 12 months we worried whether our food would run out before we got money to buy more [U.S. FSS]', given as 'Within the past 12 months we worried whether our food would run out before we got money to buy more [U.S. FSS]'})</span></p><p><b>subject</b>:         \n        <a href=\"Patient/example\">Patient/example</a></p><p><b>effective</b>: Nov 12, 2021 8:59:15 PM      \n      </p><p><b>performer</b>:         \n        <a href=\"Patient/example\">Patient/example</a></p><p><b>value</b>: Often true         \n        <span style=\"background: LightGoldenRodYellow\">(Details : {LOINC code 'LA28397-0' = 'Often true', given as 'Often true'})</span></p><p><b>derivedFrom</b>: Hunger Vital Signs Questionnaire      \n      </p></div>"
        },
        "status": "final",
        "category": [
          {
            "coding": [
              {
                "system": "http://loinc.org",
                "code": "sdoh",
                "display": "SDOH"
              }
            ]
          },
          {
            "coding": [
              {
                "system": "http://terminology.hl7.org/CodeSystem/observation-category",
                "code": "survey",
                "display": "Survey"
              }
            ]
          }
        ],
        "code": {
          "coding": [
            {
              "system": "http://loinc.org",
              "code": "88122-7",
              "display": "Within the past 12 months we worried whether our food would run out before we got money to buy more [U.S. FSS]"
            }
          ]
        },
        "subject": {
          "reference": "Patient/example"
        },
        "effectiveDateTime": "2021-11-12T17:59:15-08:00",
        "performer": [
          {
            "reference": "Patient/example"
          }
        ],
        "valueCodeableConcept": {
          "coding": [
            {
              "system": "http://loinc.org",
              "code": "LA28397-0",
              "display": "Often true"
            }
          ]
        },
        "derivedFrom": [
          {
            "display": "Hunger Vital Signs Questionnaire"
          }
        ]
      },
      "search": {
        "mode": "match",
        "score": 1
      }
    }
  ]
}
~~~
