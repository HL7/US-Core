
<!-- {% raw %} 
invoke using
{% include vitals-guidance.md %}
{% endraw %} -->
- The observations **MAY** have additional codes that translate or map to the Observation code or category codes. For example:
   -  providing a local system-specific code
   -  providing more specific codes such as 8306-3 - *Body height - lying* in addition to 8302-2 - *Body height*. Several additional observation codes are provided in the FHIR core specification [vital signs table].

  A code system value **SHOULD** be supplied for each additional code.
- The observations **MAY** have [component] observations. For example, to qualify the vital sign observation, 8310-5 - *Body temperature*, 8327-9 - *Body temperature measurement site* (oral, forehead, rectal, etc.) may be used as a component observation. The FHIR core specification [vital signs table] provides several of these.
{% include DAR-exception.md %}
- Implementers may use this profile as a base for other vital signs in addition to those in this guide.
