
**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-   Query for a specific procedure or test request, such as an electrocardiogram (ECG) order or a referral to a support program.
-   Query for a specific service offered to a patient, such as a referral to a support program.
-   Query for a category of service request (e.g., all cardiology requests)


### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Views] below provides the  formal summary, definitions, and  terminology requirements.

**Each Service Request must have:**

1.  a status
1.  an intent code indicating whether the request is a proposal, plan, or order.
3.  a code defining what is being requested
4.  a patient

**Each Service Request must support:**

1.  a category
1.  when requested service should happen
1.  when the request was made
1.  the requester

**Additional USCDI Requirements**

For ONC's USCDI requirements, each ServiceRequest must support the following additional elements. These elements are included in the formal definition of the profile, and they are represented in the examples.

1. a reason or indication for referral or consultation*

\*see guidance below

**Profile specific implementation guidance:**

- See the [Screening and Assessments] guidance page for more information when exchanging Social Determinants of Health (SDOH) Service Requests.
- The `ServiceRequest.category` binding must support, at a minimum, the [US Core ServiceRequest Category Codes].  However, this valueset can be treated as [extensible], and other category codes can be used instead.
- The `ServiceRequest.code` valueset is broad to accommodate a wide variety of use cases and should be constrained to a subset for a particular use case or domain. (for example, LOINC for laboratory orders.)

- \*The ServiceRequest resource can communicate the reason or indication for referral or consultation using either a code in `ServiceRequest.reasonCode` or a reference using `ServiceRequest.reasonReference`.
  - <span class="bg-success" markdown="1">As documented [here](general-guidance.html#referencing-us-core-profiles), when using  `ServiceRequest.reasonReference`, the referenced resources should be a US Core Profile.</span><!-- new-content -->
  


{% include link-list.md %}
