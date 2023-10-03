{% include new_page.md %}

**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-  Query for a patient's care experience preferences.
-  [Record or update] clinical observations or assessments about a patient’s care experience preferences.

### Mandatory and Must Support Data Elements

*In addition* to the Mandatory and Must Support data elements in the US Core Simple Observation Profile, the following data-elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well.  The [Formal Views] below provides the  formal summary, definitions, and terminology requirements. {%- include diff-display-note.md parent_profile='US Core Simple Observation Profile' %}

**Each Observation Must Have:**

1. a [LOINC] code, if available, representing an individual’s care experience preference.

**Each Observation Must Support:**

1. a category code of 'care-experience-preference'
2. a reference to the document(s) the observation is made from*

\*see guidance below

<!-- **Additional USCDI Requirements**

{ % include additional-requirements-intro.md type="Observation" % }

1. references to an associated survey, assessment, or screening tool*

\*see guidance below -->

**Profile Specific Implementation Guidance:**

- Care experience preferences are patient-authored information used to share an individual's goals, preferences, and priorities for overall experiences during their care and treatment. They guide caregivers and medical personnel about what is important to them.
- The value for these types of observations is typically a string
- The observation **MAY** be derived from or reference a document (for example an advance directive document.) using `Observation.derivedFrom' to reference a[DocumentReference] resource.

{% include link-list.md %}
