
**Example Usage Scenarios:**

The following are example usage scenarios for the US Core-Core Immunization
profile:

-   Query for immunizations belonging to a Patient
-  [Record or update]  immunizations belonging to a Patient

### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.  

**Each Immunization Must Have:**

1. a status
1. a vaccine code that identifies the kind of vaccine administered*
1. a patient
2. a date the vaccine was administered


**Each Immunization Must Support:**

1. a statusReason if the vaccine wasn't given
2. a flag to indicate whether the vaccine was reported by someone other than the person who administered the vaccine.
3. the encounter the immunization was part of
4. where the vaccine was administered
5. vaccine lot number*
6. a performer*

*see guidance below

**Profile Specific Implementation Guidance:**

- Use the status code: `not-done` to represent that an immunization was *not* given.
- Based upon the ASTP U.S. Core Data for Interoperability (USCDI) requirements, [CVX vaccine codes]<sup>1</sup> are required, and the [NDC vaccine codes] **SHOULD** be supported as an additional code.
    - NDC codes are defined by manufacturer, and CVX codes, which are much less granular, are often limited to a single product made by a single manufacturer.
    - The preferred code system identifiers are `http://hl7.org/fhir/sid/cvx` for CVX and `http://hl7.org/fhir/sid/ndc` for NDC vaccine codes. Note that the `vaccineCode` binding link in the formal definition and the CDC links below use the associated OID as the code system identifiers.
    - Be aware that there is a *10-digit (with dashes)* NDC format displayed on drug packaging and an *11-digit (no dashes)* NDC format for billing and prescribing (for example, "49281-121-65" and "49281012165"). Normalization may be required to avoid validation errors and warnings.
    - The CDC provides the [CDC National Drug Code (NDC) Directory – Vaccine NDC Linker Table] to assist implementers. The example [Immunization-imm-1](Immunization-imm-1.html) illustrates using the CVX and 11-digit NDC codes based on this table.
 - *There is no guarantee that vaccine lot numbers are globally unique, and they are not recommended for matching or de-duplication across systems unless used with other data elements such as a vaccine product code, manufacturer code, or date of administration.  Implementers **MAY** communicate the `Immunization.manufacturer` to ensure global uniqueness to lot numbers.
{% include provenance-author-bullet-generator.md %}

{% include link-list.md %}
