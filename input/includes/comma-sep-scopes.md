{%- assign rows = site.data.scopes -%}
{%- assign scopes = '' -%}
{%- for item in rows -%}
{%- unless forloop.first -%}
{%- unless item.add_scope == "FALSE" -%}
{%- assign scope = item.resource_type | strip | prepend: 'patient/' | append: '.rs,' -%}
{%- assign scopes =  scopes | append: scope -%}
{%- if item.category_1 -%}
{%- assign resource_type = scope | replace: ',' | append: '?category=' -%}
{%- assign category = item.category_1 | strip | append: ',' -%}
{%- assign scope =  resource_type | append: category -%}
{%- assign scopes =  scopes | append: scope -%}
{%- endif -%}
{%- if item.category_2 -%}
{%- assign category = item.category_2 | strip | append: ',' -%}
{%- assign scope =  resource_type | append: category -%}
{%- assign scopes =  scopes | append: scope -%}
{%- endif -%}
{%- if item.category_3 -%}
{%- assign category = item.category_3 | strip | append: ',' -%}
{%- assign scope =  resource_type | append: category -%}
{%-  assign scopes =  scopes | append: scope -%}
{%- endif -%}
{%- endunless -%}
{%- endunless -%}
{%- endfor -%}
{%- assign scopes = scopes | split: "," | uniq | sort  -%}
{% for scope in scopes -%}
    {{ scope | prepend: '    "'}}"{% unless forloop.last %},{% endunless %}
{% endfor %}