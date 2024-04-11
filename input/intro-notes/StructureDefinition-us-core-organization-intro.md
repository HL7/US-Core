
**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-   Query by organization name or NPI


### Mandatory and Must Support Data Elements


The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.  

**Each Organization Must Have:**

1. A status of the organization (i.e., whether it is still active )
1. A name


**Each Organization Must Support:**

1. An identifier*
1. A list of contact information
1. An address*

*see guidance below

**Profile Specific Implementation Guidance:**

- \*Systems **SHALL** support National Provider Identifier (NPI) for organizations
  and **SHOULD** support Clinical Laboratory Improvement Amendments (CLIA) for laboratories and the National Association of Insurance Commissioners NAIC Company code (sometimes called "NAIC Number" or "cocode") for payers.
- \*{% include should-project-us.md element="Organization.address" %}

{% include link-list.md %}
