
**Example Usage Scenarios:**

The following are example usage scenarios for the this profile:

-   Query for social history results for a patient.
-  [Record or update] social history results results belonging to a Patient

### Mandatory and Must Support Data Elements


The following data-elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.

**Each Observation must have:**

1. a status
1. a category code of "social-history"
1. a code
1. a patient

**Each Observation must support:**

1. <span class="bg-success" markdown="1">a category code of 'sdoh'</span><!-- new-content -->
1. a time indicating when observation was made
1. who answered the questions
3. a value

**Profile specific implementation guidance:**
- See [SDOH Guidance] for how this profile can used to represent SDOH assessments.
- Observations that are formally derived from an assessment tool or survey should use the [US Core Observation Survey Profile]. However, simple assertion may be derived from a screening tool assessments and can reference them using `Observation.derivedFrom`.
- The codes can be from LOINC or SNOMED CT.
- Often the pattern for these types of observations that the `Observation.code` indicates a statement about findings and the `Observation.value` is present and "qualifies" the finding typically confirming or refuting it. For example:

  **code**: Transport too expensive (SNOMED CT: 160695008)  
  **value**: true

{% include link-list.md %}
