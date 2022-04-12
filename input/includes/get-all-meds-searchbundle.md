{
  "resourceType": "Bundle",
  "id": "f48e4a18-173b-4c82-8eeb-3e39daa59f",
  "meta": {
    "lastUpdated": "2022-04-12T00:01:27.106Z"
  },
  "type": "searchset",
  "total": 5,
  "link": [
    {
      "relation": "self",
      "url": "http://test.fhir.org/r4/MedicationRequest?_format=application/fhir+json&search-id=a27179f4-7471-44dd-b6f1-73ae7ef001&&patient=test2&intent=order,plan&_sort=_id"
    }
  ],
  "entry": [
    {
      "fullUrl": "http://test.fhir.org/r4/MedicationRequest/269",
      "resource": {
        "resourceType": "MedicationRequest",
        "id": "269",
        "meta": {
          "versionId": "2",
          "lastUpdated": "2022-04-11T23:29:16.906Z",
          "profile": [
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-medicationrequest"
          ],
          "tag": [
            {
              "code": "US_Core_5"
            },
            {
              "code": "US_Core_5_Example"
            }
          ]
        },
        "status": "active",
        "intent": "order",
        "category": [
          {
            "coding": [
              {
                "system": "http://terminology.hl7.org/CodeSystem/medicationrequest-category",
                "code": "outpatient",
                "display": "Outpatient"
              }
            ],
            "text": "Outpatient"
          }
        ],
        "reportedBoolean": false,
        "medicationCodeableConcept": {
          "coding": [
            {
              "system": "http://www.nlm.nih.gov/research/umls/rxnorm",
              "code": "104491",
              "display": "Simvastatin 20 MG Oral Tablet [Zocor]"
            }
          ],
          "text": "Zocor (simvastatin) 20mg Tablet"
        },
        "subject": {
          "reference": "Patient/test2",
          "display": "Brian Z"
        },
        "encounter": {
          "reference": "Encounter/outpatien-Example-1"
        },
        "authoredOn": "2016-01-15",
        "requester": {
          "reference": "Practitioner/practitioner-drcayr",
          "display": "Dr Cayr"
        },
        "reasonCode": [
          {
            "coding": [
              {
                "system": "http://snomed.info/sct",
                "code": "13644009",
                "display": "Hypercholesterolemia (disorder)"
              }
            ]
          }
        ],
        "dosageInstruction": [
          {
            "sequence": 1,
            "text": "40mg by mouth once daily",
            "asNeededBoolean": false,
            "route": {
              "coding": [
                {
                  "system": "http://ncimeta.nci.nih.gov",
                  "code": "C38288",
                  "display": "ORAL"
                }
              ]
            }
          }
        ],
        "dispenseRequest": {
          "numberOfRepeatsAllowed": 11,
          "quantity": {
            "value": 60,
            "unit": "tablets",
            "system": "http://hl7.org/fhir/v3/orderableDrugForm",
            "code": "TAB"
          }
        }
      },
      "search": {
        "mode": "match"
      }
    },
    {
      "fullUrl": "http://test.fhir.org/r4/MedicationRequest/270",
      "resource": {
        "resourceType": "MedicationRequest",
        "id": "270",
        "meta": {
          "versionId": "1",
          "lastUpdated": "2022-04-11T23:33:38.281Z",
          "profile": [
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-medicationrequest"
          ],
          "tag": [
            {
              "code": "US_Core_5"
            }
          ]
        },
        "text": {
          "status": "generated",
          "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>Generated Narrative with Details</b></p><p><b>meta</b>: </p><p><b>status</b>: active</p><p><b>intent</b>: order</p><p><b>category</b>: Outpatient <span style=\"background: LightGoldenRodYellow \">(Details : {http://terminology.hl7.org/CodeSystem/medicationrequest-category code \"outpatient\" := \"outpatient\", given as \"Outpatient\"})</span></p><p><b>reported</b>: false</p><p><b>medication</b>: Humulin R (insulin regular, human) U100  100units/ml inj solution <span style=\"background: LightGoldenRodYellow \">(Details : {RxNorm code \"311036\" := \"311036\", given as \"Humulin R (insulin regular, human) U100  100units/ml inj solution\"})</span></p><p><b>subject</b>: <a href=\"Patient/test2\">Brian Z</a></p><p><b>encounter</b>: <a href=\"Encounter/outpatient-example-2\">Encounter/outpatient-example-2</a></p><p><b>authoredOn</b>: 7/1/2015</p><p><b>requester</b>: </p><p><b>dosageInstruction</b>: </p></div>"
        },
        "status": "active",
        "intent": "order",
        "category": [
          {
            "coding": [
              {
                "system": "http://terminology.hl7.org/CodeSystem/medicationrequest-category",
                "code": "outpatient",
                "display": "Outpatient"
              }
            ],
            "text": "Outpatient"
          }
        ],
        "reportedBoolean": false,
        "medicationCodeableConcept": {
          "coding": [
            {
              "system": "http://www.nlm.nih.gov/research/umls/rxnorm",
              "code": "311036",
              "display": "Humulin R (insulin regular, human) U100  100units/ml inj solution"
            }
          ],
          "text": "Humulin R (insulin regular, human) U100  100units/ml inj solution"
        },
        "subject": {
          "reference": "Patient/test2",
          "display": "Brian Z"
        },
        "encounter": {
          "reference": "Encounter/outpatient-example-2"
        },
        "authoredOn": "2015-07-01",
        "requester": {
          "reference": "Practitioner/practitioner-drcayr",
          "display": "Dr Cayr"
        },
        "dosageInstruction": [
          {
            "sequence": 1,
            "text": "10U every AM, 5U every PM, 5U at bedtime",
            "asNeededBoolean": false,
            "route": {
              "coding": [
                {
                  "system": "http://snomed.info/sct",
                  "code": "34206005",
                  "display": "Subcutaneous route (qualifier value)"
                }
              ]
            }
          }
        ],
        "dispenseRequest": {
          "numberOfRepeatsAllowed": 11,
          "quantity": {
            "value": 40,
            "unit": "ml",
            "system": "http://unitsofmeasure.org",
            "code": "mL"
          }
        }
      },
      "search": {
        "mode": "match"
      }
    },
    {
      "fullUrl": "http://test.fhir.org/r4/MedicationRequest/271",
      "resource": {
        "resourceType": "MedicationRequest",
        "id": "271",
        "meta": {
          "versionId": "1",
          "lastUpdated": "2022-04-11T23:46:16.248Z",
          "profile": [
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-medicationrequest"
          ],
          "tag": [
            {
              "code": "US_Core_5"
            }
          ]
        },
        "status": "active",
        "intent": "plan",
        "category": [
          {
            "coding": [
              {
                "system": "http://terminology.hl7.org/CodeSystem/medicationrequest-category",
                "code": "outpatient",
                "display": "Outpatient"
              }
            ],
            "text": "Outpatient"
          }
        ],
        "reportedBoolean": false,
        "medicationCodeableConcept": {
          "coding": [
            {
              "system": "http://www.nlm.nih.gov/research/umls/rxnorm",
              "code": "835829",
              "display": "testosterone cypionate 100 MG/ML Injectable Solution"
            }
          ],
          "text": "testosterone cypionate 100mg/ml inj"
        },
        "subject": {
          "reference": "Patient/test2",
          "display": "Brian Z"
        },
        "encounter": {
          "reference": "Encounter/outpatient-example-3"
        },
        "authoredOn": "2016-09-12",
        "requester": {
          "reference": "Practitioner/practitioner-drcryn",
          "display": "Dr Cryn"
        },
        "reasonCode": [
          {
            "text": "Taking for energy level and drive."
          }
        ],
        "dosageInstruction": [
          {
            "sequence": 1,
            "text": "1ml intramuscularly every 3 weeks"
          }
        ]
      },
      "search": {
        "mode": "match"
      }
    },
    {
      "fullUrl": "http://test.fhir.org/r4/MedicationRequest/272",
      "resource": {
        "resourceType": "MedicationRequest",
        "id": "272",
        "meta": {
          "versionId": "1",
          "lastUpdated": "2022-04-11T23:49:12.951Z",
          "profile": [
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-medicationrequest"
          ],
          "tag": [
            {
              "code": "US_Core_5"
            }
          ]
        },
        "status": "completed",
        "intent": "order",
        "category": [
          {
            "coding": [
              {
                "system": "http://terminology.hl7.org/CodeSystem/medicationrequest-category",
                "code": "outpatient",
                "display": "Outpatient"
              }
            ],
            "text": "Outpatient"
          }
        ],
        "reportedBoolean": false,
        "medicationCodeableConcept": {
          "coding": [
            {
              "system": "http://www.nlm.nih.gov/research/umls/rxnorm",
              "code": "314231",
              "display": "Simvastatin 10 MG Oral Tablet"
            }
          ],
          "text": "simvastatin 10mg Tablet"
        },
        "subject": {
          "reference": "Patient/test2",
          "display": "Brian Z"
        },
        "authoredOn": "2015-06-12",
        "requester": {
          "reference": "Practitioner/practitioner-drcayr",
          "display": "Dr Cayr"
        },
        "reasonCode": [
          {
            "coding": [
              {
                "system": "http://snomed.info/sct",
                "code": "13644009",
                "display": "Hypercholesterolemia (disorder)"
              }
            ]
          }
        ],
        "dosageInstruction": [
          {
            "sequence": 1,
            "text": "30mg (3 tablets) by mouth once daily",
            "asNeededBoolean": false,
            "route": {
              "coding": [
                {
                  "system": "http://ncimeta.nci.nih.gov",
                  "code": "C38288",
                  "display": "ORAL"
                }
              ]
            }
          }
        ],
        "dispenseRequest": {
          "numberOfRepeatsAllowed": 6,
          "quantity": {
            "value": 90,
            "unit": "tablets",
            "system": "http://hl7.org/fhir/v3/orderableDrugForm",
            "code": "TAB"
          }
        }
      },
      "search": {
        "mode": "match"
      }
    },
    {
      "fullUrl": "http://test.fhir.org/r4/MedicationRequest/273",
      "resource": {
        "resourceType": "MedicationRequest",
        "id": "273",
        "meta": {
          "versionId": "1",
          "lastUpdated": "2022-04-11T23:57:17.715Z",
          "profile": [
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-medicationrequest"
          ],
          "tag": [
            {
              "code": "US_Core_5"
            }
          ]
        },
        "status": "completed",
        "intent": "plan",
        "category": [
          {
            "coding": [
              {
                "system": "http://terminology.hl7.org/CodeSystem/medicationrequest-category",
                "code": "outpatient",
                "display": "Outpatient"
              }
            ],
            "text": "Outpatient"
          }
        ],
        "reportedBoolean": false,
        "medicationCodeableConcept": {
          "coding": [
            {
              "system": "http://www.nlm.nih.gov/research/umls/rxnorm",
              "code": "835829",
              "display": "testosterone cypionate 100 MG/ML Injectable Solution"
            }
          ],
          "text": "testosterone cypionate 100mg/ml inj"
        },
        "subject": {
          "reference": "Patient/test2",
          "display": "Brian Z"
        },
        "authoredOn": "2016-09-01",
        "requester": {
          "reference": "Practitioner/practitioner-drcryn",
          "display": "Dr Cryn"
        },
        "reasonCode": [
          {
            "text": "Taking for energy level and drive."
          }
        ],
        "dosageInstruction": [
          {
            "sequence": 1,
            "text": "1ml intramuscularly"
          }
        ]
      },
      "search": {
        "mode": "match"
      }
    }
  ]
}
