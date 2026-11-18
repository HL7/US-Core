
<!-- includes/unsolicited-patient-write-example2.md -->
<!-- Unsolicited Patient Write, Example 2: a provider's own portal app, an image attachment, and a 201 by documented policy. -->

**Scenario**

Before a checkup, a patient, Mike Jones, photographs his new insurance card in his provider's patient portal app and sends it. No provider asked for it, so the submission is unsolicited. The provider's documented policy is to file insurance documents on arrival and let registration staff work them from the chart, so the response is `201 Created` rather than `202 Accepted`.

The example uses these values:

* FHIR base URL `[base]`: `https://provider.example.com/r4`
* Patient: `Patient/8da636b7-aaaa-44ab-8ed7-604039829eb6` (Mike Jones)

---

**Authorization**

The app is patient-facing, so it uses a SMART standalone launch rather than the EHR launch in the [Provider Write](#provider-write) example, and the token response carries a `patient` context value but no `encounter`. That `patient` value is the id used for both `subject` and `author`. The full launch and token exchange is shown in the Provider Write example; only the scopes differ here:

* `patient/DocumentReference.c` to write the card, and `.rs` for the read-back. A server that supports a category-specific scope can restrict the grant to insurance documents instead, with `patient/DocumentReference.c?category=http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category|insurance-document`.<sup>[§][CONF-WD-51]</sup>

The portal app is the provider's own, so the categories, types, MIME types, and size limits were settled during integration and the app needs no runtime discovery.

---


**Step 1: The app writes the document**

~~~
POST [base]/DocumentReference
Authorization: Bearer p9sdkfj39sdkfj39sdkfj
Content-Type: application/fhir+json
Accept: application/fhir+json
~~~

**Request body**

The `content.attachment.data` value below is a truncated placeholder for the base64 encoded PNG.

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
  "status": "current",
  "type": {
    "coding": [
      {
        "system": "http://loinc.org",
        "code": "64290-0",
        "display": "Health insurance card"
      }
    ]
  },
  "category": [
    {
      "coding": [
        {
          "system": "http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category",
          "code": "insurance-document",
          "display": "Insurance Document"
        }
      ]
    }
  ],
  "subject": {
    "reference": "Patient/8da636b7-aaaa-44ab-8ed7-604039829eb6",
    "display": "Mike Jones"
  },
  "date": "2026-07-21T00:00:00Z",
  "author": [
    {
      "reference": "Patient/8da636b7-aaaa-44ab-8ed7-604039829eb6",
      "display": "Mike Jones"
    }
  ],
  "content": [
    {
      "attachment": {
        "contentType": "image/png",
        "data": "iVBORw0KGgo...",
        "title": "Health Insurance Card - Mike Jones"
      }
    }
  ]
}
~~~

A photograph is not a narrative document, so the submission differs from the other examples in three ways:

* `contentType` is `image/png`. A server supporting the `insurance-document` category accepts at least one of `text/plain; charset=utf-8`, `application/pdf`, `image/jpeg`, or `image/png` for it, and documents which.<sup>[§][CONF-WD-33]</sup><sup>[§][CONF-WD-34]</sup> A phone photograph can exceed the 5 MiB a server is required to accept inline, so an app either downscales it or uses a server that accepts content by `url`.<sup>[§][CONF-WD-35]</sup><sup>[§][CONF-WD-38]</sup>
* There is no `context.period`. The card has no clinically relevant period, and the checkup it was sent ahead of has not happened, so there is no encounter to reference either.
* There is no `identifier`, so `If-None-Exist` is not available and a retried submission can produce a second copy. Populating one that stays stable across resubmission is the way to prevent that.<sup>[§][CONF-WD-24]</sup>

`meta.security` still carries `PATAST`, as it does for every patient submission.<sup>[§][CONF-WD-54]</sup>

---

**Step 2: The server accepts the document**

~~~http
HTTP/1.1 201 Created
Location: https://provider.example.com/r4/DocumentReference/doc-ins-88213/_history/1
ETag: W/"1"
Last-Modified: Tue, 21 Jul 2026 00:02:38 GMT
[other headers]
~~~

The `201` reflects this server's documented policy for the `insurance-document` category, not a rule of this page. The same server holds clinical notes from patients for review and answers those `202`. Either response is conformant for an unsolicited submission as long as the policy is documented.<sup>[§][CONF-WD-04]</sup><sup>[§][CONF-WD-05]</sup><sup>[§][CONF-WD-50]</sup>

---

**Reads and searches**

The `201` means the card is on file before the patient arrives, so a confirmation search of the form shown in the [Provider Write](#provider-write) example returns it right away and the app can show him it was received. Registration staff work it from the chart.
