<!--format of include file 
include parameters:
type (required): resource type (e.g, Patient)
plural (optional): any text (e.g, 'true') if present multiple additional requirements = true, if not present single requirement
up to three LOINCs (1 or 3 required)
for example
{% raw %} {% include additional-requirements-intro.md type="Patient" plural="true" %} or {% include additional-requirements-intro.md type="DocumentReference" %} {% endraw %}
-->


**Additional USCDI Requirements:**

{% if include.plural %}These [Additional USCDI Requirements] elements are{% else %}This [Additional USCDI Requirements] element is{% endif %} not Mandatory or Must Support but {% if include.plural %}are{% else %}is{% endif %} required for ASTP Health IT certification testing and {% if include.plural %}are{% else %}is{% endif %} included in the formal definition of the profile and the {{include.type}} examples.
