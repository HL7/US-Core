<!--format of include file 
include parameters:
type (required): resource type (e.g, Patient)
plural (optional): any text (e.g, 'true') if present multiple additional requirements = true, if not present single requirement
up to three LOINCs (1 or 3 required)
for example
{% raw %} {% include additional-requirements-intro.md type="Patient" plural="true" %} or {% include additional-requirements-intro.md type="DocumentReference" %} {% endraw %}
-->

<div class="bg-success" markdown="1">
{% if include.plural %}These elements are{% else %}This element is{% endif %} included in the formal definition of the profile and the {{include.type}} examples as [Additional USCDI Requirements] for certified systems. Elements that are not
Mandatory or Must Support but are required for ONC's g(10) certification.
</div><!-- new-content -->