{%- for resource in site.data.ig.definition.resource -%}
{%- if resource.reference.reference == include.example -%}
[{{resource.name}}]({{ include.example | replace: "/", "-"}}.html)
{%- break -%}
{%- endif -%}
{%- endfor -%}
