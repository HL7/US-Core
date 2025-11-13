
* **USCDI-related Updates**: We have updated US Core to include the new [U.S. Core Data for Interoperability (USCDI) v6](https://www.healthit.gov/isa/united-states-core-data-interoperability-uscdi#uscdi-v6) Data Elements and Classes that the  Assistant Secretary for Technology Policy (ASTP) published:

  * For the USCDI Care Plan data element, we added `CarePlan.addresses` to the [US Core CarePlan Profile](StructureDefinition-us-core-careplan.html) as an Additional USCDI element.
    * We documented the future direction to continue transitioning from text-based content to discrete references such as needs (`CarePlan.addresses`), goals (`CarePlan.goal`), and strategies (`CarePlan.activity`).

  * For the USCDI Family Health History data element, we created a new [US Core FamilyMemberHistory Profile](StructureDefinition-us-core-familymemberhistory.html) to capture relevant health conditions of family members.

  * For the USCDI Facility Address data element, no changes were needed because the [US Core Location Profile](StructureDefinition-us-core-location.html) represents the physical location of available services or resources, with `Location.address` as a *Must Support* element.

  * For the USCDI Date of Onset data element, we updated the [US Core Condition Problems and Health Concerns Profile](StructureDefinition-us-core-condition-problems-health-concerns.html) *Must Support* guidance to make the `assertedDate` Extension, `Condition.onsetDateTime`, and `Condition.recordedDate` all *Must Support*.

  * For the USCDI Unique Device Identifier (UDI) data element we renamed the [US Core Implantable Device Profile](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-implantable-device.html) to [US Core Device Profile](StructureDefinition-us-core-device.html). In addition, we changed the constraints on all UDI specific elements from *Must Support* to *Additional USCDI* and relaxed `Device.patient` from *Mandatory* to *Must Support* to support a broader range of use cases.

  * For the USCDI Portable Medical Order data element:
    * We created a new [US Core PMO ServiceRequest Profile](StructureDefinition-us-core-pmo-servicerequest.html) to support clinical orders based on end-of-life or life-sustaining care Portable Medical Orders, such as a POLST.

*  **US Core Maturity Levels**: We replaced the FHIR Maturity Model (FMM) level with [US Core Maturity Levels](changes-between-versions.html#us-core-maturity-levels) to provide clear, artifact-specific criteria and forward compatibility rules:
     - **Profiles, Extensions, Operations**: FMM 5 (pre-3.1.1, widely implemented, forward-compatible), FMM 4 (post-3.1.1 or significantly changed, stable), FMM 3 (implemented but not widely), FMM 2 (not regulated or widely implemented).
     - **SearchParameters**: Assigned FMM 5 with enforced forward compatibility.
     - **ValueSets, CodeSystems, CapabilityStatements**: Assigned FMM 3 due to dynamic versioning; forward compatibility not enforced.
- **IPS Comparison**: We added a detailed profile-by-profile comparison between [US Core and the International Patient Summary (IPS) version 2.0.0](relationship-with-other-igs.html#comparison-with-international-igs), following the same format and methodology as the existing IPA comparison. This enhancement improves alignment transparency with international standards.
- **Writing Clinical Notes**: in the Looking Ahead Section, we preview the US Core approach to [writing clinical notes](writing-clinical-notes.html) using the FHIR R4 `DocumentReference` resource. It is based on the 2025 Argonaut-sponsored [FHIR Write - Notes](https://confluence.hl7.org/spaces/AP/pages/345081840/FHIR+Write+-+Notes) project.
- **Menu Bar & Change Log**: To reduces menu clutter, consolidate topics, and improves change log navigation .We updated the main menu, moving [Changes Between Versions] and [Change Log] pages to a new [Version History] menu bar item. We also moved [Security] to the [Conformance] menu, and relocated [Examples] under [FHIR Artifacts]. The change log was resorted to group trackers by their change impact - non-compatible, saubstantive, and non-substantive.
- **Changes Between Versions**: In anticipation of move to FHIR R6 in a future version of US Core, the guidance in the Changes Between Versions section has been updated to address client and server expectations when transitioning between FHIR versions. Topics include:
  - [Stable IDs](changes-between-versions.html#no-guarantee-that-resource-ids-are-preserved)
  - [Authorization](changes-between-versions.html#authorization-across-versions)
  - [Data Preservation](changes-between-versions.html#expectation-that-data-is-preserved-between-versions)
- **[ValueSet and CodeSystem Versions](terminology.html#us-core-valueset-and-codesystem-versions)**:  We document US Core's decision to publish **snapshots** of terminology at release time but **not** pin canonical references to specific versions.  We introduce *Value Set Packages* that tie US Core Versions to annual version updates of ValueSets and CodeSystems as a resource for implementer who require them. This align with real-world terminology evolution, reduces breaking changes, and supports implementers.
