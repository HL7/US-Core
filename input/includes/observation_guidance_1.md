
<!-- 
include parameters:
category (optional)
example1 (optional) 
example2 (optional)
recommendation (optional - extra recommendation inserted after first sentence in obs_cat_guidance.md)
example usage:
{% raw %} 
{% include observation_guidance_1.md category="laboratory" example1=" such as 'chemistry'" example2=" (for example, a 24-Hour Urine Collection test)" recommendation="Server **SHOULD** use [Observation Category Codes] if applicable." %}
{% endraw %} -->

{% include obs_cat_guidance.md -%}
{% include additional-codings.md %}
* Systems **SHOULD** support `Observation.effectivePeriod` to accurately represent measurements over time {{include.example2}}.
{% include DAR-exception.md %}
* See the [General Guidance] page for further guidance on SNOMED and UCUM.
* See the [LOINC scale type to FHIR data type mapping] for guidance on which `Observation.value[x]` data type to use based on the LOINC Type of Scale.

{% include link-list.md %}
