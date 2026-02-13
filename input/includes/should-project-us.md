<!--format of include file
include parameters:
type (required): resource type e.g., (e.g, Patient)
for example
{% raw %} {% include should-project-us.md type="Patient" %} {% endraw %}
-->
Systems **SHOULD** enable the user who enters the address to follow the [Project US@ Technical Specification for Patient Addresses Final Version 1.0] as the standard style guide for `{{include.type}}.address.line` and `{{include.type}}.address.city`.