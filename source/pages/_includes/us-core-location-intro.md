This profile sets minimum expectations for the [Location] resource for recording, searching for and fetching a Location associated with a patient, provider or organization. It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.


### Mandatory and Must Support Data Elements


The following data-elements are mandatory (i.e data MUST be present) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.  

**Each Location must have:**

1. A name

**Each Location must support:**

1.  Location.status
2.  Location.name
3.  Location.telecom
4.  Location.address
5.  managingOrganization

**Additional Profile specific implementation guidance:**
- none

### Examples

- [Location-hl7east](Location-hl7east.html)

{% include link-list.md %}
