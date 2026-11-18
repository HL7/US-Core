
<!-- includes/provider-write-example.md -->
<!-- Provider Write: the full interaction, SMART EHR launch through the confirmation search. -->

**Scenario**

A cardiologist, Dr. Chris Bell, reviews a five-year blood pressure trend report for a patient, Vanessa Reyes, in an analytics app launched from the patient's chart in the EHR. At the cardiologist's direction the app saves the report to the patient's record as a PDF, then searches for it to confirm the write.

The example uses these values:

* FHIR base URL `[base]`: `https://ehr.example.com/r4`
* Patient: `Patient/99feede8-2c8c-4135-92d1-083576edc1f8` (Vanessa Reyes)
* Encounter: `Encounter/enc-20260721-7`
* Authorizing user: `Practitioner/3a7b6461-1fa6-4ba9-adff-0a7ff6668a62` (Dr. Chris Bell)
* Document identifier: system `http://example.org/trendview/reports`, value `rpt-202607-0042`

The app and the EHR established which categories, types, MIME types, and size limits the EHR accepts during integration, so this example includes no runtime discovery step. See [Discovery](#discovery).

---

**Step 1: The EHR launches the app**

The cardiologist opens the app from the patient's chart. The EHR invokes the app's registered launch URL with the `iss` and `launch` parameters defined by [SMART App Launch].

~~~
GET https://app.example.com/launch?iss=https%3A%2F%2Fehr.example.com%2Fr4&launch=xyz123
~~~

---

**Step 2: The app requests authorization**

The app asks for the scopes it needs, including the create scope for `DocumentReference`. Parameter values are shown unencoded for readability.

~~~
GET https://ehr.example.com/auth/authorize?
    response_type=code&
    client_id=trendview-app&
    redirect_uri=https://app.example.com/redirect&
    launch=xyz123&
    aud=https://ehr.example.com/r4&
    scope=launch openid fhirUser user/DocumentReference.crs user/Patient.rs user/Encounter.rs&
    state=98wrghuwuogerg2&
    code_challenge=DJsz...&
    code_challenge_method=S256
~~~

`user/DocumentReference.crs` combines the create permission this guidance requires of the server for Provider Write<sup>[§][CONF-WD-39]</sup> with the read and search permissions the app needs for Steps 4 and 7. A category-specific scope such as `user/DocumentReference.crs?category=http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category|clinical-note` can be used in its place. See [SMART Scopes](#smart-scopes).

---

**Step 3: The EHR returns an access token with patient and encounter context**

The app exchanges the authorization code at the token endpoint.

~~~
POST https://ehr.example.com/auth/token
Content-Type: application/x-www-form-urlencoded

grant_type=authorization_code&code=5a8b...&redirect_uri=https%3A%2F%2Fapp.example.com%2Fredirect&client_id=trendview-app&code_verifier=erw3...
~~~

**Response**

~~~http
HTTP/1.1 200 OK
Content-Type: application/json
[other headers]
~~~

**Response body**

~~~json
{
  "access_token": "i8hweunweunweofiwweoijewiwe",
  "token_type": "Bearer",
  "expires_in": 3600,
  "scope": "launch openid fhirUser user/DocumentReference.crs user/Patient.rs user/Encounter.rs",
  "id_token": "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9...",
  "patient": "99feede8-2c8c-4135-92d1-083576edc1f8",
  "encounter": "enc-20260721-7"
}
~~~

The EHR launch supplies the context the app writes with, so the app does not prompt the cardiologist to select a patient or an encounter:

* `patient` is the id the app uses for `subject`.
* `encounter` is the id the app uses for `context.encounter`. It is a candidate value only; a document that belongs to no encounter omits the element.
* `fhirUser` in the `id_token` resolves to `Practitioner/3a7b6461-1fa6-4ba9-adff-0a7ff6668a62`, the id the app uses for `author`.

---

**Step 4: The app reads the patient and encounter context**

The app reads both context resources to confirm the chart it was launched against and to populate the `display` values this guidance recommends on `author` and `context.encounter`.<sup>[§][CONF-WD-17]</sup> Responses are abbreviated to the elements the app uses.

~~~
GET [base]/Patient/99feede8-2c8c-4135-92d1-083576edc1f8
Authorization: Bearer i8hweunweunweofiwweoijewiwe
Accept: application/fhir+json
~~~

**Response body**

~~~json
{
  "resourceType": "Patient",
  "id": "99feede8-2c8c-4135-92d1-083576edc1f8",
  "name": [
    {
      "family": "Reyes",
      "given": ["Vanessa"]
    }
  ],
  "gender": "female",
  "birthDate": "1962-03-14"
}
~~~

~~~
GET [base]/Encounter/enc-20260721-7
Authorization: Bearer i8hweunweunweofiwweoijewiwe
Accept: application/fhir+json
~~~

**Response body**

~~~json
{
  "resourceType": "Encounter",
  "id": "enc-20260721-7",
  "status": "in-progress",
  "class": {
    "system": "http://terminology.hl7.org/CodeSystem/v3-ActCode",
    "code": "AMB",
    "display": "ambulatory"
  },
  "type": [
    {
      "text": "Cardiology office visit"
    }
  ],
  "subject": {
    "reference": "Patient/99feede8-2c8c-4135-92d1-083576edc1f8"
  },
  "period": {
    "start": "2026-07-21T15:00:00Z"
  }
}
~~~

Note that `context.period` carries the clinically relevant period of the report content, not the encounter period.<sup>[§][CONF-WD-23]</sup> Here that is the five-year span of the trend data, while the encounter is the visit at which the report was reviewed.

---

**Step 5: The app writes the document**

The app submits the report with FHIR RESTful `create`. `If-None-Exist` makes the write idempotent against a network retry, using the identifier the app assigns to the document.<sup>[§][CONF-WD-24]</sup><sup>[§][CONF-WD-25]</sup>

~~~
POST [base]/DocumentReference
Authorization: Bearer i8hweunweunweofiwweoijewiwe
Content-Type: application/fhir+json
Accept: application/fhir+json
If-None-Exist: identifier=http://example.org/trendview/reports|rpt-202607-0042
~~~

**Request body**

The `content.attachment.data` value below is a truncated placeholder for the base64 encoded PDF.

~~~json
{
  "resourceType": "DocumentReference",
  "identifier": [
    {
      "system": "http://example.org/trendview/reports",
      "value": "rpt-202607-0042"
    }
  ],
  "status": "current",
  "type": {
    "coding": [
      {
        "system": "http://loinc.org",
        "code": "70004-7",
        "display": "Diagnostic study note"
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
    "reference": "Patient/99feede8-2c8c-4135-92d1-083576edc1f8",
    "display": "Vanessa Reyes"
  },
  "date": "2026-07-21T15:30:00Z",
  "author": [
    {
      "reference": "Practitioner/3a7b6461-1fa6-4ba9-adff-0a7ff6668a62",
      "display": "Dr. Chris Bell"
    }
  ],
  "content": [
    {
      "attachment": {
        "contentType": "application/pdf",
        "data": "JVBERi0xLjcK...",
        "title": "Cardiology trend report - Vanessa Reyes",
        "creation": "2026-07-21"
      }
    }
  ],
  "context": {
    "encounter": [
      {
        "reference": "Encounter/enc-20260721-7",
        "display": "Cardiology office visit, 2026-07-21"
      }
    ],
    "period": {
      "start": "2021-07-01",
      "end": "2026-07-21"
    }
  }
}
~~~

Every value in the submission comes from the launch context or from the report itself: `subject` and `author` from Step 3, their `display` values and the encounter `display` from Step 4, `date` from the moment of submission, and `attachment.creation` from when the app generated the PDF.

---

**Step 6: The EHR accepts the document**

A Provider Write is always solicited, so the response is `201 Created` with a `Location` header and the document is available through read and search without further action.<sup>[§][CONF-WD-04]</sup><sup>[§][CONF-WD-40]</sup> The `ETag` and `Last-Modified` headers are not required by this page; base FHIR asks a server to return them on a [create]({{site.data.fhir.path}}http.html#create) when it supports versioning.

~~~http
HTTP/1.1 201 Created
Location: https://ehr.example.com/r4/DocumentReference/doc-rpt-202607-0042/_history/1
ETag: W/"1"
Last-Modified: Tue, 21 Jul 2026 15:30:04 GMT
[other headers]
~~~

The response body is the created resource. As base FHIR requires of a [create]({{site.data.fhir.path}}http.html#create), the EHR populated `id`, `meta.versionId`, and `meta.lastUpdated`. It also stamped `meta.profile` with the US Core DocumentReference profile and preserved the submitted codings as received.<sup>[§][CONF-WD-14]</sup>

In this example the EHR also sets `custodian` to the organization responsible for the record. Nothing on this page requires that; see [Open Questions](#open-questions).

The submission carries no `meta.security` code of `PATAST`: the content is provider-supplied, not patient-asserted. See [Patient-asserted Signaling](#patient-asserted-signaling).

---

**Step 7: The app searches for the document**

The app confirms the write with a search that the [US Core DocumentReference Profile] Quick Start requires servers to support.

~~~
GET [base]/DocumentReference?patient=99feede8-2c8c-4135-92d1-083576edc1f8&category=http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category|clinical-note
Authorization: Bearer i8hweunweunweofiwweoijewiwe
Accept: application/fhir+json
~~~

**Response**

~~~http
HTTP/1.1 200 OK
Content-Type: application/fhir+json
[other headers]
~~~

**Response body**

The new report is in the search set. Earlier notes for the patient are omitted here, and the matched resource is abbreviated.

~~~json
{
  "resourceType": "Bundle",
  "type": "searchset",
  "total": 1,
  "link": [
    {
      "relation": "self",
      "url": "https://ehr.example.com/r4/DocumentReference?patient=99feede8-2c8c-4135-92d1-083576edc1f8&category=http%3A%2F%2Fhl7.org%2Ffhir%2Fus%2Fcore%2FCodeSystem%2Fus-core-documentreference-category%7Cclinical-note"
    }
  ],
  "entry": [
    {
      "fullUrl": "https://ehr.example.com/r4/DocumentReference/doc-rpt-202607-0042",
      "resource": {
        "resourceType": "DocumentReference",
        "id": "doc-rpt-202607-0042",
        "status": "current",
        "subject": {
          "reference": "Patient/99feede8-2c8c-4135-92d1-083576edc1f8"
        },
        "date": "2026-07-21T15:30:00Z",
        "content": [
          {
            "attachment": {
              "contentType": "application/pdf",
              "url": "/Binary/doc-rpt-202607-0042-pdf",
              "title": "Cardiology trend report - Vanessa Reyes"
            }
          }
        ]
      },
      "search": {
        "mode": "match"
      }
    }
  ]
}
~~~

The EHR returns the attachment it stored as a `url` to a `Binary` resource rather than inline, which is its choice on read and is not governed by this page. The report is also available to the care team in the patient's chart.
