
###### Scope and Usage

This profile sets minimum expectations for the [PractitionerRole] resource to record, search and fetch the practitioner role for a practitioner.  It identifies the mandatory core elements, extensions, vocabularies and value sets which **SHALL** be present in the PractitionerRole resource when using this profile.  The requirements for the US Core Practitioner were drawn from the [Argonaut Provider Directory], [IHE Healthcare Provider Directory] and the [ONC Provider Directory Workshop].


### Mandatory and Must Support Data Elements

The following data-elements are mandatory (i.e data MUST be present) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.

**Each PractitionerRole must have:**

1. An associated practitioner
1. An associated organization
1. An associated location
1. Contact information

**Each PractitionerRole must support:**

1. A role
1. A specialty

**Profile specific implementation guidance:**

* The PractitionerRole.endpoint is where the [Direct address] is included.
* Clients can request servers return the Practitioner resource and Endpoint resources by using `_include`. See [Quick Start].


#### Examples

- [Bundle-PractitionerRole-with-Practitioner-Endpoint](Bundle-66c8856b-ba11-4876-8aa8-467aad8c11a2.xml.html)

{% include link-list.md %}
