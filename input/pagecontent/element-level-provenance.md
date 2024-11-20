<!-- Using Provenance To Target Resource Elements input/pagecontent/element-level-provenence.md-->

<div class="stu-note" markdown="1">
This section is informative and not a requirement for systems conforming to the US Core Provenance Profile.
</div><!-- stu-note -->

Provenance typically communicates a single activity about one or more target resources identified via `Provenance.target`. However, it can focus on one or more resource *elements* using the FHIR [Target Element] extension on `Provenance.target` and identifying the target elements using [element ids]. For example, to document how and who supplied patient demographic data such as race and ethnicity, gender identity, and sexual orientation.

Example:

In the following [US Core Patient Profile] example, the patient demographic data such as Race and Ethnicity (R/E), gender identity, etc., have *individual element ids* within a resource for internal and external referencing:

<!-- {% raw %} {% include examplebutton_default.html example="Patient-example-targeted-provenance.json" b_title = "Click Here to See Individual Element Ids Within a Patient Resource Example" %} {% endraw %} -->

The following  [US Core Provenance Profile] resource communicates who, how, and when elements such as Race and Ethnicity (R/E), gender identity, etc., were collected. Note that the [Target Element] Extension references the element ids within the Patient resource:

<!-- {% raw %} {% include examplebutton_default.html example="Provenance-example-targeted-provenance.json" b_title = "Click Here to See an Element Level Provenance Example" %} {% endraw %} -->

{% include link-list.md %}
