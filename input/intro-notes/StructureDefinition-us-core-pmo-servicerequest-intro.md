
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

- The primary use for this profile is to instantiate medical orders after reviewing a patient's Portable Medical Order (PMO), such as POLST, MOLST, or other state-specific forms. Actionable orders are typically implemented in facility-based care environments, such as hospitals or skilled nursing facilities. This profile is not intended for routine ambulatory or office-based practice settings, where PMOs may be reviewed but new standing orders are not typically derived.
- A secondary use for this profile is to represent the medical orders section in a FHIR PMO document, such as defined by the [PACIO Advance Healthcare Directive Interoperability Implementation Guide].
- *The `ServiceRequest.code` is bound to [Portable Medical Orders – Detailed Categories and Interventions](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1267.35/expansion), which is comprised of code sets for each [Portable Medical Order Categories](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1267.34/Expansion) found in `ServiceRequest.category:us-core-pmo-category`.
  - For proper context, these codes **SHOULD** be aligned with the appropriate Category as follows:

    |PMO Category Code|PMO Code Set|
    |---|---|
    |100822-6 (Cardiopulmonary resuscitation orders)|[Cardiopulmonary Resuscitation Order Options](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1115.28/expansion/Latest)<br /> <br /> [Cardiopulmonary Resuscitation Order Procedures](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1115.30/expansion/Latest)|
    |100823-4 (Initial portable medical treatment orders)| [Initial Treatment portable medical Order Options](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1115.27/expansion/Latest)|
    |100824-2 (Additional portable medical orders or instructions)|[Additional Portable Medical Order Procedures](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1115.32/expansion/Latest)|
    |100825-9 (Medically assisted nutrition orders)|[Medically Assisted Nutrition Order Options](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1115.35/expansion/Latest)|
  - When there is no appropriate code to capture the order, plain text can be used here and in the optional `ServiceRequest.orderDetail` element.
- *The PMO document is referenced in `ServiceRequest.reasonReference`.
  - The document can be in any format the system accepts, such as a structured FHIR or CCDA document, scanned images, or PDF files.
   The ServiceRequest.basedOn currently

    US Core R4 uses ServiceRequest.reasonReference to reference the PMO document. Although ServiceRequest.basedOn is more appropriate semantically, the base FHIR R4 ServiceRequest resource restricts the references to CarePlan, ServiceRequest, or MedicationRequest. In FHIR R6, a reference to DocumentReference will be added to the ServiceRequest.basedOn element. When US Core migrates to FHIR R6, it will update the reference to it.
    {: .stu-note}


{% include provenance-author-bullet-generator.md %}

{% include link-list.md %}