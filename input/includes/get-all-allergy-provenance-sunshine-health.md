
**Request:**

Get “all allergies” for a patient and all corresponding Provenance records.


    GET [base]/AllergyIntolerance?patient=1234599&_revinclude=Provenance:target

**Response:**

A Server returns a search Bundle resource containing all the Allergies for the patient and corresponding Provenance records.


    HTTP/1.1 200 OK
    [other headers]

    {
    "resourceType": "Bundle",
    "id": "c887e62f-6166-419f-8268-b5ecd6c7b901",
    "meta": {
        "lastUpdated": "2019-07-09T18:49:01.235+00:00"
    },
    "type": "searchset",
    "total": 1,
    "link": [
        {
            "relation": "self",
            "url": "http://hapi.fhir.org/baseR4/AllergyIntolerance?patient=Examples99&_revinclude=Provenance:target"
        }
    ],
    "entry": [
        {
            "fullUrl": "http://hapi.fhir.org/baseR4/AllergyIntolerance/7961399",
            "resource": {
                "resourceType": "AllergyIntolerance",
                "id": "7961399",
                "meta": {
                    "versionId": "1",
                    "lastUpdated": "2019-07-09T15:26:23.217+00:00",
                    "profile": [
                       "http://hl7.org/fhir/us/core/StructureDefinition/us-core-allergyintolerance"
                    ]
                },
                "clinicalStatus": {
                    "coding": [
                        {
                            "system": "http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical",
                            "code": "active",
                            "display": "Active"
                        }
                    ]
                },
                "verificationStatus": {
                    "coding": [
                        {
                            "system": "http://terminology.hl7.org/CodeSystem/allergyintolerance-verification",
                            "code": "confirmed",
                            "display": "Confirmed"
                        }
                    ]
                },
                "code": {
                    "coding": [
                        {
                            "system": "http://snomed.info/sct",
                            "code": "762952008",
                            "display": "Peanuts"
                        }
                    ],
                    "text": "Peanuts"
                },
                "category": [
                    "medication"
                ],
                "criticality": "high",
                "patient": {
                    "reference": "Patient/example"
                },
                "onsetDateTime": "2017-09",
                "reaction": [
                    {
                        "manifestation": [
                            {
                                "coding": [
                                    {
                                        "system": "http://terminology.hl7.org/CodeSystem/v3-NullFlavor",
                                        "code": "UNK",
                                        "display": "Unknown"
                                    }
                                ]
                            }
                        ],
                        "onset": "2017-09"
                    }
                ]
            },
            "search": {
                "mode": "match"
            }
        },
        {
            "fullUrl": "http://hapi.fhir.org/baseR4/Provenance/7961499",
            "resource": {
                "resourceType": "Provenance",
                "id": "7961499",
                "meta": {
                    "versionId": "1",
                    "lastUpdated": "2019-07-09T15:26:23.217+00:00",
                    "profile": [
                       "http://hl7.org/fhir/us/core/StructureDefinition/us-core-provenance"
                    ]
                },
                "target": [
                     {
                        "reference": "AllergyIntolerance/7961399"
                    }
                ],
             "recorded": "2017-09T15:26:23.217+00:00",
             "agent": [
                    {
                        "type": [
                            {
                                "coding": [
                                    {
                                        "system": "http://terminology.hl7.org/CodeSystem/provenance-participant-type",
                                        "code": "author",
                                        "display": "Author"
                                    }
                                ]
                            }
                        ],
                        "who": {
                                "reference": "Practitioner/Dr-Smith-1234599"
                        },
                        "onBehalfOf": {
                                "reference": "Organization/sunshine-health-5432199"
                        }
                    }
                ]},
            "search": {
                "mode": "include"
            }
        }
    ]
}
