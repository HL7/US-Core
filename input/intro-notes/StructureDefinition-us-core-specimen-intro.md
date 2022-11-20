{% include new_page.md %}

**Example Usage Scenarios:**

Queries on Specimen resource are expected to be within the context of an Observation or DiagnosticReport resource query. The following are
example usage scenarios for the US Core Specimen profile:

-   Read Specimen resources referenced in Observation resources.

### Mandatory and Must Support Data Elements

The following data-elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Views] below provides the  formal summary, definitions, and  terminology requirements.  

**Each Specimen must have:**

1.  A specimen code

**Profile specific implementation guidance:**

*  Since the binding is [extensible], when a code is unavailable just text is allowed.

{% include link-list.md %}
