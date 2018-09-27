This profile sets minimum expectations for the [Organization] resource to searching for and fetching a Organization associated with a patient or provider. It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core-Organization profile:

-   Query by organization name or NPI


##### Mandatory Data Elements and Terminology


The following data-elements are mandatory (i.e data MUST be present). These are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [**Formal Profile Definition**](#profile) below provides the  formal summary, definitions, and  terminology requirements.  

**Each Organization must have:**

1.  An identifier
1.  A status of the organization
1.  A name
1.  A list of contact information
1.  Endpoint information


**Profile specific implementation guidance:**

- This profile may be referenced by different capability statements, such as the [Conformance requirements for the US Core Server], or a provider directory capability statement.

#### Examples

[Organization-acme-lab](Organization-acme-lab.html)

[Organization-with-EndPoint](Organization-saint-luke-w-endpoint.html)

[Organization]: {{site.data.fhir.path}}organization.html
[Conformance requirements for the US Core Server]: CapabilityStatement-server.html
