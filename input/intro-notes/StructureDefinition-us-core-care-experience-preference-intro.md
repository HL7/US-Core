

**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-  Query for a patient's care experience preferences.
-  [Record or update] clinical observations or assessments about a patient's care experience preferences.

### Mandatory and Must Support Data Elements


The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.

**Each Observation Must Have:**

1. a status
2. a fixed code for care experience preference
3. a patient
  
**Each Observation Must Support:**

1. a category code of "care-experience-preference"
2. a time indicating when the preference was made
<!-- 3. who reported the preference -->
4. care experience preference value



{% include additional-requirements-intro.md type="Observation" plural="false" %}

1. a performer*


*see guidance below

**Profile Specific Implementation Guidance:**

- Care experience preferences expressed by a patient may be documented in narrative (text) form or the result of selecting from a list of options provided by the content creator/implementer.
{% include conditional-goals-guidance.md %}
{% include additional-codings.md example1=', for example, the more specific LOINC, "81364-2 (Religious or cultural beliefs [Reported])"  '%}
  - See the existing [Care Experience Preferences at End of Life Grouping] for more specific concepts representing an individual's care experience preferences
{% include provenance-author-bullet-generator.md %}

{% include link-list.md %}
