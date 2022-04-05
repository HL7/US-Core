
﻿This profile sets minimum expectations for the [Observation] resource to record, search, and fetch retrieve observations that represent the questions and responses to form/survey and assessment tools such as the [Protocol for Responding to and Assessing Patients’ Assets, Risks, and Experiences (PRAPARE) Survey]. This profile encompasses single, multipart, and derived responses.  It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.  These observations are distinct from observations representing individual clinical assessments made by an individual about a patient's social history and not derived from an assessment tool or survey. These types of observations should use the [US Core Social History Assessment Observation Profile] instead.

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core-Results profile:

-   Query for survey screening results for a patient.
-  [Record or update] screening results results belonging to a Patient

### Mandatory and Must Support Data Elements


The following data-elements must always be present ([Mandatory] definition]) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.

**Each Observation must have:**

1. a status
1. a category code of 'survey'
1. a [LOINC] code, if available, which tells you the survey question
1. a patient

**Each Observation must support:**

1. a time indicating when survey was taken
1. who answered the questions
3. the answer or a reason why the data is absent*
   - if the result value is a numeric quantity, a standard [UCUM] unit is required
4. related questionnaire responses or observations that this observation is made from
5. component results

**Profile specific implementation guidance:**

- See [SDOH Guidance] for how this profile can used to represent SDOH assessments.
- For questions represented in `Observation.code` (e.g., LOINC) that specify “check all that apply”, the question should be used for `Observation.code` and for `Observation.component.code`. For “check all that apply” questions, the answers (regardless of whether one or more are selected) should only be represented using `Observation.component.value` and `Observation.value` should be empty.
{% include DAR-exception.md %}

### Examples

 - [Hunger Question Example](Observation-hunger-question-example.html)
 - [Prapare Multiselect Example](Observation-prapare-multiselect-example.html)

</div>
{% include link-list.md %}
