##### Complete Summary of the Mandatory Requirements

1.  One status in `MedicationRequest.status` which has a [required]({{site.data.fhir.path}}terminologies.html#required) binding to:
-   [MedicationRequestStatus] value set
1.  One medication via `MedicationRequest.medicationCodeableConcept` or `MedicationRequest.medicationReference`   
     -  `MedicationRequest.medicationCodeableConcept` has an [extensible]({{site.data.fhir.path}}terminologies.html#extensible) binding to [Medication Clinical Drug (RxNorm)]
1.  One patient reference in `MedicationRequest.patient`
1.  One date in `MedicationRequest.authoredOn`
1.  One practitioner in `MedicationRequest.requester`

##### Summary of the Must Support Requirements

1.  One or more *Sigs* in `MedicationRequest.dosageInstruction.text`

{% include link-list.md %}
