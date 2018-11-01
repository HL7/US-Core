##### Complete Summary of the Mandatory Requirements

1.  One status in `Observation.status` which has a [required]({{site.data.fhir.path}}terminologies.html#required) binding to [ObservationStatus]
1.  A category in `Observation.category` which must have:
    -   a fixed `Observation.category.coding.system`=“<http://hl7.org/fhir/observation-category>”
    -   a fixed `Observation.category.coding.code`=“laboratory”
1.  One code in `Observation.code` which has an [extensible]({{site.data.fhir.path}}terminologies.html#extensible) binding to [LOINC Observation Codes]
    -   Other additional codes are allowed - e.g. system specific codes. All codes SHALL have a code system value
1.  One patient in `Observation.subject`
1.  Either one `Observation.value[x]` or one code in `Observation.DataAbsentReason` (unless `Observation.component` or `Observation.related` is present)
    -   Observation.valueQuantity has a [required]({{site.data.fhir.path}}terminologies.html#required) binding to [UCUM units]
    -   Observation.valueCodeableConcept has an [preferred]({{site.data.fhir.path}}terminologies.html#preferred) binding to [Observation Value Codes (SNOMED-CT)]
    -   Observation.DataAbsentReason has an [extensible]({{site.data.fhir.path}}terminologies.html#extensible) binding to [Observation Value Absent Reason]

Each Observation *SHOULD* have:

1.  A date and time in `effectiveDateTime` or `effectivePeriod`
1.  A reference range if applicable in `Observation.referenceRange`

  [Observation Value Codes (SNOMED-CT)]: ValueSet-us-core-observation-value-codes.html
  [Observation Value Absent Reason]: http://hl7.org/fhir/ValueSet/data-absent-reason
  [UCUM units]: {{site.data.fhir.path}}valueset-ucum-units.html
  [LOINC]: http://loinc.org
  [LOINC Observation Codes]: {{site.data.fhir.path}}valueset-observation-codes.html
  [ObservationStatus]: {{site.data.fhir.path}}valueset-observation-status.html
