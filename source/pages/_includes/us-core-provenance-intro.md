This profile sets minimum expectations for the [Provenance] resource to record, search and fetch Provenance information associated with a record. It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile. This FHIR Provenance profile here covers the minimal (basic) information to support lineage of information.      

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core Provenance profile:

-   Query for the Provenance records associated with an Allergy
-   Query for the Provenance records associated with a Problem


### Mandatory and Must Support Data Elements

The following data-elements are mandatory (i.e. data MUST be present) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.  

**Each Provenance must have:**

1.  resource(s) the Provenance record is supporting (target)
1.  a date and time for the activity
1.  an author responsible for the update
1.  the author organization responsible for the information

**Each Provenance must support:**

1. target date(s):

**Profile specific implementation guidance:**

* none

### Examples

- TBD

{% include link-list.md %}
