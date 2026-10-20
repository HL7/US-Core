

{% include us-core-maturity.md id="us-core-relatedperson" %}

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
4. the address of the related person<sup>1</sup>

 <sup>1</sup> see guidance below

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the US Core Profile to support implementation and certification.

- <sup>1</sup>{% include should-3166-subdivision-codes.md type="RelatedPerson" %}

- <span class="bg-success" markdown="1">For the USCDI *Healthcare Agent* Data Element, systems **SHOULD** use the durable power of attorney code [DPOWATT] or the healthcare power of attorney code [HPOWATT] in `RelatedPerson.relationship`.<sup>[§][CONF-0918]</sup> For a more detailed model that builds on the US Core RelatedPerson Profile to represent a healthcare agent, including consent-based delegation and role and priority coding, see the [PACIO ADI PACP Guidance] and the [ADI Healthcare Agent Participant] profile.</span><!-- new-content -->

{% include link-list.md %}
