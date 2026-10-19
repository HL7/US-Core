{% include new_page.md %}

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core Patient Accommodation Profile:

-   Query for a Patient's accommodation needs
-   [Record or update] a Patient accommodation

### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.

**Each Observation Must Have:**

1. a status
1. a fixed code for the accommodation need
1. a patient

**Each Observation Must Support:**

1. a category code of "accommodation"
1. a clinically relevant time or time period for the observation
1. the accommodation, coded or as free text<sup>1</sup>

{% include additional-requirements-intro.md type="Observation" plural=false %}

1. a performer<sup>2</sup>

<sup>1,2</sup> see guidance below

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the US Core Profile to support implementation and certification.

* An accommodation is a support or service a patient needs in order to access care, such as a sign language interpreter, a wheelchair-accessible room, or a sensory accommodation. It is a statement of what the patient needs, not a statement of the patient's disability or functional status. Disability and functional status are recorded as assessments; see the [Screening and Assessments] page.
* <sup>1</sup>The Observation resource can represent the accommodation as a code using `Observation.valueCodeableConcept` or as free text using `Observation.valueString`.
   * Although both are marked as *Must Support*, the Server system is not required to support both, but **SHALL** support at least one of these elements.<sup>[§][CONF-0115]</sup>
   * The Client application **SHALL** support both elements.<sup>[§][CONF-0116]</sup>
   * Free text is expected to be common in the near term, since no code system covers accommodations completely. As the terminology matures, US Core will consider removing the free-text option and requiring the coded form.
{% include provenance-author-bullet-generator.md footnote-symbol='<sup>2</sup>' %}

`Observation.code` is fixed to the placeholder LOINC code 55555-5, which is **not a real LOINC code**. The design team settled on a new prerelease LOINC code for "Accommodation Need", which has not been issued yet. The placeholder will be replaced before publication, and until then validation reports that the code is unknown. The value set for `Observation.value[x]` is also outstanding: PACIO and Gravity are developing a strawman value set in VSAC, so this profile places no binding on `Observation.value[x]`.
{:.note-to-balloters}

{% include link-list.md %}
