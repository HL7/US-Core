
**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-   Query for an practitioner by name or NPI
-   Reference from other Resources


### Mandatory and Must Support Data Elements


The following data-elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Views] below provides the  formal summary, definitions, and  terminology requirements.  

**Each Practitioner must have:**

1.  An identifier which must support an NPI if available.
1.  A name


**Each PractitionerRole must support:**

1.  Contact information
1.  An address

**Profile specific implementation guidance:**

- Servers that support only US Core Practitioner Profile **SHALL** provide implementation specific guidance how to access a provider’s location and contact information using only the Practitioner resource.
- It is important to balance the privacy of healthcare workers with the patient’s right to access information. Only professional/work contact information about the practitioner**SHOULD**be available to the patient (such as a work address or office telephone number).
- This profile may be referenced by different capability statements, such as the [Conformance requirements for the US Core Server], or a provider directory capability statement.

{% include link-list.md %}
