
**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

- Query for pulse oximetry observations for a patient
- [Record or update]  pulse oximetry observations belonging to a patient

### Mandatory and Must Support Data Elements

In addition to the Mandatory and Must Support data elements in the [US Core Vital Signs Profile], the following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.

**Each Observation Must Have:**

1. a fixed code for oxygen saturation in arterial blood as defined in the FHIR oxygen saturation profile
1. an additional coding for oxygen saturation in arterial blood by pulse oximetry

**Each Observation Must Support:**

1. a value for oxygen saturation
2. a code for inspired oxygen concentration*
3. a value for inspired oxygen concentration

\*see guidance below

**Profile Specific Implementation Guidance:**

- - Note that this profile also conforms to the base FHIR [Vital Signs Profile].
{% include vitals-guidance.md %}
- Inspired oxygen therapy may be represented with [component] observations when measured at the same time as the pulse oximetry measurements. They are expressed as inhaled oxygen flow rate (e.g., 6 liters/min) and inhaled oxygen concentration (e.g., 40% oxygen).
  - {:.stu-note}This profile is technically non-conformant with the base FHIR version 4.0.1 vitals profile which defines a *required* binding that excludes the concept for `L/min` for `Observation.component.value(x)`. This is a known issue and it means validation errors may occur when validating against this version of the US Core Pulse Oximetry Profile. A change request to correct this has been applied to the base FHIR ver 4.3.0 ("Release 4B").
- Many pulse oximetry readings are taken while the patient is breathing room air. The concept of "room air" (unmodified, ambient air) **SHOULD** be represented as an inhaled oxygen flow rate of 0 liters/min.
- A pulse oximetry reading without inspired oxygen component observations may imply that the measurement was performed while the patient was breathing room air or that the inspired oxygen reading was omitted. To remove this uncertainty, the inspired oxygen [component] observations **SHOULD** be used.

{% include link-list.md %}
