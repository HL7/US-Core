{%- assign black_list = "Organization,Practitioner,PractitionerRole" | split:"," -%}
{% assign r_list = "" %}
{%- for sd_hash in site.data.structuredefinitions -%}
  {%- assign sd = sd_hash[1] -%}
  {%- if black_list contains sd.type -%}
       {% capture r_list %}{{ r_list | append: sd.title | append: "," }}{% endcapture %}
  {%- endif-%}
{%- endfor -%}
{% assign ur_list = r_list | split: "," | uniq | sort %}
<ul id="non-uscdi-profiles">
{% for r in  ur_list %}
    <li>{{r}}</li>
{% endfor %}
</ul>

