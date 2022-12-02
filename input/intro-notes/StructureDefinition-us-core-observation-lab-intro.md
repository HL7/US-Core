
**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-   Query for lab results belonging to a Patient
-  [Record or update] lab results belonging to a Patient

### Mandatory and Must Support Data Elements

*In addition* to the mandatory and must support data elements in the [US Core Observation Clinical Result Profile], The following data-elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well. The [Formal Views]  section below provides the formal summary, definitions, and terminology requirements. {% include diff-display-note.md parent_profile='US Core Laboratory Result Observation Profile' %}

**Each Observation must have:**

1.   a category code of 'laboratory'
2.   a <span class="bg-success" markdown="1">laboratory</span><!-- new-content --> [LOINC] code, if available, which tells you what is being measured

**Each Observation must support:**

1. a result value*
   - <span class="bg-success" markdown="1">if the result value is a numeric quantity, a standard [UCUM] unit</span><!-- new-content -->
   - <span class="bg-success" markdown="1">if the result value is a coded quantity, a standard [SNOMED CT]*</span><!-- new-content -->
2. <span class="bg-success" markdown="1">a specimen type (e.g., blood, serum, urine)</span><!-- new-content -->

\* see guidance below

**Profile specific implementation guidance:**

- <span class="bg-success" markdown="1">For USCDI V3+, systems are required to use SNOMED CT for coded results if the SCT code exists.</span><!-- new-content --> 
- <span class="bg-success" markdown="1">The specimen type may be implicit `Observation.code` (e.g., Blood Glucose) or communicated using `Observation.specimen`. In addition, the Specimen resource can share other information such as collection details.</span><!-- new-content -->
{% include observation_guidance_1.md category="laboratory" example1=" such as 'chemistry'" example2=" (for example, a 24-Hour Urine Collection test)" %}

{% include link-list.md %}
