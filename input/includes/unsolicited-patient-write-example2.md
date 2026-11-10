
```yaml
# =======TODO: complete this example scenario ==========
# === Note: The example `DocumentReference.attachment.data` values are truncated placeholders. ===
resourceType: DocumentReference
meta:
    security:
        -
            system: 'http://terminology.hl7.org/CodeSystem/v3-ObservationValue'
            code: PATAST
            display: patient asserted
status: current
type:
    coding:
        -
            system: 'http://loinc.org'
            code: 64290-0
            display: Health insurance card
category:
    -
        coding:
            -
                system: 'http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category'
                code: insurance-document
                display: Insurance Document
subject:
    reference: Patient/8da636b7-aaaa-44ab-8ed7-604039829eb6
date: '2026-07-21T00:00:00Z'
author:
    -
        reference: Patient/8da636b7-aaaa-44ab-8ed7-604039829eb6
        display: Mike Jones
content:
    -
        attachment:
            contentType: image/png
            data: iVBORw0KGgo=
            title: Health Insurance Card - Mike Jones

```
