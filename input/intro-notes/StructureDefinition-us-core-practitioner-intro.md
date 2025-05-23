
**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-   Query for a practitioner by name or NPI
-   Reference from other Resources


### Mandatory and Must Support Data Elements


The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.  

**Each Practitioner Must Have:**

1. An identifier that Must Support a National Provider Identifier (NPI) if available*

1. A name

**Each PractitionerRole Must Support:**

1. Contact information*
1. An address*

\* see guidance below

**Profile Specific Implementation Guidance:**

- *Other identifiers beyond NPI, such as the National Council of State Boards of Nursing Identifier (NCSBN ID), may be used to uniquely refer to a practitioner when appropriate.
- \*The Practitioner and PractitionerRole directly and indirectly communicate the address(es) and contact information of the practitioner.
Servers that support *only* the US Core Practitioner Profile and do not support the [US Core PractitionerRole Profile] **SHALL** provide implementation-specific guidance on how to access a provider's location and contact information using only the Practitioner resource.
   - Although `Practitioner.address` is marked as Must Support, the Server system is not required to support it if they support the US Core PractitionerRole Profile, but **SHALL** support it if they do not support the US Core PractitionerRole Profile. The Client application **SHALL** support both.

- It is important to balance the privacy of healthcare workers with the patient's right to access information. Only professional/work contact information about the practitioner **SHOULD** be available to the patient (such as a work address or office telephone number).
- This profile may be referenced by different capability statements, such as the [Conformance requirements for the US Core Server] or a provider directory capability statement.
- \*{% include should-project-us.md element= "Practitioner.address" %}

{% include link-list.md %}
