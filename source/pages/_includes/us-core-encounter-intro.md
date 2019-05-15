This profile sets minimum expectations for the [Encounter] resource to record, search and fetch basic encounter information for an individual patient. It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.


**Example Usage Scenarios:**

The following are example usage scenarios for the US Core Encounter profile:

-   Query for a specific patient encounter
-   Query for recent patient encounters
-   Record or update an encounter

### Mandatory and Must Support Data Elements


The following data-elements are mandatory (i.e data MUST be present) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.  

**Each Encounter must have:**

1. a status
1. an encounter type
1. a patient

**Each Encounter must support:**

1. An encounter identifier
1. Providers involved in the encounter
1. Where the encounter occurred
1. When the encounter occurred
1. The discharge disposition
1. Reason for the visit
1. Diagnosis
1. Indication of the principle diagnosis


**Profile specific implementation guidance:**

* To search for an encounter diagnosis, query for Conditions that reference the Encounter of interest and have a category of `encounter-diagnosis`.   An example search is shown in the [Condition Quick Start] section.

### Examples

- [Outpatient Example](Encounter-example-1.html)


{% include link-list.md %}
