{% include new_page.md %}

**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-  Query for a patient's treatment intervention preferences.
-  [Record or update] clinical observations or assessments about a patient’s treatment intervention preferences.

### Mandatory and Must Support Data Elements

*In addition* to the Mandatory and Must Support data elements in the US Core Simple Observation Profile, the following data-elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well.  The [Formal Views] below provides the  formal summary, definitions, and terminology requirements. {%- include diff-display-note.md parent_profile='US Core Simple Observation Profile' %}

**Each Observation Must Have:**

1. a fixed code for treatment intervention preference*

In this ballot version, we are using the US Core category code "treatment-intervention-preference" for this concept. A request for a new [LOINC] for this concept has been submitted to Regenstrief, and we expect it to be available before the publication of this version of US Core. 
{:.note-to-balloters}

\*see guidance below

**Each Observation Must Support:**

1. a category code of 'intervention-preference'

**Additional USCDI Requirements (inherited from Simple Observation Profile)**

<!-- { % include additional-requirements-intro.md type="Observation" % } -->

1. a reference to an associated form or document the observation is made from*

\*see guidance below

**Profile Specific Implementation Guidance:**

- Treatment intervention preferences are patient-authored information used to share an individual's medical treatment and intervention goals, preferences, and priorities. They guide caregivers and medical personnel when the patient cannot communicate. The value for these types of observations is typically a string.
{% include additional-codings.md example1=', for example, the more specific LOINC, “75779-9 (Thoughts on cardiopulmonary resuscitation (CPR) [Reported])”'%}
  - See the existing [Intervention Preferences at End of Life Grouping] for more specific concepts representing an individual's treatment intervention preferences
  
   We expect this value set's "end of life" name and text scope to be removed in an upcoming [Value Set Authority Center (VSAC)] update before the publication of this version of US Core. 
   {:.note-to-balloters}

- The observation **MAY** be derived from or reference a form or document (for example an advance directive document.) using `Observation.derivedFrom'.

{% include link-list.md %}
