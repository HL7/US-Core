* Additional codes that translate or map to the Observation code or category codes are allowed.  For example:
   -  providing both a local code and LOINC code
   -  providing a more specific code{{include.example1 | default: ''}}, a [SNOMED CT] concept, or system specific codes in addition to the '{{include.category}}' category code.
* Systems **SHOULD** support `Observation.effectivePeriod` to accurately represent procedure tests that are collected over a period of time{{include.example2 | default: ''}}.
{% include DAR-exception.md %}
* See the [General Guidance Section] for further guidance on using UCUM
* See the [LOINC scale type to FHIR data type mapping] for guidance on which `Observation.value[x]` data type to use based on the LOINC Type of Scale.

{% include link-list.md %}
