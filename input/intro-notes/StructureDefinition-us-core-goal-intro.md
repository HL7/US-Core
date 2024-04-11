
**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-   Query for a Patient's Goals
-   [Record or update] a Patient's Goals


### Mandatory and Must Support Data Elements


The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.  

**Each Goal Must Have:**

1. a status
1.  <span class="bg-success" markdown="1">description of the goal</span><!-- new-content -->
1. a patient


**Each Goal Must Support:**

1. start date*
2. target date(s)*

\*see guidance below

**Profile Specific Implementation Guidance:**
-  \*Although both `Goal.startDate` and `Goal.target.dueDate` are marked as Must Support, the server system is not required to support both, but **SHALL** support at least one of these elements. The client application **SHALL** support both elements.
- Free text goals can be used in `Goal.description.text` when a concept isn't available or a legacy goal is not mapped to a LOINC or SNOMED concept.
-  See the [Screening and Assessments] guidance page for more information when exchanging Social Determinants of Health (SDOH) Goals

{% include link-list.md %}
