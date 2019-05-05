**DiagnosticReport**

#### Summary of the Mandatory Requirements
1.  A  code  in `DiagnosticReport.status`
with a [required](http://hl7.org/fhir/R4/terminologies.html#required)
 binding to [DiagnosticReportStatus](http://hl7.org/fhir/ValueSet/diagnostic-report-status)
1. One or more  CodeableConcepts  in `DiagnosticReport.category`
with an [extensible](http://hl7.org/fhir/R4/terminologies.html#extensible)
 binding to [US Core DiagnosticReport Category](ValueSet-us-core-diagnosticreport-category.html)
1.  A  CodeableConcept  in `DiagnosticReport.code`
with an [extensible](http://hl7.org/fhir/R4/terminologies.html#extensible)
 binding to [US Core Diagnosticreport Report And Note Codes](ValueSet-us-core-diagnosticreport-report-and-note-codes.html)
1.  A Patient Reference  in `DiagnosticReport.subject`
1.  A  dateTime  in `DiagnosticReport.effective[x]`

#### Summary of the Must Support Requirements
1.  A Encounter Reference  in `DiagnosticReport.encounter`
1.  An  instant  in `DiagnosticReport.issued`
1. One or more Performer References  in `DiagnosticReport.performer`
1. One or more  Medias  in `DiagnosticReport.media`
1. One or more  Attachments  in `DiagnosticReport.presentedForm`