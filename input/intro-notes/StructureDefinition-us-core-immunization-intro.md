
This profile sets minimum expectations for the [Immunization] resource to record, fetch and search immunization history associated with a patient. It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core-Core Immunization
profile:

-   Query for immunizations belonging to a Patient
-  [Record or update]  immunizations belonging to a Patient

### Mandatory and Must Support Data Elements

The following data-elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.  

**Each Immunization must have:**

1.  a status
1.  a vaccine code that identifies the kind of vaccine administered
1.  a date the vaccine was administered
1.  a patient

**Each Immunization must support:**

1.  a statusReason if the vaccine wasn't given
1.  a flag to indicate whether the vaccine was reported by someone other than the person who administered the vaccine.

**Profile specific implementation guidance:**

- Use the status code: `not-done` to represent that an immunization was *not* given.
- Based upon the ONC U.S. Core Data for Interoperability (USCDI) v1 requirements, [CVX vaccine codes] are required and the [NDC vaccine codes] **SHOULD** be supported as a translation.
    - Be aware that there is *10-digit (with dashes)* NDC format displayed on drug packaging and an *11-digit (no dashes)* NDC format for billing and prescribing (for example  "49281-121-65" and "49281012165"). Normalization may be required to avoid validation errors and warnings.
    - CDC provides the [CDC National Drug Code (NDC) Directory – Vaccine NDC Linker Table] to assist implementers. The example [Immunization-imm-1](Immunization-imm-1.html) illustrates using both the CVX and 11 digit NDC codes based upon this table.
  - Note that the CVX code system contains some concepts that are  procedures, medications, or substances rather than immunizations. Implementers should not use these non-vaccine-related CVX codes.

{% include link-list.md %}
