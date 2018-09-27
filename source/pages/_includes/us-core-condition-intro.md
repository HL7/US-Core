This profile sets minimum expectations for the [Condition] resource to record, search and fetch a  list of problems and health concerns associated with a patient. It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core-Condition profile:

-   Query for a Patient’s current or historical problems
-   Record or update a Patient’s problem

##### Mandatory Data Elements and Terminology


The following data-elements are mandatory (i.e data MUST be present). These are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [**Formal Profile Definition**](#profile) below provides the  formal summary, definitions, and  terminology requirements.  

**Each Condition must have:**

1.  a status of the problem
1.  a verification status
1.  a category
1.  a code that identifies the problem
1.  a patient

**Profile specific implementation guidance:**

* The [US Core Condition Category Codes] support the separate concepts of problems and health concerns so API consumers can separate health concerns and problems. However this is not mandatory for 2015 certification
* The 2015 Certification rule requires the use of SNOMED CT for problem list entries. Following the rules for [extensible] binding to coded data types, ICD or other local codes can be used as translations to or in addition to SNOMED CT.

#### Examples

 - [Condition-hc1](Condition-hc1.html) is an example of a condition categorized as a "problem"
 - [Condition-example](Condition-example.html) is an example of a condition categorized as a "health-concern"

[Condition]: {{site.data.fhir.path}}condition.html
[extensible]: {{site.data.fhir.path}}terminologies.html#extensible
[US Core Condition Category Codes]: ValueSet-us-core-condition-category.html
