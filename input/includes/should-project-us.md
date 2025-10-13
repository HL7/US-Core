<!--format of include file
include parameters:
element (required): resource e.g., (e.g, Patient.address)
for example
{% raw %} {% include should-project-us.md element="Patient.address" %} {% endraw %}
-->
Systems **SHOULD** <span class="bg-success" markdown="1">enable the user who enters the address to</span><!-- new-content --> follow the [Project US@ Technical Specification for Patient Addresses Final Version 1.0] as the standard style guide for `{{include.element}}.line` and `{{include.element}}.city`.
