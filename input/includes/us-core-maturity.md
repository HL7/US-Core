<!--format of include file
include parameters:
id (required): the profile or extension StructureDefinition id (e.g, us-core-patient)

Looks up the artifact's US Core Maturity Level in the us_core_maturity column of
input/data/profile_metadata.csv and renders it as a link to the US Core Maturity
Levels guidance. The FHIR Maturity Level (FMM) is a separate rating, declared on
the artifact with the structuredefinition-fmm extension and rendered by the
publisher in the artifact header.

The page including this file must also include link-list.md, which defines the
[US Core Maturity] label.

for example
{% raw %} {% include us-core-maturity.md id="us-core-allergyintolerance" %} {% endraw %}
-->
{%- assign maturity_row = site.data.profile_metadata | where:"id", include.id | first -%}
**[US Core Maturity]: {{ maturity_row.us_core_maturity }}**
