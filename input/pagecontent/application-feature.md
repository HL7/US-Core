{::options toc_levels="1..4"/}

{% include conf_usage_boilerplate.md %}

<!-- ### Application Feature Framework for Runtime Advertisement and Client Discovery -->

### Introduction

Experimental: Based on FHIR R5 and the [Application Feature Framework](https://hl7.org/fhir/uv/application-feature/) Implementation Guide
{:.bg-info}

> **This section defines mechanisms only.** It describes *how* a server describes and a client discovers write support. It deliberately defines **no** minimum support mandates in this round - nothing here requires a server to support any particular category, type, or MIME type. Establishing required support levels is left to a future iteration, to regulation, or to network policy.

> **Write support and capability advertisement are independently claimable.** A server **MAY** claim conformance to `DocumentReference` write without implementing the advertisement features described in this section, and the reverse is also true. The requirements in this section apply only to servers claiming support for capability advertisement.

Advertisement exists so that a *generic* client can work across many organizations without per-organization pre-coordination. An application built for a single deployment can perform both solicited and unsolicited writes with no runtime advertisement at all, because its capabilities were established during integration. Requiring advertisement in that case would add machinery with no consumer.

For integrated-application workflows (e.g., provider-facing apps), capabilities are negotiated while working through integration. Runtime advertisement for such functionality is often unnecessary. If desired, support can be advertised through Application Features (the same mechanism as patient-facing functionality).

For patient-facing applications, runtime advertisement and client discovery are critical to proper function. This guide uses the [Application Feature Framework](https://hl7.org/fhir/uv/application-feature/) to describe support and enumerate specific types and categories.

### How the framework works

The Application Feature Framework expresses capability as a triple:

* **Feature** - the canonical URL of a `FeatureDefinition` identifying the capability being asked about (e.g., "can I write a `DocumentReference`?").
* **Context** - an optional qualifier narrowing the question (e.g., "...within the `clinical-note` category").
* **Value** - the answer returned for that feature in that context (e.g., the list of supported `type` codes).

Because context and value are both meaningful on their own, queries work in both directions: a client can ask which types a category supports, and equally which category a given type belongs to.

### Two tiers of discovery

Discovery answers differ depending on whether the requester is known to the server.

* **Generic (unauthenticated).** Servers **SHALL** answer a `$feature-query` without authentication, describing what the organization is capable of accepting in general. This tier exists so that an application developer can determine support and test integration *before* client onboarding and before any patient authorization occurs.
* **Client-specific (authenticated).** Servers **SHOULD** answer an authenticated `$feature-query` with the capability as scoped to the requesting client, since authorization to write a given category or type is commonly configured per client or per client type.
* Where a client has been granted [SMART granular scopes](http://hl7.org/fhir/smart-app-launch/STU2.2/scopes-and-launch-context.html#finer-grained-resource-constraints-using-search-parameters), those scopes convey what was actually granted and take precedence over the advertised capability.
* A generic answer is an indication of capability, not a guarantee of authorization. Clients **SHOULD** be prepared for a submission to be rejected even when the corresponding feature is advertised.

### Feature definitions

**Write support and supported categories/types**

* Feature: `http://hl7.org/fhir/us/core/FeatureDefinition/us-core-feature-documentreference-write`

```json
{
    "resourceType" : "FeatureDefinition",
    "id" : "us-core-feature-documentreference-write",
    "url" : "http://hl7.org/fhir/us/core/FeatureDefinition/us-core-feature-documentreference-write",
    "name" : "FeatureDocumentReferenceWrite",
    "title" : "US Core DocumentReference Write Feature",
    "status" : "active",
    "valueType" : "Coding",
    "contextDefinition" : "Allowed contexts are the `category` values supported by the server. Included values are a starter set of values, while servers may support fewer or additional values.",
    "context" : [
        "http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category#clinical-note",
        "http://loinc.org#42348-3",
        "http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category#medical-history",
        "http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category#insurance-document",
        "http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category#identity-document",
        "http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category#structured-document",
        "http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category#unstructured-document"
    ]
}
```

**Supported MIME types**

Supported MIME types vary by document type - a server may accept a scanned image for an insurance card but require a PDF for an advance directive. This feature is therefore contextualized by a `category` or `type` coding.

* Feature: `http://hl7.org/fhir/us/core/FeatureDefinition/us-core-feature-documentreference-write-mimetype`

```json
{
    "resourceType" : "FeatureDefinition",
    "id" : "us-core-feature-documentreference-write-mimetype",
    "url" : "http://hl7.org/fhir/us/core/FeatureDefinition/us-core-feature-documentreference-write-mimetype",
    "name" : "FeatureDocumentReferenceWriteMimeType",
    "title" : "US Core DocumentReference Write MIME Type Feature",
    "status" : "active",
    "valueType" : "code",
    "contextDefinition" : "Allowed contexts are the `category` or `type` codings supported by the server for writing. An uncontextualized query returns the MIME types accepted across all supported documents."
}
```

**Supported transport mechanisms**

Clients need to know whether the `$submit-bundle` operation is available before attempting to submit supporting resources alongside a document.

* Feature: `http://hl7.org/fhir/us/core/FeatureDefinition/us-core-feature-documentreference-write-transport`

```json
{
    "resourceType" : "FeatureDefinition",
    "id" : "us-core-feature-documentreference-write-transport",
    "url" : "http://hl7.org/fhir/us/core/FeatureDefinition/us-core-feature-documentreference-write-transport",
    "name" : "FeatureDocumentReferenceWriteTransport",
    "title" : "US Core DocumentReference Write Transport Feature",
    "status" : "active",
    "valueType" : "code",
    "contextDefinition" : "Allowed contexts are the `category` values supported by the server. Values are the supported transport mechanisms: `create` and/or `submit-bundle`."
}
```

### Example discovery requests

* Request the list of document `category` values supported for writing:
    `GET [base]/$feature-query?param=http://hl7.org/fhir/us/core/FeatureDefinition/us-core-feature-documentreference-write`
* Request the list of document `type` values for the `clinical-note` category:
    `GET [base]/$feature-query?param=http://hl7.org/fhir/us/core/FeatureDefinition/us-core-feature-documentreference-write@http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category#clinical-note`
* Request the list of document `category` values for the `type` `64290-0` (health insurance card):
    `GET [base]/$feature-query?param=http://hl7.org/fhir/us/core/FeatureDefinition/us-core-feature-documentreference-write(http://loinc.org#64290-0)`
* Request the MIME types accepted for advance directive documents:
    `GET [base]/$feature-query?param=http://hl7.org/fhir/us/core/FeatureDefinition/us-core-feature-documentreference-write-mimetype@http://loinc.org#42348-3`

### Example response

Response to a request for the `type` values supported within the `clinical-note` category. Note the patient-accessible `display` values, and the inclusion of a locally-defined type alongside the standard code.

```json
{
    "resourceType" : "Parameters",
    "parameter" : [ {
        "name" : "feature",
        "part" : [ {
            "name" : "definition",
            "valueCanonical" : "http://hl7.org/fhir/us/core/FeatureDefinition/us-core-feature-documentreference-write"
        }, {
            "name" : "context",
            "valueCoding" : {
                "system" : "http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category",
                "code" : "clinical-note"
            }
        }, {
            "name" : "value",
            "valueCoding" : {
                "system" : "http://loinc.org",
                "code" : "11506-3",
                "display" : "Progress note"
            }
        }, {
            "name" : "value",
            "valueCoding" : {
                "system" : "http://valleyhealth.example.org/notetypes",
                "code" : "PROG-PEDS",
                "display" : "Pediatric progress note"
            }
        } ]
    } ]
}
```
