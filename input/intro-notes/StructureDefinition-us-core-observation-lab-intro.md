
**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-   Query for lab results belonging to a Patient
-  [Record or update] lab results belonging to a Patient

### Mandatory and Must Support Data Elements

*In addition* to the Mandatory and Must Support data elements in the [US Core Observation Clinical Result Profile], the following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views]  section below provides the formal summary, definitions, and terminology requirements. {% include diff-display-note.md parent_profile='<span class="bg-success" markdown="1">US Core Observation Clinical Result Profile</span><!-- new-content -->' %}

**Each Observation Must Have:**

1.   a category code of 'laboratory'
2.   a laboratory [LOINC] code, if available, which tells you what is being measured

**Each Observation Must Support:**

1. <span class="bg-success" markdown="1">a timestamp when the resource last changed*</span><!-- new-content -->
2. a result value*
   - if the result value is a numeric quantity, a standard [UCUM] unit
   - if the result value is a coded quantity, a standard [SNOMED CT]
3. result interpretation
   - <span class="bg-success" markdown="1">
   if the result value is a numeric quantity, a standard [UCUM] unit
   </span><!-- new-content -->
4. result reference range
5. a specimen type (e.g., blood, serum, urine)

\* see guidance below

**Profile Specific Implementation Guidance:**

- For USCDI, systems are required to use SNOMED CT for coded results if the SCT code exists. 
- The specimen type can be communicated in the mandatory `Observation.code` (e.g., Blood Glucose), the Must Support `Observation.specimen` element, or through both elements.
{% include observation_guidance_1.md category="laboratory" example1=" such as 'chemistry'" example2=" (for example, a 24-Hour Urine Collection test)" %}
- <span class="bg-success" markdown="1">\*This profile inherits the invariant "us-core-3" from the US Core Observation Clinical Result Profile that requires UCUM to be used as a unit type for `Observation.valeQuantity.code`.</span><!-- new-content -->
- <span class="bg-success" markdown="1">\* See the US Core General Guidance page for [Searching Using lastUpdated]. Updates to `Meta.lastUpdated` **SHOULD** reflect:</span><!-- new-content -->
  - <span class="bg-success" markdown="1">New laboratory observations</span><!-- new-content -->
  - <span class="bg-success" markdown="1">Changes in the status of laboratory observations, including events that trigger the same status (e.g., amended → amended).</span><!-- new-content -->
  
{% include meta-updated-next-version.md %}

{% include link-list.md %}
