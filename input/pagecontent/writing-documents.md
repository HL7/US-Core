{::options toc_levels="1..4"/}

{% include conf_usage_boilerplate.md %}

### Purpose and Scope

This page replaces the [US Core Writing Clinical Notes](https://hl7.org/fhir/us/core/STU9/writing-clinical-notes.html).
{:.bg-info}

This page defines a US Core approach to writing any document type, such as clinical notes, insurance cards, and advance directives to a FHIR server as `DocumentReference` resources. It does not change how servers return documents in searches.  It complements the [US Core Clinical Notes]guidance and adopts conventions used in [Writing Vital Signs] and the [Continuous Glucose Monitoring Implementation Guide].

#### In Scope

* Writing DocumentReference resources using FHIR RESTful `create`
    * Optional $submit-bundle transaction
* Server documentation and discovery
* DocumentReference required and Must-Support elements
    * Document categories and type
    * Other elements
    * MIME types
    * size limits
* Submission "Modes"
  * Provider Write
  * Patient Write
    * solicited submissions
    * unsolicited submissions
* Corrections and Replacements
* Provenance
* SMART scopes

#### Out of Scope
* Stateful or draft workflows (for example, ambient scribing or continuous audio capture)
* FHIR batch and transaction interactions (see the $submit-bundle` operation)
* Downstream workflows after a server accepts a document

#### Experimental Topics

*  [Application Feature Framework] for real-time discovery.

---

### Definitions

Server
: a FHIR Server that creates, updates, exposes clinical data via FHIR's RESTful APIs

App
: Also referred to as a client or application is a software application developed by a vendor that operates with a health data platform or Electronic Health Record (EHR) system to access clinical data.

Provider Write
: A provider-facing app adds a document to a patient's record at a practitioner's direction. The document is available through read and search as soon as the server accepts it.

Patient Write
: A patient-facing app, used by the patient or an authorized representative, sends a document to the patient's provider. Patient Write covers both Patient Mediated Write and Patient Generated Write. These documents carry the `PATAST` security label.

Patient Mediated Write
: A Patient Write where the patient forwards a document that someone else authored, such as a discharge summary from a previous provider. The patient delivers the document but did not create it.

Patient Generated Write
: A Patient Write where the patient authored all or part of the content, such as an insurance card photo, an advance directive, or an activity report.

Solicited Submissions
: A Patient Write that responds to a provider's request for a specific document, recorded as a `ServiceRequest`. The submitted document references that request in `context.related`. Provider Writes are always treated as solicited.

Unsolicited Submissions
: A Patient Write sent without a specific provider request. The server may hold the document for review before it becomes available through read and search.

---

### Writing DocumentReference

This documentation establishes client and server rules and guidance for writing documents to a FHIR server. The FHIR RESTful `create` transport mechanism refers to the ability of a client to instantiate a new resource via HTTP `POST`. It builds directly on the [US Core DocumentReference profile] and [US Core Clinical Notes] guidance. This mechanism allows for simple exchange in scenarios where no additional resources are necessary.


Servers have the option of supporting the [`$submit-bundle` Operation]. It allows additional FHIR resources to be submitted by the client but permits partial acceptance by server.  Servers process the DocumentReference under the same rules as one submitted with RESTful create, including the processing expectation, submission modes, solicitation, and documented support.

---

#### Quick-reference Matrix

The following table summarizes the conformance rules for writing DocumentReference with one row per rule and one column per mode


    *TODO generate from the markdown text.*

---

#### Processing Expectation

Servers accept only the documents that the organization will actually process or review.  Patients usually assume that a submitted document reaches their care team. Accepting content that no one will process or review creates a false expectation.

**Requirements**

*  Servers **SHALL** support `create` for `DocumentReference`.
* Servers **SHALL** only accept documents that the organization can and intends to process or review.
* Servers **SHALL NOT** document support for a `DocumentReference` category or type that the organization cannot or does not intend to process or review.
* Servers **SHALL** respond `201 Created` with a `Location` header when the document is available on return.
* Servers **SHALL** respond `202 Accepted` when it is held for review.
* Servers **SHOULD** return an `OperationOutcome` on failed writes


**Guidance**

"Process or review" includes filing an insurance card that sits unexamined for months, routing a document to a later review queue, and rejecting content the deployment cannot handle. A person does not need to inspect every submission.  See the [Document Type and Category](#document-type-and-category) below for specific guidance on categories and types. To comply with the US Core [Clinical Notes](clinical-notes.html#fhir-resources-to-exchange-clinical-notes) requirements, servers are required to also create `DiagnosticReport` instances for certain scanned report types.


Whether the server returns a `201 Created` or a `202 Accepted` depends on the Submission mode:

| Submission Mode | Response | Available through read and search |
| --- | --- | --- |
| Provider Write  (always solicited) | `201 Created` | Immediately |
| Patient  Solicited | `201 Created` | Immediately |
| Patient  Unsolicited | `201 Created` or `202 Accepted` | Server policy |

See the Submission Modes Section below for further guidance and examples.

---

#### Discovery

For integrated-application workflows (e.g., provider-facing apps), capabilities are negotiated while working through integration and runtime advertisement and client discovery is not needed. However, for patient-facing applications, runtime advertisement and client discovery are critical to proper function.

**Requirements**

- Servers **SHALL** publish API documentation covering supported categories and types, MIME types, size limits, `$submit-bundle` support, and review policy.
- Servers **SHOULD** support `ValueSet/$expand` with `contextDirection=incoming`.


**Guidance**

The rules on this page do not require a server to support any particular category, type, or MIME type. See the [Document Type and Category](#document-type-and-category) below for specific guidance on these parameters. How a Client can determine the note and report types supported by a server using the `ValueSet/$expand` operation is described on the [Clinical Notes](clinical-notes.html#using-expand) page.

Note that the FHIR R5 based [Application Feature Framework](https://hl7.org/fhir/uv/application-feature/) can also express support and enumerate specific types and categories. A worked example is provided [here](application-feature.html)

---

#### Required and Must-Support Elements

This section builds directly on the [US Core DocumentReference profile]. It adds the following rules, guidance, and terminology to facilitate document write exchange.  Note that this guidance also aligns with the [US Core ADI DocumentReference Profile].

##### US Core Must Support and Writing

All US Core Profiles identify elements with a must support flag that imposes conformance requirements on both the client and server. However, the [US Core Must Support] definition is framed entirely in terms of **requesters and responders** - reading or returning data. None of its provisions is scoped to writing. The following clarifications apply for the purposes of this guidance:

* Unless the element has a minimum cardinality greater than 0, a submitted `DocumentReference` that omits a must-support element is still conformant.
* Servers can accept resources that omit must-support elements and might  reject a submission because of a business rule whether or not it is a must-support element.

---

##### Document Type and Category

The `DocumentReference.type` and `DocumentReference.category` elements are necessary for understanding what the document is. They are used by a server to advertise support and by a client to identify the contents of its submission.

* `category` is the *broad* classification used to determine what kind of data is being presented. It is the primary signal for routing, for workflow selection, and as the entry point for discovering supported types. A DocumentReference instance can have multiple categories.
* `type` is the *specific* classification used to identify the exact contents of the document. A DocumentReference instance can only have one type and is bound to [LOINC Documents types](https://hl7.org/fhir/us/core/ValueSet-us-core-documentreference-type.html) or the concept 'unknown'.

**Client Requirements**

* Clients **SHALL** populate at least one `category` and a `type` on submission.


**Server Requirements**

* Servers **SHALL** publish API documentation covering supported categories and types.
* Servers **SHALL** support at least one category.
* Servers **SHALL NOT** reject a submission with unsupported category codes if it contains at least one category code (as a repeating element) they support.
* Servers **SHALL NOT** reject a submission with unsupported type codes if it contains at least one code translation they support.
* Servers **SHOULD** preserve the submitted coding(s) as received.

**Guidance**

* Server documents the specific`type` codes for each supported `category` such that a patient is capable of selecting appropriate content. A server is not expected to accept categories and types it does not natively support.
* Because `type` and `category` are CodeableConcept datatypes, clients might populate the specific advertised coding and include the other codes in the same coding array as translations.

The codes listed in this section are a **starter set of recommendations, not conformance requirements.** A server might use some of them or support codes that do not appear here. Actual support is established by what a server documents and advertises.

###### Recommended Categories

The [US Core DocumentReference Category] value set, currently contains one concept, `clinical-note`, and the [US Core ADI DocumentReference Profile], currently lists only `42348-3 (Advance Healthcare Directives)`.

The recommended categories below addresses what the document is for which drives routing, workflow, and the type discovery described in this guidance.


|Row|Code|System|Display|Definition|
|---|---|---|---|---|
|1|`clinical-note`|`http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category`|Clinical Note|*existing* Purpose - Clinical Note|
|2|`42348-3`|`http://loinc.org`|Advance Healthcare Directives|*existing* Purpose - Advance Healthcare Directives|
|3|`medical-history`|`http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category`|Medical History|Purpose - Medical History|
|4|`insurance-document`|`http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category`|Insurance or Coverage related documentation|Purpose - Insurance or Coverage related documentation|
|5|`identity-document`|`http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category`|Identity documentation|Purpose - Identity documentation|
<!-- |6|`structured-document`|`http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category`|Structured Document|Structure - Structured Document|
|7|`unstructured-document`|`http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category`|Unstructured Document|Structure - Unstructured Document| -->


<!-- **On code system choice.** The categories in this value set use generic US Core codes rather than LOINC. At the category level readers act on the `display` rather than the code value, and a generic code avoids asserting a LOINC semantic that does not quite fit a broad routing classification. -->

###### Recommended Types

The US Core DocumentReference Profile `document.type` has a required binding to the [US Core Clinical Note Type] value set, which is composed of [LOINC Documents types](https://loinc.org/kb/users-guide/document-ontology) plus the concept "unknown". (The US Core DocumentReference ADI Profile  [Advance Healthcare Directive Categories] value set is a subset )

The recommended types below are grouped by category.



- **Category `clinical-note`:** The [US Core Clinical Notes](clinical-notes.html) page defines the eleven *Common Clinical Notes* types. For other note types, use codes from the [US Core Clinical Note Type] valueset.

- **Category LOINC `42348-3` (Advance healthcare directives):** Use LOINC codes drawn from the [Advance Healthcare Directive Categories] value set.

- **Categories `medical-history`, `insurance-document`, and `identity-document`:** - Supported types are established entirely through server advertisement and are drawn from the [US Core Clinical Note Type] value set.

  For example:

    | Category | Code | Display |
    | --- | --- | --- |
    | `insurance-document` / `identity-document` | `64290-0` | Health insurance card |
    | `medical-history` | `73985-4` | Exercise activity |
    | `medical-history` | `55424-6` | Calories burned in unspecified time by Pedometer |

###### When No Standard Type Code Exists

US Core DocumentReference Profile required binding on `DocumentReference.type` means a submission with no conformant coding cannot satisfy the US Core profile.

Where a document type genuinely has no suitable LOINC code and uses a local concept, a server might choose to support that submission as a non-conformant US Core profile.

Alternatively, to satisfy the required binding, a locally-defined coding can be accompanied by a generic "catch-all" coding from the value set as a code translation. For example, the following LOINC codes:

| Category | Code | Display |
| --- | --- | --- |
| `medical-history` | 11503-0 | Medical records |
| `medical-history` | 47045-0 | Study report |

###### Type Granularity and Mapping

When reading documents, a server commonly collapses several internal document types into a single standard code - for example, mapping ten local progress note variants onto LOINC `11506-3`. That collapse is lossy and **cannot be reversed on write**: a server receiving only `11506-3` has no way to recover whether the source meant a pediatric or an adult progress note, and is forced to select a default.

The submitting system usually knows the correct granular answer. By populating the most specific advertised type coding, and including a more specific code in the same `type.coding` array as a translation, the granularity is preserved.


---

#### References: Author and Context.encounter

**Client Requirements**

* Clients **SHALL** be capable of populating `author` and `context.encounter` when they are known.
* * Clients **SHALL** populate `author.reference` and `context.encounter.reference` with either a relative reference to a resource on the server or a reference to a contained resource.
* Clients **SHOULD** populate `author.display` and `context.encounter.display`.

**Server Requirements**

* Servers **SHALL** accept both relative references to resources on the server and references to contained resources for `author` and `context.encounter`.
* Servers **SHALL NOT** reject a submission solely because an `author` or `context.encounter` reference cannot be resolved.
* Servers **SHOULD** attempt to match `author` and `context.encounter` references to existing resources.
* Servers **MAY** persist the content of a contained `author` or `Encounter` resource.
* Servers **MAY** require `context.encounter` by business rule.

**Guidance**


- For SMART apps, the `launch/patient` context value is a candidate for `author` when the patient is the author, and the `launch/encounter` context value is a candidate for `context.encounter`.
- Relative references point to resources that already exist on the server, for example `Practitioner/123` or `Encounter/123`. When the author or encounter has no server-side resource to reference, the client includes it as a contained resource and references it by its local id, for example `#prac1` or `#enc1`.
- Note that a server can require an encounter association and still accept a reference it cannot resolve.

---

##### Date Handling

**Client Requirements**

* Clients **SHALL** use `context.period` to convey the clinically relevant time period.

**Guidance**

`DocumentReference.date` is when the `DocumentReference` was created, not when the content was authored  `content.attachment.creation` is when the attached content was first created. This guidance introduces no other authored-date element.

---

##### Identifier

*TODO align with outcome of [FHIR-58142](https://jira.hl7.org/browse/FHIR-58142).*

**Client Requirements**

* Clients **SHOULD** populate `identifier` with a value that is unique to the document and stays the same if the document is resubmitted.

**Server Requirements**

* Servers **SHALL** support conditional create (`If-None-Exist`).
* Servers **MAY** detect duplicates using identifiers, hashes, or other methods.

**Guidance**

Conditional create prevents duplicates only when the client populates `identifier`. For example: `If-None-Exist: identifier=http://example.org/docs|DS-2026-06-30-117`.
 Duplicate detection protects against network retries and resubmissions of the same document. It doesn't replace the `relatesTo` replacement mechanism for revised documents.



<div class="bg-warning" markdown="1">

##### Content.format

* Clients **SHOULD** populate `content.format` for additional detail.
* Servers **SHALL** persist and round-trip `content.format` when provided.

Structured formats such as CDA are identified by `content.format`.

Where does CDA go?  Writing Clinical Notes still carries the CDA SHOULD. If this page replaces Writing Clinical Notes, that statement disappears. The proposed structured-document category also implies structured content is in scope. Either add "Servers SHOULD accept application/xml with a CDA content.format code for the clinical-note category," or state explicitly that structured documents are out of scope.


</div><!-- bg-warning -->


##### Context.related

**Client Requirements**

* Clients **SHALL** populate `context.related` with a relative reference to the `ServiceRequest` when the document responds to a solicited request.

**Guidance**

* See the Write Modes Section below for further guidance and examples.
* Other context elements might be populated, but this guidance is silent on them

---

##### Patient-asserted Signaling

**Client Requirements**

* Clients **SHALL** include `meta.security` with the code `PATAST` from `http://terminology.hl7.org/CodeSystem/v3-ObservationValue` when the content is patient-supplied.

**Server Requirements**

* Servers **SHALL NOT** remove the `PATAST` code.
* Servers **MAY** add the `PATAST` code by policy.

**Guidance**

Patient-supplied content includes both Patient Mediated Write and Patient Generated Write submissions. See the Write Modes Section below for further guidance and an examples. Because servers don't remove the code, it can be relied on to tell where the content came from.

An example of a server policy is adding `PATAST` to every submission made with a `patient/` scope.

---

##### MIME Support

**Server Requirements**

* Servers **SHALL** accept at least one of `text/plain; charset=utf-8`, `application/pdf`, `image/jpeg`, or `image/png` for each supported document type.
* Servers **SHALL** document the MIME types they accept for each supported document type.

**Guidance**

Typical choices are `application/pdf` for forms and reports, `image/jpeg` or `image/png` for photos and scans such as insurance cards, and `text/plain; charset=utf-8` for narrative notes.

---

##### Size Limits

**Server Requirements**

* Servers **SHALL** accept inline `content.attachment.data` whose decoded content is at least 5 MiB (5,242,880 bytes).
* Servers **SHALL** document their attachment size limits.
* Servers **SHALL NOT** expose a client-supplied `content.attachment.url` to later readers.
* Servers **MAY** accept content by `content.attachment.url`, including content larger than their inline limit.

**Guidance**

The 5 MiB limit applies to the decoded content, matching the meaning of `Attachment.size`. Base64 encoding adds about 33%, so the request body is larger.
A server that accepts `url` content retrieves and stores it. Later readers get the server's copy, not the client's link.

---

#### Submission Modes

This section illustrates the following write submission modes and documents their unique rules and guidance:

- Provider Write
- Solicited Patient Write
- Unsolicited Patient Write (Including Patient Mediated Write)

Each use case shows the interaction and an example. (Note: The examples`DocumentReference`. Attachment `data` values are truncated placeholders.)


##### Provider Write

A provider-facing app adds a document to a patient's record at a practitioner's direction. The document is available through the FHIR Server that created it exposing data via its FHIR's RESTful read and search API.

###### Additional Rules and Guidance for Provider Write

Authorization:
- Scopes: servers **SHALL** support FHIR RESTful create using `<user|system>/DocumentReference.c`, or category-specific version(s) such as `<user|system>/DocumentReference.c?category=clinical-note`.

FHIR RESTful API:
- Servers **SHALL** make the document available through read and search without further action. The response is always `201`.

DocumentReference Elements:
- The `launch/encounter` parameter that an app includes in its SMART authorization request is a candidate value for `context.encounter`.

Example: *A cardiologist uses an analytics app launched from the EHR to save a PDF trend report to a patient's record.*


<div class="mermaid">
sequenceDiagram
    actor Clinician
    participant EHR as EHR (FHIR Server)
    participant App as Provider App
    Clinician->>EHR: Launch app from patient chart
    EHR->>App: SMART launch (patient, encounter)
    App->>EHR: POST DocumentReference (application/pdf)
    EHR-->>App: 201 Created, Location
    Clinician->>EHR: Search patient documents
    EHR-->>Clinician: Report returned
</div>

<!-- [Provider Write Example](https://hackmd.io/du8wR0xiSCKQwaHg3M88Sw) -->

{% include provider-write-example.md %}

##### Solicited Patient Write

A patient-facing app sends a patient-authored document to the patient's provider in response to a provider's request - recorded as a `ServiceRequest`. The document is available through the FHIR Server that created it exposing data via its FHIR's RESTful read and search API.

###### Additional Rules and Guidance for a Solicited Patient Generated Write

Authorization:
- Scopes: servers **SHALL** support `patient/DocumentReference.c`, or category-specific version(s) such as `patient/DocumentReference.c?category=clinical-note`.
- Scopes: servers **SHALL** support `patient/ServiceRequeset.rs`.

FHIR RESTful API:

- Server **SHALL** make the `ServiceRequest` resources with the patient as `performer` available through read and search .
- Servers **SHALL** make the document available through read and search without further action. The response is `201`.


ServiceRequest Elements:
- The `ServiceRequest.code` provides the specific document type code (either LOINC or local)
- The `ServiceRequest.performer` is the patient. The `launch/patient` parameter that an app includes in its SMART authorization request is a candidate value for this element.
- To create a standing order such as a weekly report, set `ServiceRequest.status` to "active" and define the repeat with `ServiceRequest.ocurrenceTiming.repeat`.

DocumentReference Elements:
- Servers **SHALL NOT** remove `meta.security` = "PATAST".
- Servers **MAY** add `meta.security` = "PATAST" by policy (e.g., based on authorization context), even if it is omitted by the client.
- Servers **SHALL** document whether to popluate the active `ServiceRequest` in context.related` or the FHIR R5 `basedOn` extension.
- Clients **SHALL** include `meta.security` = "PATAST" (Patient asserted).
- Clients **SHALL** populate `context.related` or the FHIR R5 `basedOn` extension with the active `ServiceRequest` that requests it.

- `Document.author` is the patient. The `launch/patient` parameter that an app includes in its SMART authorization request is a candidate value for `author`

Example: *A provider asks a patient to send weekly activity reports from her fitness tracker, and the patient's app submits each report in response to that request.*


<div class="mermaid">
sequenceDiagram
    actor Clinician
    actor Patient
    participant Server as Provider FHIR Server
    participant App as Patient App
    Clinician->>Server: Create ServiceRequest (weekly activity report)
    Patient->>App: Open app
    App->>Server: GET ServiceRequest?patient=[id]&code=[code]
    Server-->>App: Active ServiceRequest
    App->>Server: POST DocumentReference (context.related to ServiceRequest)
    Server-->>App: 201 Created, Location
    Note over Server: Available to the requesting provider
</div>

<!-- [Solicited Patient Write Example](https://hackmd.io/OCxcppCoTYKqfkbn5UBPMQ) -->

{% include solicited-patient-write-example.md %}

##### Unsolicited Patient Write

A patient-facing app sends a document to the patient's provider without a specific provider request. The document can patient-generated where the patient authored all or part of the content, or patient-mediated where a patient-facing app, used by the patient or an authorized representative, forwards a document to the patient's provider that someone else authored.  Servers commonly treat them the same, and may hold the document for review before it becomes available through read and search.

##### Additional Rules and Guidance for Unsolicited Patient Generated Write

Business Rules:

- Availability through read and search is based on server policy.

Discovery:

- Servers **SHALL** document their review policy for patient submissions

Authorization:

- Scopes: servers **SHALL** support `patient/DocumentReference.c`, or category-specific version(s) such as `patient/us-core-documentreference-category|clinical-note`.

FHIR RESTful API:

- The response is `201` or `202` depending on documented server policy.

DocumentReference Elements:

- Servers **SHALL NOT** remove `meta.security` = "PATAST".
- Servers **MAY** add `meta.security` = "PATAST" by policy (e.g., based on authorization context), even if it is omitted by the client.
- Clients **SHALL** include `meta.security` = "PATAST" (Patient asserted).

- `Document.author` is the patient. The `launch/patient` parameter that an app includes in its SMART authorization request is a candidate value for `author`
- The [FHIR R5 attester extension] can also be supported for specific documents types like livings wills.

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

{% include unsolicited-patient-write-example1.md %}

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

{% include unsolicited-patient-write-example2.md %}


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

{% include unsolicited-patient-write-example3.md %}

---

#### Correction and Replacement

This section establishes client and server rules and guidance for correcting documents after they have been written to a FHIR server. A client can retract a document by changing its `status` to `entered-in-error` with the FHIR RESTful `patch` or `update` interaction, or supersede it by creating a new `DocumentReference` that replaces the original. Both mechanisms tell the server and later readers what happened to the document. What a server does next, such as archiving the original or notifying users, is server policy.

**Client Requirements**

*Retraction*

* To mark a document as entered in error, clients **SHALL** use either a `patch` that changes only `status` to `entered-in-error`, or an `update` that sends the complete resource with only `status` changed.

*Replacement*

* To supersede a document, clients **SHOULD** create a new `DocumentReference` with `relatesTo.code` = `replaces` and `relatesTo.target` referencing the original.
* A replacing document **SHALL** contain the complete revised content, not only the changes.
* Clients **SHOULD** also populate `relatesTo.target.identifier` with the original document's `identifier` when it has one.

**Server Requirements**

*Retraction*

* Servers **SHOULD** allow the submitting client to change `status` to `entered-in-error` through `patch`.
* Servers **MAY** allow the submitting client to change `status` to `entered-in-error` through `update`.
* Servers **SHALL** continue to return an `entered-in-error` document through read for authorized requests.
* Servers **MAY** exclude `entered-in-error` documents from search results.

*Replacement*

* Servers **SHALL** accept `relatesTo` on create and return it unchanged on read and search.
* Servers **MAY** ignore the replacement relationship in their own processing.

---

#### Provenance

Every document needs to answer a few basic questions: who wrote it, when it was created, and where it came from. This section answers them using "small-p" provenance elements in the `DocumentReference` itself. Although a separate `Provenance` resource might not be needed for a simple submission, this does not replace it or [US Core Basic Provenance].

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


**Server Requirements**

* Servers **SHALL** persist the elements in Provenance-bearing Elements submitted, and return them unchanged on read and search, including elements they don't otherwise process.
* Servers **SHALL NOT** reject a submission solely because a provenance element is absent or cannot be resolved.
* Servers **SHALL NOT** replace a client-supplied `author` with the authenticated client or user.
* Servers **MAY** populate `custodian` with the receiving organization when they accept a document.
* Servers **MAY** create a [US Core Provenance] resource targeting the created `DocumentReference`.

**Guidance**

* Populating `custodian` on acceptance is one way a server can meet the existing US Core requirement that every `DocumentReference` have a responsible organization. See Open Question 1 below.
* The person or app that submits a document is often not its author. A patient forwarding a discharge summary, for example, is not the hospital that wrote it. Replacing `author` with the submitter would erase the distinction this section exists to preserve.


 ---

#### Authorization (SMART on FHIR Scopes)

Apps need write permission for `DocumentReference`. SMART scopes allow access permissions to be delegated to a Client application. Servers can grant SMART v2 scopes for DocumentReference create/update, limit that permission to specific categories, and advertise them in `/.well-known/smart-configuration`.

##### SMART Scopes

**Server Requirements**

* Servers **SHALL** support the `patient/DocumentReference.c` scope for Patient Write.
* Servers **SHALL** support the `user/DocumentReference.c` scope for Provider Write.
* Servers **SHALL** support the `system/DocumentReference.c` scope for backend services that write documents.
* Servers that allow status correction or replacement **SHALL** support the matching `.u` scopes.
* Servers **SHALL** list their supported scopes in `scopes_supported` in `.well-known/smart-configuration`.
* Servers **MAY** support category-specific versions of these scopes in place of the scopes above.

**Guidance**

* The `.u` scope covers both the `patch` and `update` interactions used for status correction. See [Correction and Replacement](#correction-and-replacement).
* A category-specific scope limits write permission to one category.

    Recommended granular scopes

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

*This table will list every conformance statement on this page, by actor.*

> **Stub.** The table will be generated from the conformance statements on this page once the text is stable.

| ID | Actor | Conformance | Requirement | Section |
| --- | --- | --- | --- | --- |
| TBD | Server | **SHALL** | TBD | [Processing Expectation](#processing-expectation) |


---

####  Open Questions

The following items are unresolved.

1. How to meet US Core's DocumentReference's "responsible-organization requirement"?

   The US Core DocumentReference guidance requires that every `DocumentReference` have a responsible `Organization`, present either in `DocumentReference.custodian` or in a `Provenance` resource targeting the document. For patient-generated and patient-mediated writes there is no responsible organization at the time of submission.

2. When is discovery needed ?

   If pre-coordination is required, runtime discovery adds machinery without removing the coordination step

3. What about Per-organization discovery versus network-level requirements?

4. What are the DocumentReference categories candidates?

5. Is there need for a separate DocumentReference write profile?

6. Are structured Documents (e.g., CDA and FHIR) in scope?

---

{% include link-list.md %}
