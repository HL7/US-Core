<div markdown="1" class="new-content">

﻿This profile sets minimum expectations for the [Observation] resource to record, search, and fetch retrieve observations that represent simple observations made by an individual about a patient's social history status such as education, food insecurity, etc. Observations that are formally derived from an assessment tool or survey should use the [US Core Screening Response Observation Profile].  It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core-Results profile:

-   Query for social history results for a patient.
-  [Record or update] social history results results belonging to a Patient

### Mandatory and Must Support Data Elements


The following data-elements must always be present ([Mandatory] definition]) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.

**Each Observation must have:**

1. a status
1. a category code of 'social-history'
1. a code
1. a patient

**Each Observation must support:**

1. a time indicating when observation was made
1. who answered the questions
3. a value

**Profile specific implementation guidance:**
- See [SDOH Guidance] for how this profile can used to represent SDOH assessments.
- Simple assertion may be derived from a screening tool assessments such as [US Core Screening Response Observation Profile]  and can reference them using `Observation.derivedFrom`.

{:.note-to-balloters}Should this profiles include the derivedFrom element as a MustSupport element to reference any form/survey or assessment tool?

- The codes can be from LOINC or SNOMED CT.
- Often the pattern for these types of observations that the `Observation.code` indicates a statement about findings and the `Observation.value` is present and "qualifies" the finding typically confirming or refuting it. For example:

  code= "Transport too expensive"
  value="true"

### Examples

 - [Social History Example](Observation-socialhistory-assessment-example.html)

</div>
{% include link-list.md %}
