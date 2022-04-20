
**Example Usage Scenarios:**

The following are example usage scenarios for the this profile:

-   Query for a specific patient encounter
-   Query for recent patient encounters
-   [Record or update] an encounter

### Mandatory and Must Support Data Elements


The following data-elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.  

**Each Encounter must have:**

1. A status
1. An classification such as inpatient, outpatient or emergency
1. An encounter type
1. A patient

**Each Encounter must support:**

1. An encounter identifier
1. Providers involved in the encounter
1. When the encounter occurred
1. Reason for the visit
1. The discharge disposition
1. Where the encounter occurred

**Profile specific implementation guidance:**

* To search for an encounter diagnosis, query for Condition resources that reference the Encounter of interest and have a category of `encounter-diagnosis`.   An example search is shown in the [Condition Quick Start] section.
* The Encounter resource can represent a reason using either a code with `Encounter.reasonCode`, or a reference with `Encounter.reasonReference` to  Condition or other resource.
   * Although both are marked as must support, servers are not required to support both a code and a reference, but they **SHALL** support *at least one* of these elements.
   * The client application **SHALL** support both elements.
   * If `Encounter.reasonReference` references an Observation, it **SHOULD** conform to a US Core Observation if applicable. For example, a laboratory result **SHOULD** conform to the [US Core Laboratory Result Observation Profile].
* This profile supports *where the encounter occurred*.  The location address can be represented by the Location referenced by `Encounter.location.location` or indirectly through the Organization referenced by `Encounter.serviceProvider`.
  * Although both are marked as must support, servers are not required to support both `Encounter.location.location` and `Encounter.serviceProvider`, but they **SHALL** support *at least one* of these elements.
  * The client application **SHALL** support both elements.
  * If using `Encounter.location.location` it **SHOULD** conform to US Core Location.  However, as a result of implementation feedback, it **MAY**  reference the base FHIR Location resource.  See this guidance on [Referencing US Core Profiles].

{% include link-list.md %}
