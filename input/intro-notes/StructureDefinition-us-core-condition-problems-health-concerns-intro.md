

**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-   Query for a Patient's current or historical problems and health concerns
-   [Record or update] a Patient's problems and health concerns

### Mandatory and Must Support Data Elements


The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.  

**Each Condition Must Have:**

1. a category code of "problem-list-item" or "health-concern"
2. a code that identifies the condition*
3. a patient

**Each Condition Must Support:**

1. a timestamp when the resource last changed*
2. a clinical status of the condition (e.g., active or resolved)
3. a verification status
4. a date of diagnosis*
5. abatement date (in other words, date of resolution or remission)
6. a date when recorded*



{% include additional-requirements-intro.md type="Condition" plural="true" %}

1. additional health status/assessment categories*
1. a recorder*



*see guidance below

**Profile Specific Implementation Guidance:**

* For Encounter Diagnosis, use the [US Core Condition Encounter Diagnosis Profile].
* \*The `Condition.code` has an *additional binding* of "[current]" and a base "preferred" binding.
  - For the conformance rules on the current binding for coded data, review [this section](general-requirements.html#current-binding-for-coded-elements) in the General Requirements page.
  - USCDI's applicable vocabulary standards for Problems/Health Concerns are SNOMED CT and ICD-10-CM.
    - The [US Core Condition Codes] only supports ICD-9-CM for historical purposes. When using ICD codes, only *non-header* ICD-10-CM codes **SHOULD** be used.
* See the [Screening and Assessments] guidance page for more information when exchanging Social Determinants of Health (SDOH) Problems/Health Concerns.
* \*The category of "problem-list-item" or "health-concern" is required, and, at a minimum, Certifying Systems **SHALL** support, a category of "sdoh", **SHOULD** support the other [US Core Simple Observation Category] codes, and **MAY** support other categories.
  * If the category is "problem-list-item", `Condition.clinicalStatus` **SHOULD** be present.
* \*There is no single element in Condition that represents the date of diagnosis. It may be the [assertedDate Extension], `Condition.onsetDateTime`, or `Condition.recordedDate`.
    * Although all three are marked as Must Support, the Server is not required to support all.
  * A Server **SHALL** support `Condition.recordedDate`.
    * A Server **SHALL** support at least one of [assertedDate Extension] and `Condition.onsetDateTime`. A Server may support both, which means they support all 3 locations.
    * The Client application **SHALL** support all three elements
- \* See the US Core General Guidance page for [Searching Using lastUpdated]. Updates to `.meta.lastUpdated` **SHOULD** reflect:
  - New problems and health concerns
  - Changes in the clinical status or verifications status of problems or health concerns
{% include provenance-author-bullet-generator.md %}

{% include link-list.md %}
