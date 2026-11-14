{::options toc_levels="1..4"/}

{% include conf_usage_boilerplate.md %}

### Purpose and Scope

This page defines a US Core approach to writing any document type, such as clinical notes, insurance cards, and advance directives, to a FHIR server as `DocumentReference` resources. It does not change how servers return documents in searches. It replaces US Core's Version 9 [Clinical Notes](https://hl7.org/fhir/us/core/STU9/writing-clinical-notes.html) guidance page and adopts conventions used in [Writing Vital Signs] and the [Continuous Glucose Monitoring Implementation Guide].

#### In Scope

* Writing DocumentReference resources using FHIR RESTful `create`
    * Optional `$submit-bundle` transaction
* Server documentation and discovery
* DocumentReference required and Must-Support elements
* Submission Modes
* Corrections and Replacements
* Provenance
* SMART scopes

#### Out of Scope

* Stateful or draft workflows (for example, ambient scribing or continuous audio capture)
* FHIR batch and transaction interactions
* Downstream workflows after a server accepts a document

#### Experimental Topics

* [Application Feature Framework] for real-time discovery.

---

### Definitions

Below is a glossary of terms used on page.

* **Server**: a FHIR Server that creates, updates, and exposes clinical data via FHIR's RESTful APIs
* **App**: Also referred to as a client or application, an app is a software application developed by a vendor that operates with a health data platform or Electronic Health Record (EHR) system to access clinical data.
* **Provider Write**: A provider-facing app adds a document to a patient's record at a practitioner's direction. The document is available through read and search as soon as the server accepts it.
* **Patient Write**: A patient-facing app, used by the patient or an authorized representative, sends a document to the patient's provider. Patient Write covers both Patient Mediated Write and Patient Generated Write. These documents carry the `PATAST` security label.
* **Patient Mediated Write**: A Patient Write where the patient forwards a document that someone else authored, such as a discharge summary from a previous provider. The patient delivers the document but did not create it.
* **Patient Generated Write**: A Patient Write where the patient authored all or part of the content, such as an insurance card photo, an advance directive, or an activity report.
* **Solicited Submissions**: A Patient Write that responds to a provider's request for a specific document, recorded as a `ServiceRequest`. The submitted document references that request in `context.related`. Provider Writes are always treated as solicited.
* **Unsolicited Submissions**: A Patient Write sent without a specific provider request. The server may hold the document for review before it becomes available through read and search.

---

### Writing DocumentReference

This documentation establishes client and server rules and guidance for writing documents to a FHIR server. The FHIR RESTful `create` transport mechanism refers to the ability of a client to instantiate a new resource via HTTP `POST`. It builds directly on the [US Core DocumentReference profile] and [US Core Clinical Notes] guidance. This mechanism allows for simple exchange in scenarios where no additional resources are necessary.

#### `$submit-bundle` Operation

Servers have the option of supporting the [`$submit-bundle` Operation]. It allows additional FHIR resources to be submitted by the client but permits partial acceptance by the server. Servers process the DocumentReference under the same rules as one submitted with RESTful create, including the processing expectation, submission modes, solicitation, and documented support.

---

#### Quick-reference Matrix

