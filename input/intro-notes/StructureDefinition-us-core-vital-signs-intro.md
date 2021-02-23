
This profile is based on the base FHIR [Vital Signs Profile] and identifies the must support elements and value sets which **SHALL** be present in the Observation resource when using this profile.  This profile is used as the base for the following vital signs profiles in this guide:

- [US Core Blood Pressure Profile]
- [US Core BMI Profile]
- [US Core Head Circumference Profile]
- [US Core Body Height Profile]
- [US Core Body Weight Profile]
- [US Core Body Temperature Profile]
- [US Core Heart Rate Profile]
- [US Core Pediatric BMI for Age Observation Profile]
- [US Core Pediatric Head Occipital-frontal Circumference Percentile
Profile]
- [US Core Pediatric Weight for Height Observation Profile]
- [US Core Pulse Oximetry Profile]
- [US Core Respiratory Rate Profile]

### Mandatory and Must Support Data Elements

The following data-elements are mandatory (i.e data MUST be present) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and terminology requirements.  The "Snapshot Table (Must Support)" tab below displays all the mandatory and must support data elements for this profile and the those inherited from the US Core Vital Signs Profile.

**Each Observation must have:**

1. a status
1. a category code of "vital-signs"
1. a [LOINC] code, if available, which tells you what is being measured
1  a patient
1. a clinically relevant time

**Each Observation must support:**

1.  a result value
    - if the result value is a numeric quantity, a standard [UCUM] unit
1.  a reason if the value is absent
1.  component results

**Profile specific implementation guidance:**

- The observations **MAY** have additional codes that translate or map to the Observation code or category codes. For example:
   -  providing a local system specific code
   -  providing a more specific codes such as 8306-3 - *Body height - lying* in addition to 8302-2 - *Body height*.  Several additional observation codes are provided in the FHIR core specification [vital signs table].

  Note that the code system value **SHOULD** be supplied for each additional code.
- The observations **MAY** have [component] observations. For example, to qualify the vital sign observation 8310-5 - *Body temperature*, 8327-9 - *Body temperature measurement site** (oral, forehead, rectal, etc) may be used as a component observation. Several of these are provided in the FHIR core specification [vital signs table].
- An Observation without a value, **SHALL** include a reason why the data is absent *unless* there are 1) component observations, or 2) reporting vital signs panel components using  `Observation.hasMember`.
- Implementers may use this profile as a base for other vital signs in addition to those in this guide.

### Examples

- for example see the profiles listed above

{% include link-list.md %}
