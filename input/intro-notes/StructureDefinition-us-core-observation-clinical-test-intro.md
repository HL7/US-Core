
﻿This profile sets minimum expectations for the [Observation] resource  to record, search, and fetch non-imaging and non-laboratory clinical tests results for a patient.  It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core-Results profile:

-   Query for non-imaging and non-laboratory tests results for a patient.
-  [Record or update] clinical tests results belonging to a Patient

### Mandatory and Must Support Data Elements


The following data-elements must always be present ([Mandatory] definition]) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.

**Each Observation must have:**

1.   a status
1.   a category code of 'procedure'
1.   a [LOINC] code, if available, which tells you what is being measured
1.   a patient

**Each Observation must support:**

1.  a time indicating when the measurement was taken
1. a result value or a reason why the data is absent*
   - if the result value is a numeric quantity, a standard [UCUM] unit

**Profile specific implementation guidance:**

{% include observation_guidance_1.md category=procedure example1='' example2='' %}


### Examples


 - [observation-rhythm](#.html)
 - [todo](#.html)

{% include link-list.md %}
