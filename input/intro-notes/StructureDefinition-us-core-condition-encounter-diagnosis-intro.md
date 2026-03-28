
**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-   Query for a Patient's current or historical encounter diagnosis
-   [Record or update] a Patient's encounter diagnosis

### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.

**Each Condition Must Have:**

1. a category code of "encounter-diagnosis"
2. a code that identifies the condition<sup>1</sup>
3. a patient

**Each Condition Must Support:**

1. an encounter
2. date record was first recorded

{% include additional-requirements-intro.md type="Condition" plural="false" %}

1. a recorder<sup>2</sup>

<sup>1,2</sup> see guidance below

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the US Core Profile to support implementation and certification.

* For Problems and Health Concerns, use the [US Core Condition Problems and Health Concerns Profile].<sup>[§][CONF-0320]</sup>
* <span class="bg-success" markdown="1"><sup>1</sup>Unless exchanging legacy or text-only data, condition codes **SHOULD** be taken from SNOMED CT and ICD-10-CM, USCDI's applicable vocabulary standards for the Problem Data Element.<sup>[§][CONF-0900]</sup></span><!-- new-content -->
  - When using ICD codes, only *non-header* ICD-10-CM codes **SHOULD** be used.<sup>[§][CONF-0323]</sup>
  - The [US Core Condition Codes] value set supports ICD-9-CM for historical purposes only.
* The encounter **SHOULD** always be referenced in `Condition.encounter`.<sup>[§][CONF-0324]</sup>
* To search for an encounter diagnosis, query for Conditions that reference the Encounter of interest and have a category of `encounter-diagnosis`. An example search is shown in the [Quick Start](#search) section below.
{% include provenance-author-bullet-generator.md footnote-symbol='<sup>2</sup>' %}

{% include link-list.md %}
