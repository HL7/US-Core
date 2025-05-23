

**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

- Query for the existence and location of any advance directive documents the patient may have.
- [Record or update] observations to indicate whether a patient has an advance directive document.

### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.

**Each Observation Must Have:**

1. a status
2. a fixed code for the presence of advance directives
3. a patient
  
**Each Observation Must Support:**

1. references to ADI documents if they exist*
2. a category code of "observation-adi-documentation"
3. when this verified observation was made available
4. one or more performers of the observation*
5. a value*

*See guidance below

**Profile Specific Implementation Guidance:**

- *The `Observation.value` element uses codes for "yes, "no", and "unknown" to answer the question posed by the fixed `Observation.code` - whether one or more advance directives are present.
- \* If the system asserts the patient has ADI documents and the references to the (electronic) documents are known, it **SHOULD** reference them in the [Supporting Info Extension] using the [US Core ADI DocumentReference Profile] to exchange the ADI documents and their properties.
  - If the system asserts the patient has ADI documents, but the location of the  documents is unknown, there would be no reference.
- \* An `Observation.performer` of type Practitioner or Organization typically makes the observation, and an `Observation.performer` of Patient or RelatedPerson usually supplies the information (for example, a next of kin who answers questions about the patient's advance directives). Systems may use the standard [Performer function Extension] to distinguish the type of involvement of the performer in the Observation resource.
{% include provenance-author-bullet-generator.md %}

{% include link-list.md %}
