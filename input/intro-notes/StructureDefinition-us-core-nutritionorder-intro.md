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
1. the type of oral diet or diet restriction<sup>1</sup>
1. the orderer<sup>2</sup>

{% include additional-requirements-intro.md type="NutritionOrder" %}

1. instructions or additional information about the oral diet

<sup>1,2</sup> see guidance below

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the US Core Profile to support implementation and certification.

* This profile constrains only the oral diet. `NutritionOrder.supplement` and `NutritionOrder.enteralFormula` are not constrained, and no element in either is *Must Support*.
* A nutrition order is not always represented with a NutritionOrder. Depending on the context, the same order can be communicated with the [US Core ServiceRequest Profile] when the request is procedure focused, or with the [US Core MedicationRequest Profile] when the request is medication related. Clients can expect to find a nutrition order in any of these three profiles.
* A NutritionOrder records the request for a diet, not its fulfillment. The act of providing the diet is represented with the [US Core Procedure Profile], and findings about what the patient has eaten are represented as nutrition assessments. See the [Screening and Assessments] page for the USCDI *Nutrition Assessment* Data Element.
* <sup>1</sup>The `NutritionOrder.oralDiet.type` binding to the [Diet Type](https://hl7.org/fhir/R4/valueset-diet-type.html) value set is strengthened from the base FHIR *example* strength to *preferred*. That value set selects the SNOMED CT descendants of 182922004 (Dietary regime), which include the International Dysphagia Diet Standardisation Initiative (IDDSI) framework concepts. Other codes **MAY** be used, and a diet with no suitable code can be recorded as text in `NutritionOrder.oralDiet.type.text`.
{% include provenance-author-bullet-generator.md footnote-symbol='<sup>2</sup>' %}

{% include link-list.md %}
