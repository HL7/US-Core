<div markdown="1" class="new-content">

 This profile sets minimum expectations for the [Observation] resource to record, search, and fetch sexual orientation observations associated with a patient.  It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core Sexual Orientation Observation Profile:

- Query for sexual orientation 
- [Record or update] sexual orientation

### Mandatory and Must Support Data Elements

The following data-elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.  

**Each Observation must have:**

1. a status
1. a fixed code for sexual orientation
1. a patient


**Each Observation must support:**

1. a time indicating when the measurement was taken
1. a sexual orientation value


**Profile specific implementation guidance:**

* Additional codes that translate or map to the Observation code (e.g., local codes) are allowed. 
   
### Examples

</div>


{% include link-list.md %}
