

**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

- Query for a related person that supports the patient.
- Query for a person related to the patient by name.


### Mandatory and Must Support Data Elements


The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.

**Each RelatedPerson Must Have:**

1. an active flag
2. a patient

**Each RelatedPerson Must Support:**

1. the relationship to the patient
2. the name of the related person
3. the telecom of the related person
4. the address of the related person*

*see guidance below

**Profile Specific Implementation Guidance:**

- \*{% include should-project-us.md element="RelatedPerson.address" %}

{% include link-list.md %}
