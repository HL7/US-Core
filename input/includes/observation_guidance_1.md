
<!-- 
include parameters:
category (optional)
example1 (optional) 
example2 (optional)
example usage:
{% raw %} 
{% include observation_guidance_1.md category="laboratory" example1=" such as 'chemistry'" example2=" (for example, a 24-Hour Urine Collection test)" %}
{% endraw %} -->

{% include obs_cat_guidance.md -%}
* Additional codes that translate or map to the Observation code or category codes are allowed.  For example:
   -  providing both a local code and LOINC code
   -  providing a more specific code {{include.example1}}, a [SNOMED CT] concept, or a system specific code.
* Systems **SHOULD** support `Observation.effectivePeriod` to accurately represent procedure tests that are collected over a period of time {{include.example2}}.
{% include DAR-exception.md %}
* See the [General Guidance] page for further guidance on using SNOMED and UCUM.
* See the [LOINC scale type to FHIR data type mapping] for guidance on which `Observation.value[x]` data type to use based on the LOINC Type of Scale.

{% include link-list.md %}
