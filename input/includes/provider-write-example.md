
<details>
  <summary>Provider Write Example</summary>

```yaml
# =======TODO: complete this example scenario ==========
resourceType: DocumentReference
identifier:
    -
        system: 'http://example.org/trendview/reports'
        value: rpt-202607-0042
status: current
type:
    coding:
        -
            system: 'http://loinc.org'
            code: 70004-7
            display: Diagnostic study note
category:
    -
        coding:
            -
                system: 'http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category'
                code: clinical-note
                display: Clinical Note
subject:
    reference: Patient/99feede8-2c8c-4135-92d1-083576edc1f8
date: '2026-07-21T15:30:00Z'
author:
    -
        reference: Practitioner/3a7b6461-1fa6-4ba9-adff-0a7ff6668a62
        display: Dr. Chris Bell
content:
    -
        attachment:
            contentType: application/pdf
            data: JVBERi0xLjcK
            title: Cardiology trend report - Vanessa Reyes
context:
    encounter:
        -
            reference: Encounter/enc-20260721-7
    period:
        start: '2021-07-01'
        end: '2026-07-21'

```

</details>
