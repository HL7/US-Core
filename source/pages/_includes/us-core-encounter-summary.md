##### Complete Summary of the Mandatory Requirements

1.  One status in `Encounter.status`  
1.  A class in `Encounter.class` from [EncounterCode]({{site.data.fhir.path}}v3/ActEncounterCode/vs.html) value set.
1.  At least one type in `Encounter.type` from [US Core Encounter Type](ValueSet-us-core-encounter-type.html) value set.
1.  One patient reference in `Encounter.subject`

##### Summary of the Must Support Requirements

Additionally your system must Support:

1.  One or more Encounter numbers in `Encounter.identifier`
1.  One or more participants in `Encounter.participant`
1.  An `Encounter.period`
1.  One or more reasons in `Encounter.reason` from [EncounterReason]({{site.data.fhir.path}}valueset-encounter-reason.html) value set.
1.  One or more `Encounter.diagnosis.condition`
1.  An `Encounter.diagnosis.rank`
1.  A disposition in `Encounter.hospitlization.dischargeDisposition` from example [dischargeDisposition]({{site.data.fhir.path}}valueset-encounter-discharge-disposition.html) value set.
1.  One or more locations in `Encounter.location`
