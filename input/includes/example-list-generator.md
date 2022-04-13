{% assign my_types = "" %}
{% for p in site.data.ig.definition.resource %}
  {%- if p.exampleBoolean or p.exampleCanonical -%}

    {% assign my_types =  my_types | append: "," | append: p.reference.reference | split: '/' | first %}

  {% endif %}
{% endfor %}

{% assign my_array = my_types | split: "," %}
{% assign my_array = my_array | sort | uniq %}

{% for i in my_array offset:1 %}
### {{i}}
<ul>
  {%- for p in site.data.ig.definition.resource -%}
      {%- if p.exampleBoolean or p.exampleCanonical -%}
        {%- assign type =  p.reference.reference | split: '/' | first -%}
            {%- if type == i %}

              {%- assign new = false -%}
              {%- for new_stuff in site.data.new_stuff -%}
                 {%- if p.name == new_stuff -%}
                   {%- assign new = true -%}
                   {%- break -%}
                 {%- endif -%}
              {%- endfor -%}

              {%- if new -%}
                <li><a href="{{p.reference.reference | replace: '/','-'}}.html"><span class="bg-success" markdown="1">{{p.name}}</span><!-- new-content --></a></li>
              {% else %}
                <li><a href="{{p.reference.reference | replace: '/','-'}}.html">{{p.name}}</a></li>
              {% endif %}

          {%- endif -%}
       {%- endif -%}
   {%- endfor %}
</ul>
{% endfor %}
