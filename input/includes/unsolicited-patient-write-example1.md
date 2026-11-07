
<details markdown="1">
  <summary>Unsolicited Patient Write Example 1</summary>


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
        system: 'http://example.org/mydirectives/documents'
        value: adi-202607-01
status: current
type:
    coding:
        -
            system: 'http://loinc.org'
            code: 86533-7
            display: Patient Living will
category:
    -
        coding:
            -
                system: 'http://loinc.org'
                code: 42348-3
                display: Advance healthcare directives
subject:
    reference: Patient/341912d8-207d-4e73-a3a6-17117e602227
date: '2026-07-21T00:00:00Z'
author:
    -
        reference: Patient/341912d8-207d-4e73-a3a6-17117e602227
        display: Suzie Smith
content:
    -
        attachment:
            contentType: application/pdf
            data: JVBERi0xLjcK
            title: Advance Healthcare Directive - Suzie Smith
            creation: '2026-07-14'
```

</details>
