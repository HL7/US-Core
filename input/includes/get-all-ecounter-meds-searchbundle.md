{
  "resourceType": "Bundle",
  "id": "bb33a47a-cab8-4b4b-ba2e-3b663ffb98",
  "meta": {
    "lastUpdated": "2022-04-12T01:55:49.093Z"
  },
  "type": "searchset",
  "total": 6,
  "link": [
    {
      "relation": "self",
      "url": "http://test.fhir.org/r4/MedicationRequest?_format=application/fhir+json&search-id=3f726452-7d24-4740-86f8-9c4a8f993a&&patient=test2&intent=order,plan&encounter=inpatient-example&_sort=_id"
    }
  ],
  "entry": [
    {
      "fullUrl": "http://test.fhir.org/r4/MedicationRequest/0e2dda71-7122-4840-9252-17c84a0d50",
      "resource": {
        "resourceType": "MedicationRequest",
        "id": "0e2dda71-7122-4840-9252-17c84a0d50",
        "meta": {
          "versionId": "4",
          "lastUpdated": "2022-04-12T01:54:45.483Z",
          "profile": [
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-medicationrequest"
          ],
          "tag": [
            {
              "code": "US_Core_5"
            },
            {
              "code": "Inpatient"
            }
          ]
        },
        "contained": [
          {
            "resourceType": "Medication",
            "id": "med-1",
            "meta": {
              "profile": [
                "http://hl7.org/fhir/us/core/StructureDefinition/us-core-medication"
              ]
            },
            "code": {
              "text": "Azithromycin 500mg in 250 ml Normal Saline"
            },
            "ingredient": [
              {
                "itemCodeableConcept": {
                  "coding": [
                    {
                      "system": "http://www.nlm.nih.gov/research/umls/rxnorm",
                      "code": "1668240",
                      "display": "Zithromax 500 MG Injection"
                    }
                  ],
                  "text": "Zithromax (azithromycin) 500 MG Injection"
                },
                "isActive": true
              },
              {
                "itemCodeableConcept": {
                  "coding": [
                    {
                      "system": "http://www.nlm.nih.gov/research/umls/rxnorm",
                      "code": "313002",
                      "display": "Sodium Chloride 0.9% injectable solution"
                    }
                  ],
                  "text": "Normal Saline"
                },
                "isActive": true
              }
            ]
          }
        ],
        "status": "active",
        "intent": "order",
        "category": [
          {
            "coding": [
              {
                "system": "http://terminology.hl7.org/CodeSystem/medicationrequest-category",
                "code": "inpatient",
                "display": "Inpatient"
              }
            ],
            "text": "Inpatient"
          }
        ],
        "reportedBoolean": false,
        "medicationReference": {
          "reference": "#med-1"
        },
        "subject": {
          "reference": "Patient/test2",
          "display": "Brian Z"
        },
        "encounter": {
          "reference": "Encounter/inpatient-example",
          "display": "Inpatient encounter"
        },
        "authoredOn": "2016-09-12",
        "requester": {
          "reference": "Practitioner/example-drb",
          "display": "Dr B"
        },
        "reasonCode": [
          {
            "coding": [
              {
                "system": "http://snomed.info/sct",
                "code": "233604007",
                "display": "Pneumonia (disorder)"
              }
            ]
          }
        ],
        "dosageInstruction": [
          {
            "sequence": 1,
            "text": "Azithromycin 500mg in 250 ml Normal Saline intravenously over 1hour every 24 hours",
            "timing": {
              "repeat": {
                "duration": 1,
                "durationUnit": "h",
                "frequency": 1,
                "period": 24,
                "periodUnit": "h"
              }
            },
            "asNeededBoolean": false,
            "route": {
              "coding": [
                {
                  "system": "http://ncimeta.nci.nih.gov",
                  "code": "C38276",
                  "display": "INTRAVENOUS"
                }
              ]
            },
            "method": {
              "text": "1 hr infusion"
            }
          }
        ]
      },
      "search": {
        "mode": "match"
      }
    },
    {
      "fullUrl": "http://test.fhir.org/r4/MedicationRequest/1e51d801-1cdf-4d61-9dc0-8937945a35",
      "resource": {
        "resourceType": "MedicationRequest",
        "id": "1e51d801-1cdf-4d61-9dc0-8937945a35",
        "meta": {
          "versionId": "4",
          "lastUpdated": "2022-04-12T01:54:45.608Z",
          "profile": [
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-medicationrequest"
          ],
          "tag": [
            {
              "code": "US_Core_5"
            },
            {
              "code": "Inpatient"
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
                "code": "inpatient",
                "display": "Inpatient"
              }
            ],
            "text": "Inpatient"
          }
        ],
        "reportedBoolean": false,
        "medicationCodeableConcept": {
          "coding": [
            {
              "system": "http://www.nlm.nih.gov/research/umls/rxnorm",
              "code": "212446",
              "display": "Zithromax 250 MG Oral Tablet"
            }
          ],
          "text": "Zithromax 500 MG Oral Tablet"
        },
        "subject": {
          "reference": "Patient/test2",
          "display": "Brian Z"
        },
        "encounter": {
          "reference": "Encounter/inpatient-example",
          "display": "Inpatient encounter"
        },
        "authoredOn": "2016-09-12",
        "requester": {
          "reference": "Practitioner/example-drb",
          "display": "Dr B"
        },
        "reasonCode": [
          {
            "coding": [
              {
                "system": "http://snomed.info/sct",
                "code": "233604007",
                "display": "Pneumonia (disorder)"
              }
            ]
          }
        ],
        "dosageInstruction": [
          {
            "sequence": 1,
            "text": "Zithromax (azithromycin) 250mg by mouth every 12 hours for 10 days",
            "additionalInstruction": [
              {
                "coding": [
                  {
                    "system": "http://snomed.info/sct",
                    "code": "311504000",
                    "display": "With or after food"
                  }
                ]
              }
            ],
            "timing": {
              "repeat": {
                "frequency": 1,
                "period": 12,
                "periodUnit": "h"
              }
            },
            "route": {
              "coding": [
                {
                  "system": "http://ncimeta.nci.nih.gov",
                  "code": "C38288",
                  "display": "ORALLY",
                  "userSelected": false
                }
              ]
            }
          }
        ],
        "dispenseRequest": {
          "validityPeriod": {
            "start": "2016-09-12",
            "end": "2016-10-12"
          },
          "quantity": {
            "value": 20,
            "unit": "TAB",
            "system": "http://hl7.org/fhir/v3/orderableDrugForm",
            "code": "TAB"
          },
          "expectedSupplyDuration": {
            "value": 10,
            "unit": "days",
            "system": "http://unitsofmeasure.org",
            "code": "d"
          }
        }
      },
      "search": {
        "mode": "match"
      }
    },
    {
      "fullUrl": "http://test.fhir.org/r4/MedicationRequest/4362b3f0-37bc-4463-93b3-c6b8228d91",
      "resource": {
        "resourceType": "MedicationRequest",
        "id": "4362b3f0-37bc-4463-93b3-c6b8228d91",
        "meta": {
          "versionId": "4",
          "lastUpdated": "2022-04-12T01:54:45.671Z",
          "profile": [
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-medicationrequest"
          ],
          "tag": [
            {
              "code": "US_Core_5"
            },
            {
              "code": "Inpatient"
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
                "code": "inpatient",
                "display": "Inpatient"
              }
            ],
            "text": "Inpatient"
          }
        ],
        "reportedBoolean": false,
        "medicationCodeableConcept": {
          "coding": [
            {
              "system": "http://www.nlm.nih.gov/research/umls/rxnorm",
              "code": "308191",
              "display": "Amoxicillin 500 MG Oral Capsule"
            }
          ],
          "text": "Amoxicillin 500 MG"
        },
        "subject": {
          "reference": "Patient/test2",
          "display": "Brian Z"
        },
        "encounter": {
          "reference": "Encounter/inpatient-example",
          "display": "Inpatient encounter"
        },
        "authoredOn": "2016-09-12",
        "requester": {
          "reference": "Practitioner/example-drb",
          "display": "Dr B"
        },
        "reasonCode": [
          {
            "coding": [
              {
                "system": "http://snomed.info/sct",
                "code": "233604007",
                "display": "Pneumonia (disorder)"
              }
            ]
          }
        ],
        "dosageInstruction": [
          {
            "sequence": 1,
            "text": "Amoxicillin 500mg by mouth every 6 hours for 10 days",
            "additionalInstruction": [
              {
                "coding": [
                  {
                    "system": "http://snomed.info/sct",
                    "code": "311504000",
                    "display": "With or after food"
                  }
                ]
              }
            ],
            "timing": {
              "repeat": {
                "frequency": 1,
                "period": 6,
                "periodUnit": "h"
              }
            },
            "route": {
              "coding": [
                {
                  "system": "http://ncimeta.nci.nih.gov",
                  "code": "C38288",
                  "display": "ORALLY",
                  "userSelected": false
                }
              ]
            }
          }
        ],
        "dispenseRequest": {
          "validityPeriod": {
            "start": "2016-09-12",
            "end": "2016-10-12"
          },
          "numberOfRepeatsAllowed": 0,
          "quantity": {
            "value": 40,
            "unit": "Oral Capsule",
            "system": "http://hl7.org/fhir/v3/orderableDrugForm",
            "code": "ORCAP"
          },
          "expectedSupplyDuration": {
            "value": 10,
            "unit": "days",
            "system": "http://unitsofmeasure.org",
            "code": "d"
          }
        }
      },
      "search": {
        "mode": "match"
      }
    },
    {
      "fullUrl": "http://test.fhir.org/r4/MedicationRequest/5996de24-bb15-44d5-ad5e-e942090123",
      "resource": {
        "resourceType": "MedicationRequest",
        "id": "5996de24-bb15-44d5-ad5e-e942090123",
        "meta": {
          "versionId": "4",
          "lastUpdated": "2022-04-12T01:54:45.765Z",
          "profile": [
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-medicationrequest"
          ],
          "tag": [
            {
              "code": "US_Core_5"
            },
            {
              "code": "Inpatient"
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
                "code": "inpatient",
                "display": "Inpatient"
              }
            ],
            "text": "Inpatient"
          }
        ],
        "reportedBoolean": false,
        "medicationCodeableConcept": {
          "coding": [
            {
              "system": "http://www.nlm.nih.gov/research/umls/rxnorm",
              "code": "860601",
              "display": "Calcium Chloride 0.0014 MEQ/ML / Potassium Chloride 0.024 MEQ/ML / Sodium Chloride 0.103 MEQ/ML / Sodium Lactate 0.028 MEQ/ML Injectable Solution"
            }
          ],
          "text": "LRS"
        },
        "subject": {
          "reference": "Patient/test2",
          "display": "Brian Z"
        },
        "encounter": {
          "reference": "Encounter/inpatient-example",
          "display": "Inpatient encounter"
        },
        "authoredOn": "2016-09-12",
        "requester": {
          "reference": "Practitioner/example-drb",
          "display": "Dr B"
        },
        "reasonCode": [
          {
            "coding": [
              {
                "system": "http://snomed.info/sct",
                "code": "233604007",
                "display": "Pneumonia (disorder)"
              }
            ]
          }
        ],
        "dosageInstruction": [
          {
            "sequence": 1,
            "text": "LRS IV at 250 ml/hr",
            "asNeededBoolean": false,
            "route": {
              "coding": [
                {
                  "system": "http://ncimeta.nci.nih.gov",
                  "code": "C38276",
                  "display": "INTRAVENOUS",
                  "userSelected": false
                }
              ]
            },
            "method": {
              "text": "Constant Rate Infusion"
            }
          }
        ]
      },
      "search": {
        "mode": "match"
      }
    },
    {
      "fullUrl": "http://test.fhir.org/r4/MedicationRequest/bb95536c-eca6-4f31-af6e-821c3bc9d3",
      "resource": {
        "resourceType": "MedicationRequest",
        "id": "bb95536c-eca6-4f31-af6e-821c3bc9d3",
        "meta": {
          "versionId": "4",
          "lastUpdated": "2022-04-12T01:54:45.811Z",
          "profile": [
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-medicationrequest"
          ],
          "tag": [
            {
              "code": "US_Core_5"
            },
            {
              "code": "Inpatient"
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
                "code": "inpatient",
                "display": "Inpatient"
              }
            ],
            "text": "Inpatient"
          }
        ],
        "reportedBoolean": false,
        "medicationCodeableConcept": {
          "coding": [
            {
              "system": "http://www.nlm.nih.gov/research/umls/rxnorm",
              "code": "1656313",
              "display": "Cefotaxime 1000 MG Injection"
            }
          ],
          "text": "Cefotaxime 1000Mg Powder For Solution For Injection"
        },
        "subject": {
          "reference": "Patient/test2",
          "display": "Brian Z"
        },
        "encounter": {
          "reference": "Encounter/inpatient-example",
          "display": "Inpatient encounter"
        },
        "authoredOn": "2016-09-12",
        "requester": {
          "reference": "Practitioner/example-drcayr",
          "display": "Dr Cayr"
        },
        "reasonCode": [
          {
            "coding": [
              {
                "system": "http://snomed.info/sct",
                "code": "233604007",
                "display": "Pneumonia (disorder)"
              }
            ]
          }
        ],
        "dosageInstruction": [
          {
            "sequence": 1,
            "text": "Cefatoxime 1gm intravenously every 6 hours",
            "timing": {
              "repeat": {
                "frequency": 1,
                "period": 6,
                "periodUnit": "h"
              }
            },
            "asNeededBoolean": false,
            "route": {
              "coding": [
                {
                  "system": "http://ncimeta.nci.nih.gov",
                  "code": "C38276",
                  "display": "INTRAVENOUS",
                  "userSelected": false
                }
              ]
            },
            "method": {
              "text": "Slow Push"
            }
          }
        ]
      },
      "search": {
        "mode": "match"
      }
    },
    {
      "fullUrl": "http://test.fhir.org/r4/MedicationRequest/e5fb50da-bff9-414a-a229-68b431c489",
      "resource": {
        "resourceType": "MedicationRequest",
        "id": "e5fb50da-bff9-414a-a229-68b431c489",
        "meta": {
          "versionId": "4",
          "lastUpdated": "2022-04-12T01:54:45.858Z",
          "profile": [
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-medicationrequest"
          ],
          "tag": [
            {
              "code": "US_Core_5"
            },
            {
              "code": "Inpatient"
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
                "code": "inpatient",
                "display": "Inpatient"
              }
            ],
            "text": "Inpatient"
          }
        ],
        "reportedBoolean": false,
        "medicationCodeableConcept": {
          "coding": [
            {
              "system": "http://www.nlm.nih.gov/research/umls/rxnorm",
              "code": "860092",
              "display": "1 ML Ketorolac Tromethamine 15 MG/ML Injection"
            }
          ],
          "text": "Ketorolac Tromethamine 15 MG/ML For Injection"
        },
        "subject": {
          "reference": "Patient/test2",
          "display": "Brian Z"
        },
        "encounter": {
          "reference": "Encounter/inpatient-example",
          "display": "Inpatient encounter"
        },
        "authoredOn": "2016-09-12",
        "requester": {
          "reference": "Practitioner/example-drb",
          "display": "Dr B"
        },
        "reasonCode": [
          {
            "coding": [
              {
                "system": "http://snomed.info/sct",
                "code": "233604007",
                "display": "Pneumonia (disorder)"
              }
            ]
          }
        ],
        "dosageInstruction": [
          {
            "sequence": 1,
            "text": "Ketoralac 15mg every six hours",
            "timing": {
              "repeat": {
                "frequency": 1,
                "period": 6,
                "periodUnit": "h"
              }
            },
            "asNeededBoolean": false,
            "route": {
              "coding": [
                {
                  "system": "http://ncimeta.nci.nih.gov",
                  "code": "C38276",
                  "display": "INTRAVENOUS",
                  "userSelected": false
                }
              ]
            },
            "method": {
              "text": "Slow Push"
            }
          }
        ]
      },
      "search": {
        "mode": "match"
      }
    }
  ]
}
