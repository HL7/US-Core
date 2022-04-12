{
    "resourceType": "Bundle",
    "id": "1f8a772f-1a54-4ef7-8bf6-7e27325ca4",
    "meta": {
        "lastUpdated": "2022-04-12T01:01:49.419Z"
    },
    "type": "searchset",
    "total": 3,
    "link": [
        {
            "relation": "self",
            "url": "http://test.fhir.org/r4/MedicationRequest?_format=application/fhir+json&search-id=667926e8-efa6-427e-b801-73c66b1789&&patient=test2&intent=order,plan&status=active&_sort=_id"
        }
    ],
    "entry": [
        {
            "fullUrl": "http://test.fhir.org/r4/MedicationRequest/269",
            "resource": {
                "resourceType": "MedicationRequest",
                "id": "269",
                "meta": {
                    "versionId": "3",
                    "lastUpdated": "2022-04-12T01:01:29.279Z",
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
                    "versionId": "2",
                    "lastUpdated": "2022-04-12T01:01:29.498Z",
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
                    "versionId": "2",
                    "lastUpdated": "2022-04-12T01:01:29.795Z",
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
        }
    ]
}
