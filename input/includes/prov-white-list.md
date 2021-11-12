<ul id="prov-white-list">
{%- assign black_list = "Extension,Provenance,Medication,Organization,Practitioner,PractitionerRole,Location" | split:"," -%}
{%- for sd_hash in site.data.structuredefinitions -%}
  {%- assign sd = sd_hash[1] -%}
  {%- unless black_list contains sd.type -%}
    {%- for r_hash in site.data.resources -%}
      {%- assign r = r_hash[1] -%}
      {%- if r.name == sd.name -%}
         <li>{{r.title}}</li>
      {%- endif -%}
    {%- endfor -%}
  {%- endunless -%}
{%- endfor -%}
</ul>
