<!--input/intro-notes/StructureDefinition-us-core-condition-encounter-diagnosis-notes.md -->
<!-- establish the page context and get type,title,optionally fixed-categories and code lists (remember to escape "|" with "\|" ) -->
{% assign id = include.id %}
{% assign sd = site.data.structuredefinitions[id] %}
{% assign type = sd.type %}
{% assign title = sd.title %}

{% include quickstart-intro.md %}

{% include quickstart-search.md type=type title=title  category="http://terminology.hl7.org/CodeSystem/observation-category\|social-history" code1="http://loinc.org\|11331-6" single_example=true %}

{% include link-list.md %}