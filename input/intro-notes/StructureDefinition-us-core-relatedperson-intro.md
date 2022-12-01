{% include new_page.md %}

**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-  Query for clinical tests or diagnostic imaging results for a patient.
-  [Record or update] clinical tests or diagnostic imaging results belonging to a Patient

### Mandatory and Must Support Data Elements


The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.

**Each Observation must have:**

1.   a status
2.   a category code
3.   a [LOINC] code, if available, which tells you what is being measured
4.   a patient

**Each Observation must support:**

1. a time indicating when the measurement was taken
2. a result value
   - if the result value is a numeric quantity, a standard [UCUM] unit
3. a reason why the data is absent*

\* see guidance below

**Profile specific implementation guidance:**

{% include observation_guidance_1.md category="procedure, exam or laboratory" recommendation="Servers SHOULD use the base FHIR [Observation Category Codes]." %}
- For a *starter set* of example clinical test LOINC codes, see [Appendix B in U.S. Core Data for Interoperability (USCDI) Task Force 2021 HITAC Phase 3 Recommendations Report Letter].
- For representing laboratory test results, see the [US Core Laboratory Result Observation Profile].

{% include link-list.md %}
