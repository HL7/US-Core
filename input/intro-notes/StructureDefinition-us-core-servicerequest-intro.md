
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
- The `ServiceRequest.code` valueset is broad to accommodate a wide variety of use cases and**SHOULD**be constrained to a subset for a particular use case or domain. (for example, LOINC for laboratory orders.)

  
{% include reason-for-referral.md %}
  


{% include link-list.md %}
