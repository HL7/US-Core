
﻿Clinical tests includes non-imaging and non-laboratory tests performed on a patient that results in structured or unstructured (narrative) findings specific to the patient, such as electrocardiogram (ECG), visual acuity exam, macular exam, or graded exercise testing (GXT), to facilitate the diagnosis and management of conditions. The US Core Observation Clinical Test Result Profile profile sets minimum expectations for the [Observation] resource to record, search, and fetch clinical tests for a patient <span class="bg-success" markdown="1">to promote interoperability and adoption through common implementation.</span><!-- new-content --> {% include profile-intro.md %}  

**Example Usage Scenarios:**

The following are example usage scenarios for the this profile:

-   Query for non-imaging and non-laboratory tests results for a patient.
-  [Record or update] clinical tests results belonging to a Patient

### Mandatory and Must Support Data Elements


The following data-elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.

**Each Observation must have:**

1.   a status
1.   <span class="bg-success" markdown="1">a category code of 'clinical-test'</span><!-- new-content -->
1.   a [LOINC] code, if available, which tells you what is being measured**
1.   a patient

**Each Observation must support:**

1.  a time indicating when the measurement was taken
1. a result value or a reason why the data is absent*
   - if the result value is a numeric quantity, a standard [UCUM] unit

*see guidance below

**Profile specific implementation guidance:**

- <span class="bg-success" markdown="1">\*\*This profile defines a Valueset based on a *starter set* of example clinical test LOINC codes identified in the [Appendix B in U.S. Core Data for Interoperability (USCDI) Task Force 2021 HITAC Phase 3 Recommendations Report Letter]. It is not intended to be complete and implementers are expected include other LOINC or other codes to meet their business needs.</span><!-- new-content -->
{% include observation_guidance_1.md category="clinical-test" %}
- <span class="bg-success" markdown="1">For imaging and laboratory tests the corresponding [US Core Diagnostic Imaging Result Observation Profile] and [US Core Laboratory Result Observation Profile] should be used instead.</span><!-- new-content -->
{% include link-list.md %}
