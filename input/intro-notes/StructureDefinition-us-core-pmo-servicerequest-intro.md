
{% include new_page.md %}

<div class="note-to-balloters" markdown="1">

The decision to add the US Core PMO Service Request Profile and to meet the USCDI's PMO Order Data Element definition sparked a healthy debate on whether `ServiceRequest` is necessary for actionable orders or if `DocumentReference` is sufficient for PMO portability and patient access.


The rationale for adding ServiceRequest to represent the USCDI PMO Order includes:


1. **Enhancing Patient Access and Care**: ServiceRequest enables actionable orders; without it, patient access and care goals are not fully met.
2. **Tracking PMO Implementation** A derivative order via ServiceRequest is necessary to demonstrate that the PMO has followed the patient.

The concerns include:

1. **Incomplete Representation**: A `ServiceRequest` reflects only part of a PMO order and may not fully capture the PMO's scope.
2. **Scope Creep Beyond USCDI**: Concerns that it goes beyond USCDI requirements by including derivative orders.
3. **Unnecessary Complexity**: `ServiceRequest` could add unnecessary complexity without clear justification.
4. **Sufficiency of Current Design**: The current `DocumentReference`-based design already meets PMO requirements for USCDI

We request feedback on the clinical utility of this profile and its implications for certification
</div><!-- note-to-balloters -->.

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
2. plain text representation of what is being requested*
3. a code or plain text representation of additional order details*
4. the encounter in which the request was created
5. when the requested service should happen
6. when the request was made
7. the requester*
1. the code for the test, procedure, or service to be performed
8. a reason or indication for referral or consultation

<!-- {% raw %} {% include additional-requirements-intro.md type="ServiceRequest" %} {% endraw %} -->



\*see guidance below

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the US Core Profile to support implementation and certification.

- This profile is intended for use when documenting derived medical orders after reviewing a patient's Portable Medical Order (PMO) — such as POLST, MOLST, or other state-specific forms. It is scoped to facility-based care environments where actionable orders are implemented, including hospitals, skilled nursing facilities, long-term care, and outpatient procedure centers (e.g., surgery centers, dialysis facilities).
   - This profile is not intended for routine ambulatory or office-based practice settings, where PMOs may be reviewed, but new standing orders are not typically derived.
- Although the `ServiceRequest.code` is bound to US Core Procedure Codes, a broadly defined value set that accommodates many healthcare domains, it has several additional bindings based on the PMO categories found in `ServiceRequest.category`. The additional bindings are displayed in `ServiceRequest.code`'s Description and Constrain column in the formal definition below.
- Often, plain text is used instead of codes to define what is being requested/ordered and for additional order details.

{% include provenance-author-bullet-generator.md %}

{% include link-list.md %}