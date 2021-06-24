
﻿Laboratory results are grouped and summarized using the [DiagnosticReport] resource which reference [Observation] resources.  Each Observation resource represents an individual laboratory test and result value, a “nested” panel (such as a microbial susceptibility panel) which references other observations, or rarely a laboratory test with component result values. This profile sets minimum expectations for the Observation resource resource to record, search, and fetch laboratory test results associated with a patient.  It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core-Results profile:

-   Query for lab results belonging to a Patient
-  [Record or update]  lab results belonging to a Patient

### Mandatory and Must Support Data Elements


The following data-elements must always be present ([Mandatory] definition]) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.  

**Each Observation must have:**

1.   a status
1.   a category code of 'laboratory'
1.   a [LOINC] code, if available, which tells you what is being measured
1.   a patient

**Each Observation must support:**

1.  a time indicating when the measurement was taken
1. a result value or a reason why the data is absent*
   - if the result value is a numeric quantity, a standard [UCUM] unit

**Profile specific implementation guidance:**

* Additional codes that translate or map to the Observation code or category codes are allowed.  For example:
   -  providing both a local code and LOINC code
   -  providing a more specific category codes such as 'chemistry', [SNOMED CT] concept, or system specific codes in addition to the 'laboratory' category code.
* Systems **SHOULD** support `Observation.effectivePeriod` to accurately represent laboratory tests that are collected over a period of time (for example, a 24-Hour Urine Collection test).
* An Observation without a value, **SHALL** include a reason why the data is absent unless there are component observations, or references to other Observations that are grouped within it.
   - For Further guidance see the [Observation Grouping] section in FHIR Specification.
   - \*Systems that never provide an observation without a value are not required to support `Observation.dataAbsentReason`
* See the [General Guidance Section] for further guidance on using UCUM
* See the [LOINC scale type to FHIR data type mapping] for guidance on which `Observation.value[x]` data type to use based on the LOINC Type of Scale.

### Examples

 - [observation-usg](Observation-usg.html)
 - [observation-serum-total-bilirubin](Observation-serum-total-bilirubin.html)
 - [observation-erythrocytes](Observation-erythrocytes.html)

{% include link-list.md %}
