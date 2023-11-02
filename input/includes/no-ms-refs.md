<!--format of include file 
include parameters:
element (optional): profile element(e.g. Observation.derivedFrom) 
for example
{% raw %} {% include no-ms-refs.md element="Observation.derivedFrom" %} {% endraw %}
-->
Although none of the {% if include.element %}`{{include.element}}`{% endif %} [references are flagged as *Must Support*](must-support.html#must-support---resource-references), the server **SHALL** support at least one of them.