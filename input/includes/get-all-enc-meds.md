
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

~~~
{% include get-all-ecounter-meds-searchbundle.md %}
~~~
