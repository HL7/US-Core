
**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-   Query for a Patient's current or historical encounter diagnosis
-   [Record or update] a Patient's encounter diagnosis

### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.  

**Each Condition Must Have:**

1. a category code of 'encounter-diagnosis'
2. a code that identifies the condition*
3. a patient

**Each Condition Must Support:**

1. an encounter
2. date record was first recorded



{% include additional-requirements-intro.md type="Condition" plural="false" %}

1. a recorder*



**Profile Specific Implementation Guidance:**

* For Problems and Health Concerns, use the [US Core Condition Problems and Health Concerns Profile].
* \*The `Condition.code` has an *additional binding* of "[current]" and a base "preferred" binding.
  - For the conformance rules on the current binding for coded data, review [this section](general-requirements.html#current-binding-for-coded-elements) in the General Requirements page.
  - USCDI's applicable vocabulary standards for Encounter Diagnosis are SNOMED CT and ICD-10-CM.
    - The [US Core Condition Codes] only supports ICD-9-CM for historical purposes. When using ICD codes, only *non-header* ICD-10-CM codes **SHOULD** be used as the primary code for current encounter diagnoses.
* The encounter **SHOULD** always be referenced in `Condition.encounter`.
* To search for an encounter diagnosis, query for Conditions that reference the Encounter of interest and have a category of `encounter-diagnosis`. An example search is shown in the [Quick Start](#search) section below.
{% include provenance-author-bullet-generator.md %}

{% include link-list.md %}
