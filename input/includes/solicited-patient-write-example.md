<details markdown="1">
  <summary>Solicited Patient Write Example</summary>

```yaml
# =======TODO: complete this example scenario ==========
resourceType: DocumentReference
meta:
    security:
        -
            system: 'http://terminology.hl7.org/CodeSystem/v3-ObservationValue'
            code: PATAST
            display: patient asserted
identifier:
    -
        system: 'http://example.org/fitshare/reports'
        value: lin-2026-w29
status: current
type:
    coding:
        -
            system: 'http://loinc.org'
            code: 51855-5
            display: Patient Note
category:
    -
        coding:
            -
                system: 'http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category'
                code: medical-history
                display: Medical History
subject:
    reference: Patient/512cd664-6cd2-4a56-b462-0133464ffaa0
date: '2026-07-21T00:00:00Z'
author:
    -
        reference: Patient/512cd664-6cd2-4a56-b462-0133464ffaa0
        display: Lin Zhang
content:
    -
        attachment:
            contentType: application/pdf
            data: JVBERi0xLjcK
            title: 'Weekly activity report, July 14-20, 2026'
context:
    period:
        start: '2026-07-14'
        end: '2026-07-20'
    related:
        -
            reference: ServiceRequest/activity-report-weekly
```

</details>