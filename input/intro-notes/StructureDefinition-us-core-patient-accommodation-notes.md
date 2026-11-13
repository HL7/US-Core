<!-- establish the page context and get type,title,optionally fixed-categories and code lists (remember to escape "|" with "\|" ) -->
{% assign id = include.id %}
{% assign sd = site.data.structuredefinitions[id] %}
{% assign type = sd.type %}
{% assign title = sd.title %}

{% include quickstart-intro.md type=type %}

{% include quickstart-search.md type=type title=title  category="accommodation" code1="http://loinc.org\|116322-6" single_example=true %}

{% include link-list.md %}
