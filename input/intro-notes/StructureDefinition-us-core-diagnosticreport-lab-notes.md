<!--input/intro-notes/StructureDefinition-us-core-condition-encounter-diagnosis-notes.md -->
<!-- establish the page context and get type,title,optionally fixed-categories and code lists (NOTE: escape "|" with "\|" and when only want a single example ) -->
{% assign id = include.id %}
{% assign sd = site.data.structuredefinitions[id] %}
{% assign type = sd.type %}
{% assign title = sd.title %}

{% include quickstart-intro.md %}

{% include quickstart-search.md type=type title=title category="http://terminology.hl7.org/CodeSystem/v2-0074\|LAB" code1="http://loinc.org\|24323-8" %}

{% include link-list.md %}