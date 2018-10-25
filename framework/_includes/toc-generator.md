{% for p in site.data.pages %}
{% assign pagepath = p[0] %}
{% unless pagepath contains 'ttl' or pagepath contains 'json' or  pagepath contains 'xml' or  pagepath contains 'definitions' or pagepath contains 'mappings' %}
{% assign pagelabel = site.data.pages[pagepath].label | remove: ".0" %}
{% assign pagetitle = site.data.pages[pagepath].title %}
{% assign depth = pagelabel | split: '.' %}
  {%- for i in depth -%}
  &nbsp;&nbsp;
  {%- endfor -%}
{{ pagelabel | plus: 1 }}&nbsp;-&nbsp;[{{ pagetitle | remove: ".html" }}]({{ pagepath }})
{% endunless %}
{% endfor %}
