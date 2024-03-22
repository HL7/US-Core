<!-- This liquid script creates a US Core scope requirements table using input data from input/data/scopes.csv 
include parameters: conformance='SHALL'|'SHOULD'|'MAY' see below for how used, and crud='cruds' not currently used -->

{% assign rows = site.data.scopes -%}
{%- assign granular_scopes = '' -%}
{%- for item in rows -%}
{%- if item.resource_conformance == "SHALL" -%}
{% for i in (1..6) %}
{%- assign category =  'category_' | append: i -%}
{%- assign category_conformance =  'category_' | append: i |append: '_conformance' -%}

{%- assign conformance = false -%}
{%- unless include.conformance -%}
{%- if 'SHALLSHOULD' contains item[category_conformance] -%}
{%- assign conformance = true -%}
{%- endif -%}
{%- endunless -%}
{%- if item[category_conformance] == include.conformance -%}
{%- assign conformance = true -%}
{%- endif -%}

{%- if item[category] and conformance -%}
{%- assign resource_type = item.resource_type | strip | replace: ',' -%}
{%- assign category = item[category] | strip | append: ',' -%}
{%- assign scope =  resource_type | append: '.rs?category=' | append: category -%}
{%- assign granular_scopes =  granular_scopes | append: scope -%}
{%- endif -%}
{%- endfor -%}
{%- endif -%}
{%- endfor -%}
{%- assign granular_scopes = granular_scopes | split: "," | uniq | sort  %}