# Patient Data Feed: Subscriptions

## 1. Overview

The Patient Data Feed is an optional feature for servers implementing US Core. It allows clients to receive FHIR Subscription Notifications when events occur related to US Core content.

> **Note**: This specification does not yet address the standardization of the SubscriptionTopic resource itself. Instead, it focuses on standardizing the functionality of the `patient-data-feed` topic and the expectations of Subscription management. For more information on future work in this area, see [Section 8. Future Work](#8-future-work).

Servers can start simple. A minimal implementation might support just a few key US Core profiles to enable subscriptions for DiagnosticReport, DocumentReference, Encounter, and Observation. From there, servers can expand to cover more resources as needed.

This specification defines a canonical topic URL, subscription filters, triggers, and conformance requirements for the Patient Data Feed. It builds on FHIR R4 definitions from http://hl7.org/fhir/uv/subscriptions-backport.

## 2. Canonical Topic URL

The canonical topic URL for the Patient Data Feed is:

`http://hl7.org/fhir/us/core/SubscriptionTopic/patient-data-feed`

Clients use this topic URL when creating Subscriptions to indicate they are requesting the Patient Data Feed.

## 3. Resources, Filters, and Triggers

The table below defines a minimal set of required resources, their US Core search parameters, and the standardized triggering events for the Patient Feed. 

Guidance for supporting additional resources is provided in the [Additional Resources](additionalresources.md) page.

<a id="table1"></a>
*Table 1. Required Resources*.
<table>
  <thead>
    <tr>
      <th>Resource</th>
      <th>Required-Support Triggers</th>
      <th>Required-Support Filters</th>
      <th>Recommended-Support Filters</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>DiagnosticReport</td>
      <td>feed-event</td>
      <td>patient<br>category<br>trigger</td>
      <td>code</td>
    </tr>
    <tr>
      <td>DocumentReference</td>
      <td>feed-event</td>
      <td>patient<br>category<br>trigger</td>
      <td>type</td>
    </tr>
    <tr>
      <td>Encounter</td>
      <td>feed-event</td>
      <td>patient<br>trigger</td>
      <td>type</td>
    </tr>
    <tr>
      <td>Observation</td>
      <td>feed-event</td>
      <td>patient<br>category<br>trigger</td>
      <td>code</td>
    </tr>
  </tbody>
</table>

> **Note**: Servers can support a limited set of profiles for these resources. See the [Conformance Requirements](#6-additional-conformance-requirements) for details.

## 4. Triggering Events and Notifications

### 4.1 Definition of feed-event Trigger

The `feed-event` trigger can be implemented in two ways:

1. **Event-Driven**: The system sends notifications when something meaningful happens (like a patient being admitted or a provider signing a note)
2. **Data-Driven**: The system sends notifications when FHIR resources change directly

Servers SHALL implement at least one of these approaches and document which one(s) they use. In either case, common examples of changes that may trigger notifications include:

- New or updated content is available for clinical use
- Status changes affect the resource's usability or interpretation
- Corrections or amendments modify the resource's meaning


> **Note**: 
> 1. A `feed-event` will not necessarily fire for every FHIR-visible change. Implementation flexibility allows servers to define the specific events that will appear as updates.
> 2. Servers MAY overlay their own more specific event codes onto this generic trigger. These specific codes can be included in notifications and used for more granular filtering via the `trigger` parameter, providing clients with richer context about the nature of updates.

### 4.2 Profile-Specific Mapping for "feed-event" trigger

This section provides guidance for a minimum set of events to expose via the "feed-event" trigger. Servers will publish detailed documentation of their trigger functionality based on this guidance.

- **US Core DocumentReference**:
    * A clinical note has new or updated content available, including draft content
    * The note's status has changed (e.g., preliminary to final, draft to signed, or any status to entered-in-error)
    * The note has been amended or corrected

- **US Core Encounter**:
    * An encounter has started or a patient has been admitted
    * An encounter has ended or a patient has been discharged
    * The encounter's status has changed (e.g., planned to in-progress, in-progress to finished, or any status to entered-in-error)

- **US Core Laboratory Observation**:
    * A new result (preliminary or final) has become available
    * An existing result has been updated, amended, or corrected
    * The observation's status has changed (e.g., preliminary to final, or any status to entered-in-error)

- **US Core DiagnosticReport for Laboratory Results Reporting**:
    * A new report (preliminary or final) has become available
    * An existing report has been updated, amended, or corrected
    * The report's status has changed (e.g., preliminary to final, or any status to entered-in-error)

### 4.3 Conformance Requirements for Triggering Events

For each supported resource type:
- Servers SHALL support the Required-Support Triggers as specified in Table 1
- EHRs MAY overlay their own more specific event codes (e.g., "lab_result_final", "medication_administered") onto these generic triggers. These specific codes can be included in notifications and used for more granular filtering via the `trigger` parameter, providing clients with richer context about the nature of updates. EHRs that implement this approach SHALL document their event codes and enable filtering them using the `trigger` filter.
- When sending a notification, servers SHALL include all applicable supported triggering event code(s) in the `trigger` sub-part of the `notification-event` part of the Parameters resource. Multiple trigger codes are included if a single change satisfies multiple trigger conditions.

Example of a Parameters resource for a notification with multiple triggers, including an EHR-specific event code and an HL7 v2 event code:

```json
{
  "resourceType": "Parameters",
  "parameter": [
    {
      "name": "subscription",
      "valueReference": {
        "reference": "Subscription/example"
      }
    },
    {
      "name": "topic",
      "valueCanonical": "http://hl7.org/fhir/us/core/SubscriptionTopic/patient-data-feed"
    },
    {
      "name": "status",
      "valueCode": "active"
    },
    {
      "name": "type",
      "valueCode": "event-notification"
    },
    {
      "name": "events-since-subscription-start",
      "valueString": "5"
    },
    {
      "name": "notification-event",
      "part": [
        {
          "name": "event-number",
          "valueString": "5"
        },
        {
          "name": "timestamp",
          "valueInstant": "2023-09-05T14:30:00Z"
        },
        {
          "name": "focus",
          "valueReference": {
            "reference": "Observation/lab-result-123"
          }
        },
        {
          "name": "trigger",
          "valueCoding": {
            "system": "http://hl7.org/fhir/us/core/CodeSystem/trigger",
            "code": "update"
          }
        },
        {
          "name": "trigger",
          "valueCoding": {
            "system": "http://example.com/ehr-events",
            "code": "lab_result_final"
          }
        },
        {
          "name": "trigger",
          "valueCoding": {
            "system": "http://terminology.hl7.org/CodeSystem/v2-0003",
            "code": "R01"
          }
        }
      ]
    }
  ]
}
```

## 5. Subscription Filters and Requests

Servers SHALL allow clients to create Subscriptions according to http://hl7.org/fhir/uv/subscriptions-backport. This includes "filter-criteria" extensions for each resource where notifications are requested.

For each supported resource type, servers SHALL support the Required-Support Filters as specified in Table 1, and SHOULD support the Recommended-Support Filters.

Servers SHALL support Subscriptions with zero or more supported filters in any filter-criteria extension.

### 5.1 Example Subscription Request

Example Subscription request, demonstrating filters based on patient, category, and trigger event.

```js
{
  "resourceType": "Subscription",
  "status": "requested",
  "reason": "Notify on new lab results and reports",
  "criteria": "http://hl7.org/fhir/us/core/SubscriptionTopic/patient-data-feed",
  "_criteria": {
    "extension": [
      {
        "url": "http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-filter-criteria",
        "valueString": "Encounter?patient=123&trigger=feed-event"
        //              ^ equivalent to "all available events"
      },
      {
        "url": "http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-filter-criteria",
        "valueString": "Observation?patient=123&trigger=http://terminology.hl7.org/CodeSystem/v2-0003|R01"
        //              ^ example of filtering if the EHR offers granular or custom event codes

      },
      {
        "url": "http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-filter-criteria",
        "valueString": "DiagnosticReport?patient=123&category=LAB"
        //              ^ example of filtering by category

      }
    ]
  },
  "channel": {
    "type": "rest-hook",
    "endpoint": "https://client.example.org/fhir/subscription-notification",
    "payload": "application/fhir+json",
    "_payload": {
      "extension": [
        {
          "url": "http://hl7.org/fhir/uv/subscriptions-backport/StructureDefinition/backport-payload-content",
          "valueCode": "id-only"
        }
      ]
    }
  }
}
```

### 5.2 Handling Multiple Resource Types and Filters

1. Clients MAY include multiple resource types by supplying multiple filter-criteria extensions in a Subscription request; Servers SHALL process all supplied filter-criteria extensions.

2. Clients SHALL NOT include `patient=` filters for different patients in the same Subscription.

3. Servers SHALL make any **adjustments** needed to ensure that the filter-criteria extensions align with server capabilities. Adjustments consist of:
   - Removing unsupported elements (such as resource types, triggers, or filters) that the server cannot handle
   - Adding any implicitly required filters (such as category restrictions that the server always applies)

4. When no adjustments are made, Servers SHALL process the request as a normal create.

5. When any adjustments are made, Servers SHALL persist the Subscription resource with the adjusted filter-criteria and the subscription status set to "error".

6. Clients SHALL review the persisted Subscription resource to understand the status, resource types, triggers, and filters that are in effect.

7. If the Subscription has been persisted with a status of "error", the client MAY:
   a. Accept the adjusted subscription by updating the Subscription to set status to "requested".
   b. Delete the subscription and create a new one with different parameters.

Examples of potential adjustments:
- A server that does not support CareTeam resources might remove the client's `CareTeam` filter-criteria extension entirely.
- A server that only supports notifications for laboratory observations might add `category=laboratory` to the client's `Observation` filter-criteria extension if it wasn't already present.

## 6. Additional Conformance Requirements

### 6.1 General

1. Support for the Patient Data Feed is optional for servers implementing US Core.
2. Servers that choose to support the Patient Data Feed SHALL implement the following requirements.

### 6.2 Resource Support

1. Servers SHALL support at least one resource type from the list in Table 1.
2. Servers MAY support additional resource types described on the [Additional Resources](additionalresources.md) page.
3. Servers supporting the following profiles SHALL support subscriptions for their resources:
   - US Core DocumentReference Profile 
   - US Core Encounter Profile
   - US Core DiagnosticReport Profile for Laboratory Results Reporting
   - US Core Laboratory Result Observation Profile
4. Servers MAY enable subscriptions for a limited set of profiles on supported resources by adjusting any necessary filters (e.g., `category` or `type`; see Section 5.2 for details on adjustments).

### 6.3 Filter Support

1. Servers MAY support filters beyond those listed in Table 1 for each resource type.
2. Servers SHOULD align any additional filters with existing search parameter names, when applicable.

### 6.4 Delivery (Channel and Payload Support)
1. Servers SHALL support the `rest-hook` channel type for notification delivery.
2. Servers SHALL support the `empty` and `id-only` payload types for notifications.
3. Servers MAY support additional channel types and payload types.

### 6.6 Documentation and Error Handling
1. Servers SHALL clearly document the following in their developer-facing documentation:
   - Supported resources, filters, and triggers
   - Supported channel types
   - Supported payload types 
   - How their update notification implementation works, including:
     * An explanation of the internal events or conditions that trigger notifications
     * Any throttling or batching mechanisms used to manage notification frequency
     * The expected latency between a resource change and the corresponding notification
     * Any limitations or edge cases that clients should be aware of
   - Criteria for firing the `feed-event` trigger, including examples of changes that would and would not result in a notification
2. Clients SHALL review server documentation to understand the circumstances under which `feed-event` notifications are triggered, as these may correspond to a subset of changes to data as visible over the FHIR REST API.
3. Servers SHOULD provide clear error messages in `OperationOutcome.issue.details` when rejecting subscription requests due to unsupported features.

## 7. Additional Considerations

### 7.1 Performance Optimization

Servers implementing the Patient Data Feed should consider the following performance optimizations:

1. Event Coalescing: When multiple changes occur to a single resource in rapid succession, servers can coalesce these changes into a single event notification that includes all applicable trigger codes to represent the nature of the changes.

2. Event Batching: For subscriptions with high update frequencies, servers can implement batching strategies to group multiple events into a single notification bundle.

### 7.2 Security Considerations

While detailed security implementations are beyond the scope of this specification, servers must maintain the same level of access control and security for subscription notifications as they do for direct REST API access. Key considerations include authentication, authorization, encryption in transit (https), and audit logging.  Implementers are encouraged to refer to the FHIR Security and Privacy Module (http://hl7.org/fhir/security.html) and relevant security best practices for additional guidance.

## 8. Future Work

The standardization of how to model and publish topics for discovery is ongoing work in the FHIR community. US Core's Patient Data Feed does not yet address the standardization of the SubscriptionTopic resource itself. Instead, it focuses on standardizing the functionality of the `patient-data-feed` topic and the expectations of Subscription management, allowing for interoperability based on the canonical URL, supported resources, filters, and triggers.

As the FHIR community continues to develop and standardize subscription-related features, this specification will be updated to align with best practices and emerging standards.

{% include link-list.md %}
