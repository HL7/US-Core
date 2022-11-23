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
- \*\*For responses to individual survey questions, the question is represented in `Observation.code`, and the answer in  `Observation.value`.
- \*\*For responses to multi-select or “check all that apply” questions, each response is represented as individual US Core Survey Observations. For each response, the question is represented in `Observation.code`, and the answer in  `Observation.value`.
- \*\*For multi-question surveys and assessments represented in `Observation.code`, the  `Observation.value` element should be empty, and the individual survey questions represented as distinct US Core Survey Observations and referenced using `Observation.hasMember`.
- See the [SDOH] guidance page for how this profile *along with other Observation Profiles or alternatively QuestionnaireResponse* to is used represent SDOH assessments.
- Individual clinical assessments made by an individual about a patient's social history which array_to_sentence_string not derived from an assessment tool or survey should use the [US Core Observation Social History Profile] instead.
{% include obs_cat_guidance.md category='survey'-%}
{% include DAR-exception.md %}

{% include link-list.md %}
