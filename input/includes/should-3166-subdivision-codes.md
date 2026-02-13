<!--format of include file
include parameters:
type (required): resource e.g., (e.g, Patient)
for example
{% raw %} {% include should-3166-subdivision-codes.md type="Patient" %} {% endraw %}
-->
For `{{include.type}}.address.state`, this profile uses USPS Two Letter Alphabetic Codes for US states. When encoding addresses outside the US, systems **SHOULD** use the [ISO 3166 subdivision codes](https://www.iso.org/iso-3166-country-codes.html).