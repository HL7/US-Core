
**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-   Query for a specific procedure or test request, such as an electrocardiogram (ECG) order or a referral to a support program.
-   Query for a specific service offered to a patient, such as a referral to a support program.
-   Query for a category of service request (e.g., all cardiology requests)


### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Views] below provides the  formal summary, definitions, and  terminology requirements.

**Each Service Request Must Have:**

1.  a status
1.  an intent code indicating whether the request is a proposal, plan, or order.
3.  a code defining what is being requested
4.  a patient

**Each Service Request Must Support:**

1.  a category
2.  the encounter in which the request was created
3.  when requested service**SHOULD**happen
4.  when the request was made
5.  the requester

{% include additional-requirements-intro.md type="ServiceRequest" %}

1. a reason or indication for referral or consultation*

\*see guidance below

**Profile Specific Implementation Guidance:**

- See the [Screening and Assessments] guidance page for more information when exchanging Social Determinants of Health (SDOH) Service Requests.
- The `ServiceRequest.category` binding Must Support, at a minimum, the [US Core ServiceRequest Category Codes].  However, this valueset can be treated as [extensible], and other category codes can be used instead.
- The `ServiceRequest.code` valueset is broad to accommodate a wide variety of use cases and **SHOULD** be constrained to a subset for a particular use case or domain. (for example, LOINC for laboratory orders.)

<div class="bg-success" markdown="1">

- *Servers and Clients **SHALL** support both US Core ServiceRequest and US Core Procedure Profiles for communicating the reason or justification for a referral as Additional USCDI Requirements. Typically, the reason or justification for a referral or consultation is communicated through `Procedure.basedOn` linking the Procedure to the US Core ServiceRequest Profile that includes either `ServiceRequest.reasonCode` or `ServiceRequest.reasonReference`. When the Procedure does not have an associated ServiceRequest, it is communicated through the US Core Procedure Profile's `Procedure.reasonCode` or `Procedure.reasonReference`.  Depending on the procedure being documented, a server will select the appropriate Profile to use.
   - `ServiceRequest.reasonCode` and `ServiceRequest.reasonReference` are marked as Additional USCDI Requirements. The certifying server system is not required to support both but **SHALL** support at least one of these elements. The certifying client application **SHALL** support both elements.
     - when using  `ServiceRequest.reasonReference`:
       - Servers **SHALL** support *at least one* resource in ServiceRequest.reasonReference. Clients SHALL support all resources in ServiceRequest.reasonReference.
       - The referenced resources **SHOULD** be a US Core Profile as documented in [Referencing US Core Profiles].

</div><!-- new-content -->

{% include link-list.md %}
