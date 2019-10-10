**DiagnosticReport**

#### Summary of the Mandatory Requirements
1.  A  code  in `DiagnosticReport.status`
with a [required](http://hl7.org/fhir/R4/terminologies.html#required)
 binding to [DiagnosticReportStatus](http://hl7.org/fhir/ValueSet/diagnostic-report-status)
1. One or more CodeableConcepts CodeableConcept  in `DiagnosticReport.category`
with an [example](http://hl7.org/fhir/R4/terminologies.html#example)
 binding to [Diagnostic Service Section Codes](http://hl7.org/fhir/ValueSet/diagnostic-service-sections)
   - which must have at least  a `DiagnosticReport.category` = `{"coding": [{"code": "LAB", "system": "terminology.hl7.org/CodeSystem/v2-0074"}]}`
1.  A  CodeableConcept  in `DiagnosticReport.code`
with an [extensible](http://hl7.org/fhir/R4/terminologies.html#extensible)
 binding to [US Core Diagnostic Report Laboratory Codes](ValueSet-us-core-diagnosticreport-lab-codes.html)
1.  A Patient Reference  in `DiagnosticReport.subject`
1.  A  dateTime  in `DiagnosticReport.effective[x]`
1.  An  instant  in `DiagnosticReport.issued`

#### Summary of the Must Support Requirements
1. One or more Performer References  in `DiagnosticReport.performer`
1. One or more Result References  in `DiagnosticReport.result`
