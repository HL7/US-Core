
### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile-specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements. The "Snapshot Table (Must Support)" tab below displays all the mandatory and must support data elements for this profile and those inherited from the US Core Vital Signs Profile.

**Each Observation must have:**

1. a status
1. a category code of "vital-signs"
1. a [LOINC] code, if available, which tells you what is being measured
1. a patient
1. a clinically relevant time

**Each Observation must support:**

1. a result value
    - if the result value is a numeric quantity, a standard [UCUM] unit
1. a reason if the value is absent*
1. component results

*see guidance below

**Profile specific implementation guidance:**

{% include vitals-guidance.md %}

{% include link-list.md %}
