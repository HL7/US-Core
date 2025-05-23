**Example Usage Scenarios:**

The following are example usage scenarios for the US Core Specimen profile:

-  Query for a patient's specimen
-  [Record or update] a specimen for a patient

### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.  

**Each Specimen Must Have:**

1. a specimen type code

  **Each Specimen Must Support:**

1. business identifier(s)*
2. an accession identifier*
3. a patient

{% include additional-requirements-intro.md type="Specimen" plural="true" %}

1. specimen collection source site
2. specimen condition*

\* see guidance below

**Profile Specific Implementation Guidance:**

*  Since the binding is [extensible] when a code is unavailable, just text is allowed.
*  \*Although both `Specimen.identifier` and `Specimen.accessionIdentifier` are marked as Must Support, the Server system is not required to support both, but **SHALL** support at least one of these elements.
    * The Client application **SHALL** support both elements.
*  \*The specimen condition is used by the laboratory to determine the acceptability of a specimen for the ordered test. An individual specimen condition may be acceptable for one test and not for another. The specimen condition is typically provided when the specimen does not meet the laboratory's criteria for acceptability, whether the test was performed or not. Examples include but are not limited to hemolyzed, clotted, container leaking, and missing patient names. This element may include information about the contents of the container, the container, and the label.
*  in addition to Specimen search criteria, Clients may request Specimen resources be included with the Observation or DiagnosticReport resource query. An example query is provided in the [Notes](#notes) section below.

{% include link-list.md %}
