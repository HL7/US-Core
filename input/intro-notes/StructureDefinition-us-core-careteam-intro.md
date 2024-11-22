
**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-   Query for a Patient's CareTeam
-   [Record or update] a Patient's CareTeam


### Mandatory and Must Support Data Elements


The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.  

**Each CareTeam Must Have:**

1. a patient
1. a participant role for each careteam member
1. a reference to each careteam member, which can be:
    -   a practitioner or practitioner type (doctor, nurse, therapist)*
    -   a relative, friend, or guardian

*See below for how practitioner members are represented in this Profile.

**Each CareTeam Must Support:**

1. a status code


**Profile Specific Implementation Guidance:**

In order to access care team member's names, identifiers, locations, and contact information, the CareTeam profile supports several types of care team participants. They are represented as references to other profiles and include the following three profiles, which are marked as Must Support:
  1. US Core Practitioner Profile
  1. US Core PractitionerRole Profile
  2. US Core RelatedPerson Profile

  * Although *both* US Core Practitioner Profile and US Core PractitionerRole are Must Support, the Server system is not required to support references to both, but **SHALL** support *at least* one of them.
  * The Client application **SHALL** support all three profile references.
  * Because the US Core PractitionerRole Profile supplies the provider's location and contact information and a reference to the Practitioner, Server systems **SHOULD** reference it instead of the US Core Practitioner Profile. The quick start section below shows an example of how to access the practitioner name and identifier.
  * Servers that support only US Core Practitioner Profile and do not support the US Core PractitionerRole Profile **SHALL** provide implementation-specific guidance on how to access a provider's location and contact information using only the Practitioner resource.

{% include link-list.md %}
