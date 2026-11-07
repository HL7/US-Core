{::options toc_levels="1..4"/}

{% include conf_usage_boilerplate.md %}

<!-- # `$submit-bundle` Operation -->

### Introduction

`$submit-bundle` is an **optional* operation defined for writing documents. It is based on the *Submit CGM Bundle Operation* in the FHIR [Continuous Glucose Monitoring](https://build.fhir.org/ig/HL7/cgm/index.html) guide. It combines two behaviors that neither a standard `batch` nor a standard `transaction` provides together: references between entries resolve within the `Bundle`, and the server can accept all or only part of the submission.

The `$submit-bundle` transport mechanism uses the FHIR `operation` interaction, through HTTP `POST`, to invoke the `$submit-bundle` operation on the `DocumentReference` resource type, as defined in this guide. It lets a client include additional FHIR resources in a submission, such as discrete `Observation` resources.


### Definition

* **Canonical URL**: `http://hl7.org/fhir/us/core/OperationDefinition/us-core-documentreference-submit-bundle`
* **Code**: `submit-bundle`
* **Invocation**: type level - `POST [base]/DocumentReference/$submit-bundle`
* **Affects state**: yes
* **Idempotent**: no (see [Identifier](writing-documents.html#identifier) for deduplication expectations)

### Parameters

| Name | Cardinality | Type | Use | Documentation |
| --- | --- | --- | --- | --- |
| `resource` | 1..1 | `Bundle` | in | A `Bundle` with `Bundle.type` of `collection` containing the focal `DocumentReference` and any supporting resources. |
| `return` | 0..1 | `DocumentReference` | out | The persisted `DocumentReference` as accepted by the server. |
{:.grid}

When an operation has a single input parameter that is a resource, the client can post the resource directly or as a `Parameters` resource containing the `resource` parameter.

### Input Bundle Requirements

**Client Requirements**

* Clients **SHALL** set `Bundle.type` to `collection`.
* Clients **SHALL** include exactly one `DocumentReference` in the `Bundle`.
* Clients **SHALL** place the `DocumentReference` as the first entry.
* Clients **SHALL** populate `fullUrl` for every entry.
* Clients **SHOULD** use `urn:uuid:` values in `fullUrl` for resources that don't yet exist on the server.

**Server Requirements**

* Servers **SHALL NOT** reject a submission solely because a supporting resource cannot be linked to an existing record.

**Guidance**

* The `DocumentReference` is the *focal resource* of the submission and has the same requirements as one submitted with RESTful `create`. See the [Required and Must-Support Elements](writing-documents.html#required-and-must-support-elements) for details. All other entries are *supporting resources* related to it, such as `Observation`s reported in the attached document.
* Each Bundle carries one document as the focus. To submit several documents, a client invokes the operation once per document.
* Following the standard FHIR rules for resolving references in a `Bundle`, references between entries resolve to other entries by `fullUrl` or to resources on the server.

### Processing and response

**Server Requirements**

* Servers **SHALL** process the `DocumentReference` under the same rules as one submitted with RESTful `create`, including the processing expectation, submission modes, solicitation, and documented support.
* Servers **SHALL** respond to a successful submission with `201 Created` and a `Location` header for the `DocumentReference` when it is available on return, or `202 Accepted` when it is held for review.
* Servers **SHALL** respond to a failed submission with an HTTP error status and an `OperationOutcome` describing the reason.
* Servers **MAY** accept the `DocumentReference` without accepting the supporting resources.
* Servers **MAY** return the persisted `DocumentReference` in the response body.

**Guidance**

* Partial acceptance is what distinguishes this operation from a `transaction`. A server can keep the document and drop supporting resources it doesn't support, rather than rejecting the whole submission.


### Example

Request: `POST [base]/DocumentReference/$submit-bundle`

```json
{
    "resourceType" : "Bundle",
    "type" : "collection",
    "entry" : [ {
        "fullUrl" : "urn:uuid:0f9f4e1c-5c9c-4d3c-9a3d-8e3b1a7c4a01",
        "resource" : {
            "resourceType" : "DocumentReference",
            "status" : "current",
            "type" : {
                "coding" : [ {
                    "system" : "http://loinc.org",
                    "code" : "73985-4",
                    "display" : "Exercise Activity"
                } ]
            },
            "category" : [ {
                "coding" : [ {
                    "system" : "http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category",
                    "code" : "medical-history",
                    "display" : "Medical History"
                } ]
            } ],
            "subject" : {
                "reference" : "Patient/512cd664-6cd2-4a56-b462-0133464ffaa0"
            },
            "date" : "2026-07-21T00:00:00Z",
            "description" : "July 2026 activity data report for Lin Zhang.",
            "content" : [ {
                "attachment" : {
                    "contentType" : "application/pdf",
                    "url" : "http://example.org/documents/activity-202607.pdf",
                    "title" : "Lin Zhang activity report for July 2026",
                    "creation" : "2026-07-21T00:00:00Z"
                }
            } ]
        }
    }, {
        "fullUrl" : "urn:uuid:0f9f4e1c-5c9c-4d3c-9a3d-8e3b1a7c4a02",
        "resource" : {
            "resourceType" : "Observation",
            "status" : "final",
            "category" : [ {
                "coding" : [ {
                    "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
                    "code" : "activity"
                } ]
            } ],
            "code" : {
                "coding" : [ {
                    "system" : "http://loinc.org",
                    "code" : "55423-8",
                    "display" : "Number of steps in unspecified time Pedometer"
                } ]
            },
            "subject" : {
                "reference" : "Patient/512cd664-6cd2-4a56-b462-0133464ffaa0"
            },
            "effectiveDateTime" : "2026-07-20",
            "valueQuantity" : {
                "value" : 8214,
                "unit" : "steps"
            },
            "derivedFrom" : [ {
                "reference" : "urn:uuid:0f9f4e1c-5c9c-4d3c-9a3d-8e3b1a7c4a01"
            } ]
        }
    } ]
}
```

Response: `201 OK` with the `Location` header and the persisted `DocumentReference` as the body.
