
**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-   Query for a Patient's current or historical encounter diagnosis
-   [Record or update] a Patient's encounter diagnosis

### Mandatory and Must Support Data Elements

The following data-elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Views] below provides the  formal summary, definitions, and  terminology requirements.  

**Each Condition Must Have:**

<!-- 1.  a status of the condition* -->
1.  a category code of ‘encounter-diagnosis'
1.  a code that identifies the condition
1.  a patient

**Each Condition Must Support:**

1.  a clinical status of the condition (e.g., active or resolved)
1.  a verification status
1.  an encounter
1.  a date of diagnosis*
1.  abatement date (in other words, date of resolution or remission)
1.  a date when recorded*

*see guidance below

**Profile Specific Implementation Guidance:**

* For Problems and Health Concerns use the [US Core Condition Problems and Health Concerns Profile].
* For USCDI v2+ the applicable vocabulary standards for Encounter Diagnosis are SNOMED CT and ICD-10-CM.  For general guidance on extensible binding to coded data, review [this section](general-requirements.html#extensible-binding-for-coded-elements) in the General Requirements page.
  - The [US Core Condition Codes] supports ICD-9-CM for historical purposes only. ICD-10-CM is available and **SHOULD** be used as the primary code for current encounter diagnoses.
* The encounter **SHOULD** always be referenced in `Condition.encounter`.
* To search for an encounter diagnosis, query for Conditions that reference the Encounter of interest and have a category of `encounter-diagnosis`.  An example search is shown in the [Quick Start](#search) section below.
* \*There is no single element in Condition that represents the date of diagnosis. It may be the [assertedDate Extension], `Condition.onsetDate`, or `Condition.recordedDate`.
    * Although all three are marked as Must Support, the server is not required to support all.
	* A server **SHALL** support `Condition.recordedDate`.
    * A server **SHALL** support at least one of [assertedDate Extension] and `Condition.onsetDate`. A server may support both, which means they support all 3 dates.
    * The client application **SHALL** support all three elements.

{% include link-list.md %}
