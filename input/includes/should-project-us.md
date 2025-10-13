<!--format of include file
include parameters:
type (required): resource type e.g., (e.g, Patient)
for example
{% raw %} {% include should-project-us.md type="Patient" %} {% endraw %}
-->
Systems **SHOULD** <span class="bg-success" markdown="1">enable the user who enters the address to</span><!-- new-content --> follow the [Project US@ Technical Specification for Patient Addresses Final Version 1.0] as the standard style guide for `{{include.type}}.address.line` and `{{include.type}}.address.city`.