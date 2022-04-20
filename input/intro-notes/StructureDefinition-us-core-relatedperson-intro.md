
**Example Usage Scenarios:**

The following are example usage scenarios for the this profile:

-   Return RelatedPerson resources referenced in CareTeam resources.

### Mandatory and Must Support Data Elements


The following data-elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.

**Each RelatedPerson must have:**

1. a flag indicating whether is in active use
1. a reference to patient

**Each Location must support:**

1.  relationship to a patient
2.  a name
3.  contact details
4.  an address

**Profile specific implementation guidance:**

* Supports caretakers as part of CareTeam USCDI requirements

{% include link-list.md %}
