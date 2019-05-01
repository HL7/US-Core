This profile sets minimum expectations for the [Organization] resource to searching for and fetching a Organization associated with a patient or provider. It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core-Organization profile:

-   Query by organization name or NPI


### Mandatory and Must Support Data Elements


The following data-elements are mandatory (i.e data MUST be present) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.  

**Each Organization must have:**

1.  An identifier (e.g. NPI)
1.  A status of the organization
1.  A name
1.  A list of contact information
1.  Endpoint information


**Profile specific implementation guidance:**

- Preferred identifier for Organizations is National Provider Identifier (NPI), or Clinical Laboratory Improvement Amendments (CLIA) for labs. 

### Examples

[Organization-acme-lab](Organization-acme-lab.html)

[Organization-with-EndPoint](Organization-saint-luke-w-endpoint.html)

{% include link-list.md %}


