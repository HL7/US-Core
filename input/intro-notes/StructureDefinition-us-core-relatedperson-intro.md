
This profile sets minimum expectations for the RelatedPerson resource to record, search, and fetch related persons associated with a patient. It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core RelatedPerson profile:

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

### Examples

- [Related Person Niece](RelatedPerson-shaw-niece.html) is an example of a niece who is related to a patient.

{% include link-list.md %}

This profile sets minimum expectations for the RelatedPerson resource to record, search, and fetch related persons associated with a patient. It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core RelatedPerson profile:

-   Return RelatedPerson resources referenced in CareTeam resources.

### Mandatory and Must Support Data Elements


The following data-elements must always be present ([Mandatory] definition]) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.

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

### Examples

- [RelatedPerson Patient Niece](RelatedPerson-shaw-niece.html)

{% include link-list.md %}
