
{% include us-core-maturity.md id="us-core-immunization" %}

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core Immunization
profile:

-   Query for immunizations belonging to a Patient
-  [Record or update]  immunizations belonging to a Patient

### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.

**Each Immunization Must Have:**

1. a status<sup>1</sup>
1. a vaccine code that identifies the kind of vaccine administered<sup>2</sup>
1. a patient
2. a date the vaccine was administered

**Each Immunization Must Support:**

1. a statusReason if the vaccine wasn't given<sup>1</sup>
2. a flag to indicate whether the vaccine was reported by someone other than the person who administered the vaccine.
3. the encounter the immunization was part of
4. where the vaccine was administered
5. vaccine lot number<sup>3</sup>
6. a performer<sup>4</sup>

<sup>1,2,3,4</sup> see guidance below

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the US Core Profile to support implementation and certification.

- <sup>1</sup>Servers **SHALL** use the status code: `not-done` to represent that an immunization was *not* given.<sup>[§][CONF-0390]</sup>
   - <span class="bg-success" markdown="1">`Immunization.statusReason` communicates the reason the vaccine was not administered at the point of care, such as patient refusal.  **Note that this binding is provisional, pending the review of the terminology aligned with the HL7 FHIR US Quality Core Implementation Guide.**</span><!-- new-content -->
- <sup>2</sup>Based upon the ONC U.S. Core Data for Interoperability (USCDI) requirements, [CVX vaccine codes] are required, and the [NDC vaccine codes] **SHOULD** be supported as an additional code.<sup>[§][CONF-0392]</sup>
    - NDC codes are defined by the manufacturer, and CVX codes, which are much less granular, are often limited to a single product made by a single manufacturer.
    - In most cases, there are separate NDCs for the Unit of Use (primary) and Unit of Sale (secondary) packaging of a vaccine, but only the Unit of Use NDC codes should be used since they represent the product that is administered.
    - The code system identifiers are `http://hl7.org/fhir/sid/cvx` for CVX and `http://hl7.org/fhir/sid/ndc` for NDC vaccine codes.  Note that the `vaccineCode` binding link in the formal definition and the CDC links below use the associated OID as the code system identifiers.
    - Be aware that there is a *10-digit (with dashes)* NDC format displayed on drug packaging and an *11-digit (no dashes)* NDC format for billing and prescribing (for example, "49281-121-65" and "49281012165"). Normalization may be required to avoid validation errors and warnings.
    - The CDC provides the [CDC National Drug Code (NDC) Directory – Vaccine NDC Linker Table] to assist implementers (note that both the Unit of Use and Unit of Sale NDC are mapped to CVX codes). The [Immunization Example 1](Immunization-imm-1.html) uses both CVX and the 11-digit NDC Unit of Use code based on this table.
 - <sup>3</sup> There is no guarantee that vaccine lot numbers are globally unique, and they are not recommended for matching or de-duplication across systems unless used with other data elements such as a vaccine product code, manufacturer code, or date of administration.  Implementers **MAY** communicate the `Immunization.manufacturer` to ensure global uniqueness to lot numbers.<sup>[§][CONF-0841]</sup>
{% include provenance-author-bullet-generator.md footnote-symbol='<sup>4</sup>' %}
- <span class="bg-success" markdown="1">For the USCDI *Adverse Events* Data Class, `Immunization.reaction` records a reaction following an immunization, which can be the change in condition that the USCDI *Adverse Event Condition* describes. Adverse events are recorded as ordinary clinical events and are not tagged as adverse events; see the [Adverse Events: Clinical Records and Patient Safety Reporting] page.</span><!-- new-content -->

{% include link-list.md %}
