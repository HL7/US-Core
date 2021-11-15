
This profile sets minimum expectations for the [Goal] resource to record, search, and fetch Goal information associated with a patient. It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core-Goal profile:

-   Query for a Patient's Goals
-   [Record or update] a Patient's Goals


### Mandatory and Must Support Data Elements


The following data-elements must always be present ([Mandatory] definition]) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.  

**Each Goal must have:**

1.  a status
1.  text description of the goal
1.  a patient

**Each Goal must support:**

1. target date(s):

**Profile specific implementation guidance:**

-  {:.new-content}When exchanging Social Determinants of Health (SDOH) Goals, servers **SHALL** use the SDOH Goal concepts provided by Gravity in the Goal.description value set. Free text goals are allowed in Goal.description.text when a concept isn't available, or a legacy goal is not mapped to a LOINC or SNOMED concept. 

### Examples

- [Goal-1](Goal-goal-1.html)

{% include link-list.md %}
