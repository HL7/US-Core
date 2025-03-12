
### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.

**Each PractitionerRole Must Support:**

1. An associated organization
1. An associated practitioner
1. A role
1. A specialty
1. An associated location
1. Contact information
1. A communication endpoint

**Profile Specific Implementation Guidance:**

* At least one of the following elements must be present:
    - `PractitionerRole.practitioner`
    - `PractitionerRole.organization`
    - `PractitionerRole.healthcareService`
    - `PractitionerRole.location`

* Due to implementer feedback, some US Core Profiles reference the [PractitionerRole] resource instead of the US Core PractitionerRole Profile. However, the US Core PractitionerRole Profile **SHOULD** be used as the default profile if referenced by another US Core profile. See this guidance on [Referencing US Core Profiles].
* A [Direct address] can be represented in the `telecom` element using the [US Core Direct email Extension] or in a referenced [Endpoint] as a "direct-project" endpoint connection type.


* When selecting role codes
  * implementers **SHOULD** choose the code that reflects the specific duties performed within that role rather than the specialty unless the individual's professional specialization characterizes the role.
  * Systems that primarily rely on NUCC codes instead of SNOMED CT to represent role codes can use the Da Vinci HRex [NUCC to SNOMED CT Mappings] to aid in translations. 
 

* Clients can request Servers return the Practitioner and Endpoint resources using `_include`. See the [Quick Start] section below for further guidance.

{% include link-list.md %}
