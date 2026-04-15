
### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.

**Each Location Must Have:**

1. A name

**Each Location Must Support:**

1. Location or facility identifier
2. A status (whether in use)
3. The type of location or facility<sup>1</sup>
4. Contact details of the location
5. A Location address<sup>2</sup>
6. The managing organization

<sup>1,2</sup> see guidance below

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the US Core Profile to support implementation and certification.

- [US Core Encounter Profile] and the [US Core Immunization Profile] link directly to US Core Location via `Encounter.location` and `Immunization.location`.
{% include encounter-location.md%}
- <sup>1</sup>`Location.type` is a grouped value set composed of four value sets to meet multiple industry needs for identifying service locations:
   - The Service Delivery Location Role Type value set is inherited from the base resource, and, although its binding strength is [extensible] in the base resource, US Core implementers **MAY** treat it as [preferred].<sup>[§][CONF-0901]</sup>
   - Healthcare Service Location Codes (HSLOC) and SNOMED-CT Healthcare Facility Type value sets meet the USCDI applicable vocabulary standard for the Encounter Location Data Element. Certifying Systems **MAY** use a code from either vocabulary.<sup>[§][CONF-0902]</sup>
   - The CMS Place of Service (POS) value set meets the Health Insurance Portability and Accountability Act of 1996 (HIPAA) requirements for billing and Payers.
- <sup>2</sup>{% include should-3166-subdivision-codes.md type="Location" %}

{% include link-list.md %}
