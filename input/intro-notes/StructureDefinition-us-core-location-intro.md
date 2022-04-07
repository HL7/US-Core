
This profile sets minimum expectations for the [Location] resource for recording, searching for and fetching a Location associated with a patient, provider or organization. It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.


### Mandatory and Must Support Data Elements


The following data-elements must always be present ([Mandatory] definition]) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.  

**Each Location must have:**

1. A name

**Each Location must support:**

1.  Location.status
2.  Location.name
3.  Location.telecom
4.  Location.address
5.  managingOrganization

**Additional Profile specific implementation guidance:**

* As a result of implementation feedback, the US Core Location  and PractitionerRole Profiles are not explicitly referenced in any US Core Profile. However they **SHOULD** be used as the default profile if referenced by another US Core profile. See this guidance on [Referencing US Core Profiles].

{% include link-list.md %}
