
**Request:**

Get “all allergies” for a patient and all corresponding Provenance records.


    GET [base]/AllergyIntolerance?patient=123459988&_revinclude=Provenance:target

**Response:**

A Server returns a search Bundle resource containing all the Allergies for the patient and corresponding Provenance records.


    HTTP/1.1 200 OK
    [other headers]

    {
    "resourceType": "Bundle",
    "id": "94d5d5ac-6645-41dc-8282-1870b71e840a",
    "meta": {
        "lastUpdated": "2019-07-20T18:49:01.235+00:00"
    },
    "type": "searchset",
    "total": 1,
    "link": [
        {
            "relation": "self",
            "url": "http://hapi.fhir.org/baseR4/AllergyIntolerance?patient=Examples9988&_revinclude=Provenance:target"
        }
    ],
    "entry": [
        {
            "fullUrl": "http://hapi.fhir.org/baseR4/AllergyIntolerance/796139988",
            "resource": {
                "resourceType": "AllergyIntolerance",
                "id": "796139988",
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
                                        "system": "http://snomed.info/sct",
                                        "code": "247472004",
                                        "display": "Hives"
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
            "fullUrl": "http://hapi.fhir.org/baseR4/Provenance/796149988",
            "resource": {
                "resourceType": "Provenance",
                "id": "796149988",
                "meta": {
                    "versionId": "1",
                    "lastUpdated": "2019-07-09T15:26:23.217+00:00",
                    "profile": [
                       "http://hl7.org/fhir/us/core/StructureDefinition/us-core-provenance"
                    ]
                },
                "target": [
                     {
                        "reference": "AllergyIntolerance/796139988"
                    }
                ],
             "recorded": "2019-05-15T15:26:23.217+00:00",
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
                                "reference": "Practitioner/dr-reconciled-123459988"
                        },
                        "onBehalfOf": {
                                "reference": "Organization/future-health-543219988"
                        }
                    }
                ]},
            "search": {
                "mode": "include"
            }
        }
    ]
}
