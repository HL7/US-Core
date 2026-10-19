{% include new_page.md %}

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core NutritionOrder Profile:

-   Query for NutritionOrder resources belonging to a Patient
-   Query for a Patient's NutritionOrder resources by oral diet type, status, or date
-   [Record or update] a Patient NutritionOrder

### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.

**Each NutritionOrder Must Have:**

1. a status
1. an intent code indicating whether the request is a proposal, plan, or order
1. a patient
1. the date and time the order was requested

**Each NutritionOrder Must Support:**

1. the oral diet requested
2. the type of oral diet or diet restriction
3. the orderer<sup>2</sup>

{% include additional-requirements-intro.md type="NutritionOrder" %}

1. instructions or additional information about the oral diet<sup>1</sup>

<sup>1,2</sup> see guidance below

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the US Core Profile to support implementation and certification.

* A NutritionOrder records the request for a diet, not its fulfillment. The act of providing the diet is represented with the [US Core Procedure Profile]. Whether the patient consumed a meal, such as the percentage eaten, is represented as an observation using the [US Core Simple Observation Profile]. A nutrition assessment evaluates the patient's overall nutritional status (see the [Screening and Assessments] page).
* A nutrition order is not always represented as a NutritionOrder. The resource used often depends on who fills the order. Diet, oral supplement, and tube feeding orders filled by food and nutrition services are typically represented as NutritionOrder. In some systems, enteral formulas filled by the pharmacy are typically represented using the [US Core MedicationRequest Profile]. Home nutrition may be represented using the [US Core ServiceRequest Profile]. To retrieve a patient's complete set of nutrition orders, clients may need to query all three profiles.
* This profile constrains only the oral diet (`NutritionOrder.oralDiet`). Implementers can also use it to order oral nutrition supplements (`NutritionOrder.supplement`) or enteral formulas (`NutritionOrder.enteralFormula`).
* <sup>1</sup>In some settings, particularly outpatient care, an oral diet may be ordered only using free-text instructions. This profile includes `NutritionOrder.oralDiet.instruction` to support these orders.
{% include provenance-author-bullet-generator.md footnote-symbol='<sup>2</sup>' %}

`NutritionOrder.oralDiet.type` uses the base FHIR R4 value set, which displays a 2019 expansion of the Dietary Regime SNOMED CT hierarchy. This value set is slated to move to HL7 Terminology (THO) and display the current expansion of values. if it is available before this guide is published, we will adopt it.
{:.note-to-balloters}

{% include link-list.md %}
