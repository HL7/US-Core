
**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-   Query for lab results belonging to a Patient
-  [Record or update] lab results belonging to a Patient

### Mandatory and Must Support Data Elements

*In addition* to the Mandatory and Must Support data elements in the [US Core Observation Clinical Result Profile], The following data-elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well. The [Formal Views]  section below provides the formal summary, definitions, and terminology requirements. {% include diff-display-note.md parent_profile='US Core Laboratory Result Observation Profile' %}

**Each Observation Must Have:**

1.   a category code of 'laboratory'
2.   a laboratory [LOINC] code, if available, which tells you what is being measured

**Each Observation Must Support:**

1. a result value*
   - if the result value is a numeric quantity, a standard [UCUM] unit
   - if the result value is a coded quantity, a standard [SNOMED CT]*
1. result interpretation
1. result reference range
1. a specimen type (e.g., blood, serum, urine)

\* see guidance below

**Profile Specific Implementation Guidance:**

- For USCDI V3+, systems are required to use SNOMED CT for coded results if the SCT code exists. 
- The specimen type can be communicated in the mandatory `Observation.code` (e.g., Blood Glucose), or the Must Support `Observation.specimen` element, or through both elements.
{% include observation_guidance_1.md category="laboratory" example1=" such as 'chemistry'" example2=" (for example, a 24-Hour Urine Collection test)" %}

{% include link-list.md %}
