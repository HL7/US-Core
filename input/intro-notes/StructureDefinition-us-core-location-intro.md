
### Mandatory and Must Support Data Elements


The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.  

**Each Location Must Have:**

1. A name

**Each Location Must Support:**

1. Location or facility identifier
2. A status (whether in use)
3. The type of location or facility*
4. Contact details of the location
5. A Location address*
6. The managing organization

*see guidance below

**Additional Profile specific implementation guidance:**


* [US Core Encounter Profile] and the [US Core Immunization Profile] link directly to US Core Location via `Encounter.location` and `Immunization.location`.
{% include encounter-location.md%}
* *The ONC U.S. Core Data for Interoperability (USCDI) applicable terminology requirements for Encounter Location is the National Healthcare Safety Network (NHSN) [Healthcare Facility Patient Care Location (HSLOC)] and SNOMED CT location type codes. This profile's Location.type value set is based on HSLOC and the ServiceDeliveryLocationRoleType codes inherited from the base resource. However, implementers may extend the binding to use SNOMED CT codes when an existing concept does not exist or as a translation to an existing code.
* *{% include should-project-us.md element="Location.address" %}

{% include link-list.md %}
