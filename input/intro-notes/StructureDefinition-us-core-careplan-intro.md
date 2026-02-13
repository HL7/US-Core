**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-   Query for a care plan belonging to a Patient
-   [Record or update] an existing care plan

### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.

**Each CarePlan Must Have:**

1. a status
<!-- 1. a category -->
1. an intent
2. a patient

**Each CarePlan Must Support:**

1. a narrative summary of the patient assessment and plan of treatment*
2. a category
<!-- 1. a category code of "assess-plan" -->

{% include additional-requirements-intro.md type="CarePlan" plural="false" %}

1. a contributor†
2. references to health issues this plan addresses*

\*† see guidance below

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the US Core Profile to support implementation and certification.

* \*The original US Core CarePlan Profile was designed to support the "Assessment and Plan" from a narrative Progress Note. The future direction of US Core CarePlan Profile is continue to move from text-based content to discrete references to conditions/needs (`CarePlan.addresses`), goals (`CarePlan.goal`), and strategies (`CarePlan.activities`).

* Additional considerations for systems aligning with [HL7 Consolidated (C-CDA)](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=492) Care Plan requirements:
    - US Core Goal **SHOULD** be present in `CarePlan.goal`
    - US Core Condition **SHOULD** be present in `CarePlan.addresses`
    - Assessment and Plan **MAY** be included as narrative in `CarePlan.text`
* As an alternative to the US Core CarePlan, Assessment and Plan of Treatment may be included in various types of [Clinical Notes], such as Progress Notes, History & Physical (H&P), Discharge Summaries, etc.
{% include provenance-author-bullet-generator.md footnote-symbol='†' %}

<!-- add this guidance if keeping assess-plan category -->
<!-- -  Systems that always populate category = "AssessPlan" and always include CarePlan.addresses will consistently meet the USCDI data element requirements for both Care Plan and Assessment and Plan.</span>new-content -->

{% include link-list.md %}
