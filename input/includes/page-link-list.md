<!--this liquid script generate a link-list of the IG pages including  all the IG artifacts based on their titles -->
{%- for pages_hash in site.data.pages -%}
{%- assign page = pages_hash[0] -%} 
{%- assign hash= pages_hash[1] -%}
{%- capture link -%}
{{hash.title | prepend: "[" | append: "]"}}: {{page}}
{%- endcapture -%}
{{link}}
{% endfor %} 