<!--input/intro-notes/StructureDefinition-us-core-allergyintolerance-notes.md -->
<!-- establish the page context and get type -->
{% assign id = include.id %}
{% assign sd = site.data.structuredefinitions[id] %}
{% assign type = sd.type %}
{% assign title = sd.title %}

{% include quickstart-intro.md %}

{% include quickstart-search.md type=type title=title %}

---

<sup>1</sup> Although the CVX code system contains some concepts that are  procedures, medications, or substances rather than immunizations, the value set defined in VSAC has removed those and retained only the vaccine codes (see the exclusion definition in VSAC for more detail)

{% include link-list.md %}