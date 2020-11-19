
This profile sets minimum expectations for the [Observation] resource to record, search, and fetch pulse oximetry and inspired oxygen observations associated with a patient. It is based on the [US Core Vital Signs Profile] and identifies the *additional* mandatory core elements, extensions, vocabularies and value sets which **SHALL** be present in the Observation resource when using this profile.

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core Pulse Oximetry Profile:

- Query for pulse oximety observations for a patient
- [Record or update]  pulse oximety observations belonging to a patient

### Mandatory and Must Support Data Elements

In addition to the mandatory and must support data elements in the FHIR Oxygen Saturation Profile, the following data-elements are mandatory (i.e data MUST be present) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.

**Each Observation must have:**

1. a fixed code for oxygen saturation in arterial blood as defined in the FHIR oxygen saturation profile
1. a additional coding for oxygen saturation in arterial blood by pulse oximetry

**Each Observation must support:**

1. a code for inspired oxygen concentration
1. a value for inspired oxygen concentration

**Profile specific implementation guidance:**

- Inspired oxygen therapy may be represented with [component] observations when measured at the same time as the pulse oximetry measurements. They are expressed as inhaled oxygen flow rate (e.g., 6 liters/min) and as inhaled oxygen concentration (e.g., 40% oxygen).
- Many pulse oximetry readings are taken while the patient is breathing room air.  The concept of "room air" (unmodified, ambient air) should be represented as an inhaled oxygen flow rate of 0 liters/min.
- A pulse oximetry reading without component inspired oxygen observations may imply that the measurement was performed while the patient was breathing room air or that the inspired oxygen reading was omitted. To remove this uncertainty, the inspired oxygen [component] observations should be used.

### Examples

- [Pulse Oximetry Example](Observation-satO2-fiO2.html)

{% include link-list.md %}
