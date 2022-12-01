
<!-- includes/docref-example2 -->
<!-- Example 2: Request Procedure Notes and Discharge Summaries for 2019 -->


** Request Procedure Notes and Discharge Summaries for 2019 using `POST` syntax**

`POST [base]/DocumentReference/$docref}`

**POST request body:**

~~~
{
    "resourceType": "Parameters",
    "id": "get-docs",
    "parameter": [
        {
            "name": "patient",
            "valueId": "123"
        },
        {
            "name": "start",
            "valueDateTime": "2019-01-01"
        },
        {
            "name": "end",
            "valueDateTime": "2019-12-31"
        },
        {
            "name": "type",
            "valueCoding": {
                "system": "http://terminology.hl7.org/CodeSystem/c80-doc-typecodes",
                "code": "18842-5",
                "display": "Discharge summary"
            }
        },
        {
            "name": "type",
            "valueCoding": {
                "system": "http://terminology.hl7.org/CodeSystem/c80-doc-typecodes",
                "code": "28570-0",
                "display": "Procedures Note"
            }
        },
        {
            "name": "on-demand",
            "valueBoolean": true
        }
    ]
}
~~~

**Response**

~~~
HTTP/1.1 200 OK
[other headers]
~~~

**Response body**

~~~
{
    "resourceType": "Bundle",
    "id": "get-docs-response",
    "type": "searchset",
    "total": 3,
    "entry": [
        {
            "fullUrl": "http://server/path/DocumentReference/procedure-note123",
            "resource": {
                "resourceType": "DocumentReference",
                "id": "procedure-note123",
                "meta": {
                    "profile": [
                        "http://hl7.org/fhir/us/core/StructureDefinition/us-core-documentreference"
                    ]
                },
                "identifier": [
                    {
                        "system": "urn:ietf:rfc:3986",
                        "value": "urn:oid:2.16.840.1.113883.19.5.99999.1"
                    }
                ],
                "status": "current",
                "category": [
                    {
                        "coding": [
                            {
                                "system": "http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category",
                                "code": "clinical-note",
                                "display": "Clinical Note"
                            }
                        ],
                        "text": "Clinical Note"
                    }
                ],
                "type": {
                    "coding": [
                        {
                            "system": "http://loinc.org",
                            "code": "28570-0",
                            "display": "Procedure Note"
                        }
                    ],
                    "text": "Procedure Note"
                },
                "subject": {
                    "reference": "Patient/example",
                    "display": "Amy Shaw"
                },
                "date": "2022-11-18T20:45:05Z",
                "author": [
                    {
                        "reference": "Practitioner/practitioner-1",
                        "display": "Ronald Bone, MD"
                    }
                ],
                "description": "Ureteroscopy",
                "content": [
                    {
                        "attachment": {
                            "contentType": "application/pdf",
                            "url": "/Binary/procedure-note123.pdf"
                        }
                    }
                ],
                "context": {
                    "period": {
                        "start": "2019-03-01",
                        "end": "2019-03-02"
                    }
                }
            }
        },
        {
            "fullUrl": "http://server/path/DocumentReference/procedure-note456",
            "resource": {
                "resourceType": "DocumentReference",
                "id": "procedure-note456",
                "meta": {
                    "profile": [
                        "http://hl7.org/fhir/us/core/StructureDefinition/us-core-documentreference"
                    ]
                },
                "status": "current",
                "type": {
                    "coding": [
                        {
                            "system": "http://loinc.org",
                            "code": "28570-0",
                            "display": "Procedure Note"
                        }
                    ],
                    "text": "Procedure Note"
                },
                "category": [
                    {
                        "coding": [
                            {
                                "system": "http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category",
                                "code": "clinical-note",
                                "display": "Clinical Note"
                            }
                        ],
                        "text": "Clinical Note"
                    }
                ],
                "subject": {
                    "reference": "Patient/example",
                    "display": "Amy Shaw"
                },
                "date": "2022-11-18T20:45:05Z",
                "author": [
                    {
                        "reference": "Practitioner/practitioner-1",
                        "display": "Ronald Bone, MD"
                    }
                ],
                "description": "Ureteroscopy",
                "content": [
                    {
                        "attachment": {
                            "contentType": "application/pdf",
                            "url": "/Binary/procedure-note456.pdf"
                        }
                    }
                ],
                "context": {
                    "period": {
                        "start": "2019-06-01",
                        "end": "2019-06-01"
                    }
                }
            }
        },
        {
            "fullUrl": "http://server/path/DocumentReference/discharge-summary789",
            "resource": {
                "resourceType": "DocumentReference",
                "id": "discharge",
                "meta": {
                    "profile": [
                        "http://hl7.org/fhir/us/core/StructureDefinition/us-core-documentreference"
                    ]
                },
                "status": "current",
                "type": {
                    "coding": [
                        {
                            "system": "http://loinc.org",
                            "code": "18842-5",
                            "display": "Discharge Summary"
                        }
                    ],
                    "text": "Discharge Summary"
                },
                "category": [
                    {
                        "coding": [
                            {
                                "system": "http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category",
                                "code": "clinical-note",
                                "display": "Clinical Note"
                            }
                        ],
                        "text": "Clinical Note"
                    }
                ],
                "subject": {
                    "reference": "Patient/example",
                    "display": "Amy Shaw"
                },
                "date": "2022-11-18T20:45:05Z",
                "author": [
                    {
                        "reference": "Practitioner/practitioner-1",
                        "display": "Ronald Bone, MD"
                    }
                ],
                "description": "Ureteroscopy",
                "content": [
                    {
                        "attachment": {
                            "contentType": "application/pdf",
                            "url": "/Binary/discharge-summary789.pdf"
                        }
                    }
                ],
                "context": {
                    "period": {
                        "start": "2019-03-01",
                        "end": "2019-03-03"
                    }
                }
            }
        }
    ]
}
~~~
