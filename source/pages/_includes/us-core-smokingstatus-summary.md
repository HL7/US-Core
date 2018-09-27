#### Complete Summary of the Mandatory Requirements

1.  One status in `Observation.status`which has a [required]({{site.data.fhir.path}}terminologies.html#required) binding to:
    -   [ObservationStatus] value set.
1.  One code in `Observation.code`
    -   a fixed `Observation.code.coding.system`= http://loinc.org
    -   a fixed `Observation.code.coding.code`=72166-2
1.  One reference to a Patient in `Observation.subject`
1.  One DateTime ([instant]) in `Observation.issued`
1.  One `Observation.valueCodeableConcept`which has a [extensible + max valueset](guidance.html#extensible--max-valueset-binding-for-codeableconcept-datatype) binding to:
    -   [Smoking Status] value set.





  [ObservationStatus]: {{site.data.fhir.path}}valueset-observation-status.html
  [instant]: {{site.data.fhir.path}}datatypes.html#instant
  [Smoking Status]: ValueSet-us-core-observation-ccdasmokingstatus.html
