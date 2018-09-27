This profile sets minimum expectations for the [CarePlan] resource to record search and fetch assessment and plan of treatment data associated with a patient. It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core-CarePlan profile:

-   Query for a care plan belonging to a Patient
-   Record or update an existing care plan


##### Mandatory Data Elements and Terminology


The following data-elements are mandatory (i.e data MUST be present). These are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [**Formal Profile Definition**](#profile) below provides the  formal summary, definitions, and  terminology requirements.  

**Each CarePlan must have:**

1.  a narrative summary of the patient assessment and plan of treatment
1.  a status
1.  an intent
1.  a category code of “assess-plan”
1.  a patient

**Profile specific implementation guidance:**

* none

#### Examples

- [CarePlan-colonoscopy](CarePlan-colonoscopy.html)


[CarePlan]: {{site.data.fhir.path}}careplan.html
