This profile sets minimum expectations for the [Immunization] resource to record, fetch and search immunization history associated with a patient. It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core-Core Immunization
profile:

-   Query for immunizations belonging to a Patient
-   Record immunizations belonging to a Patient

##### Mandatory Data Elements and Terminology


The following data-elements are mandatory (i.e data MUST be present). These are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [**Formal Profile Definition**](#profile) below provides the  formal summary, definitions, and  terminology requirements.  

**Each Immunization must have:**

1.  a status
1.  a date the vaccine was administered
1.  a vaccine code that identifies the kind of vaccine administered
1.  a patient
1.  a flag to indicate whether vaccine was given
1.  a flag to indicate whether the vaccine was reported by patient rather than directly administered.


**Profile specific implementation guidance:**

* **NDC codes as a translational data element**:
Based upon the 2015 Edition Certification Requirements, [CVX vaccine codes] are required and the [NDC vaccine codes] SHOULD be supported as translations to them.  A [NDC to CVX ConceptMap] is provided and is based upon the CDC's [CVX crosswalk table]. A translation is illustrated in the example below.

#### Examples

- [Immunization-imm-1](Immunization-imm-1.html)

  [CVX vaccine codes]: http://www2a.cdc.gov/vaccines/iis/iisstandards/vaccines.asp?rpt=cvx
  [NDC vaccine codes]: http://www2a.cdc.gov/vaccines/iis/iisstandards/ndc_crosswalk.asp
  [CVX crosswalk table]: http://www2a.cdc.gov/vaccines/iis/iisstandards/ndc_crosswalk.asp
[Immunization]:  {{site.data.fhir.path}}immunization.html
[NDC to CVX ConceptMap]: ConceptMap-ndc-cvx.html
