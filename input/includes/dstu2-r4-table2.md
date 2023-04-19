
<!--  liquid script for creating a markdown table from a csv file in the input/data folder source file = input/data/dstu2-r4-table.csv  -->

{% assign rows = site.data.dstu2-r4-table %}
{% for row in rows -%}
{% if forloop.first -%}
| {% for pair in row %}{{ pair[0] }} | {% endfor %}
| {% for pair in row %} --- |{% endfor %}
{% else -%}
| {% for pair in row %}{{ pair[1] }}|{% endfor %}
{% endif -%}
{% if forloop.last %}{:.grid}{% endif -%}
{% endfor %}





