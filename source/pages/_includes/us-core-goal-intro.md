This profile sets minimum expectations for the [Goal] resource to record, search and fetch Goal information associated with a patient. It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core-Goal profile:

-   Query for a Patient's Goals
-   Record or update a Patient's Goals


##### Mandatory Data Elements and Terminology


The following data-elements are mandatory (i.e data MUST be present). These are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [**Formal Profile Definition**](#profile) below provides the  formal summary, definitions, and  terminology requirements.  

**Each Goal must have:**

1.  a status
1.  text description of the goal
1.  a patient

**Profile specific implementation guidance:**

* none

#### Examples

- [Goal-1](Goal-goal-1.html)


[Goal]: {{site.data.fhir.path}}goal.html
