{% assign assessments = "SDOH,Functional,Disability,Mental,PE,Booze,Drugs" %}
{% for group in site.data.uscdi-examples.groups %}
{%- if assessments contains group[0] -%}
#### {{ group[1].description }}

{% for example in group[1].resources -%}
- {% include example_link.md example=example %}
{% endfor -%}
{%- endif -%}
{% endfor %}