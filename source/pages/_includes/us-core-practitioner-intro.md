
This profile sets minimum expectations for the [Practitioner] resource to record [content] associated with a patient. It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core-Practitioner profile:

-   Query for an practitioner by name or NPI
-   Reference from other Resources


##### Mandatory Data Elements and Terminology


The following data-elements are mandatory (i.e data MUST be present). These are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [**Formal Profile Definition**](#profile) below provides the  formal summary, definitions, and  terminology requirements.  

**Each Practitioner must have:**

1.  An identifier (NPI preferred)
1.  A name

**Profile specific implementation guidance:**

- This profile may be referenced by different capability statements, such as the [Conformance requirements for the US Core Server], or a provider directory capability statement.


#### Examples

[Practitioner-1](Practitioner-practitioner-1.html)

[Practitioner]: {{site.data.fhir.path}}practitioner.html
[Conformance requirements for the US Core Server]: CapabilityStatement-server.html
