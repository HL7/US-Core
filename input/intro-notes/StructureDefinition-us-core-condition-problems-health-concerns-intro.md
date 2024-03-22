
**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-   Query for a Patient's current or historical problems and health concerns
-   [Record or update] a Patient's problems and health concerns

### Mandatory and Must Support Data Elements


The following data-elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Views] below provides the  formal summary, definitions, and  terminology requirements.  

**Each Condition Must Have:**

<!-- 1.  a status of the condition* -->
1.  a category code of "problem-list-item" or "health-concern"
1.  a code that identifies the condition
1.  a patient

**Each Condition Must Support:**

1.  a clinical status of the condition (e.g., active or resolved)
1.  a verification status
2.  additional health status/assessment categories
3.  a date of diagnosis*
4.  abatement date (in other words, date of resolution or remission)
5.  a date when recorded*

*see guidance below

**Profile Specific Implementation Guidance:**

* For Encounter Diagnosis use the [US Core Condition Encounter Diagnosis Profile].
* For USCDI, the applicable vocabulary standards for Problems/Health Concerns are SNOMED CT and ICD-10-CM.  For general guidance on extensible binding to coded data, review [this section](general-requirements.html#extensible-binding-for-coded-elements) in the General Requirements page.
  - The [US Core Condition Codes] supports ICD-9-CM for historical purposes only. ICD-10-CM is available and **SHOULD** be used as the primary code for current encounter diagnoses.
* See the [Screening and Assessments] guidance page for more information when exchanging Social Determinants of Health (SDOH) Problems/Health Concerns.
* If `Condition.category` contains a Problem List item category (`problem-list-item`), `Condition.clinicalStatus` **SHOULD** be present.
* \*There is no single element in Condition that represents the date of diagnosis. It may be the [assertedDate Extension], `Condition.onsetDateTime`, or `Condition.recordedDate`.
    * Although all three are marked as Must Support, the server is not required to support all.
	* A server **SHALL** support `Condition.recordedDate`.
    * A server **SHALL** support at least one of [assertedDate Extension] and `Condition.onsetDateTime`. A server may support both, which means they support all 3 locations.
    * The client application **SHALL** support all three elements.

{% include link-list.md %}
