
**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-  Query for clinical observations or assessments about a patient's health status.
-  [Record or update] clinical observations or assessments about a patient's health status.

### Mandatory and Must Support Data Elements


The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.

**Each Observation Must Have:**

1. a status
1. a category code*
2. a code
3. a patient

**Each Observation Must Support:**

2. a time indicating when the observation was made
3. who answered the questions <span class="bg-success" markdown="1">(in other words, a performer)*</span><!-- new-content -->
4. a value

{% include additional-requirements-intro.md type="Observation" %}

1. <span class="bg-success" markdown="1">a screening and assessments category code*</span><!-- new-content -->
1. references to an associated survey, assessment, or screening tool*

\*see guidance below

**Profile Specific Implementation Guidance:**

- The codes can be from LOINC or SNOMED CT.
- The value for these types of observations may be:
  -  a string
  -  a code
  -  a "qualifier" confirming or refuting a statement about findings in code. For example:
      **code**: Transport too expensive (SNOMED CT: 160695008)  
      **value**: true

<div class="bg-success" markdown="1">

- \*At a minimum, Certifying Systems **SHALL** support, the [US Core Screening Assessment Observation Category] codes, **SHOULD** support the other [US Core Simple Observation Category] codes, and **MAY** support other categories.

    {% include obs_cat_guidance.md category="sdoh, functional-status, or social history"%}
</div><!-- new-content -->

{% include DAR-exception.md %}
- <span class="bg-success" markdown="1">
- 
- \*Although 'Observation.performer' target profiles [US Core Practitioner Profile] and [US Core Patient Profile] are labeled *Must Support*. Servers are not required to support both, but **SHALL** support at least one. Clients **SHALL** support both.</span><!-- new-content -->
{% include obs_cat_guidance.md category= "sdoh, functional-status, or social history" %}
- See the [Screening and Assessments] guidance page for how this profile can represent "clinical judgments".
  - \*Observations formally part of an assessment tool or survey **SHOULD** use the [US Core Observation Screening Assessment Profile]. However, an assertion or determination derived from screening and assessment tools **SHOULD** reference them using `Observation.derivedFrom`.
-   <span class="bg-success" markdown="1">\*Although 'Observation.performer' target profiles [US Core Practitioner Profile] and [US Core Patient Profile] are labeled *Must Support*. Servers are not required to support both, but **SHALL** support at least one. Clients **SHALL** support both.</span><!-- new-content -->
-  <span class="bg-success" markdown="1">\*Although none of the `Observation.derivedFrom` [referenced target profiles are flagged as *Must Support*](must-support.html#must-support---resource-references), The certifying server system **SHALL** support at least one of them. The client application **SHALL** support all.</span><!-- new-content -->
   - As documented [here](general-guidance.html#referencing-us-core-profiles), when using `Observation.derivedFrom` to reference an Observation, the referenced Observation **SHOULD** be a US Core Observation.

{% include link-list.md %}
