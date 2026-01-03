<!--input/intro-notes/StructureDefinition-us-core-allergyintolerance-notes.md -->
<!-- establish the page context and get type -->
{% assign id = include.id %}
{% assign sd = site.data.structuredefinitions[id] %}
{% assign type = sd.type %}
{% assign title = sd.title %}

{% include quickstart-intro.md %}

{% include quickstart-search.md type=type title=title %}

#### Including Specimen when searching for an Observation or DiagnosticReport

Servers **MAY** support the [`_include`] parameter to request that additional resources be included in the response of a search query. For example, when searching for an Observation or DiagnosticReport that references Specimen, the Client can use the `_include` parameter to retrieve information about a specimen associated with the search results. The syntax for querying an Observation and the associated Specimen is:

`GET [base]/[Resource-type]?[parameter1]=[value1]{&...}&_include=Observation:specimen`

Example:

GET [base]/Observation?_id=9163726&_include=Observation:specimen

{% include link-list.md %}