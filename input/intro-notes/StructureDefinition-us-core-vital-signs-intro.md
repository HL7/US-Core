
### Mandatory and Must Support Data Elements

The following data-elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and terminology requirements.  The "Snapshot Table (Must Support)" tab below displays all the mandatory and must support data elements for this profile and the those inherited from the US Core Vital Signs Profile.

**Each Observation must have:**

1. a status
1. a category code of "vital-signs"
1. a [LOINC] code, if available, which tells you what is being measured
1.  a patient
1. a clinically relevant time

**Each Observation must support:**

1.  a result value
    - if the result value is a numeric quantity, a standard [UCUM] unit
1.  a reason if the value is absent*
1.  component results

*see guidance below

**Profile specific implementation guidance:**

- The observations **MAY** have additional codes that translate or map to the Observation code or category codes. For example:
   -  providing a local system specific code
   -  providing a more specific codes such as 8306-3 - *Body height - lying* in addition to 8302-2 - *Body height*.  Several additional observation codes are provided in the FHIR core specification [vital signs table].

  Note that the code system value **SHOULD** be supplied for each additional code.
- The observations **MAY** have [component] observations. For example, to qualify the vital sign observation 8310-5 - *Body temperature*, 8327-9 - *Body temperature measurement site** (oral, forehead, rectal, etc) may be used as a component observation. Several of these are provided in the FHIR core specification [vital signs table].
{% include DAR-exception.md %}
- Implementers may use this profile as a base for other vital signs in addition to those in this guide.

{% include link-list.md %}
