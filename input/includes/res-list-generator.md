
<!-- Use for sorted flat list resources ValueSet, CodeSystem, OperationDefinition  allows for highlighting new stuff using include parameter. SearchParameter works too but can't be sorted by Type and no title element so need to convert id to title using something like {%raw%}{r.id|split "-" | join | capitalize}}{%endraw%}-->
{% assign my_types = "" %}
{%- for r_hash in site.data.resources -%}
  {% assign r_type = r_hash[0] | split: '/' | first %}
  {%- assign r = r_hash[1] -%}
  {%- if r_type == include.type %}
    {% assign my_types =  my_types | append: ","s | append: r.name %}
  {%- endif -%}
{% endfor %}
{% assign my_array = my_types | split: "," %}
{% assign my_array = my_array | sort | uniq %}

<ul>
{% for i in my_array offset:1 %}
  {%- for r_hash in site.data.resources -%}
      {% assign r_type = r_hash[0] | split: '/' | first %}
      {%- assign r = r_hash[1] -%}
      {%- if r.name == i and r_type == include.type %}
        {%- assign new = false -%}
        {%- for new_stuff in site.data.new_stuff -%}
           {%- if new_stuff == i -%}
             {%- assign new = true -%}
             {%- break -%}
           {%- endif -%}
        {%- endfor -%}

        {%- if new -%}
          <li><a href="{{r.path}}"><span class="bg-success" markdown="1">{{r.title}}</span><!-- new-content --></a></li>
        {% else %}
          <li><a href="{{r.path}}">{{r.title}}</a></li>
        {% endif %}

    {% endif %}
  {%- endfor -%}
{% endfor %}
</ul>