Every rule on this page applies to all three [Submission Modes](#submission-modes) unless it appears below. This table lists only the rules and guidance that differ by mode; the [Conformance Requirements](#conformance-requirements) table at the end of the page lists every statement in full, by actor, with the key cited here.

| Key | Rule | Actor | Provider Write | Solicited Patient Write | Unsolicited Patient Write |
| --- | --- | --- | --- | --- | --- |
| [CONF-WD-04], [CONF-WD-05] | Response on a successful write | Server | `201 Created` | `201 Created` | `201 Created` or `202 Accepted` by documented policy |
| [CONF-WD-40], [CONF-WD-44] | Make the document available through read and search without further action | Server | **SHALL** | **SHALL** | Server policy |
| [CONF-WD-50] | Document the review policy for patient submissions | Server | n/a | n/a | **SHALL** |
| [CONF-WD-39] | Support the create scope `user/DocumentReference.c` or `system/DocumentReference.c` | Server | **SHALL** | n/a | n/a |
| [CONF-WD-41], [CONF-WD-51], [CONF-WD-70] | Support the create scope `patient/DocumentReference.c` | Server | n/a | **SHALL** | **SHALL** |
| [CONF-WD-42] | Support the scope `patient/ServiceRequest.rs` | Server | n/a | **SHALL** | n/a |
| [CONF-WD-43] | Make `ServiceRequest` resources with the patient as `performer` available through read and search | Server | n/a | **SHALL** | n/a |
| [CONF-WD-29], [CONF-WD-49] | Populate `context.related`, or the FHIR R5 `basedOn` extension, with the active `ServiceRequest` | Client | n/a | **SHALL** | n/a |
| [CONF-WD-47] | Document whether to populate `context.related` or the FHIR R5 `basedOn` extension | Server | n/a | **SHALL** | n/a |
| [CONF-WD-30], [CONF-WD-48], [CONF-WD-54] | Include `meta.security` = `PATAST` | Client | n/a | **SHALL** | **SHALL** |
| [CONF-WD-31], [CONF-WD-45], [CONF-WD-52] | Do not remove the `PATAST` code | Server | n/a | **SHALL NOT** | **SHALL NOT** |
| [CONF-WD-32], [CONF-WD-46], [CONF-WD-53] | Add the `PATAST` code by policy | Server | n/a | **MAY** | **MAY** |
| - | `author` is the patient, with `launch/patient` as a candidate value | Client | n/a | Guidance | Guidance |
| - | `launch/encounter` is a candidate value for `context.encounter` | Client | Guidance | n/a | n/a |
| - | Support the [DocumentReference Attestor R5 Extension] for document types such as living wills | Server | n/a | n/a | Guidance |
{:.grid}

**Reading this table**

* "Server policy" means the page sets no conformance verb and leaves the behavior to documented server policy. "Guidance" means the page offers guidance for that mode but states no conformance verb. "n/a" means the page states no rule for that mode.
* A category-specific scope can be supported in place of any create scope listed. See [SMART Scopes](#smart-scopes).
* A rule's own preconditions stay in its statement text in the [Conformance Requirements](#conformance-requirements) table - for example, the `.u` scopes are required only of a server that allows status correction or replacement.

---

#### Processing Expectation

Servers accept only the documents that the organization will actually process or review. Patients usually assume that a submitted document reaches their care team. Accepting content that no one will process or review creates a false expectation.

**Requirements**

* Servers **SHALL** support `create` for `DocumentReference`.<sup>[§][CONF-WD-01]</sup>
* Servers **SHALL** only accept documents that the organization can and intends to process or review.<sup>[§][CONF-WD-02]</sup>
* Servers **SHALL NOT** document support for a `DocumentReference` category or type that the organization cannot or does not intend to process or review.<sup>[§][CONF-WD-03]</sup>
* Servers **SHALL** respond `201 Created` with a `Location` header when the document is available on return.<sup>[§][CONF-WD-04]</sup>
* Servers **SHALL** respond `202 Accepted` when it is held for review.<sup>[§][CONF-WD-05]</sup>
* Servers **SHOULD** return an `OperationOutcome` on failed writes.<sup>[§][CONF-WD-06]</sup>


**Guidance**

"Process or review" includes filing an insurance card, routing a document to a later review queue, and rejecting content the deployment cannot handle. A person does not need to inspect every submission. See the [Document Type and Category](#document-type-and-category) below for specific guidance on categories and types. To comply with the US Core [Clinical Notes](clinical-notes.html#fhir-resources-to-exchange-clinical-notes) requirements, servers are required to also create `DiagnosticReport` instances for certain scanned report types.


Whether the server returns a `201 Created` or a `202 Accepted` depends on the Submission mode:

| Submission Mode | Response | Available through read and search |
| --- | --- | --- |
| Provider Write (always solicited) | `201 Created` | Immediately |
| Patient Solicited | `201 Created` | Immediately |
| Patient Unsolicited | `201 Created` or `202 Accepted` | Server policy |
{:.grid}

See the Submission Modes Section below for further guidance and examples.

---

#### Discovery

For integrated-application workflows (for example, provider-facing apps), capabilities are negotiated while working through integration and runtime advertisement and client discovery is not needed. However, for patient-facing applications, runtime advertisement and client discovery are critical to proper function.

**Requirements**

- Servers **SHALL** publish API documentation covering supported categories and types, MIME types, size limits, `$submit-bundle` support, and review policy.<sup>[§][CONF-WD-07]</sup>
- Servers **SHOULD** support `ValueSet/$expand` with `contextDirection=incoming`.<sup>[§][CONF-WD-08]</sup>


**Guidance**

The rules on this page do not require a server to support any particular category, type, or MIME type. See the [Document Type and Category](#document-type-and-category) below for specific guidance on these parameters. How a Client can determine the note and report types supported by a server using the `ValueSet/$expand` operation is described on the [Clinical Notes](clinical-notes.html#using-expand) page.

Note that the FHIR R5 based [Application Feature Framework](https://hl7.org/fhir/uv/application-feature/) can also express support and enumerate specific types and categories. A worked example is provided [here](application-feature.html)

---

#### Required and Must-Support Elements

This section builds directly on the [US Core DocumentReference profile]. It adds the following rules, guidance, and terminology to facilitate document write exchange. Note that this guidance also aligns with the [US Core ADI DocumentReference Profile].

##### US Core Must Support and Writing

All US Core Profiles identify elements with a must-support flag that imposes conformance requirements on both the client and server. However, the US Core [Must Support] definition is framed entirely in terms of **requesters and responders** - reading or returning data. None of its provisions is scoped to writing. The following clarifications apply for the purposes of this guidance:

* Unless the element has a minimum cardinality greater than 0, a submitted `DocumentReference` that omits a must-support element is still conformant.
* Servers can accept resources that omit must-support elements and might reject a submission because of a business rule whether or not it is a must-support element.

---

##### Document Type and Category

The `DocumentReference.type` and `DocumentReference.category` elements are necessary for understanding what the document is. They are used by a server to advertise support and by a client to identify the contents of its submission.

* `category` is the *broad* classification used to determine what kind of data is being presented. It is the primary signal for routing, for workflow selection, and as the entry point for discovering supported types. A DocumentReference instance can have multiple categories.
* `type` is the *specific* classification used to identify the exact contents of the document. A DocumentReference instance can only have one type and is bound to [LOINC document types](https://loinc.org/kb/users-guide/document-ontology) or the concept "unknown".

**Client Requirements**

* Clients **SHALL** populate at least one `category` and a `type` on submission.<sup>[§][CONF-WD-09]</sup>


**Server Requirements**

* Servers **SHALL** publish API documentation covering supported categories and types.<sup>[§][CONF-WD-10]</sup>
* Servers **SHALL** support at least one category.<sup>[§][CONF-WD-11]</sup>
* Servers **SHALL NOT** reject a submission with unsupported category codes if it contains at least one category code (as a repeating element) they support.<sup>[§][CONF-WD-12]</sup>
* Servers **SHALL NOT** reject a submission with unsupported type codes if it contains at least one code translation they support.<sup>[§][CONF-WD-13]</sup>
* Servers **SHOULD** preserve the submitted coding(s) as received.<sup>[§][CONF-WD-14]</sup>

**Guidance**

* Server documents the specific `type` codes for each supported `category` such that a patient is capable of selecting appropriate content. A server is not expected to accept categories and types it does not natively support.
* Because `type` and `category` are CodeableConcept datatypes, clients might populate the specific advertised coding and include the other codes in the same coding array as translations.

The codes listed in this section are a **starter set of recommendations, not conformance requirements.** A server might use some of them or support codes that do not appear here. Actual support is established by what a server documents and advertises.

###### Recommended Categories

Currently, the [US Core DocumentReference Category] value set contains one concept, `clinical-note`, and the [US Core ADI DocumentReference Profile] lists four LOINC codes, including `42348-3` (Advance healthcare directives).

The recommended categories below address what the document is for which drives routing, workflow, and the type discovery described in this guidance.


|Row|Code|System|Display|Definition|
|---|---|---|---|---|
|1|`clinical-note`|`http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category`|Clinical Note|*existing* Purpose - Clinical Note|
|2|`42348-3`|`http://loinc.org`|Advance Healthcare Directives|*existing* Purpose - Advance Healthcare Directives|
|3|`medical-history`|`http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category`|Medical History|Purpose - Medical History|
|4|`insurance-document`|`http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category`|Insurance or Coverage related documentation|Purpose - Insurance or Coverage related documentation|
|5|`identity-document`|`http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category`|Identity documentation|Purpose - Identity documentation|
{:.grid}

<!-- |6|`structured-document`|`http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category`|Structured Document|Structure - Structured Document|
|7|`unstructured-document`|`http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category`|Unstructured Document|Structure - Unstructured Document| -->


<!-- **On code system choice.** The categories in this value set use generic US Core codes rather than LOINC. At the category level readers act on the `display` rather than the code value, and a generic code avoids asserting a LOINC semantic that does not quite fit a broad routing classification. -->

###### Recommended Types

The US Core DocumentReference Profile `DocumentReference.type` has a required binding to the [US Core DocumentReference Type] value set, which is composed of [LOINC document types](https://loinc.org/kb/users-guide/document-ontology) plus the concept "unknown". (the US Core ADI DocumentReference Profile [Advance Healthcare Directive Categories] value set is a subset).

The recommended types below are grouped by category.



- **Category `clinical-note`:** The [US Core Clinical Notes](clinical-notes.html) page defines the eleven *Common Clinical Notes* types. For other note types, use codes from the [US Core DocumentReference Type] value set.

- **Category LOINC `42348-3` (Advance healthcare directives):** Use LOINC codes drawn from the [Advance Healthcare Directive Document Types Grouper] value set.

- **Categories `medical-history`, `insurance-document`, and `identity-document`:** Supported types are established entirely through server advertisement and are drawn from the [US Core DocumentReference Type] value set.

  For example:

    | Category | Code | Display |
    | --- | --- | --- |
    | `insurance-document` / `identity-document` | `64290-0` | Health insurance card |
    | `medical-history` | `73985-4` | Exercise activity |
    | `medical-history` | `55424-6` | Calories burned in unspecified time by Pedometer |
    {:.grid}

###### When No Standard Type Code Exists

US Core DocumentReference Profile required binding on `DocumentReference.type` means a submission with no conformant coding cannot satisfy the US Core profile.

Where a document type genuinely has no suitable LOINC code and uses a local concept, a server might choose to support that submission as a non-conformant US Core profile.

Alternatively, to satisfy the required binding, a locally-defined coding can be accompanied by a generic "catch-all" coding from the value set as a code translation. For example, these LOINC codes might be used:

| Category | Code | Display |
| --- | --- | --- |
| `medical-history` | 11503-0 | Medical records |
| `medical-history` | 47045-0 | Study report |
{:.grid}

###### Type Granularity and Mapping

When reading documents, a server commonly collapses several internal document types into a single standard code - for example, mapping ten local progress note variants onto LOINC `11506-3`. That collapse is lossy and **cannot be reversed on write**: a server receiving only `11506-3` has no way to recover whether the source meant a pediatric or an adult progress note, and is forced to select a default.

The submitting system usually knows the correct granular answer. By populating the most specific advertised type coding, and including a more specific code in the same `type.coding` array as a translation, the granularity is preserved.


---

#### References: Author and Context.encounter

**Client Requirements**

* Clients **SHALL** be capable of populating `author` and `context.encounter` when they are known.<sup>[§][CONF-WD-15]</sup>
* When a Client populates `.author` or `.context.encounter`, `.reference` **SHALL** be either a relative reference to a resource on the Server or a reference to a contained resource.<sup>[§][CONF-WD-16]</sup>
* When a Client populates `.author` or `.context.encounter`, `.display` **SHOULD** be populated.<sup>[§][CONF-WD-17]</sup>

**Server Requirements**

* Servers **SHALL** accept both relative references to resources on the server and references to contained resources for `author` and `context.encounter`.<sup>[§][CONF-WD-18]</sup>
* Servers **SHALL NOT** reject a submission solely because an `author` or `context.encounter` reference cannot be resolved.<sup>[§][CONF-WD-19]</sup>
* Servers **SHOULD** attempt to match `author` and `context.encounter` references to existing resources.<sup>[§][CONF-WD-20]</sup>
* Servers **MAY** persist the content of a contained `author` or `Encounter` resource.<sup>[§][CONF-WD-21]</sup>
* Servers **MAY** require `context.encounter` by business rule.<sup>[§][CONF-WD-22]</sup>

**Guidance**


- For SMART apps, the `launch/patient` context value is a candidate for `author` when the patient is the author, and the `launch/encounter` context value is a candidate for `context.encounter`.
- Relative references point to resources that already exist on the server, for example `Practitioner/123` or `Encounter/123`. When the author or encounter has no server-side resource to reference, the client includes it as a contained resource and references it by its local id, for example `#prac1` or `#enc1`.
- Note that a server can require an encounter association and still accept a reference it cannot resolve.

---

##### Date Handling

**Client Requirements**

* Clients **SHALL** use `context.period` to convey the clinically relevant time period.<sup>[§][CONF-WD-23]</sup>

**Guidance**

`DocumentReference.date` is when the `DocumentReference` was created, not when the content was authored. `DocumentReference.content.attachment.creation` is when the attached content was first created. This guidance introduces no other authored-date element.

---

##### Identifier

*TODO align with outcome of [FHIR-58142](https://jira.hl7.org/browse/FHIR-58142).*

**Client Requirements**

* Clients **SHOULD** populate `identifier` with a value that is unique to the document and stays the same if the document is resubmitted.<sup>[§][CONF-WD-24]</sup>

**Server Requirements**

* Servers **SHALL** support conditional create (`If-None-Exist`).<sup>[§][CONF-WD-25]</sup>
* Servers **MAY** detect duplicates using identifiers, hashes, or other methods.<sup>[§][CONF-WD-26]</sup>

**Guidance**

Conditional create prevents duplicates only when the client populates `identifier`. For example: `If-None-Exist: identifier=http://example.org/docs|DS-2026-06-30-117`.
 Duplicate detection protects against network retries and resubmissions of the same document. It doesn't replace the `relatesTo` replacement mechanism for revised documents.



<div class="bg-warning" markdown="1">

##### Content.format

* Clients **SHOULD** populate `content.format` for additional detail.<sup>[§][CONF-WD-27]</sup>
* Servers **SHALL** persist and round-trip `content.format` when provided.<sup>[§][CONF-WD-28]</sup>

Structured formats such as CDA are identified by `content.format`.

Where does CDA go? Writing Clinical Notes still carries the CDA SHOULD. If this page replaces Writing Clinical Notes, that statement disappears. The proposed structured-document category also implies structured content is in scope. Either add "Servers SHOULD accept application/xml with a CDA content.format code for the clinical-note category," or state explicitly that structured documents are out of scope.


</div><!-- bg-warning -->


##### Context.related

**Client Requirements**

* Clients **SHALL** populate `context.related` with a relative reference to the `ServiceRequest` when the document responds to a solicited request.<sup>[§][CONF-WD-29]</sup>

**Guidance**

* See the Submission Modes section below for further guidance and examples.
* Other context elements might be populated, but this guidance is silent on them.

---

##### Patient-asserted Signaling

**Client Requirements**

* Clients **SHALL** include `meta.security` with the code `PATAST` from `http://terminology.hl7.org/CodeSystem/v3-ObservationValue` when the content is patient-supplied.<sup>[§][CONF-WD-30]</sup>

**Server Requirements**

* Servers **SHALL NOT** remove the `PATAST` code.<sup>[§][CONF-WD-31]</sup>
* Servers **MAY** add the `PATAST` code by policy.<sup>[§][CONF-WD-32]</sup>

**Guidance**

Patient-supplied content includes both Patient Mediated Write and Patient Generated Write submissions. See the Submission Modes section below for further guidance and examples. Because servers don't remove the code, it can be relied on to tell where the content came from.

An example of a server policy is adding `PATAST` to every submission made with a `patient/` scope.

---

##### MIME Support

**Server Requirements**

* Servers **SHALL** accept at least one of `text/plain; charset=utf-8`, `application/pdf`, `image/jpeg`, or `image/png` for each supported document type.<sup>[§][CONF-WD-33]</sup>
* Servers **SHALL** document the MIME types they accept for each supported document type.<sup>[§][CONF-WD-34]</sup>

**Guidance**

Typical choices are `application/pdf` for forms and reports, `image/jpeg` or `image/png` for photos and scans such as insurance cards, and `text/plain; charset=utf-8` for narrative notes.

---

##### Size Limits

**Server Requirements**

* Servers **SHALL** accept inline `content.attachment.data` whose decoded content is at least 5 MiB (5,242,880 bytes).<sup>[§][CONF-WD-35]</sup>
* Servers **SHALL** document their attachment size limits.<sup>[§][CONF-WD-36]</sup>
* Servers **SHALL NOT** expose a client-supplied `content.attachment.url` to later readers.<sup>[§][CONF-WD-37]</sup>
* Servers **MAY** accept content by `content.attachment.url`, including content larger than their inline limit.<sup>[§][CONF-WD-38]</sup>

**Guidance**

The 5 MiB limit applies to the decoded content, matching the meaning of `Attachment.size`. Base64 encoding adds about 33%, so the request body is larger.
A server that accepts `url` content retrieves and stores it. Later readers get the server's copy, not the client's link.

---

#### Submission Modes

This section illustrates the following write submission modes and documents their unique rules and guidance:

- Provider Write
- Solicited Patient Write
- Unsolicited Patient Write (Including Patient Mediated Write)

Each use case shows the interaction and an example.

##### Provider Write

A provider-facing app adds a document to a patient's record at a practitioner's direction. The document is available through the FHIR Server that created it exposing data via its FHIR's RESTful read and search API.

###### Additional Rules and Guidance for Provider Write

Authorization:
- Scopes: servers **SHALL** support FHIR RESTful create using `<user|system>/DocumentReference.c`, or category-specific version(s) such as `<user|system>/DocumentReference.c?category=clinical-note`.<sup>[§][CONF-WD-39]</sup>

FHIR RESTful API:
- Servers **SHALL** make the document available through read and search without further action. The response is always `201`.<sup>[§][CONF-WD-40]</sup>

DocumentReference Elements:
- The `launch/encounter` parameter that an app includes in its SMART authorization request is a candidate value for `context.encounter`.

Example: *A cardiologist uses an analytics app launched from the EHR to save a PDF trend report to a patient's record.*


<div class="mermaid">
sequenceDiagram
  actor Clinician
  participant EHR as EHR (FHIR Server)
  participant App as Provider App
  Note over Clinician,EHR: Clinician opens the app<br/>from the patient's chart
  EHR->>App: SMART EHR launch (iss, launch)
  App->>EHR: Authorize (user/DocumentReference.c)
  EHR-->>App: Access token with patient and encounter context
  App->>EHR: POST DocumentReference (application/pdf)
  EHR-->>App: 201 Created, Location
  App->>EHR: GET DocumentReference?patient=[id]
  EHR-->>App: Bundle including the new report
  Note over EHR: The report is also available in the patient's chart
</div>

<!-- [Provider Write Example](https://hackmd.io/du8wR0xiSCKQwaHg3M88Sw) -->

{% include examplebutton.html example="provider-write-example" b_title = "Click Here To See the Provider Write Example" %}

##### Solicited Patient Write

A patient-facing app sends a patient-authored document to the patient's provider in response to a provider's request - recorded as a `ServiceRequest`. The document is available through the FHIR Server that created it exposing data via its FHIR's RESTful read and search API.

###### Additional Rules and Guidance for Solicited Patient Write

Authorization:
- Scopes: servers **SHALL** support `patient/DocumentReference.c`, or category-specific version(s) such as `patient/DocumentReference.c?category=clinical-note`.<sup>[§][CONF-WD-41]</sup>
- Scopes: servers **SHALL** support `patient/ServiceRequest.rs`.<sup>[§][CONF-WD-42]</sup>

FHIR RESTful API:

- Servers **SHALL** make the `ServiceRequest` resources with the patient as `performer` available through read and search.<sup>[§][CONF-WD-43]</sup>
- Servers **SHALL** make the document available through read and search without further action. The response is `201`.<sup>[§][CONF-WD-44]</sup>


ServiceRequest Elements:
- The `ServiceRequest.code` provides the specific document LOINC or local type code.
- The `ServiceRequest.performer` is the patient. The `launch/patient` parameter that an app includes in its SMART authorization request is a candidate value for this element.
- To create a standing order such as a weekly report, set `ServiceRequest.status` to "active" and define the repeat with `ServiceRequest.occurrenceTiming.repeat`.

DocumentReference Elements:
- Servers **SHALL NOT** remove `meta.security` = "PATAST".<sup>[§][CONF-WD-45]</sup>
- Servers **MAY** add `meta.security` = "PATAST" by policy (for example, based on authorization context), even if it is omitted by the client.<sup>[§][CONF-WD-46]</sup>
- Servers **SHALL** document whether to populate the active `ServiceRequest` in `context.related`, or the FHIR R5 `basedOn` extension.<sup>[§][CONF-WD-47]</sup>
- Clients **SHALL** include `meta.security` = "PATAST" (Patient asserted).<sup>[§][CONF-WD-48]</sup>
- Clients **SHALL** populate `context.related` or the FHIR R5 `basedOn` extension with the active `ServiceRequest` that requests it.<sup>[§][CONF-WD-49]</sup>

- `DocumentReference.author` is the patient. The `launch/patient` parameter that an app includes in its SMART authorization request is a candidate value for this element.

Example: *A provider asks a patient to send weekly activity reports from her fitness tracker, and the patient's app submits each report in response to that request.*


<div class="mermaid">
sequenceDiagram
    actor Clinician
    actor Patient
    participant Server as Provider FHIR Server
    participant App as Patient App
    Note over Clinician,Server: Clinician orders weekly<br/>activity reports in the EHR
    Patient->>App: Open app
    App->>Server: GET ServiceRequest?patient=[id]&code=[code]
    Server-->>App: Active ServiceRequest
    App->>Server: POST DocumentReference (context.related to ServiceRequest)
    Server-->>App: 201 Created, Location
    Note over Server: Available to the requesting provider
</div>

<!-- [Solicited Patient Write Example](https://hackmd.io/OCxcppCoTYKqfkbn5UBPMQ) -->

{% include examplebutton.html example="solicited-patient-write-example" b_title = "Click Here To See the Solicited Patient Write Example" %}

##### Unsolicited Patient Write

A patient-facing app sends a document to the patient's provider without a specific provider request. The document can be patient-generated, where the patient authored all or part of the content, or patient-mediated where a patient-facing app, used by the patient or an authorized representative, forwards a document to the patient's provider that someone else authored. Servers commonly treat them the same, and might hold the document for review before it becomes available through read and search.

###### Additional Rules and Guidance for Unsolicited Patient Write

Business Rules:

- Availability through read and search is based on server policy.

Discovery:

- Servers **SHALL** document their review policy for patient submissions.<sup>[§][CONF-WD-50]</sup>

Authorization:

- Scopes: servers **SHALL** support `patient/DocumentReference.c`, or category-specific version(s) such as `patient/us-core-documentreference-category|clinical-note`.<sup>[§][CONF-WD-51]</sup>

FHIR RESTful API:

- The response is `201` or `202` depending on documented server policy.

DocumentReference Elements:

- Servers **SHALL NOT** remove `meta.security` = "PATAST".
- Servers **MAY** add `meta.security` = "PATAST" by policy (for example, based on authorization context), even if it is omitted by the client.
- Clients **SHALL** include `meta.security` = "PATAST" (Patient asserted).

- `DocumentReference.author` is the patient. The `launch/patient` parameter that an app includes in its SMART authorization request is a candidate value for this element.
- The [DocumentReference Attestor R5 Extension] can also be supported for specific document types like living wills.

Example 1: *A patient uses an app to send her advance directive, prepared by her attorney, to her provider as a PDF.*

<div class="mermaid">
sequenceDiagram
    actor Patient
    participant App as Patient App
    participant Server as Provider FHIR Server
    Patient->>App: Select living will PDF
    App->>Server: GET ValueSet/$expand (ADI document types, incoming)
    Server-->>App: Accepted ADI document types
    App->>Server: POST DocumentReference
    Server-->>App: 202 Accepted
    Note over Server: Held for staff review before filing
</div>

<!-- [Unsolicited Patient Write Example 1](https://hackmd.io/84hr95EWQlKmP_fcdzEy9Q) -->

{% include examplebutton.html example="unsolicited-patient-write-example1" b_title = "Click Here To See the Unsolicited Patient Write Example 1" %}

Example 2: *Before a checkup, a patient uses his provider's portal app to send a photo of his new insurance card.*

<div class="mermaid">
sequenceDiagram
    actor Patient
    participant App as Portal App
    participant Server as Provider FHIR Server
    Patient->>App: Photograph new insurance card
    App->>Server: POST DocumentReference (image/png)
    Server-->>App: 201 Created, Location
    Note over Server: Filed for registration staff
</div>

<!-- [Unsolicited Patient Write Example 2](https://hackmd.io/jaSQ7-r0Q2eQvvnQIgqqqQ) -->

{% include examplebutton.html example="unsolicited-patient-write-example2" b_title = "Click Here To See the Unsolicited Patient Write Example 2" %}


Example 3 (Patient Mediated Write): *A patient forwards a discharge summary from another hospital. The hospital is the author, and the document was written a month before it was sent.*

<div class="mermaid">
sequenceDiagram
    actor Patient
    participant App as Patient App
    participant Server as Provider FHIR Server
    Patient->>App: Retrieve discharge summary from previous hospital
    App->>Server: POST DocumentReference (author contained Organization)
    Server-->>App: 202 Accepted
    Note over Server: Clinician reviews before adding to chart
</div>

<!-- [Unsolicited Patient Write Example 3](https://hackmd.io/uEf7XBncRkm_CYHLVrxlAg) -->

{% include examplebutton.html example="unsolicited-patient-write-example3" b_title = "Click Here To See the Unsolicited Patient Write Example 3 (Patient Mediated Write)" %}

---

#### Corrections and Replacements

This section establishes client and server rules and guidance for correcting documents after they have been written to a FHIR server. A client can retract a document by changing its `status` to `entered-in-error` with the FHIR RESTful `patch` or `update` interaction, or supersede it by creating a new `DocumentReference` that replaces the original. Both mechanisms tell the server and later readers what happened to the document. What a server does next, such as archiving the original or notifying users, is server policy.

**Client Requirements**

*Retraction*

* To mark a document as entered in error, clients **SHALL** use either a `patch` that changes only `status` to `entered-in-error`, or an `update` that sends the complete resource with only `status` changed.<sup>[§][CONF-WD-55]</sup>

*Replacement*

* To supersede a document, clients **SHOULD** create a new `DocumentReference` with `relatesTo.code` = `replaces` and `relatesTo.target` referencing the original.<sup>[§][CONF-WD-56]</sup>
* A replacing document **SHALL** contain the complete revised content, not only the changes.<sup>[§][CONF-WD-57]</sup>
* Clients **SHOULD** also populate `relatesTo.target.identifier` with the original document's `identifier` when it has one.<sup>[§][CONF-WD-58]</sup>

**Server Requirements**

*Retraction*

* Servers **SHOULD** allow the submitting client to change `status` to `entered-in-error` through `patch`.<sup>[§][CONF-WD-59]</sup>
* Servers **MAY** allow the submitting client to change `status` to `entered-in-error` through `update`.<sup>[§][CONF-WD-60]</sup>
* Servers **SHALL** continue to return an `entered-in-error` document through read for authorized requests.<sup>[§][CONF-WD-61]</sup>
* Servers **MAY** exclude `entered-in-error` documents from search results.<sup>[§][CONF-WD-62]</sup>

*Replacement*

* Servers **SHALL** accept `relatesTo` on create and return it unchanged on read and search.<sup>[§][CONF-WD-63]</sup>
* Servers **MAY** ignore the replacement relationship in their own processing.<sup>[§][CONF-WD-64]</sup>

---

#### Provenance

Every document needs to answer a few basic questions: who wrote it, when it was created, and where it came from. This section answers them using "small-p" provenance elements in the `DocumentReference` itself. Although a separate `Provenance` resource might not be needed for a simple submission, this section does not replace it or US Core [Basic Provenance].

##### Provenance-bearing Elements

*This table maps each provenance question to the `DocumentReference` element that answers it. The example use cases show these elements together.*

| Question | Element |
| --- | --- |
| Who authored the content? | `author` |
| Who attested to the content? | `authenticator`, R5 `attester` cross-version extension |
| Is this patient-asserted? | `meta.security` = `PATAST` |
| When was the content created? | `content.attachment.creation` |
| What period does the content cover? | `context.period` |
| How does the source system identify the document? | `identifier` |
| What was this submitted in response to? | `context.related` |
| What does this supersede? | `relatesTo` |
| Who is the patient according to the originating system? | `context.sourcePatientInfo` |
{:.grid}


**Server Requirements**

* Servers **SHALL** persist the submitted Provenance-bearing elements, and return them unchanged on read and search, including elements they don't otherwise process.<sup>[§][CONF-WD-65]</sup>
* Servers **SHALL NOT** reject a submission solely because a provenance element is absent or cannot be resolved.<sup>[§][CONF-WD-66]</sup>
* Servers **SHALL NOT** replace a client-supplied `author` with the authenticated client or user.<sup>[§][CONF-WD-67]</sup>
* Servers **MAY** populate `custodian` with the receiving organization when they accept a document.<sup>[§][CONF-WD-68]</sup>
* Servers **MAY** create a [US Core Provenance Profile] resource targeting the created `DocumentReference`.<sup>[§][CONF-WD-69]</sup>

**Guidance**

* Populating `custodian` on acceptance is one way a server can meet the existing US Core requirement that every `DocumentReference` have a responsible organization. See Open Question 1 below.
* The person or app that submits a document is often not its author. A patient forwarding a discharge summary, for example, is not the hospital that wrote it. Replacing `author` with the submitter would erase the distinction this section exists to preserve.


---

#### Authorization (SMART on FHIR Scopes)

Apps need write permission for `DocumentReference`. SMART scopes allow access permissions to be delegated to a client application. Servers can grant SMART v2 create/update scopes for DocumentReference or category-specific scopes, and advertise them in `/.well-known/smart-configuration`.

##### SMART Scopes

**Server Requirements**

* Servers **SHALL** support the `patient/DocumentReference.c` or category-specific scopes for Patient Write.<sup>[§][CONF-WD-70]</sup>
* Servers **SHALL** support the `user/DocumentReference.c` or category-specific scopes for Provider Write.<sup>[§][CONF-WD-71]</sup>
* Servers **SHALL** support the `system/DocumentReference.c` or category-specific scopes for backend services that write documents.<sup>[§][CONF-WD-72]</sup>
* Servers that allow status correction or replacement **SHALL** support the matching `.u` scopes.<sup>[§][CONF-WD-73]</sup>
* Servers **SHALL** list their supported scopes in `scopes_supported` in `/.well-known/smart-configuration`.<sup>[§][CONF-WD-74]</sup>

**Guidance**

* The `.u` scope covers both the `patch` and `update` interactions used for status correction. See [Corrections and Replacements](#corrections-and-replacements).
* A category-specific scope limits write permission to one category.

    Recommended category-specific scopes

    * Clinical Note
      * `<patient|user|system>/DocumentReference.c?category=http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category|clinical-note`
      * `<patient|user|system>/DocumentReference.u?category=http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category|clinical-note`
    * Advance Healthcare Directives
      * `<patient|user|system>/DocumentReference.c?category=http://loinc.org|42348-3`
      * `<patient|user|system>/DocumentReference.u?category=http://loinc.org|42348-3`
    * Medical History
      * `<patient|user|system>/DocumentReference.c?category=http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category|medical-history`
      * `<patient|user|system>/DocumentReference.u?category=http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category|medical-history`
    * Insurance Document
      * `<patient|user|system>/DocumentReference.c?category=http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category|insurance-document`
      * `<patient|user|system>/DocumentReference.u?category=http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category|insurance-document`
    * Identity Document
      * `<patient|user|system>/DocumentReference.c?category=http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category|identity-document`
      * `<patient|user|system>/DocumentReference.u?category=http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category|identity-document`

---



#### Conformance Requirements

*This table lists every conformance statement on this page, by actor. Each statement is footnoted where it is written on the page with a <sup>&sect;</sup> marker linking to its row here.*

<!-- BEGIN conformance requirements table -- rendered by Liquid from input/data/writing_documents_requirements.csv -->

**Legend**

* **Key** - the requirement key, `CONF-WD-NN`. It is the anchor target of the <sup>&sect;</sup> footnote marker that follows the statement where it is written on this page.
* **Mode** - `ALL` applies to every submission mode. `PROV` [Provider Write](#provider-write), `SPAT` [Solicited Patient Write](#solicited-patient-write), `UPAT` [Unsolicited Patient Write](#unsolicited-patient-write), `PAT` both patient modes. A statement in a general section is `ALL` unless it is scoped tighter.
* **Conformance** - the RFC 2119 verb as written in the statement.
* **Conditional** - <span style="color:green; font-size:1.5em">&#10004;</span> marks a statement with a precondition in its text, for example "when it is held for review". A "-" means the statement applies whenever its mode applies.
* &dagger; - the statement sits in an unresolved block on this page and is not settled.

<!-- ========================================================
The liquid syntax below renders the conformance requirements table.
The source is a csv file at input/data/writing_documents_requirements.csv,
which is maintained by hand, the same way input/data/us_core_requirements.csv
is maintained for the main specification's requirements table. There is no
script. See the README section "Maintaining the Writing Documents Conformance
Table" for the editing checklist.

Each statement on this page carries a footnote marker immediately after it:

  Servers **SHALL** support `create` for `DocumentReference`.<sup>[§][CONF-WD-01]</sup>

The reference-style link definition that resolves [CONF-WD-01] is generated for
every active key in this csv by input/includes/requirements-link-list.md, which
input/includes/link-list.md includes at the bottom of every page. The link
target is writing-documents.html#CONF-WD-NN, which is the id on the table row
below. Unlike the main specification's keys, these keys get no `{: #key}`
attribute list in that include: it would put the same id on the footnote
anchor, ahead of the row in document order, so the footnote would link to
itself instead of to the table row.

A statement that repeats verbatim elsewhere on the page is footnoted at its
first occurrence only; the later occurrences keep their own rows and keys in
the table but carry no marker. CONF-WD-52, CONF-WD-53, and CONF-WD-54 are the
repeats, of CONF-WD-45, CONF-WD-46, and CONF-WD-48 in the Solicited Patient
Write section.

writing_documents_requirements.csv columns:
- key: the requirement key, "CONF-WD-NN". Assigned once from this append-only
  csv and never renumbered, so a tracker or test plan can cite it. A statement
  keeps its key when it is reworded or moved to another section; only a full
  rewrite draws a new key. A deleted statement keeps its row with
  status = retired rather than freeing its number.
- actor: Client or Server. The "**Client Requirements**" or
  "**Server Requirements**" block the bullet sits under, or the subject of the
  sentence in the per-mode sections, which do not use those block headers.
- mode_code: the submission mode the statement applies to. ALL, PROV
  (Provider Write), SPAT (Solicited Patient Write), UPAT (Unsolicited
  Patient Write), or PAT (both patient modes). A statement in a general
  section is ALL. PAT has to be set deliberately, since no single section
  spans the two patient modes.
- conformance: the RFC 2119 verb as written in the statement: SHALL,
  SHALL NOT, SHOULD, MAY.
- conditionality: "Yes" when the statement carries a precondition in its
  text, for example "when it is held for review".
- requirement: a direct quote of the statement from this page. Markdown.
  Reference-style links are expanded to inline links, because the cell is
  rendered on its own by markdownify and link-list.md is not in scope.
  The footnote marker is not part of the quote.
- section: the title of the section the statement came from.
- section_anchor: that section's generated id, used for the link back.
- unresolved: "yes" when the statement sits in an unresolved block on
  this page. Rendered as a dagger beside the key.
- mode: the full name of the per-mode section, empty in a general section.
- mode_code_auto, conditionality_auto: historical columns, holding what the
  retired generator script derived for mode_code and conditionality when the
  row was first written. Not read by the table.
- status: active or retired. Retired rows are kept for their keys only and
  are not published in the table.
- match_key: normalized statement text plus section. A historical column from
  the retired generator script, which used it to match a row to its bullet.
  Not read by the table.

The liquid below retrieves, sorts, and selects the table data.
==============================================================-->

{% assign rows = site.data.writing_documents_requirements -%}
{% assign actors = "Client,Server" | split: "," %}
<table class="grid">
<thead>
  <tr>
    <th>Key</th>
    <th>Actor</th>
    <th>Mode</th>
    <th>Conformance</th>
    <th>Conditional</th>
    <th>Requirement</th>
    <th>Section</th>
  </tr>
</thead>
<tbody>
{% for actor in actors -%}
{% assign actor_rows = rows | where: "actor", actor | where: "status", "active" | sort: "key" -%}
{% for item in actor_rows -%}
  <tr id="{{ item.key }}">
    <td>{{ item.key }}{% if item.unresolved == "yes" %} &dagger;{% endif %}</td>
    <td>{{ item.actor }}</td>
    <td>{{ item.mode_code }}</td>
    <td><strong>{{ item.conformance }}</strong></td>
    <td style="text-align: center;">{% if item.conditionality == "Yes" %}<span style="color:green; font-size:1.5em">&#10004;</span>{% else %}-{% endif %}</td>
    <td>{{ item.requirement | markdownify }}</td>
    <td><a href="#{{ item.section_anchor }}">{{ item.section }}</a></td>
  </tr>
{% endfor -%}
{% endfor -%}
</tbody>
</table>

<!-- =============================== end liquid =================================== -->

<!-- END conformance requirements table -->

---

#### Open Questions

The following items are unresolved.

1. How to meet US Core's DocumentReference "responsible-organization requirement"?

   The US Core DocumentReference guidance requires that every `DocumentReference` have a responsible `Organization`, present either in `DocumentReference.custodian` or in a `Provenance` resource targeting the document. For patient-generated and patient-mediated writes there is no responsible organization at the time of submission.

2. When is discovery needed?

   If pre-coordination is required, runtime discovery adds machinery without removing the coordination step.

3. What about per-organization discovery versus network-level requirements?

4. What are the DocumentReference categories candidates?

5. Is there a need for a separate DocumentReference write profile?

6. Are structured documents like CDA and FHIR in scope?

---

{% include link-list.md %}
