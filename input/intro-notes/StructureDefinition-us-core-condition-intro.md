
﻿This profile sets minimum expectations for the [Condition] resource to record, search, and fetch a  list of conditions associated with a patient. It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core Condition profile:

-   Query for a Patient’s current or historical conditions
-   [Record or update] a Patient’s conditions

### Mandatory and Must Support Data Elements


The following data-elements are mandatory (i.e data MUST be present) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.  

**Each Condition must have:**

1.  a status of the condition*
1.  a category
1.  a code that identifies the condition
1.  a patient

*The status element has the following constraints: SHALL be present if verification status is not entered-in-error and SHALL NOT be present if verification Status is entered-in-error.

**Each Condition must support:**

1.  a verification status

**Profile specific implementation guidance:**

* The [US Core Condition Category Codes] support the separate types of conditions so API consumers can separate health concerns, problems, and encounter diagnoses.
* The 2015 Certification rule requires the use of SNOMED CT for problem list entries. Following the rules for [required] binding to coded data types, ICD or other local codes can be used as translations to SNOMED CT.
* The [US Core Condition Code] supports ICD-9-CM for historical purposes only. ICD-10-CM is available and may be used as the primary code for current encounter diagnoses.
* To search for an encounter diagnosis, query for Conditions that reference the Encounter of interest and have a category of `encounter-diagnosis`.  An example search is shown in the [Quick Start](#search) section below.

### Examples

 - [Condition-hc1](Condition-hc1.html) is an example of a condition categorized as a "health-concern"
 - [Condition-example](Condition-example.html) is an example of a condition categorized as a "problem"

{% include link-list.md %}
