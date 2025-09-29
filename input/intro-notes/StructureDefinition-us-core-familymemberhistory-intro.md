
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

1. a recorder*

*see guidance below

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the US Core Profile to support implementation and certification.

- \*USCDI's applicable vocabulary standards for Family Health History are SNOMED CT and ICD-10-CM.
    - The [US Core Condition Codes] supports ICD-9-CM for historical purposes only. When using ICD codes, only *non-header* ICD-10-CM codes **SHOULD** be used.
{% include provenance-author-bullet-generator.md %}

{% include link-list.md %}
