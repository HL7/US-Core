
This profile sets minimum expectations for the [Practitioner] resource to record, search, and fetch basic demographics and other administrative information about an individual practitioner. It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core-Practitioner profile:

-   Query for an practitioner by name or NPI
-   Reference from other Resources


### Mandatory and Must Support Data Elements


The following data-elements must always be present ([Mandatory] definition]) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.  

**Each Practitioner must have:**

1.  An identifier which must support an NPI if available.
1.  A name


**Each PractitionerRole must support:**

1.  Contact information
1.  An address

**Profile specific implementation guidance:**

- This profile may be referenced by different capability statements, such as the [Conformance requirements for the US Core Server], or a provider directory capability statement.

{% include link-list.md %}
