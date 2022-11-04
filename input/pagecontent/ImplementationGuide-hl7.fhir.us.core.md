
|||
|---|---|
|*Official URL*: {{ site.data.ig.url }}|*Version*: {{ site.data.ig.version }}|
|*Active as of*: {% if site.data.ig.status == 'active' %}{{ "now" | date: "%Y-%m-%d %H:%M" }}{% endif %}|*ComputableName*: {{ site.data.ig.name }}|
|*Copyright/Legal*: Used by permission of HL7 International, all rights reserved Creative Commons License|
{:.grid}

{{ site.data.ig.description }}

- [XML](ImplementationGuide-{{site.data.ig.id}}.xml)
- [JSON](ImplementationGuide-{{site.data.ig.id}}.json)

### IG Dependencies

This IG Contains the following dependencies on other IGs.

{% include dependency-table.xhtml %}


### Parameter Settings

The following [IG Parameters](#) are set for this Implementation Guide:

{% for p in site.data.ig.definition.parameter %}
- code: {{p.code}}<br/>value: {{p.value }}
{%- endfor -%}

