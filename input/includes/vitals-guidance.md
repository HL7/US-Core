
<!-- {% raw %}
invoke using
{% include vitals-guidance.md %}
{% endraw %} -->
{% include additional-codings.md example1=' such as 8306-3 - *Body height - lying* in addition to 8302-2 - *Body height*. Several additional observation codes are provided in the FHIR core specification [vital signs table].'%}
- The observations **MAY** have [component] observations.<sup>[§][CONF-0447]</sup> For example, to qualify the vital sign observation, 8310-5 - *Body temperature*, 8327-9 - *Body temperature measurement site* (oral, forehead, rectal, etc.) may be used as a component observation. The FHIR core specification [vital signs table] provides several of these.
{% include DAR-exception.md %}
- Implementers may use this profile as a base for other vital signs in addition to those in this guide.
