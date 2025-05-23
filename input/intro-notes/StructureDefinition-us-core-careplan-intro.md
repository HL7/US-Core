**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-   Query for a care plan belonging to a Patient
-   [Record or update] an existing care plan

### Mandatory and Must Support Data Elements


The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.  

**Each CarePlan Must Have:**

1. a status
1. a category
2. an intent
3. a patient


**Each CarePlan Must Support:**

1. a narrative summary of the patient assessment and plan of treatment*
1. a category code of "assess-plan"



{% include additional-requirements-intro.md type="CarePlan" plural="false" %}

1. a contributor*


*see guidance below

**Profile Specific Implementation Guidance:**
* \*The original Assessment and Plan design in the CarePlan was to support the "Assessment and Plan" from a narrative Progress Note. Systems have advanced significantly since the introduction of this requirement in 2015. Relaxing this to 0..1 allows more sophisticated systems to discretely encode a CarePlan instead of providing the narrative portion.
* Additional considerations for systems aligning with [HL7 Consolidated (C-CDA)](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=492) Care Plan requirements:
    - US Core Goal **SHOULD** be present in `CarePlan.goal`
    - US Core Condition **SHOULD** be present in `CarePlan.addresses`
    - Assessment and Plan **MAY** be included as narrative in `CarePlan.text`
* As an alternative to the US Core CarePlan, Assessment and Plan of Treatment may be included in various types of [Clinical Notes], such as Progress Notes, History & Physical (H&P), Discharge Summaries, etc.
{% include provenance-author-bullet-generator.md %}

{% include link-list.md %}
