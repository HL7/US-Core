

**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

- Query for sexual orientation
- [Record or update] sexual orientation

### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.  

**Each Observation Must Have:**

1. a status
1. a fixed code for sexual orientation
1. a patient


**Each Observation Must Support:**

1. a time indicating when the observation was made
2. a sexual orientation value


**Profile Specific Implementation Guidance:**

* This profile is no longer a USCDI requirement. Implementers can look to the FHIR specification and other implementation guides for usage.
* Additional codes that translate or map to the Observation code (e.g., local codes) are allowed.


{% include link-list.md %}
