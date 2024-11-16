<!-- {% raw %}  This liquid script creates a ms target table using input data from input/data/csv files

This file is created with the python jupyter script: https://github.com/Healthedata1/MyNotebooks/blob/master/CapStatement/target_profile-tabler.ipynb 
with the following columns:
- profile: The US Core Profile that has Must Support Reference elements
- target1..target7: The  Must Support target profiles or resources (up to 7 for now may be more in future)
-  include parameters: file = "ms_refs","addl_uscdi_refs", "ms_choice_refs", "adl_uscdi_choice_refs"

example usage for MS MS Targets: {% include ms-target-table-generator.md file="ms_refs" %}
{% endraw %} -->

{% assign rows = site.data.[include.file] %}
{% for item in rows -%}
{% if forloop.first -%}
| US Core Profile | {% if include.file contains "ms" %}Must Support {% else %}Choice of {% endif %}Target Profiles |
|---|---|
{% endif -%}
{% if item.target1 -%}
| [{{item.profile}}] | [{{item.target1}}]{% if item.target2 %}<br />[{{item.target2}}]{% endif %}{% if item.target3 %}<br />[{{item.target3}}]{% endif %}{% if item.target4 %}<br />[{{item.target4}}]{% endif %}{% if item.target5 %}<br />[{{item.target5}}]{% endif %}{% if item.target6 %}<br />[{{item.target6}}]{% endif %}{% if item.target7 %}<br />[{{item.target7}}]{% endif %} |
{% endif -%}
{% if forloop.last %}{:.grid style="width: 75%"}{% endif -%}
{% endfor %}