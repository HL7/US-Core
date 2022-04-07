
###### Scope and Usage

This profile sets minimum expectations for the [PractitionerRole] resource to record, search, and fetch the practitioner role for a practitioner.  It identifies the mandatory core elements, extensions, vocabularies and value sets which **SHALL** be present in the PractitionerRole resource when using this profile.  The requirements for the US Core Practitioner were drawn from the [Argonaut Provider Directory], [IHE Healthcare Provider Directory] and the [ONC Provider Directory Workshop].


### Mandatory and Must Support Data Elements

The following data-elements must always be present ([Mandatory] definition]) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.

**Each PractitionerRole must support:**

1. An associated organization
1. An associated practitioner
1. A role
1. A specialty
1. An associated location
1. Contact information
1. A communication endpoint

**Profile specific implementation guidance:**

* At least one of the following elements must be present:
    - `PractitionerRole.practitioner`
    - `PractitionerRole.organization`
    - `PractitionerRole.healthcareService`
    - `PractitionerRole.location`
* The PractitionerRole.endpoint is where a [Direct address] may be represented.
* Clients can request servers return the Practitioner resource and Endpoint resources by using `_include`. See [Quick Start].
* As a result of implementation feedback, the US Core Location  and PractitionerRole Profiles are not explicitly referenced in any US Core Profile. However they **SHOULD** be used as the default profile if referenced by another US Core profile. See this guidance on [Referencing US Core Profiles].

{% include link-list.md %}
