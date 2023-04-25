<!--format of include file 
include parameters:
type (required): resource type (e.g, Patient)
plural (optional): any text (e.g, 'true') if present multiple additional requirements = true, if not present single requirement
up to three LOINCs (1 or 3 required)
for example
{% raw %} {% include additional-requirements-intro.md type="Patient" plural="true" %} or {% include additional-requirements-intro.md type="DocumentReference" %} {% endraw %}
-->

For ONC's USCDI requirements, each {{include.type}} Must Support the following additional {% if include.plural %}elements. These elements are{% else %}element. This element is{% endif %} included in the formal definition of the profile and the {{include.type}} examples.