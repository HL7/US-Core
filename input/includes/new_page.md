<!--
site.data.structuredefinitions.{SD}.name maps new artifact
site.data.structuredefinitions.{SD}.path maps to page.name
 -->
{%- for r_hash in site.data.resources -%}
  {%- assign r = r_hash[1] -%}
      {%- if r.path == page.name -%}
       {%- assign r_name = r.name -%}
       {%- break -%}
      {%- endif -%}
{%- endfor -%}

{%- assign new = false -%}
{%- for new_stuff in site.data.new_stuff -%}
    {%- if new_stuff == r_name  -%}
This page has new content for US Core Version 8.0.0
{:.new-content}
        {%- break -%}
    {%- endif -%}
{%- endfor -%}
