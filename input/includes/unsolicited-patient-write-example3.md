
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
contained:
    -
        resourceType: Organization
        id: source-org
        name: Riverside Community Hospital
    -
        resourceType: Patient
        id: source-patient
        name:
            -
                family: Smith
                given:
                    - Suzanne
        birthDate: '1974-03-12'
identifier:
    -
        system: 'http://riverside.example.org/documents'
        value: DS-2026-06-30-117
status: current
type:
    coding:
        -
            system: 'http://loinc.org'
            code: 18842-5
            display: Discharge summary
category:
    -
        coding:
            -
                system: 'http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category'
                code: clinical-note
                display: Clinical Note
subject:
    reference: Patient/341912d8-207d-4e73-a3a6-17117e602227
date: '2026-07-28T09:15:00Z'
author:
    -
        reference: '#source-org'
        display: Riverside Community Hospital
content:
    -
        attachment:
            contentType: application/pdf
            data: JVBERi0xLjcK
            title: Discharge Summary - Riverside Community Hospital
            creation: '2026-06-30'
context:
    period:
        start: '2026-06-26'
        end: '2026-06-30'
    sourcePatientInfo:
        reference: '#source-patient'

```
