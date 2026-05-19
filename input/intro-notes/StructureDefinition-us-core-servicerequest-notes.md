<!--input/intro-notes/StructureDefinition-us-core-allergyintolerance-notes.md -->
<!-- establish the page context and get type -->
{% assign id = include.id %}
{% assign sd = site.data.structuredefinitions[id] %}
{% assign type = sd.type %}
{% assign title = sd.title %}

{% include quickstart-intro.md %}

{% include quickstart-search.md type=type title=title category="LG41762-2 (SDOH)" %}

{% include link-list.md %}