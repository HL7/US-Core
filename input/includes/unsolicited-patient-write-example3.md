
<!-- includes/unsolicited-patient-write-example3.md -->
<!-- Unsolicited Patient Write, Example 3 (Patient Mediated): a document someone else authored, forwarded by the patient. -->

**Scenario**

A patient, Suzie Smith, was discharged from another hospital a month ago. She retrieves the discharge summary from that hospital's patient portal and forwards it to her own provider through her app. The hospital, not the patient, authored the document, and it was written a month before she sent it. The provider holds it for clinician review before it joins the chart.

This is a patient-mediated write: the patient is the submitter but not the author. How the app obtained the document from the other hospital is out of scope for this page.

The example uses these values:

* FHIR base URL `[base]`: `https://provider.example.com/r4`
* Patient: `Patient/341912d8-207d-4e73-a3a6-17117e602227` (Suzie Smith, as known to the receiving provider)
* Document identifier: system `http://riverside.example.org/documents`, value `DS-2026-06-30-117`

---

**Authorization**

The app is patient-facing, so it uses a SMART standalone launch rather than the EHR launch in the [Provider Write](#provider-write) example, and the token response carries a `patient` context value but no `encounter`. That `patient` value is the id used for `subject` only. Unlike the other patient examples it is **not** used for `author`, because the patient did not write this document. The full launch and token exchange is shown in the Provider Write example; only the scopes differ here:

* `patient/DocumentReference.c`, the unrestricted create scope, because a forwarded document can be of any category the server accepts

---


**Step 1: The app forwards the discharge summary**

~~~
POST [base]/DocumentReference
Authorization: Bearer t5hwkd93jfksl20dmfk3
Content-Type: application/fhir+json
Accept: application/fhir+json
If-None-Exist: identifier=http://riverside.example.org/documents|DS-2026-06-30-117
~~~

**Request body**

The `content.attachment.data` value below is a truncated placeholder for the base64 encoded PDF.

~~~json
{
  "resourceType": "DocumentReference",
  "meta": {
    "security": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/v3-ObservationValue",
        "code": "PATAST",
        "display": "patient asserted"
      }
    ]
  },
  "contained": [
    {
      "resourceType": "Organization",
      "id": "source-org",
      "name": "Riverside Community Hospital"
    },
    {
      "resourceType": "Patient",
      "id": "source-patient",
      "name": [
        {
          "family": "Smith",
          "given": ["Suzanne"]
        }
      ],
      "birthDate": "1974-03-12"
    }
  ],
  "identifier": [
    {
      "system": "http://riverside.example.org/documents",
      "value": "DS-2026-06-30-117"
    }
  ],
  "status": "current",
  "type": {
    "coding": [
      {
        "system": "http://loinc.org",
        "code": "18842-5",
        "display": "Discharge summary"
      }
    ]
  },
  "category": [
    {
      "coding": [
        {
          "system": "http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category",
          "code": "clinical-note",
          "display": "Clinical Note"
        }
      ]
    }
  ],
  "subject": {
    "reference": "Patient/341912d8-207d-4e73-a3a6-17117e602227",
    "display": "Suzie Smith"
  },
  "date": "2026-07-28T09:15:00Z",
  "author": [
    {
      "reference": "#source-org",
      "display": "Riverside Community Hospital"
    }
  ],
  "content": [
    {
      "attachment": {
        "contentType": "application/pdf",
        "data": "JVBERi0xLjcK...",
        "title": "Discharge Summary - Riverside Community Hospital",
        "creation": "2026-06-30"
      }
    }
  ],
  "context": {
    "period": {
      "start": "2026-06-26",
      "end": "2026-06-30"
    },
    "sourcePatientInfo": {
      "reference": "#source-patient"
    }
  }
}
~~~

What makes this submission different from a patient-generated one:

* `author` is the authoring hospital, carried as a **contained** `Organization` and referenced by its local id `#source-org`. The receiving server has no `Organization` resource for Riverside, so there is no relative reference to give. A server accepts a contained reference,<sup>[§][CONF-WD-18]</sup> might persist its content,<sup>[§][CONF-WD-21]</sup> and does not reject the submission just because the reference does not resolve to one of its own resources.<sup>[§][CONF-WD-19]</sup>
* `context.sourcePatientInfo` holds the demographics the other hospital had on file, as a second contained resource. That lets a reviewer confirm the forwarded document is about this patient.
* `meta.security` carries `PATAST` even though a hospital wrote the content.<sup>[§][CONF-WD-54]</sup> The code says the submission came through the patient, which is what a later reader needs to know; it does not claim the patient authored it.

Three dates carry three different meanings here, and only `creation` describes the document itself:<sup>[§][CONF-WD-23]</sup>

| Element | Value | Meaning |
| --- | --- | --- |
| `context.period` | 2026-06-26 to 2026-06-30 | the hospital stay the summary covers |
| `attachment.creation` | 2026-06-30 | the day the hospital wrote the summary |
| `date` | 2026-07-28 | the moment the app submitted it, a month later |
{:.grid}

---

**Step 2: The server accepts the document for review**

~~~http
HTTP/1.1 202 Accepted
Content-Type: application/fhir+json
[other headers]
~~~

**Response body**

~~~json
{
  "resourceType": "OperationOutcome",
  "issue": [
    {
      "severity": "information",
      "code": "informational",
      "diagnostics": "Document received and routed to the care team for review before it is added to the chart."
    }
  ]
}
~~~

An outside document asserts clinical facts a clinician has not seen, so this server reviews it rather than filing it on arrival. The response carries no `Location` header: nothing is readable yet. Availability through read and search is server policy for an unsolicited submission, and the server documents that policy.<sup>[§][CONF-WD-50]</sup>

---

**Reads and searches**

A clinician reviews the summary and accepts it, and the server files it. Until then a search finds nothing, as shown in Example 1 of [Unsolicited Patient Write](#unsolicited-patient-write) above. Once filed, two things the app submitted are still on the stored resource: the `PATAST` code, which the server does not remove,<sup>[§][CONF-WD-52]</sup> so every later reader can tell the document arrived through the patient rather than from the authoring hospital directly; and the identifier the hospital assigned, so if the patient forwards the same summary again, or the hospital later sends it directly, the server has something to match on.<sup>[§][CONF-WD-26]</sup>
