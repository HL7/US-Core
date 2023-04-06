{% include new_page.md %}

**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-  Query for clinical observations or assessments about a patient’s health status.
-  [Record or update] clinical observations or assessments about a patient’s health status.

### Mandatory and Must Support Data Elements


The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.

**Each Observation must have:**

1. a status
1. a category code
2. a code
3. a patient

**Each Observation must support:**

2. a time indicating when the observation was made
3. who answered the questions
4. a value

**Additional USCDI Requirements**

For ONC's USCDI requirements, each ServiceRequest must support the following additional elements. These elements are included in the formal definition of the profile, and they are represented in the examples.

1. references to an associated survey, assessment, or screening tool*

\*see guidance below

**Profile specific implementation guidance:**

- The codes can be from LOINC or SNOMED CT.
- The value for these types of observations may be:
  -  a string
  -  a code
  -  a "qualifier" confirming or refuting a statement about findings in code. For example:
      **code**: Transport too expensive (SNOMED CT: 160695008)  
      **value**: true
{% include obs_cat_guidance.md category="sdoh, functional-status, or social history" %}
<div class="bg-success" markdown="1">
- See the [Screening and Assessments] guidance page for how this profile can represent "clinical judgments".
  - \*Observations that are formally part of an assessment tool or survey should use the [US Core Observation Screening Assessment Profile]. However, an assertion or determination derived from screening and assessment tools and **SHOULD** reference them using `Observation.derivedFrom`.
- As documented [here](general-guidance.html#referencing-us-core-profiles), when using `ServiceRequest.reasonReference` to reference an Observation, the referenced Observation **SHOULD** be a US Core Observation.
</div><!-- new-content -->

{% include link-list.md %}
