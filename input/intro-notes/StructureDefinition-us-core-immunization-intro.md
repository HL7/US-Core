
This profile sets minimum expectations for the [Immunization] resource to record, fetch and search immunization history associated with a patient. It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core-Core Immunization
profile:

-   Query for immunizations belonging to a Patient
-  [Record or update]  immunizations belonging to a Patient

### Mandatory and Must Support Data Elements

The following data-elements are mandatory (i.e data MUST be present) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.  

**Each Immunization must have:**

1.  a status*
1.  a vaccine code that identifies the kind of vaccine administered
1.  a date the vaccine was administered
1.  a patient

**Each Immunization must support:**

1.  a statusReason if the vaccine wasn't given
1.  {:.new-content #FHIR-28452}a flag to indicate whether the vaccine was reported by patient rather than directly administered

**Profile specific implementation guidance:**

- \*Use the status code: `not-done` to represent that an immunization was *not* given.
- NDC codes as a translational data element:
Based upon the 2015 Edition Certification Requirements, [CVX vaccine codes] are required and the [NDC vaccine codes] SHOULD be supported as translations to them.  A [NDC to CVX ConceptMap] is provided and is based upon the CDC's [CVX crosswalk table]. A translation is illustrated in the example below.

### Examples

- [Immunization-imm-1](Immunization-imm-1.html)

{% include link-list.md %}
