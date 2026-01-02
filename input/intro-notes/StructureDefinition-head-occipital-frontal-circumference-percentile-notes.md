<!--input/intro-notes/StructureDefinition-us-core-condition-encounter-diagnosis-notes.md -->
<!-- establish the page context and get type,title,optionally fixed-categories and code lists (remember to escape "|" with "\|" ) -->
{% assign id = include.id %}
{% assign sd = site.data.structuredefinitions[id] %}
{% assign type = sd.type %}
{% assign title = sd.title %}

{% include quickstart-intro.md %}

{% include quickstart-search.md type=type title=title  category="http://terminology.hl7.org/CodeSystem/observation-category\|vital-signs" code3="http://loinc.org\|29463-7" code1="http://loinc.org\|8289-1" code2="http://loinc.org\|9843-4" single_example=false %}

{% include link-list.md %}