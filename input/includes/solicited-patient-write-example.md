
<!-- includes/solicited-patient-write-example.md -->
<!-- Solicited Patient Write: the full interaction, standalone launch through the confirmation search. -->

**Scenario**

A cardiologist asks a patient, Lin Zhang, to send a weekly activity report from her fitness tracker. The clinician records the request in the EHR as a standing `ServiceRequest` with the patient as `performer`. Each week the patient's fitness app finds that request, submits the week's report against it, and confirms the write.

The example uses these values:

* FHIR base URL `[base]`: `https://provider.example.com/r4`
* Patient: `Patient/512cd664-6cd2-4a56-b462-0133464ffaa0` (Lin Zhang)
* ServiceRequest: `ServiceRequest/activity-report-weekly`
* Document identifier: system `http://example.org/fitshare/reports`, value `lin-2026-w29`

---

**Authorization**

The app is patient-facing, so it uses a SMART standalone launch rather than the EHR launch in the [Provider Write](#provider-write) example, and the token response carries a `patient` context value but no `encounter`. That `patient` value is the id used for both `subject` and `author`, because for a patient write the patient is the author. The full launch and token exchange is shown in the Provider Write example; only the scopes differ here:

* `patient/DocumentReference.c` to write the report<sup>[§][CONF-WD-41]</sup>
* `patient/ServiceRequest.rs` to find the request it responds to<sup>[§][CONF-WD-42]</sup>
* `offline_access`, so next week's report needs no new sign-in

---


**Step 1: The app finds the request it is responding to**

The server makes `ServiceRequest` resources with the patient as `performer` available through read and search.<sup>[§][CONF-WD-43]</sup>

~~~
GET [base]/ServiceRequest?patient=512cd664-6cd2-4a56-b462-0133464ffaa0&status=active
Authorization: Bearer j4kfhw84hf8w4hf8w4hf8w4h
Accept: application/fhir+json
~~~

**Response body**

The search set holds one active request. The resource is abbreviated to the elements the app uses.

~~~json
{
  "resourceType": "Bundle",
  "type": "searchset",
  "total": 1,
  "entry": [
    {
      "fullUrl": "https://provider.example.com/r4/ServiceRequest/activity-report-weekly",
      "resource": {
        "resourceType": "ServiceRequest",
        "id": "activity-report-weekly",
        "status": "active",
        "intent": "order",
        "code": {
          "coding": [
            {
              "system": "http://loinc.org",
              "code": "51855-5",
              "display": "Patient Note"
            }
          ],
          "text": "Weekly activity report from fitness tracker"
        },
        "subject": {
          "reference": "Patient/512cd664-6cd2-4a56-b462-0133464ffaa0"
        },
        "performer": [
          {
            "reference": "Patient/512cd664-6cd2-4a56-b462-0133464ffaa0",
            "display": "Lin Zhang"
          }
        ],
        "requester": {
          "reference": "Practitioner/3a7b6461-1fa6-4ba9-adff-0a7ff6668a62",
          "display": "Dr. Chris Bell"
        },
        "authoredOn": "2026-06-15",
        "occurrenceTiming": {
          "repeat": {
            "frequency": 1,
            "period": 1,
            "periodUnit": "wk"
          }
        }
      },
      "search": {
        "mode": "match"
      }
    }
  ]
}
~~~

The request tells the app three things: that it is still `active` and so still expects reports, that `occurrenceTiming.repeat` makes it a standing weekly order rather than a one-time request, and that `code` is the document type to submit.

---

**Step 2: The app writes the report**

~~~
POST [base]/DocumentReference
Authorization: Bearer j4kfhw84hf8w4hf8w4hf8w4h
Content-Type: application/fhir+json
Accept: application/fhir+json
If-None-Exist: identifier=http://example.org/fitshare/reports|lin-2026-w29
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
  "identifier": [
    {
      "system": "http://example.org/fitshare/reports",
      "value": "lin-2026-w29"
    }
  ],
  "status": "current",
  "type": {
    "coding": [
      {
        "system": "http://loinc.org",
        "code": "51855-5",
        "display": "Patient Note"
      }
    ]
  },
  "category": [
    {
      "coding": [
        {
          "system": "http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category",
          "code": "medical-history",
          "display": "Medical History"
        }
      ]
    }
  ],
  "subject": {
    "reference": "Patient/512cd664-6cd2-4a56-b462-0133464ffaa0",
    "display": "Lin Zhang"
  },
  "date": "2026-07-21T00:00:00Z",
  "author": [
    {
      "reference": "Patient/512cd664-6cd2-4a56-b462-0133464ffaa0",
      "display": "Lin Zhang"
    }
  ],
  "content": [
    {
      "attachment": {
        "contentType": "application/pdf",
        "data": "JVBERi0xLjcK...",
        "title": "Weekly activity report, July 14-20, 2026",
        "creation": "2026-07-21"
      }
    }
  ],
  "context": {
    "period": {
      "start": "2026-07-14",
      "end": "2026-07-20"
    },
    "related": [
      {
        "reference": "ServiceRequest/activity-report-weekly"
      }
    ]
  }
}
~~~

Three elements make this a solicited submission rather than an unsolicited one:

* `context.related` points at the active `ServiceRequest` found in Step 1.<sup>[§][CONF-WD-49]</sup> The server documents whether to use this element or the FHIR R5 `basedOn` extension.<sup>[§][CONF-WD-47]</sup>
* `meta.security` carries `PATAST`, because the content is patient-supplied.<sup>[§][CONF-WD-48]</sup> The server does not remove it,<sup>[§][CONF-WD-45]</sup> so a later reader can tell where the content came from.
* `author` is the patient, taken from the `patient` context value in the token response.

`context.period` is the week the activity was recorded, not the moment of submission.<sup>[§][CONF-WD-23]</sup> `date` is when the app created the `DocumentReference`, and `attachment.creation` is when it generated the PDF. The identifier carries the week number, so next week's report gets its own identifier and `If-None-Exist` suppresses only a retry of this one.<sup>[§][CONF-WD-24]</sup>

---

**Step 3: The server accepts the report**

A solicited submission answers a request the provider already made, so it is accepted and filed without review. The response is `201 Created`.<sup>[§][CONF-WD-44]</sup>

~~~http
HTTP/1.1 201 Created
Location: https://provider.example.com/r4/DocumentReference/doc-lin-2026-w29/_history/1
ETag: W/"1"
Last-Modified: Tue, 21 Jul 2026 00:04:12 GMT
[other headers]
~~~

The response body is the created resource, with `id`, `meta.versionId`, and `meta.lastUpdated` populated as base FHIR requires of a [create]({{site.data.fhir.path}}http.html#create). The server also stamped `meta.profile` with the US Core DocumentReference profile, preserved the submitted codings as received,<sup>[§][CONF-WD-14]</sup> and left `meta.security` in place, so the `PATAST` code is still on the stored resource.<sup>[§][CONF-WD-45]</sup>

---

**Reads and searches**

The report is available through read and search immediately, with no further action by the patient or the provider.<sup>[§][CONF-WD-44]</sup> A confirmation search takes the same form as the one in the [Provider Write](#provider-write) example, and the returned `DocumentReference` keeps the `context.related` reference, which ties the report back to the order for the clinician who asked for it.

Next week the app repeats these steps with a new identifier and a new `context.period`, against the same standing `ServiceRequest`.
