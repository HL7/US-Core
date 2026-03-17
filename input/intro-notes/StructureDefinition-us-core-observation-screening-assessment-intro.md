

**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-  Query for screening or assessment results for a patient.
-  [Record or update] screening and assessment results belonging to a Patient

### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile-specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.

1. a status
1. a category code of "survey"
1. a [LOINC] code, if available, which tells you the survey question
1. a patient

**Each Observation Must Support:**

1. a time indicating when the survey was taken
1. the answer or a reason why the data is absent<sup>1</sup>
   - if the result value is a numeric quantity and coded quantity units are used, [UCUM] is required.
1. who answered the questions (in other words, a performer)<sup>2</sup>
1. related questionnaire responses or observations that this observation is made from
1. reference to observations that make up this observation<sup>3</sup>

{% include additional-requirements-intro.md type="Observation" %}

1. additional categories that further specify the assessment or screening<sup>4</sup>


<sup>1,2,3,4</sup> see guidance below

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the US Core Profile to support implementation and certification.

- <sup>1</sup>See the [Screening and Assessments] guidance page for how this profile represents surveys, screenings, and assessments.
  - Each response to individual questions and each answer to a multi-select or "check all that apply" question is a separate US Core Screening and Assessments Observation. The question is communicated in `Observation.code`, and the answer is in `Observation.value`.
  - Multi-question screenings and assessments use the US Core Screening and Assessments Observation to represent a "panel" or grouping. The multi-question surveys or assessments  `Observation.code` is an overarching assessment or screening code, and the `Observation.value` element **SHOULD** be empty.<sup>[§][CONF-0437]</sup> `Observation.hasMember` references US Core Screening and Assessments Observations that represent the responses to each question in the screening or assessment.
- A practitioner's clinical observation or assertion about a patient's health status, which is not a response to a screening or assessment question, **SHOULD** use the [US Core Simple Observation Profile] instead.<sup>[§][CONF-0438]</sup>
- <sup>4</sup>The category type "survey" is required, and, at a minimum, Certifying Systems **SHALL** support, the [US Core Screening Assessment Observation Category] codes,<sup>[§][CONF-0845],[§][CONF-0846]</sup> **SHOULD** support the other [US Core Screening Assessment Observation Maximum Category] codes,<sup>[§][CONF-0847]</sup> and **MAY** support other categories.<sup>[§][CONF-0848]</sup>

    {% include obs_cat_guidance.md category='survey'%}

{% include DAR-exception.md %}
{% include provenance-author-bullet-generator.md footnote-symbol='<sup>2</sup>' %}
    - Although 'Observation.performer' target profiles [US Core Practitioner Profile] and [US Core Patient Profile] are labeled *Must Support*. Servers are not required to support both, but **SHALL** support at least one.<sup>[§][CONF-0887]</sup> Clients **SHALL** support both.<sup>[§][CONF-0888]</sup>
- <sup>3</sup>Although 'Observation.derivedFrom' target profiles [US Core Observation Screening Assessment Profile] and [US Core QuestionnaireResponse Profile] are labeled *Must Support*. Servers are  not required to support both, but **SHALL** support at least one.<sup>[§][CONF-0439]</sup> The Client application **SHALL** support both.<sup>[§][CONF-0849]</sup>
    - As documented [here](general-guidance.html#referencing-us-core-profiles), when using `Observation.derivedFrom` to reference an Observation, the referenced Observation **SHOULD** be a US Core Observation.<sup>[§][CONF-0850]</sup>

{% include link-list.md %}
