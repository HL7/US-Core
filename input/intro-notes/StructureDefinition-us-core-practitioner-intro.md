
**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-   Query for a practitioner by name or NPI
-   Reference from other Resources

### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.

**Each Practitioner Must Have:**

1. An identifier that Must Support a National Provider Identifier (NPI) if available<sup>1</sup>
1. A name

**Each PractitionerRole Must Support:**

1. Contact information<sup>2</sup>
1. An Address<sup>3</sup>

<sup>1,2,3</sup> see guidance below

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the US Core Profile to support implementation and certification.

- <sup>1</sup>Other identifiers beyond NPI, such as the National Council of State Boards of Nursing Identifier (NCSBNID), may be used to uniquely refer to a practitioner when appropriate.
- <sup>2</sup>The Practitioner and PractitionerRole directly and indirectly communicate the address(es) and contact information of the practitioner.
Servers that support *only* the US Core Practitioner Profile and do not support the [US Core PractitionerRole Profile] **SHALL** provide implementation-specific guidance on how to access a provider's location and contact information using only the Practitioner resource.<sup>[§][CONF-0473]</sup>
   - Although `Practitioner.address` is marked as Must Support, the Server system **MAY** choose not to support it if they support the US Core PractitionerRole Profile,<sup>[§][CONF-0474]</sup> but **SHALL** support it if they do not support the US Core PractitionerRole Profile.<sup>[§][CONF-0475]</sup> The Client application **SHALL** support both.<sup>[§][CONF-0476]</sup>

- It is important to balance the privacy of healthcare workers with the patient's right to access information. Only professional/work contact information about the practitioner **SHOULD** be available to the patient (such as a work address or office telephone number).<sup>[§][CONF-0477]</sup>
- This profile may be referenced by different capability statements, such as the [Conformance requirements for the US Core Server] or a provider directory capability statement.
- <sup>3</sup>{% include should-3166-subdivision-codes.md type="Practitioner" %}

{% include link-list.md %}
