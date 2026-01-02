<!--input/intro-notes/StructureDefinition-us-core-condition-encounter-diagnosis-notes.md -->
<!-- establish the page context and get type,title,optionally fixed-categories and code lists (remember to escape "|" with "\|" ) -->
{% assign id = include.id %}
{% assign sd = site.data.structuredefinitions[id] %}
{% assign type = sd.type %}
{% assign title = sd.title %}

{% include quickstart-intro.md %}

{% include quickstart-search.md type=type title=title  category="http://terminology.hl7.org/CodeSystem/observation-category\|procedure" code1="http://loinc.org\|44974-4" code2="http://loinc.org\|44963-7" code3="http://loinc.org\|8601-7" single_example=false %}

{% include link-list.md %}