
**Storyboard for this example**

This example is based upon the following scenario.

Patient Brain Z has presented with the same condition (pneumonia) as in a previous inpatient encounter. Provider A (Dr Cayr) uses a desktop or mobile application to request all the medications from this previous inpatient encounter (Encounter A).

 Medication records for Patient Brian Z during Encounter A

Item|Date|Script|Source|Notes
---|---|---|---|---
1 | 9/10/2016 - 9/12-2016| Cefatoxime 1gm intravenously every 6 hours | Provider B's Order |  Administered in hospital
2 | 9/10/2016 - 9/12-2016| Zithromax  (azithromycin) 500 MG in 250 ml Normal Saline intravenous infusion over 1hr daily | Provider B's Order |  Administered in hospital
3 | 9/10/2016 - 9/12-2016| Ketorolac 15 mg intravenously every 6 hours | Provider B's Order |  Administered in hospital
2 | 9/10/2016 - 9/12-2016| LRS Solution 200 ml/hr intravenously CRI | Provider B's Order | Administered in hospital
5 | 9/12/2016  | Amoxicillin 500mg by mouth every 6 hours for 10 days | Provider B's Order | discharge prescription, patient reported did not comply (fill prescription)
6 | 9/12/2016  | Zithromax (azithromycin) 250mg by mouth every 12 hours for 10 days | Provider B's Order | discharge prescription, patient reported did not comply (fill prescription)
{: .grid}


**Request:**

Get “all medications” for a patient inpatient encounter by querying MedicationRequest using the patient and encounter search parameters.


    GET [base]/MedicationRequest?patient=test2&intent=order,plan&encounter=A

**Response:**

A Server returns a search Bundle resource containing all the MedicationRequests for the patient Brian Z during inpatient Encounter A:


    HTTP/1.1 200 OK
    [other headers]
    "id": "get-encounter-meds",
    "meta": {
      "versionId": "1",
      "lastUpdated": "2017-04-10T12:49:37.665-04:00"
    },
    "type": "searchset",
    "total": 6,
     ...snip...
     "entry": [
       {
         "fullUrl": "http://test.fhir.org/r4/MedicationRequest/derivedfrom-mr-enca-1",
         "resource": {
           "resourceType": "MedicationRequest",
           "id": "mr-example-6",
      ...snip...
      },
      "encounter": {
        "reference": "Encounter/A",
        "display": "Inpatient Encounter A"
      },
      "status": "completed",
      "intent": "order",
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
      ...snip...
      "fullUrl": "http://test.fhir.org/r4/MedicationRequest/derivedfrom-mr-enca-2",
      "resource": {
        "resourceType": "MedicationRequest",
        "id": "mr-example-7",
        ...snip...
        },
        "encounter": {
          "reference": "Encounter/A",
          "display": "Inpatient Encounter A"
        },
        "status": "completed",
          "intent": "order",
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
        ...snip...
        "fullUrl": "http://test.fhir.org/r4/MedicationRequest/derivedfrom-mr-enca-3",
        "resource": {
          "resourceType": "MedicationRequest",
          "id": "mr-example-8",
          ...snip...
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
              ...snip...
              },
            "encounter": {
              "reference": "Encounter/A",
              "display": "Inpatient Encounter A"
            },
            "status": "completed",
            "intent": "order",
            "medicationReference": {
                "reference": "#med-1"
              },
              ...snip...
          "fullUrl": "http://test.fhir.org/r4/MedicationRequest/derivedfrom-mr-enca-4",
          "resource": {
            "resourceType": "MedicationRequest",
            "id": "mr-example-9",
          ...snip...
          "encounter": {
            "reference": "Encounter/A",
            "display": "Inpatient Encounter A"
          },
          "status": "completed",
          "intent": "order",
          "medicationCodeableConcept": {
            "coding": [
              {
                "system": "http://www.nlm.nih.gov/research/umls/rxnorm",
                "code": "847626",
                "display": "Calcium Chloride 0.0014 MEQ/ML / Potassium Chloride 0.024 MEQ/ML / Sodium Chloride 0.103 MEQ/ML / Sodium Lactate 0.028 MEQ/ML Injectable Solution"
              }
            ],
            "text": "LRS"
            ...snip...
          "fullUrl": "http://test.fhir.org/r4/MedicationRequest/derivedfrom-mr-enca-5",
          "resource": {
            "resourceType": "MedicationRequest",
            "id": "mr-example-10",
          ...snip...
          "encounter": {
            "reference": "Encounter/A",
            "display": "Inpatient Encounter A"
          },
          "status": "active",
          "intent": "order",
          "medicationCodeableConcept": {
            "coding": [
              {
                "system": "http://www.nlm.nih.gov/research/umls/rxnorm",
                "code": "212446",
                "display": "Zithromax 250 MG Oral Tablet"
              }
            ],
            "text": "Zithromax 500 MG Oral Tablet"
            ...snip...
          "fullUrl": "http://test.fhir.org/r4/MedicationRequest/derivedfrom-mr-enca-6",
          "resource": {
            "resourceType": "MedicationRequest",
            "id": "mr-example-11",
          ...snip...
          },
          "encounter": {
            "reference": "Encounter/A",
            "display": "Inpatient Encounter A"
          },
          "status": "active",
          "intent": "order",
          "medicationCodeableConcept": {
            "coding": [
              {
                "system": "http://www.nlm.nih.gov/research/umls/rxnorm",
                "code": "308191",
                "display": "Amoxicillin 500 MG Oral Capsule"
              }
            ],
            "text": "Amoxicillin 500 MG"

     ]
    }
