<div markdown="1" class="new-content">
﻿This profile sets minimum expectations for the [Observation] resource to record, search, and fetch retrieve structured and unstructured (narrative) components of diagnostic imaging test results for a patient. These observations include reasons, findings, and impressions.  It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core-Results profile:

-   Query for diagnostic imaging related tests results for a patient.
-  [Record or update] diagnostic imaging results belonging to a Patient

### Mandatory and Must Support Data Elements


The following data-elements must always be present ([Mandatory] definition]) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.  

**Each Observation must have:**

1.   a status
1.   a category code of 'imaging'
1.   a [LOINC] code, if available, which tells you what is being measured
1.   a patient

**Each Observation must support:**

1.  a time indicating when the measurement was taken
1. a result value or a reason why the data is absent*
   - if the result value is a numeric quantity, a standard [UCUM] unit

**Profile specific implementation guidance:**

{% include observation_guidance_1.md category="imaging" %}


### Examples

 - [DXA Femur-L ArMass BMD](Observation-dxa-femur-l-armass-bmd.html)
 - [DXA Hip-L Z-score BMD](Observation-dxa-hip-l-z-score-bmd.html)

</div>
{% include link-list.md %}
