
This profile sets minimum expectations for searching and fetching  using the [ServiceRequest] resource. This profile identifies the mandatory core elements, extensions, vocabularies and value sets which **SHALL** be present in the ServiceRequest when using this profile.

**Example Usage Scenarios:**

The following are example usage scenarios for the Service Request profile:

-   Query for a specific procedure or test request such as an electrocardiogram (ECG) order or a referral to a support program.
-   Query for a specific service offered to a patient such as a referral to a support program.
-   Query for category of service request (e.g. all cardiology requests)


### Mandatory and Must Support Data Elements

The following data-elements must always be present ([Mandatory] definition]) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.

**Each Service Request must have:**

1.  a status
1.  a intent code indicated whether the request is a proposal, plan, or order.
3.  a code defining what is being requested
4.  a patient

**Each Service Request must support:**

1.  a category
1.  when requested service should happen
1.  when request was made
1.  the requester

**Profile specific implementation guidance:**

- See [SDOH Guidance] for more information when exchanging Social Determinants of Health (SDOH) Service Requests.
- The `ServiceRequest.category` binding must support at a minimum the [US Core ServiceRequest
Category Codes].  Within this categorization scheme/axis, other categories codes may be supported and alternate codes may be provided *in addition* to the standard codes. See [Using multiple codes with CodeableConcept Datatype] for examples.  Other categorization schemes to be used as well.

#### Examples

- [Foodpantry Referral](ServiceRequest-foodpantry-referral.html)

{% include link-list.md %}
