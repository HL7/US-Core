{% include new_page.md %}

**Example Usage Scenarios:**

The following are example usage scenarios for the this profile:

-  Query for clinical judgments about a patient’s health status.
-  [Record or update] clinical judgments about a patient’s health status.

### Mandatory and Must Support Data Elements


The following data-elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Views] below provides the  formal summary, definitions, and  terminology requirements.

**Each Observation must have:**

1. a status
1. a category code
2. a code
3. a patient

**Each Observation must support:**


2. a time indicating when observation was made
3. who answered the questions
4. a value
5. references to associated survey, assessment or screening tool

**Profile specific implementation guidance:**
- See the [SDOH] guidance page for how this profile can used to represent SDOH assessments.
- Observations that are formally part of an assessment tool or survey should use the [US Core Observation Screening Assessment Profile]. However, simple assertion may be derived from a screening tool assessments and can reference them using `Observation.derivedFrom`.
- The codes can be from LOINC or SNOMED CT.
- The value for these types of observations may be:
  -  a string
  -  a code
  -  a "qualifier" confirming or refuting a statement about findings in code. For example:
      **code**: Transport too expensive (SNOMED CT: 160695008)  
      **value**: true

{% include link-list.md %}
