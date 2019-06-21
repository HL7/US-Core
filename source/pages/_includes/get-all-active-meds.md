
**Storyboard for this example**

The following example is based upon the following scenario:

Patient Brian Z uses an App to request all his medications from a single provider, Dr Cayr. This test scenario exercises a mix of routine meds, unusual schedule meds and as-needed meds. All meds are in the outpatient setting only.

Provider A's (Dr Cayr) medication records for Patient Brian Z

Item|Date|Script|Source|Notes
---|---|---|---|---
1 | 9/12/2016 | testosterone cypionate 100mg/ml inj  1ml intramuscularly every 3 weeks | Reported by Patient |  Get at doctor's office every third Friday. Taking for energy level and drive.
2 | 9/1/2016 | testosterone cypionate 100mg/ml inj  1ml intramuscularly  | Reported by Dr Cryn | completed
3 | 1/15/2016 | Zocor (simvastatin) 40mg by mouth once daily | Dr. Cayr Order: BMC |patient med status: taking
4 | 7/1/2015 | Humulin R (insulin regular, human) U100 10U every AM, 5U every PM, 5U at bedtime. |Dr.Cayr Order:BMC | patient med status: taking
5 | 6/12/2015  | simvastatin 30mg by mouth once daily  | Dr. Cayr Order: BMC  | patient med status: completed
{: .grid}

**Request:**

Get “all active medications” for a patient by querying MedicationRequest using the patient and status= "active" search parameters.


    GET [base]/MedicationRequest?patient=test2&intent=order&status=active

**Response:**

A Server returns a search Bundle resource containing all the MedicationRequests with a status of "active" for the patient Brian Z


    HTTP/1.1 200 OK
    [other headers]
    {
    "resourceType" : "Bundle",
    "id" : "get-all-meds",
    "meta" : {
      "lastUpdated" : "2017-03-28T14:29:23Z"
    },
    "type" : "searchset",
    "total" : 3,
    "entry" : [
      {
        "fullUrl" : "http://test.fhir.org/r4/MedicationRequest/derivedfrom-mr-test2-1",
        "resource" : {
          "resourceType" : "MedicationRequest",
          "id" : "mr-example-1",
    ...snip...
          "status" : "active",
          "medicationCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://www.nlm.nih.gov/research/umls/rxnorm",
                "code" : "104491",
                "display" : "Simvastatin 20 MG Oral Tablet [Zocor]",
                "userSelected" : false
              }
            ],
            "text" : "Zocor (simvastatin) 20mg Tablet"
          },
    ...snip...
      },
      {
        "fullUrl" : "http://test.fhir.org/r4/MedicationRequest/derivedfrom-mr-test2-2",
        "resource" : {
          "resourceType" : "MedicationRequest",
          "id" : "mr-example-2",
    ...snip...
          "status" : "active",
          "medicationCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://www.nlm.nih.gov/research/umls/rxnorm",
                "code" : "311036",
                "display" : "Humulin R (insulin regular, human) U100  100units/ml inj solution",
                "userSelected" : false
              }
            ],
            "text" : "Humulin R (insulin regular, human) U100  100units/ml inj solution"
          },
    ...snip...
      },
      {
        "fullUrl" : "http://test.fhir.org/r4/MedicationRequest/test2-2",
        "resource" : {
          "resourceType" : "MedicationRequest",
          "id" : "mr-example-5",
    ...snip...
          "status" : "active",
          "medicationCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://www.nlm.nih.gov/research/umls/rxnorm",
                "code" : "835829",
                "display" : "testosterone cypionate 100 MG/ML Injectable Solution",
                "userSelected" : false
              }
            ],
            "text" : "testosterone cypionate 100mg/ml inj"
          },
    ...snip...
        }
      }
     ]
    }
