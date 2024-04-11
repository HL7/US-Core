
**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-   Query for the Provenance records associated with an Allergy
-   Query for the Provenance records associated with a Problem


### Mandatory and Must Support Data Elements

The following data elements are mandatory (i.e., data MUST be present) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.


**Each Provenance Must Have:**

1.  a reference to the resource(s) the Provenance record is supporting (target)
1. a date and time for the activity


**Each Provenance Must Support:**

1. the author organization responsible for the information
1. the transmitter that provided the information
1. the transmitter organization responsible for the transmission (if the transmitter is a device, the transmitter organization must also be valued).

**Profile Specific Implementation Guidance:**



{% include prov-white-list.md %}



*  If a system receives a provider in `Provenance.agent.who` as free text, they must capture who sent them the information as the organization. On request, they  **SHALL** provide this organization as the source and **MAY** include the free text provider.
* Systems that need to know the activity has occurred **SHOULD** populate the activity.

{% include link-list.md %}
