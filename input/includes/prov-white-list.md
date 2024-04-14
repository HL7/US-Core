{%- assign black_list = "Extension,Provenance,Medication,Organization,Practitioner,PractitionerRole,Location,Specimen,Questionnaire" | split:"," -%}
{% assign r_list = "" %}
{%- for sd_hash in site.data.structuredefinitions -%}
  {%- assign sd = sd_hash[1] -%}
  {%- unless black_list contains sd.type -%}
       {% capture r_list %}{{ r_list | append: sd.type | append: "," }}{% endcapture %}
  {%- endunless -%}
{%- endfor -%}
{% assign ur_list = r_list | split: "," | uniq | sort %}
<ul>
<li> The US Core Provenance resource <strong>SHALL</strong> be supported for these US Core resource types: 
<ul id="prov-white-list">
{% for r in  ur_list %}
    <li>{{r}}</li>
{% endfor %}
</ul>
</li>
</ul>
