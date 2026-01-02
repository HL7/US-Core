{%- comment %} invoke with {% include search-requirement-handler.md conf_verb="SHOULD|SHALL" search=search %}  note that the parent variables are inherited  e.g resource_type,fixed_category , and code1, code2 , code3 {% endcomment -%}

{% assign conf_verb = include.conf_verb -%}
{% assign search_row = include.search -%}
{% assign search_codes = search_row.code | split: "," -%}
{% assign search_types = search_row.type | split: "," -%}

{%- comment %} search requirement details {% endcomment -%}
1. **{{conf_verb}}** {% if search_row.description %}{{search_row.description}} using {% else %}support searching using {% endif %}the combination of the {% comment %}preserve space{% endcomment -%}
{%- for search_code in search_codes -%}
{%- assign search_code_row = site.data.search_requirements | where:"code", search_code |  where: "base", resource_type | first -%}
{%- assign search_code_link = search_code_row.rel_url -%}
[{{ search_code }}]({{ search_code_link }}) {% unless forloop.last %} and {% endunless -%}
{% endfor -%}
search parameter{% if search_codes.size > 1 %}s{% endif -%}

   {% for search_code in search_codes %}
     {%- assign search_code_row = site.data.search_requirements | where:"code", search_code |  where: "base", resource_type | first -%}
      {% if search_code_row.multipleAnd_conf %}- Including {% if search_code_row.multipleAnd_conf == "SHOULD" %} optional {% endif %} support for *AND* search on `{{search_code}}` (e.g.`{{search_code}}=[date]&{{search_code}}=[date]&...`){% endif %}
      {% if search_code_row.multipleOr_conf %}- Including {% if search_code_row.multipleOr_conf == "SHOULD" %} optional {% endif %} support *OR* search on `{{search_code}}` (e.g.`{{search_code}}={system|}[code],{system|}[code],...`){% endif %}
      {% if search_code_row.shall_comparator %}- Including support for these `{{search_code}}` comparators: "{{ search_code_row.shall_comparator | split: "," | join: '", "' }}"{% endif %}
      {% if search_code_row.should_comparator %}- Including optional support for these `{{search_code}}` comparators: '{{ search_code_row.should_comparator | split: "," | join: '", "' }}"{% endif %}
      {% if search_code_row.shall_chain %}- Including support for these chained  parameters: `{% for i in search_code_row.shall_chain | split: "," %}{{ i | prepend: "." | prepend: search_code }}{% unless forloop.last %}`, `{% endunless %}{% endfor %}`{% endif %}
      {% if search_code_row.should_chain %}- Including optional support for these chained parameters: `{% for i in search_code_row.shall_chain | split: "," %}{{ i | prepend: "." | prepend: search_code }}{% unless forloop.last %}`, `{% endunless %}{% endfor %}`{% endif %}
      {% if search_code_row.shall_include %}- Including support for these `_include` parameters: `{{ search_code_row.shall_include | split: "," | join: '`, `' }}`{% endif %}
      {% if search_code_row.should_include %}- Including optional support for these `_include` parameters: `{{ search_code_row.should_include | split: "," | join: '`, `' }}`{% endif %}
   {%- endfor %}

{% comment %} Search syntax {% endcomment %}
   {% for search_code in search_codes %}
      {%- assign search_code_row = site.data.search_requirements | where:"code", search_code |  where: "base", resource_type | first -%}
      {%- assign search_record = site.data.search_requirements | where:"code", search_code | where: "base", resource_type | first -%}
      {%- assign search_type = search_record.type -%}
         {% if forloop.first %}`GET [base]/{{type}}?{% endif %}
      {{- search_code -}}
      {%- if search_code == '_id' %}=[id]' or 'GET [base]/{{type}}/[id]
      {%- elsif search_code == '_lastUpdated' %}=[dateTime]
      {%- elsif search_type == 'reference' %}={% if search_code == 'patient' %}{Patient/}[id]{% else %}{Type/}[id]{% endif %}
      {%- elsif search_type == 'status' %}=[status]
      {%- elsif search_type == 'composite' %}=[search_code]&amp;[value]
      {%- elsif search_type == 'uri' %}=[uri]
      {%- elsif search_type == 'string' %}=[{{search_code}}]
      {%- elsif search_type == 'date' %}={% if search_code_row.multipleAnd_conf and (search_code_row.shall_comparator or search_code_row.should_comparator) %}{gt|lt|ge|le}[dateTime]{&date={gt|lt|ge|le}[dateTime]&...}{% elsif search_code_row.multipleAnd_conf %}[dateTime]{&date=[dateTime]&...}{% elsif search_code_row.shall_comparator or search_code_row.should_comparator %}{gt|lt|ge|le}[dateTime]{% else %}[dateTime]{% endif %}
      {%- elsif search_type == 'token' %}={system|}[search_code]{% if search_code_row.multipleOr_conf %}{,{system|}[code],...}{% endif %}
      {%- else %}=[{{search_code}}]
      {%- endif -%}
      {%- unless forloop.last %}&{% else %}`{% endunless -%}
   {%- endfor %}
{% comment %} Search examples from the csv file replace '!CATEGORYNNN' and '!CODENNN' where NNN is 1, 2, 3 etc when code variables are needed{% endcomment %}
      {%- assign examples = search_row.example | split: "~" %}
      Example{% if examples.size > 1 %}{%  unless single_example -%}s{% endunless -%}{% endif %}:
      {%  unless single_example -%}
      >{% for ex in examples %}
      {% assign display_example = ex -%}
      {% assign display_example = ex | replace: '!CATEGORY', fixed_category | replace: '!CODE1', code1 | replace: '!CODE2', code2 | replace: '!CODE3', code3 -%}
      {{ forloop.index }}. {{ display_example }}
      >{% endfor -%}
      {% else -%}
      {% assign display_example = examples | first | replace: '!CATEGORY', fixed_category | replace: '!CODE1', code1 | replace: '!CODE2', code2 | replace: '!CODE3', code3 -%}
      >1. {{ display_example }}
      {% endunless %}
{% comment %} add in implementation notes from the csv file, replace '!CATEGORYNNN' and '!CODENNN' where NNN is 1, 2, 3 etc when code variables are needed - for easier reading, just the code - no system  {% endcomment %}
      *Implementation Notes*: {% assign imp_notes = search_row.imp_note -%}
        {% assign fixed_category_name = fixed_category | split: "|" | last -%}
        {% assign imp_notes = imp_notes | replace: resource_type, profile_name | replace: '!CATEGORY', fixed_category_name | replace: '!CODE1', code1 | replace: '!CODE2', code2 | replace: '!CODE3', code3 -%}
        {{ imp_notes }}{%- if search_codes[0] == '_id' %} (see [Parameters for all resources]{% else %} ( see {% endif %}{% for search_type in search_types %} [how to search by {{search_type}}]{% unless forloop.last %} and {% endunless %}{% endfor %}).