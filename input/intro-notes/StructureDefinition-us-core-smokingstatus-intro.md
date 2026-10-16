
**Example Usage Scenarios:**

The following are example usage scenarios for the US Core Tobacco And Nicotine Use
Observation profile:

- Query for a patient's tobacco and nicotine product use
- [Record or update] a patient's tobacco and nicotine product use

### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile-specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.

**Each Observation Must Have:**

1. a status
1. a category code of "social-history"
1. a code for the <span class="bg-success">tobacco or nicotine use</span><!-- new-content --> observation<sup>1</sup>
1. a patient
1. when the observation occurred
3. a performer<sup>2</sup>
3. a result value<sup>1</sup>

<sup>1,2</sup> see guidance below

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the US Core Profile to support implementation and certification.

- <sup>1</sup>The <span class="bg-success" markdown="1">*Tobacco And Nicotine Use Status*</span><!-- new-content --> Value Set on `Observation.code` is a "starter" set of concepts to capture tobacco and nicotine product use, and the <span class="bg-success" markdown="1">*Tobacco And Nicotine Use*</span><!-- new-content --> Value Set for `Observation.valueCodeableConcept` contains terms representing nicotine, smoking, vaping, chew, and snuff use to encourage the use of this profile for other tobacco and nicotine questions.
{% include provenance-author-bullet-generator.md footnote-symbol='<sup>2</sup>' %}

{% include link-list.md %}
