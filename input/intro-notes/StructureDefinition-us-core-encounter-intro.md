
**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-   Query for a specific patient encounter
-   Query for recent patient encounters
-   [Record or update] an encounter

### Mandatory and Must Support Data Elements


The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.  

**Each Encounter Must Have:**

1. A status
1. A classification such as inpatient, outpatient, or emergency
1. An encounter type
1. A patient

**Each Encounter Must Support:**

1. A timestamp when the resource last changed*
1. An encounter identifier
1. Providers involved in the encounter
1. When the encounter occurred
1. Reason for the visit
1. The discharge disposition
1. Where the encounter occurred

**Profile Specific Implementation Guidance:**

* To search for an encounter diagnosis, query for Condition resources that reference the Encounter of interest and have a category of `encounter-diagnosis`.   An example search is shown in the [Condition Quick Start] section.
* The Encounter resource can represent a reason using a code with `Encounter.reasonCode` or a reference with `Encounter.reasonReference` to  Condition or other resources.
   * Although both are marked as Must Support, servers are not required to support both a code and a reference, but they **SHALL** support *at least one* of these elements.
   * The client application **SHALL** support both elements.
   * If `Encounter.reasonReference` references an Observation, it **SHOULD** conform to a US Core Observation if applicable. For example, a laboratory result **SHOULD** conform to the [US Core Laboratory Result Observation Profile].
* This profile supports *where the encounter occurred*.  The location address can be represented by the Location referenced by `Encounter.location.location` or indirectly through the Organization referenced by `Encounter.serviceProvider`.
  * Although both are marked as Must Support, servers are not required to support both `Encounter.location.location` and `Encounter.serviceProvider`, but they **SHALL** support *at least one* of these elements.
  * The client application **SHALL** support both elements.

{% include encounter-location.md %} 

- \* See the US Core General Guidance page for [Searching Using lastUpdated]. Updates to `Meta.lastUpdated` **SHOULD** reflect:
  - New encounters/visits
  - Changes in the status of encounters, including events that trigger the same status (e.g., in-progress → in-progress). These status changes correspond to events that can initiate [HL7 V2] ADT messages.
  
{% include meta-updated-next-version.md %}

{% include link-list.md %}
