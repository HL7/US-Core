
**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-   Query for a Patient's Goals
-   [Record or update] a Patient's Goals

### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.

**Each Goal Must Have:**

1. a status
1. description of the goal<sup>1</sup>
1. a patient

**Each Goal Must Support:**

1. start date<sup>2</sup>
2. target date(s)<sup>2</sup>
3. who established the goal<sup>3</sup>

<sup>1,2,3</sup> see guidance below

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the US Core Profile to support implementation and certification.

-  <sup>2</sup> Although both `Goal.startDate` and `Goal.target.dueDate` are marked as Must Support, the Server system is not required to support both, but **SHALL** support at least one of these elements.<sup>[§][CONF-0387]</sup> The Client application **SHALL** support both elements.<sup>[§][CONF-0388],[§][CONF-0389]</sup>
- <sup>1</sup> Goals are often captured as text and communicated in `Goal.description.text`. When the goal is a Social Determinants of Health (SDOH) goal, use the preferred [Social Determinants of Health Goals] binding.
-  See the [Screening and Assessments] guidance page for more information when exchanging Social Determinants of Health (SDOH) Goals
{% include provenance-author-bullet-generator.md footnote-symbol='<sup>3</sup>' %}

{% include link-list.md %}
