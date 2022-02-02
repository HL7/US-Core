
When referencing a medication, the  [MedicationRequest] resource can either use a code or refer to a [Medication] resource.  This profile sets minimum expectations for the Medication resource to record, search, and fetch medications associated with a patient. It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.

**Example Usage Scenarios:**

Queries on Medication resource are expected to be within the context of a MedicationRequest resource query. The following are
example usage scenarios for the US Core Medication profile:

-   Read Medication resources referenced in MedicationRequest resources.

### Mandatory and Must Support Data Elements


The following data-elements must always be present ([Mandatory] definition]) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.  

**Each Medication must have:**

1.  A medication code

**Profile specific implementation guidance:**

*  Since the binding is [extensible], when a code is unavailable just text is allowed.
* When the medication is compounded and is a list of ingredients, the code is still present and may contain only the text.

{% include link-list.md %}
