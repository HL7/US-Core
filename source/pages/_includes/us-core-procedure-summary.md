#### Complete Summary of the Mandatory Requirements

1.  One patient reference in `Procedure.subject`
1.  A status code in Procedure.status which has a [required]({{site.data.fhir.path}}terminologies.html#required) binding to:
-  [EventStatus] value set.
1.  One Identification of the procedure in `Procedure.code` which has:
    - a [extensible + max valueset](guidance.html#extensible--max-valueset-binding-for-codeableconcept-datatype) binding to the [US Core Procedure Codes] valueset (SNOMED CT or CPT-4/HCPC for procedures).
    - MAY have a translation to [ICD-10-PCS] or [Code on Dental Procedures and Nomenclature (CDT Codes)].s
1.  A date or a time period in `Procedure.performedDateTime` or `Procedure.performedPeriod`


  [US Core Procedure Codes]: ValueSet-us-core-procedure-code.html
  [ICD-10-PCS]: http://www.icd10data.com/icd10pcs
  [Code on Dental Procedures and Nomenclature (CDT Codes)]: http://www.ada.org/en/publications/cdt/
  [EventStatus]: {{site.data.fhir.path}}ValueSet/event-status
