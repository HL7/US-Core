<div class="new-content" markdown="1">The US Core Condition Profile has been split into the US Core Condition Encounter Diagnosis Profile below and US Core Condition Problems and Health Concerns Profile
</div><!-- new-content -->

﻿This profile sets minimum expectations for the [Condition] resource to record, search, and fetch a list of problems and health concerns associated with a patient. It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.  For Encounter Diagnosis use the [US Core Condition Encounter Diagnosis Profile].

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core Condition Problems and Health Concerns Profile:

-   Query for a Patient’s current or historical problems and health concerns
-   [Record or update] a Patient’s problems and health concerns

### Mandatory and Must Support Data Elements


The following data-elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.  

**Each Condition must have:**

<!-- 1.  a status of the condition* -->
1.  a category code of ‘problem-list-item’ or ‘health-concern’
1.  a code that identifies the condition
1.  a patient

**Each Condition must support:**

1.  <span class="bg-success" markdown="1">a clinical status of the condition (e.g., active or resolved)</span><!-- new-content -->
1.  a verification status
1.  a category code of ‘sdoh’
1.  a date of diagnosis*
1.  <span class="bg-success" markdown="1">abatement date (in other words, date of resolution or remission)</span><!-- new-content -->
1.  a date when recorded*

*see guidance below

**Profile specific implementation guidance:**

* USCDI v2 applicable vocabulary standards for Problems/Health Concerns are SNOMED CT and ICD-10-CM.  For general guidance on extensible binding to coded data, review [this section](conformance-expectations.html#extensible-binding-for-codeableconcept-datatype) in the Conformance Expectations page.
  - The [US Core Condition Codes] supports ICD-9-CM for historical purposes only. ICD-10-CM is available and should be used as the primary code for current encounter diagnoses.
* See [SDOH Guidance] for more information when exchanging Social Determinants of Health (SDOH) Problems/Health Concerns.
* \*There is no single element in Condition that represents the date of diagnosis. It may be the [assertedDate Extension], `Condition.onsetDate`, or `Condition.recordedDate`.
    * Although all three are marked as must support, the server is not required to support all.
	* A server **SHALL** support `Condition.recordedDate`.
    * A server **SHALL** support at least one of [assertedDate Extension] and `Condition.onsetDate`. A server may support both, which means they support all 3 locations.
    * The client application **SHALL** support all three elements.

{% include link-list.md %}
