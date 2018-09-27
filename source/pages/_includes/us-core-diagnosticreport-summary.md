#### Complete Summary of the Mandatory Requirements


1.  One status in `DiagnosticReport.status` which has a [required]({{site.data.fhir.path}}terminologies.html#required) binding to:
    -   [DiagnosticReportStatus] value set.
1.  One category in `DiagnosticReport.category` which must have:
    -   a fixed `DiagnosticReport.category.coding.system`= "http://hl7.org/fhir/DiagnosticReport-category”
    -   a fixed `DiagnosticReport.category.coding.code`= "LAB"
1.  One code in `DiagnosticReport.code` which has an [extensible]({{site.data.fhir.path}}terminologies.html#extensible) binding to:
    -   [LOINC Diagnostic Report Codes]
    -   Other additional codes are allowed - e.g. system specific codes. All codes *SHALL* have an system value
1.  One patient in `DiagnosticReport.subject`
1.  A date and time in `DiagnosticReport.effectiveDateTime` or `DiagnosticReport.effectivePeriod`
1.  A date and time in `DiagnosticReport.issued`
1.  One or more `DiagnosticReport.result` and/or one or more `DiagnosticReport.presentedForm`

Each DiagnosticReport *SHOULD* have:

1.  A practitioner or organization in `DiagnosticReport.performer.actor`

[DiagnosticReportStatus]: {{site.data.fhir.path}}valueset-diagnostic-report-status.html
[Observation]: {{site.data.fhir.path}}observation.html
[LOINC Diagnostic Report Codes]: {{site.data.fhir.path}}valueset-report-codes.html
