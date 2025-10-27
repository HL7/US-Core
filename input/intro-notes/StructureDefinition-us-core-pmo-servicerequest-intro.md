
{% include new_page.md %}

<div class="note-to-balloters" markdown="1">

The decision to add the US Core PMO Service Request Profile to meet the USCDI's PMO Order Data Element definition sparked a healthy debate on whether `ServiceRequest` is necessary for actionable orders or if `DocumentReference` is sufficient for PMO portability and patient access.

The rationale for adding ServiceRequest to represent the USCDI PMO Order includes:

- **Enhancing Patient Access and Care**: ServiceRequest enables actionable orders; without it, patient access and care goals are not fully met.
-  **Tracking PMO Implementation** A derivative order via ServiceRequest is necessary to demonstrate that the PMO has followed the patient.

The concerns include:

-  **Incomplete Representation**: A `ServiceRequest` reflects only part of a PMO order and may not fully capture the PMO's scope.
-  **Unnecessary Complexity**: `ServiceRequest` could add unnecessary complexity.

We request feedback on the importance on patients having access to their *actionable* orders that reflect their PMO.

</div><!-- note-to-balloters -->

**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

- Query for a specific procedure
- Query for a category of service request

### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.

**Each Service Request Must Have:**

1. a status
1. an intent code indicating whether the request is a proposal, plan, or order.
3. a code or plain text representation defining what is being requested*
4. a patient

**Each Service Request Must Support:**

1. a category
<!-- 2. plain text representation of what is being requested* -->
<!-- 3. a code or plain text representation of additional order details* -->
4. the encounter in which the request was created
5. when the requested service should happen
6. when the request was made
7. the requester*
8. a reference to the patient's PMO document*

<!-- {% raw %} {% include additional-requirements-intro.md type="ServiceRequest" %} {% endraw %} -->

\*see guidance below

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the US Core Profile to support implementation and certification.

- This profile is principally intended for use when documenting derived medical orders after reviewing a patient's Portable Medical Order (PMO)  such as POLST, MOLST, or other state-specific forms. Actionable orders are typically implemented in facility-based care environments, such as hospitals or skilled nursing facilities
- A secondary purpose for this profile is to define what is requested as part of a FHIR-based PMO document, such as defined by the [PACIO Advance Healthcare Directive Interoperability Implementation Guide].
- *The `ServiceRequest.code` is bound to **<TODO: PMO Procedure Codes ValueSet>** and based on the categories found in `ServiceRequest.category`.
  - Plain text is often used instead of codes to define what is being requested/ordered and for additional order details.
- *The PMO document, which is often a scanned or PDF copy, can be referenced in `ServiceRequest.reasonReference`.
{% include provenance-author-bullet-generator.md %}

{% include link-list.md %}