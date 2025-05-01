
**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-   Query for survey screening results for a patient.
-  [Record or update] screening results results belonging to a Patient

### Mandatory and Must Support Data Elements

*In addition to* the Mandatory and Must Support data elements in the SDC QuestionnaireResponse Profile, the following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements. Note that the *Key Elements Table* view aggregates all the Must Support elements between this profile and its parent profiles.

**Each QuestionnaireResponse Must Have:**

1. a reference back to the assessment upon which it is based
1. a status
1. a patient
1. the date the answers were gathered

**Each QuestionnaireResponse Must Support:**

<!-- 1. a tag to indicate context like SDOH -->
1. a practitioner who recorded the answers*
3. the questions and decimal, string, and coded answers
   - each question must have an identifier pointing to the question

*see guidance below

**Profile Specific Implementation Guidance:**

- The SDC profile (from which this profile is derived) focuses on the constraints appropriate to capturing the "answer(s)" to a FHIR [Questionnaire] and demands that the Questionnaire's canonical URL be specified. If the QuestionnaireResponse is based on a non-FHIR form:
  1. Construct a FHIR Questionnaire representing *at least* the relevant metadata (in other words, the questions may be omitted).
  2. Communicates the identifier of the non-FHIR form instead of the canonical URI using the [US Core Extension Questionnaire URI] extension.
- See the [Screening and Assessments] guidance page for how this profile or Observations can represent SDOH assessments.
- QuestionnaireResponse can be searched using the standard FHIR RESTful API search parameters. Example searches are shown in the [Quick Start](#notes) section below. Although search [chains] through the associated Questionnaire can be used to query QuestionnaireResponse by item, individual responses are not directly searchable in QuestionnaireResponse. To search directly for individual responses, they must be "parsed" into a searchable form - i.e., to a local FHIR or non-FHIR data store such as a database or FHIR Observations.
- The basic workflow for creating, discovering, retrieving, and data-extracting FHIR Questionnaire and QuestionnaireResponse is thoroughly documented in the [Structured Data Capture (SDC)] implementation guide.
{% include provenance-author-bullet-generator.md %}

{% include link-list.md %}
