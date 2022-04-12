
**Storyboard for this example**

This example is based upon the following scenario:

Patient Brian Z uses an App to request all his medications from a single provider, Dr Cayr. This test scenario exercises a mix of routine meds, unusual schedule meds and as-needed meds. All meds are in the outpatient setting only.

Provider A's (Dr Cayr) medication records for Patient Brian Z. Note that three of these are active, the other two are completed.

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


    GET [base]/MedicationRequest?patient=test2&intent=order,plan&status=active

**Response:**

A Server returns a search Bundle resource containing all the MedicationRequests with a status of "active" for the patient Brian Z


    HTTP/1.1 200 OK
    [other headers]

~~~
{% include get-all-active-meds-searchbundle.md %}
~~~
