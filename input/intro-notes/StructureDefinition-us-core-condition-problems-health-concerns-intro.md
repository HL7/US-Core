

**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-   Query for a Patient's current or historical problems and health concerns
-   [Record or update] a Patient's problems and health concerns

### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.

**Each Condition Must Have:**

1. a category code of "problem-list-item" or "health-concern"
2. a code that identifies the condition<sup>1</sup>
3. a patient

**Each Condition Must Support:**

1. a timestamp when the resource last changed<sup>2</sup>
2. a clinical status of the condition (e.g., active or resolved)
3. a verification status
4. a date of diagnosis<sup>2</sup>
5. a date of onset<sup>2</sup>
6. an abatement date<sup>2</sup>
7. a date when recorded<sup>2</sup>

{% include additional-requirements-intro.md type="Condition" plural="true" %}

1. additional health status/assessment categories<sup>3</sup>
1. a recorder<sup>4</sup>

<sup>1,2,3,4</sup> see guidance below

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the US Core Profile to support implementation and certification.

* For Encounter Diagnosis, use the [US Core Condition Encounter Diagnosis Profile].<sup>[§][CONF-0330]</sup>
* <sup>1</sup>The `Condition.code` has an *additional binding* of "[current]" and a base "preferred" binding.
  - For the conformance rules on the current binding for coded data, review [this section](general-requirements.html#current-binding-for-coded-elements) in the General Requirements page..<sup>[§][CONF-0321],[§][CONF-0322]</sup>
  - USCDI's applicable vocabulary standards for Problems/Health Concerns are SNOMED CT and ICD-10-CM.
    - When using ICD codes, only *non-header* ICD-10-CM codes **SHOULD** be used.<sup>[§][CONF-0323]</sup>
    - The [US Core Condition Codes] supports ICD-9-CM for historical purposes only.
* See the [Screening and Assessments] guidance page for more information when exchanging Social Determinants of Health (SDOH) Problems/Health Concerns.
* <sup>3</sup>The category of "problem-list-item" or "health-concern" is required <sup>[§][CONF-0831],[§][CONF-0832]</sup>, and, at a minimum, Certifying Systems **SHALL** support, a category of "sdoh",<sup>[§][CONF-0833]</sup> **SHOULD** support the other [US Core Simple Observation Category] codes,<sup>[§][CONF-0834]</sup> and **MAY** support other categories.<sup>[§][CONF-0835]</sup>
  * If the category is "problem-list-item", `Condition.clinicalStatus` **SHOULD** be present.<sup>[§][CONF-0331]</sup>
* <sup>2</sup>The assertedDate Extension represents the date of diagnosis. The `Condition.onsetDateTime` represents the date of onset, or the date or estimated date when signs or symptoms of a condition began. The `Condition.abatementdateTime` is the date of resolution or remission. And the `Condition.recordedDate` is the date the record was created in the system. Since users don't always capture these four values, they will not always be available for Servers to share with Clients.
- <sup>2</sup>See the US Core General Guidance page for [Searching Using lastUpdated]. Updates to `.meta.lastUpdated` **SHOULD** reflect:
  - New problems and health concerns.<sup>[§][CONF-0332]</sup>
  - Changes in the clinical status or verifications status of problems or health concerns.<sup>[§][CONF-0333]</sup>
{% include provenance-author-bullet-generator.md footnote-symbol='<sup>4</sup>' %}

{% include link-list.md %}
