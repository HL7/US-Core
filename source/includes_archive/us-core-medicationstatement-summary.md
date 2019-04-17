##### Complete Summary of the Mandatory Requirements


1.  One status in `MedicationStatement.status` which has a [required]({{site.data.fhir.path}}terminologies.html#required) binding to:
-   [MedicationStatementStatus] value set.
1.  One medication via `MedicationStatement.medicationCodeableConcept` or `MedicationStatement.medicationReference`   
-  `MedicationStatement.medicationCodeableConcept` has an [extensible]({{site.data.fhir.path}}terminologies.html#extensible) binding to [Medication Clinical Drug (RxNorm)] value set.
1.  One date `MedicationStatement.dateAsserted`
1.  One patient reference in `MedicationStatement.subject`

##### Summary of the Must Support Requirements

1.  One date or period in `MedicationStatement.effectiveDateTime` or `MedicationStatement.effectivePeriod`
1.  One or more references in `MedicationStatement.derivedFrom` (likely references would be to the [US Core MedicationRequest Profile](StructureDefinition-us-core-medicationrequest.html))

  [Medication Clinical Drug (RxNorm)]: ValueSet-us-core-medication-codes.html
  [MedicationStatusStatus]: {{site.data.fhir.path}}valueset-medicationrequest-status.html

[MedicationStatementStatus]: {{site.data.fhir.path}}valueset-medication-statement-status.html
[MedicationStatementTaken]: {{site.data.fhir.path}}valueset-medication-statement-taken.html
