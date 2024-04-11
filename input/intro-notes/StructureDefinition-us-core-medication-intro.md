
**Example Usage Scenarios:**

Queries on Medication resources are expected to be within the context of a MedicationRequest resource query. The following are
example usage scenarios for the US Core Medication profile:

-   Read Medication resources referenced in MedicationRequest resources.

### Mandatory and Must Support Data Elements


The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.  

**Each Medication Must Have:**

1. A medication code

**Profile Specific Implementation Guidance:**

* RXNorm concepts are defined as an [extensible] binding. USCDI recommends the [National Drug Codes (NDC)] as an *optional* terminology. They can be supplied as an additional coding element.
* Since the binding is [extensible] when a code is unavailable, just text is allowed.
* When the medication is compounded and is a list of ingredients, the code is still present and may contain only the text.

{% include link-list.md %}
