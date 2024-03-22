<!-- This liquid script creates a US Core scope requirements table using input data from input/data/scopes.csv
include parameters: conformance='SHALL'|'SHOULD'|'MAY'see below for how used and crud='cruds'<<< not used -->

{% assign rows = site.data.scopes -%}
{%- assign resource_scopes = '' -%}
{%- for item in rows -%}
{%- if item.resource_conformance == include.conformance -%}
{%- assign scope = item.resource_type | strip | append: ',' -%}
{%- assign resource_scopes =  resource_scopes | append: scope -%}
{%- endif -%}
{%- endfor -%}
{%- assign resource_scopes = resource_scopes | split: "," | uniq | sort %}