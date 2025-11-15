
{% include new_page.md %}

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core FamilyMemberHistory
 profile:

-   Query for a family member's relevant health history
-   [Record or update] relevant health history for a a family member

### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.

**Each FamilyMemberHistory Must Have:**

1. a record status
2. a patient
3. a relationship to the patient

**Each FamilyMemberHistory Must Support:**

1. 	a condition that the related person had*

{% include additional-requirements-intro.md type="FamilyMemberHistory" plural="false" %}

1. a recorder†

\*† see guidance below

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the US Core Profile to support implementation and certification.

- \*USCDI's applicable vocabulary standards for Family Health History are SNOMED CT and ICD-10-CM.
    - When using ICD codes, only *non-header* ICD-10-CM codes **SHOULD** be used.
    - The [US Core Condition Codes] supports ICD-9-CM for historical purposes only.
{% include provenance-author-bullet-generator.md footnote-symbol='†' %}

<div class="note-to-balloters" markdown="1">
The [US Core FamilyMemberHistory Recorder Extension] is used to record the individual provenance. It will be replaced by the FHIR R6 [Cross Version Extension] when FHIR R6 is published.
</div><!-- note-to-balloters -->

{% include link-list.md %}
