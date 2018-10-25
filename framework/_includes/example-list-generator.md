{% for p in site.html_pages %}
{% unless p.name contains 'ttl' or p.name contains 'json' or  p.name contains 'xml' or  p.name contains 'definitions' or p.name contains 'mappings'%}
    {% assign title = p.name | remove: ".html" | remove: ".md" | split: '-' %}
    {% for e in site.example_types %}
      {% if title contains e %}
- [{% for word in title %}{{ word | capitalize }} {% endfor %}]({{ p.path }})
      {% endif %}
    {% endfor %}
  {% endunless %}
{% endfor %}
