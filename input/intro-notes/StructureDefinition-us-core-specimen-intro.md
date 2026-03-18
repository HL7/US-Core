**Example Usage Scenarios:**

The following are example usage scenarios for the US Core Specimen profile:

-  Query for a patient's specimen
-  [Record or update] a specimen for a patient

### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.

**Each Specimen Must Have:**

1. a specimen type code<sup>1</sup>

  **Each Specimen Must Support:**

1. business identifier(s)<sup>2</sup>
2. an accession identifier<sup>2</sup>
3. a patient

{% include additional-requirements-intro.md type="Specimen" plural="true" %}

1. specimen collection source site
2. specimen condition<sup>3</sup>

<sup>1,2,3</sup> see guidance below

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the US Core Profile to support implementation and certification.

- <sup>1</sup>Since the binding is [extensible] when a code is unavailable, just text is allowed.<sup>[§][CONF-0523]</sup>
- <sup>1</sup>Although both `Specimen.identifier` and `Specimen.accessionIdentifier` are marked as Must Support, the Server system is not required to support both, but **SHALL** support at least one of these elements.<sup>[§][CONF-0524]</sup>
    - The Client application **SHALL** support both elements.<sup>[§][CONF-0525]</sup>
- <sup>3</sup>The specimen condition is used by the laboratory to determine the acceptability of a specimen for the ordered test. An individual specimen condition may be acceptable for one test and not for another. The specimen condition is typically provided when the specimen does not meet the laboratory's criteria for acceptability, whether the test was performed or not. Examples include but are not limited to hemolyzed, clotted, container leaking, and missing patient names. This element may include information about the contents of the container, the container, and the label.
- in addition to Specimen search criteria, Clients may request Specimen resources be included with the Observation or DiagnosticReport resource query.<sup>[§][CONF-0526]</sup> An example query is provided in the [Notes](#notes) section below.

{% include link-list.md %}
