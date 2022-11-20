
<!-- {% raw %}
parameter:
parent_profile (required) Title of US Core Profile from which this profile inherits
example usage:
 {% include diff-display-note.md parent_profile='US Core Laboratory Result Observation Profile' %} {% endraw %} -->
Note that the "Differential Table" displays elements unique to this profile and the "Key Elements Table” displays a combined view of elements for this profile and the {{include.parent_profile |default: "parent profiles"}}.