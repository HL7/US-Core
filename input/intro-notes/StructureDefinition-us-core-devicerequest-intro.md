{% include new_page.md %}

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core DeviceRequest Profile:

-   Query for DeviceRequest resources belonging to a Patient
-   Query for a Patient's DeviceRequest resources by device code, status, or date
-   [Record or update] a Patient DeviceRequest

### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.

**Each DeviceRequest Must Have:**

1. a status
1. an intent code indicating whether the request is a proposal, plan, or order
1. the device requested<sup>1</sup>
1. a patient

**Each DeviceRequest Must Support:**

1. when the request was made
1. the requester<sup>2</sup>

<sup>1,2</sup> see guidance below

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the US Core Profile to support implementation and certification.

* A medical device order is not always represented with a DeviceRequest. Depending on the context, the same order can be communicated with the [US Core ServiceRequest Profile] when the request is procedure focused, or with the [US Core MedicationRequest Profile] when the request is medication related, such as for billing. Clients can expect to find a medical device order in any of these three profiles.
* <sup>1</sup>The DeviceRequest resource can represent the device requested as a code using `DeviceRequest.codeCodeableConcept` or as a reference using `DeviceRequest.codeReference`.
   * Although both are marked as *Must Support*, the Server system is not required to support both, but **SHALL** support at least one of these elements.<sup>[§][CONF-0115]</sup>
   * The Client application **SHALL** support both elements.<sup>[§][CONF-0116]</sup>
{% include provenance-author-bullet-generator.md footnote-symbol='<sup>2</sup>' %}

{% include link-list.md %}
