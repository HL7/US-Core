{% include new_page.md %}

**Example Usage Scenarios:**

The following are example usage scenarios for this Profile:

-   Query for survey screening results for a patient.
-  [Record or update] screening results results belonging to a Patient

### Mandatory and Must Support Data Elements


The following data-elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Views] below provides the formal summary, definitions, and  terminology requirements.

1. a status
1. a category code of "survey"
1. a [LOINC] code, if available, which tells you the survey question
1. a patient

**Each Observation must support:**

1. a time indicating when survey was taken
1. the answer or a reason why the data is absent*
   - if the result value is a numeric quantity and coded quantity units are used, [UCUM] is required.
3. who answered the questions
4. related questionnaire responses or observations that this observation is made from
5. reference to observations that make up this observation**

\* \*\* see guidance below

**Profile specific implementation guidance:**
- \*\*See the [Screening and Assessments] guidance page for how this profile is used to represent surveys, screenings, and assessments.
  - Each response to individual questions and each answer to a multi-select or “check all that apply” question is a separate US Core Screening and Assessments Observation. The question is communicated in `Observation.code` and the answer in `Observation.value`.
  - Multi-question screenings and assessments use the US Core Screening and Assessments Observation to represent a “panel” or grouping. The multi-question surveys or assessments  `Observation.code` is an overarching assessment or screening code, and the `Observation.value` element should be empty. `Observation.hasMember` references US Core Screening and Assessments Observations that represent the responses to each question in the screening or assessment. 
- An individual’s clinical judgment about a patient’s health status, which is not a response to screening or assessment question should use the [US Core Simple Observation Profile] instead.
{% include obs_cat_guidance.md category='survey'-%}
{% include DAR-exception.md %}

{% include link-list.md %}
