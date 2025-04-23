
### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile-specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements. The "Snapshot Table (Must Support)" tab below displays all the Mandatory and Must Support data elements for this profile and those inherited from the US Core Vital Signs Profile.

**Each Observation Must Have:**

1. a status
1. a category code of "vital-signs"
1. a [LOINC] code, if available, which tells you what is being measured
1. a patient
1. a clinically relevant time

**Each Observation Must Support:**

1. a performer*
2. a result value
    - if the result value is a numeric quantity, a standard [UCUM] unit
3. a reason if the value is absent*
4. component results

*see guidance below

**Profile Specific Implementation Guidance:**

{% include vitals-guidance.md %}
{% include provenance-author-bullet-generator.md %}

<div class="stu-note" markdown="1">
This profile conforms to the base FHIR ver 4.0.1 vitals profile, which defines a *required* binding for `Quantity.code` concepts. This means validation errors occur when validating derived profiles that use other `Quantity.code` concepts such as `L/min` for `Observation.component.value(x)` in the [US Core Pulse Oximetry Profile]. This known issue has been corrected in the base FHIR specification since version 4.3.0 ("Release 4B").
</div><!-- stu-note -->



{% include link-list.md %}
