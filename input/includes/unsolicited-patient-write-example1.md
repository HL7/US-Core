
<!-- includes/unsolicited-patient-write-example1.md -->
<!-- Unsolicited Patient Write, Example 1: discovery, a 202 held for review, and what a read returns before the review completes. -->

**Scenario**

A patient, Suzie Smith, has an advance healthcare directive her attorney prepared. No provider asked for it. She uses an app to check which directive types her provider accepts, then sends the signed PDF. The provider holds patient submissions for staff review before filing them, so the document is not readable or searchable on return.

The example uses these values:

* FHIR base URL `[base]`: `https://provider.example.com/r4`
* Patient: `Patient/341912d8-207d-4e73-a3a6-17117e602227` (Suzie Smith)
* Document identifier: system `http://example.org/mydirectives/documents`, value `adi-202607-01`

---

**Authorization**

The app is patient-facing, so it uses a SMART standalone launch rather than the EHR launch in the [Provider Write](#provider-write) example, and the token response carries a `patient` context value but no `encounter`. That `patient` value is the id used for both `subject` and `author`. The full launch and token exchange is shown in the Provider Write example; only the scopes differ here:

* `patient/DocumentReference.c?category=http://loinc.org|42348-3` to write the directive, and the matching `.rs` for the read-back. These are category-specific scopes rather than the unrestricted `patient/DocumentReference.c`, so the grant covers advance healthcare directives and nothing else.<sup>[§][CONF-WD-51]</sup> A server that supports only the unrestricted scope grants that instead. See [SMART Scopes](#smart-scopes).

---


**Step 1: The app discovers which directive types the server accepts**

A patient-facing app cannot negotiate its capabilities with every provider in advance, so runtime discovery matters here in a way it does not for a provider-facing app. The app expands the type value set in the incoming direction to learn what this server accepts on write.<sup>[§][CONF-WD-08]</sup>

~~~
GET [base]/ValueSet/$expand?context=http://hl7.org/fhir/us/core/StructureDefinition/us-core-adi-documentreference#DocumentReference.type&contextDirection=incoming
Authorization: Bearer k2mfy37dhs8dj3kfhw8s
Accept: application/fhir+json
~~~

**Response body**

~~~json
{
  "resourceType": "ValueSet",
  "status": "active",
  "expansion": {
    "timestamp": "2026-07-21T14:02:11Z",
    "parameter": [
      {
        "name": "context",
        "valueString": "DocumentReference.type"
      },
      {
        "name": "contextDirection",
        "valueString": "incoming"
      }
    ],
    "contains": [
      {
        "system": "http://loinc.org",
        "code": "86533-7",
        "display": "Patient Living will"
      },
      {
        "system": "http://loinc.org",
        "code": "84095-9",
        "display": "Do not resuscitate"
      },
      {
        "system": "http://loinc.org",
        "code": "93037-0",
        "display": "Portable medical order form"
      }
    ]
  }
}
~~~

The living will code the patient selected, `86533-7`, is in the expansion, so the app proceeds. The server's published API documentation covers the same ground for implementers who cannot call `$expand`, including the MIME types it accepts, its size limits, and its review policy for patient submissions.<sup>[§][CONF-WD-07]</sup><sup>[§][CONF-WD-50]</sup>

---

**Step 2: The app writes the directive**

~~~
POST [base]/DocumentReference
Authorization: Bearer k2mfy37dhs8dj3kfhw8s
Content-Type: application/fhir+json
Accept: application/fhir+json
If-None-Exist: identifier=http://example.org/mydirectives/documents|adi-202607-01
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
  "extension": [
    {
      "url": "http://hl7.org/fhir/5.0/StructureDefinition/extension-DocumentReference.attester",
      "extension": [
        {
          "url": "mode",
          "valueCodeableConcept": {
            "coding": [
              {
                "system": "http://hl7.org/fhir/composition-attestation-mode",
                "code": "personal"
              }
            ]
          }
        },
        {
          "url": "time",
          "valueDateTime": "2026-07-14T10:30:00Z"
        },
        {
          "url": "party",
          "valueReference": {
            "reference": "Patient/341912d8-207d-4e73-a3a6-17117e602227",
            "display": "Suzie Smith"
          }
        }
      ]
    }
  ],
  "identifier": [
    {
      "system": "http://example.org/mydirectives/documents",
      "value": "adi-202607-01"
    }
  ],
  "status": "current",
  "type": {
    "coding": [
      {
        "system": "http://loinc.org",
        "code": "86533-7",
        "display": "Patient Living will"
      }
    ]
  },
  "category": [
    {
      "coding": [
        {
          "system": "http://loinc.org",
          "code": "42348-3",
          "display": "Advance healthcare directives"
        }
      ]
    }
  ],
  "subject": {
    "reference": "Patient/341912d8-207d-4e73-a3a6-17117e602227",
    "display": "Suzie Smith"
  },
  "date": "2026-07-21T14:05:00Z",
  "author": [
    {
      "reference": "Patient/341912d8-207d-4e73-a3a6-17117e602227",
      "display": "Suzie Smith"
    }
  ],
  "content": [
    {
      "attachment": {
        "contentType": "application/pdf",
        "data": "JVBERi0xLjcK...",
        "title": "Advance Healthcare Directive - Suzie Smith",
        "creation": "2026-07-14"
      }
    }
  ]
}
~~~

`meta.security` carries `PATAST`, because the content is patient-supplied.<sup>[§][CONF-WD-54]</sup> The server does not remove it,<sup>[§][CONF-WD-52]</sup> so a later reader can tell the directive arrived from the patient.

`author` is the patient even though her attorney drafted the document, because the patient is the party who asserts it. The optional [DocumentReference Attestor R5 Extension] records who signed it and when, which this guidance offers as a candidate for document types such as living wills. The attestation `time` and `attachment.creation` are the day she signed, a week before she sent it; `date` is the moment of submission.<sup>[§][CONF-WD-23]</sup> There is no `context.encounter`: the directive belongs to no visit.

---

**Step 3: The server accepts the directive for review**

The provider's documented policy is to route unsolicited patient submissions to a staff review queue, so the response is `202 Accepted` rather than `201 Created`.<sup>[§][CONF-WD-05]</sup>

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
      "diagnostics": "Document received and queued for review by health information management. It will appear in the patient's record once accepted."
    }
  ]
}
~~~

There is no `Location` header, because there is no resource to read yet. This page requires an `OperationOutcome` only on a failed write,<sup>[§][CONF-WD-06]</sup> so returning one here to explain the hold is this server's choice. A `202` is possible only for an unsolicited patient submission; a Provider Write and a Solicited Patient Write are both answered `201`.

---

**Step 4: A search does not find the document yet**

~~~
GET [base]/DocumentReference?patient=341912d8-207d-4e73-a3a6-17117e602227&category=http://loinc.org|42348-3
Authorization: Bearer k2mfy37dhs8dj3kfhw8s
Accept: application/fhir+json
~~~

**Response body**

~~~json
{
  "resourceType": "Bundle",
  "type": "searchset",
  "total": 0,
  "entry": []
}
~~~

Availability through read and search is server policy for an unsolicited submission, which is why the server has to document that policy.<sup>[§][CONF-WD-50]</sup> An app that treats a `202` as "filed" and polls for the document will keep finding nothing until review completes, so a `202` is better surfaced to the patient as submitted and pending. Once staff accept the directive the server files it, and the same search returns it.
