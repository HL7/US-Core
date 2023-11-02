{% include new_page.md %}

**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-  Query for a patient's care experience preferences.
-  [Record or update] clinical observations or assessments about a patient’s care experience preferences.

### Mandatory and Must Support Data Elements

*In addition* to the Mandatory and Must Support data elements in the US Core Simple Observation Profile, the following data-elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well.  The [Formal Views] below provides the  formal summary, definitions, and terminology requirements. {%- include diff-display-note.md parent_profile='US Core Simple Observation Profile' %}

**Each Observation Must Have:**

1. a fixed code for care experience preference*

\*see guidance below

**Each Observation Must Support:**

1. a category code of "care-experience-preference"

**Additional USCDI Requirements (inherited from Simple Observation Profile)**

<!-- { % include additional-requirements-intro.md type="Observation" % } -->

1. a reference to an associated form or document the observation is made from*

\*see guidance below

**Profile Specific Implementation Guidance:**

- \*Care experience preferences are patient-authored information used to share an individual's goals, preferences, and priorities for overall experiences during their care and treatment. They guide caregivers and medical personnel about what is important to them. The value for these types of observations is typically a string.
{% include additional-codings.md example1=', for example, the more specific LOINC, “81364-2	(Religious or cultural beliefs [Reported]) from the ”'%}
  - See the existing [Care Experience Preferences at End of Life Grouping] for more specific concepts representing an individual's care experience preferences

   We expect this value set's "end of life" name and text scope to be removed in an upcoming [Value Set Authority Center (VSAC)] update before the publication of this version of US Core. 
   {:.note-to-balloters}

- \*Systems can reference a form or document (for example, an advance directive document.) from which the Observation is derived using `Observation.derivedFrom`.
   - {% include no-ms-refs.md element="Observation.derivedFrom" %}


{% include link-list.md %}
