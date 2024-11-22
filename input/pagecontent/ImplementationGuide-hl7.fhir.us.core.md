
|||
|---|---|
|*Official URL*: {{ site.data.ig.url }}|*Version*: {{ site.data.ig.version }}|
|*NPM package name*: {{ site.data.ig.packageId }}|*ComputableName*: {{ site.data.ig.name }}|
|*Copyright/Legal*: Used by permission of HL7 International, all rights reserved Creative Commons License|
{:.grid}

{{ site.data.ig.description }}

- [XML](ImplementationGuide-{{site.data.ig.id}}.xml)
- [JSON](ImplementationGuide-{{site.data.ig.id}}.json)

### Cross Version Analysis

{% capture cross-version-analysis %}{% include cross-version-analysis.xhtml %}{% endcapture %}{{ cross-version-analysis | remove: '<p>' | remove: '</p>'}}

### IG Dependencies

This IG Contains the following dependencies on other IGs.

{% include dependency-table.xhtml %}

### Global Profiles

{% include globals-table.xhtml %}

### Copyrights

{% capture ip-statement %}{% include ip-statements.xhtml %}{% endcapture %}

{{ ip-statement | remove: '<p>' | remove: '</p>'}}


### Parameter Settings

The following [IG Parameters](https://confluence.hl7.org/display/FHIR/Implementation+Guide+Parameters) are set for this Implementation Guide:

{% for p in site.data.ig.definition.parameter -%}
- code: {{p.code}}<br/>value: {{p.value }}
{% endfor %}
