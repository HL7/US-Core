
**Example Usage Scenarios:**

The following are example usage scenarios for the this profile:

-   Query for a Patient's Goals
-   [Record or update] a Patient's Goals


### Mandatory and Must Support Data Elements


The following data-elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.  

**Each Goal must have:**

1.  a status
1.  text description of the goal
1.  a patient

**Each Goal must support:**

1. target date(s):

**Profile specific implementation guidance:**
- Free text goals can be used in Goal.description.text when a concept isn't available or a legacy goal is not mapped to a LOINC or SNOMED concept.
-  See the [SDOH] guidance page for more information when exchanging Social Determinants of Health (SDOH) Goals

{% include link-list.md %}
