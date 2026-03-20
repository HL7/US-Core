
### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.

**Each PractitionerRole Must Support:**

1. An associated organization<sup>1</sup>
1. An associated practitioner<sup>1</sup>
1. A role<sup>2</sup>
1. A specialty<sup>3</sup>
1. An associated location<sup>1</sup>
1. Contact information<sup>4</sup>
1. A communication endpoint<sup>4</sup>

<sup>1,2,3,4</sup> see guidance below

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the US Core Profile to support implementation and certification.

- <sup>1</sup>At least one of the following elements must be present:
    - `PractitionerRole.practitioner`
    - `PractitionerRole.organization`
    - `PractitionerRole.healthcareService`
    - `PractitionerRole.location`

- Due to implementer feedback, some US Core Profiles reference the [PractitionerRole] resource instead of the US Core PractitionerRole Profile. However, the US Core PractitionerRole Profile **SHOULD** be used as the default profile if referenced by another US Core profile.<sup>[§][CONF-0889]</sup> See this guidance on [Referencing US Core Profiles].
- <sup>4</sup>A [Direct address] can be represented in the `telecom` element using the [US Core Direct email Extension] or in a referenced [Endpoint] as a "direct-project" endpoint connection type.
- <sup>2</sup>When selecting role codes
  - <span class="bg-success" markdown="1"><sup>3</sup>Unless exchanging legacy or text-only data, medical specialty codes **SHOULD** be taken from NUCC or SNOMED CT.<sup>[§][CONF-0894]</sup></span><!-- new-content -->
  - implementers **SHOULD** choose the code that reflects the specific duties performed within that role rather than the specialty unless the individual's professional specialization characterizes the role.<sup>[§][CONF-0891]</sup>
  - Systems that primarily rely on NUCC codes instead of SNOMED CT to represent role codes can use the Da Vinci HRex [NUCC to SNOMED CT Mappings] to aid in translations.
- Clients can request Servers return the Practitioner and Endpoint resources using `_include`. See the [Quick Start] section below for further guidance.

{% include link-list.md %}
