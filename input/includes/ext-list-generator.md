<!-- Use for sorted flat list  Extension allows for highlighting new stuff using include parameter -->
{% assign profile_extensions = "" %}
{%- for sd_hash in site.data.structuredefinitions -%}
  {%- assign sd = sd_hash[1] -%}
  {%- if sd.type == "Extension" -%}
{%- unless ig_only contains sd.name or realm_only contains sd.name -%}
    {% assign profile_extensions = profile_extensions | append: "," | append: sd.name %}
{%- endunless -%}
  {%- endif -%}
{% endfor %}
{%- if include.use == "ig" -%}{% assign my_array = ig_only | split: "," %}
{%- elsif include.use == "realm" -%}{% assign my_array = realm_only | split: "," %}
{%- else -%}{% assign my_array = profile_extensions | split: "," %} <!-- include.use == "profile" -->
{%- endif -%}
{% assign my_array = my_array | sort | uniq %}
<ul>
  {% for i in my_array %}
    {%- for sd_hash in site.data.structuredefinitions -%}
      {%- assign sd = sd_hash[1] -%}
      {%- if sd.name == i %}
        {%- assign new = false -%}
        {%- for new_stuff in site.data.new_stuff -%}
          {%- if new_stuff == i -%}
            {%- assign new = true -%}
            {%- break -%}
          {%- endif -%}
        {%- endfor -%}
        {%- if new -%}
          <li>
            <a href="{{sd.path}}">
              <span class="bg-success" markdown="1">{{ sd.title }}</span><!-- new-content --></a>
          </li>
        {% else %}
          <li>
            <a href="{{sd.path}}">{{ sd.title }}</a>
          </li>
        {% endif %}
      {% endif %}
    {% endfor %}
  {% endfor %}
</ul>