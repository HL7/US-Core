{% comment %}
format of include file
include parameters:
level (required): the US Core Maturity Level to list (e.g, "5")

Emits a three-column list of the US Core profiles and extensions assigned to the
given level, for use inline after that level's criteria in the US Core Maturity
Levels section. The source is the us_core_maturity column of
input/data/profile_metadata.csv. Retired and deprecated artifacts are omitted.

A Liquid comment is used here rather than the usual HTML comment, and the whole
list is emitted on a single line, so that nothing but the list itself lands
inside the enclosing markdown list item. Either one at the start of a line would
end the list.

for example
{% raw %} {% include us-core-maturity-level-list.md level="5" %} {% endraw %}
{% endcomment %}
{%- assign artifacts = site.data.profile_metadata | where: "us_core_maturity", include.level | sort: "title" -%}
<div class="bg-success" markdown="1"><ul style="column-count: 3; column-gap: 2em; margin-top: 0.5em; list-style-type: disc;">{%- for artifact in artifacts -%}{%- assign is_retired = artifact.retired | default: "" -%}{%- assign is_deprecated = artifact.deprecated | default: "" -%}{%- if is_retired == "" and is_deprecated == "" -%}<li><a href="{{ artifact.rel_url }}">{{ artifact.title }}</a></li>{%- endif -%}{%- endfor -%}</ul></div><!-- new-content -->
