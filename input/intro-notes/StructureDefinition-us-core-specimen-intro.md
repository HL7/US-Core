**Example Usage Scenarios:**

The following are example usage scenarios for the US Core Specimen profile:

-  Query for a patient’s specimen
-  [Record or update] a specimen for a patient

### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.  

**Each Specimen Must Have:**

1. a specimen code

  **Each Specimen Must Support:**

1. business identifier(s)
1. a patient



{% include additional-requirements-intro.md type="Specimen" plural="true" %}

1. specimen collection source site
2. specimen condition*

\* see guidance below

**Profile Specific Implementation Guidance:**

*  Since the binding is [extensible] when a code is unavailable, just text is allowed.
*  in addition to Specimen search criteria, clients may request Specimen resources be included with Observation or DiagnosticReport resource query. An example query is provided in the [Notes](#notes) section below.
*  <span class="bg-success" markdown="1">\*The specimen condition is used by the laboratory to determine the acceptability of a specimen for the ordered test. An individual specimen condition may be acceptable for one test, and not for another. The specimen condition is typically provided when the specimen does not meet the laboratory’s criteria for acceptability whether the test was performed or not. Examples include but are not limited to hemolyzed, clotted, container leaking, and missing patient name. This element may include information about the contents of the container, the container, and the label.</span><!-- new-content -->

{% include link-list.md %}
