
The **US Core Implementation Guide Change Log** captures updates, enhancements, clarifications, and corrections across multiple versions, reflecting community feedback, ballot processes, and alignment with evolving USCDI standards.

### How to Review Updates Between Versions
1. **Identify Your Starting Point**: Determine the version you’re currently using (e.g., 7.0.0) and the target version (e.g., 8.0.0). Each version builds on the previous version including intermediate ballot-related updates (e.g., January 2025 for v 8.0.0) so don't skip them when reviewing changes.
1. **Review Version Summaries**: Start with the “What’s New” section for each version including intermediate ballot versions to get a summary of important updates to the guide (e.g., new profiles in v8.0.0 supporting USCDI v5).
1. **Examine Detailed Changes**: Review the “Changes” section for each version for a complete list of a changes to the guide. Click the Jira Tracker (e.g., FHIR-123) links to see the underlying issue and resolution, and click on the  “See Changes Here” links to view modified content directly in the guide.
1. **Compare Across Versions**: For a deeper analysis, refer to the [Changes Between Versions] page for detailed FHIR artifact comparisons.

### Version = 9.0.0 - ballot
- url: <https://hl7.org/fhir/us/core/2026Jan/>
- Based on FHIR version : 4.0.1

#### What's new in the US Core January 2026 Ballot

{% include whats-new/v9-ballot.md %}

#### Changes:

- Implementers submitted over 50 trackers since the publication of US Core ver 8.0.0. We have addressed them and applied over 40 changes grouped by change impact and listed below:


**Tracker Status**: **Change Impact** **(Change Category)** **Change Summary** **Jira Issue [Link](#)** **Updated Content [Link](#)**

##### Non-compatible
1. **Resolved - change required:** Non-compatible (Enhancement) Deprecate every version before 3.1.1  [FHIR-46065](https://jira.hl7.org/browse/FHIR-46065) See Changes [Here](changes.html)
2. **Triaged:** Non-compatible (Correction) Constrain subject to only patient [FHIR-51032](https://jira.hl7.org/browse/FHIR-51032) See Changes [Here](StructureDefinition-us-core-adi-documentreference.html)
3. **Applied:**  Non-compatible (Enhancement) Replace `DocumentReference.attestor`and US Core Authentication Time Extension extension with the R5 authenticator extension [FHIR-49617](https://jira.hl7.org/browse/FHIR-49617) See Changes [Here](StructureDefinition-us-core-adi-documentreference.html)
4. **Applied:** Non-compatible (Correction) Correct HCPCS code system URI [FHIR-50807](https://jira.hl7.org/browse/FHIR-50807) See Changes [Here](ValueSet-us-core-procedure-code.html)
5. **Applied:** Non-compatible, substantive (Enhancement) Add USCDI v6 Data Elements to US Core [FHIR-52965](https://jira.hl7.org/browse/FHIR-52965) See Changes Listed in the [9.0.0-Ballot Introduction](#whats-new-in-the-us-core-january-2026-ballot) above.

##### Compatible, substantive
6. **Resolved - change required:** Compatible, substantive (Enhancement) Seems like observation-category CodeSystem needs to be extended to include a concept for care-experience-preference [FHIR-43541](https://jira.hl7.org/browse/FHIR-43541) See Changes [Here]()
3. **Resolved - change required:** Compatible, substantive (Clarification) How to deal with searchparameters in the package that only convey expectations [FHIR-48876](https://jira.hl7.org/browse/FHIR-48876) See Changes [Here](https://www.hl7.org/fhir/us/core/search-parameters-and-operations.html#search-parameters)
4. **Triaged:** Compatible, substantive (Clarification) Hyperlink discrepancy [FHIR-49336](https://jira.hl7.org/browse/FHIR-49336) See Changes [Here](StructureDefinition-us-core-diagnosticreport-lab.html#terminology-bindings-differential)
5. **Triaged:** Compatible, substantive (Clarification) Hyperlink discrepancy [FHIR-49337](https://jira.hl7.org/browse/FHIR-49337) See Changes [Here](StructureDefinition-us-core-observation-lab.html#terminology-bindings-differential)
6. **Applied:** Compatible, substantive (Correction) Update Medication Adherence Value Set [FHIR-52822](https://jira.hl7.org/browse/FHIR-52822) See Changes [Here](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1240.8/expansion)
7. **Applied:** Compatible, substantive (Enhancement) Add SNOMED CT specialty codes as an "additional binding" to `PractitionerRole.specialty`  [FHIR-52843](https://jira.hl7.org/browse/FHIR-52843) See Changes [Here](StructureDefinition-us-core-practitionerrole.html)
8. **Triaged:** Compatible, substantive (Correction) Update the SOPT's terminology reference in the code-system table [FHIR-44138](https://jira.hl7.org/browse/FHIR-44138) See Changes [Here](terminology.html)
9. **Resolved - change required:** Compatible, substantive (Enhancement) Move USPS value set to THO [FHIR-50143](https://jira.hl7.org/browse/FHIR-50143) See Changes [Here](StructureDefinition-us-core-patient.html)
10. **Applied:**  Compatible, substantive (Enhancement) Additional Guidance for the appropriate NDC code to use from the NDC vaccine linker [FHIR-50798](https://jira.hl7.org/browse/FHIR-50798) See Changes:
    - [US Core Immunization Profile](StructureDefinition-us-core-immunization.html#profile-specific-implementation-guidance)
    - [Immunization Example 1](Immunization-imm-1.html)
11. **Resolved - change required:**  Compatible, substantive (Enhancement) merge US Core Provenance Type CodeSystem with FHIR Provenance Type CodeSystem [FHIR-50927](https://jira.hl7.org/browse/FHIR-50927) See Changes:[Here](CodeSystem-us-core-provenance-participant-type.html)
12. **Applied:** Compatible, substantive (Correction) Remove guidance from US Core Simple Observation Profile [FHIR-51493](https://jira.hl7.org/browse/FHIR-51493) See Changes [Here](StructureDefinition-us-core-simple-observation.html#mandatory-and-must-support-data-elements)
13. **Applied:** Compatible, substantive (Clarification) Redefined FMM Levels for USCDI artifacts and renamed to US Core Maturity Levels [FHIR-52975](https://jira.hl7.org/browse/FHIR-52975) See Changes [Here](changes-between-versions.html#us-core-maturity-levels)
14. **Applied:** Compatible, substantive (Enhancement) Add resource types that can use the Individual Sex Extension [FHIR-52994](https://jira.hl7.org/browse/FHIR-52994) See Changes [Here](StructureDefinition-us-core-individual-sex.html)
15. **Applied:** Compatible, substantive (Enhancement) Add NCSBN as an optional identifier to US Core Practitioner Profile [FHIR-53040](https://jira.hl7.org/browse/FHIR-53040) See Changes:
    - [US Core Practitioner Profile](StructureDefinition-us-core-practitioner.html)
    - [Practitioner 3 Example](Practitioner-practitioner-3.html)
16. **Applied:** Compatible, substantive (Enhancement) Add *Electronic cigarette status* to US Core Smoking Status Profile's Smoking Status Type value set. [FHIR-53042](https://jira.hl7.org/browse/FHIR-53042) See Changes
    - [Smoking Status Type](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1267.6/expansion)
    - [Electronic Cigarette User Example](Observation-e-cig-user.html)
17. **Pre-Applied:** Compatible, substantive (Enhancement) Add ValueSet and CodeSystem version guidance [FHIR-53111](https://jira.hl7.org/browse/FHIR-53111) See Changes [Here](terminology.html#us-core-valueset-and-codesystem-versions)

##### Non-substantive
25.  **Applied:** Non-substantive (Clarification) Clarify Coverage.type value set usage [FHIR-44122](https://jira.hl7.org/browse/FHIR-44122) See Changes [Here](StructureDefinition-us-core-coverage.html#profile-specific-implementation-guidance)
2.  **Applied:** Non-substantive (Correction) Change binding description in US Core Coverage Profile [FHIR-44124](https://jira.hl7.org/browse/FHIR-44124) See Changes:
    -  [US Core Coverage Profile](StructureDefinition-us-core-coverage.html)
    -  [Payer Type Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.114222.4.11.3591/expansion)
2. **Applied:** Non-substantive (Enhancement) Register NAIC Code Number Identifier system in THO [FHIR-46185](https://jira.hl7.org/browse/FHIR-46185) See Changes [Here](https://terminology.hl7.org/NamingSystem-NAICCompanyCodes.html)
3.  **Resolved - change required:** Non-substantive (Correction) correct line 81 in terminology  [FHIR-49610](https://jira.hl7.org/browse/FHIR-49610) See Changes [Here](terminology.html)
4.  **Applied:** Non-substantive (Enhancement) Relax US@ address requirements [FHIR-51159](https://jira.hl7.org/browse/FHIR-51159) See Changes [Here](StructureDefinition-us-core-patient.html)
5.  **Applied:** Non-substantive (Clarification) Update client expectations for preserving resource IDs between versions [FHIR-51756](https://jira.hl7.org/browse/FHIR-51756) See Changes [Here](changes-between-versions.html#no-guarantee-that-resource-ids-are-preserved)
6.  **Applied:** Non-substantive (Clarification) Update guidance on Authorization Across Versions Sections [FHIR-51757](https://jira.hl7.org/browse/FHIR-51757) See Changes [Here](changes-between-versions.html#authorization-across-versions)
7.  **Applied:** Non-substantive (Clarification) Add implementer guidance for non-US addresses [FHIR-51791](https://jira.hl7.org/browse/FHIR-51791) See Changes:
    - [US Core Patient](StructureDefinition-us-core-patient.html#profile-specific-implementation-guidance)
    - [US Core Practitioner](StructureDefinition-us-core-practitioner.html#profile-specific-implementation-guidance)
    - [US Core Organization](StructureDefinition-us-core-organization.html#profile-specific-implementation-guidance)
    - [US Core RelatedPerson](StructureDefinition-us-core-relatedperson.html#profile-specific-implementation-guidance)
    - [US Core Location](StructureDefinition-us-core-location.html#profile-specific-implementation-guidance)
8.   **Applied:** Non-substantive (Enhancement) Call attention and link to USCDI level 1, 2 Data elements [FHIR-52492](https://jira.hl7.org/browse/FHIR-52492) See Changes [Here](uscdi.html#anticipating-future-uscdi-versions)
9.  **Applied:** Non-substantive (Clarification) Clarify $docref operation behavior [FHIR-52869](https://jira.hl7.org/browse/FHIR-52869) See Changes [Here](OperationDefinition-docref.html)
10. **Resolved - change required:** Non-substantive (Correction) Fix the US Core History Page [FHIR-46749](https://jira.hl7.org/browse/FHIR-46749) See Changes [Here](https://hl7.org/fhir/us/core/history.html)
11. **Applied:**  Non-substantive (Enhancement) Updated main menu and menu items [FHIR-50345](https://jira.hl7.org/browse/FHIR-50345) See Changes [Here](index.html)
1.  **Applied:** Non-substantive (Enhancement) Reformat the profile pages' Implementation Guidance Sections [FHIR-50972](https://jira.hl7.org/browse/FHIR-50972) See Change [Here](StructureDefinition-us-core-allergyintolerance.html#profile-specific-implementation-guidance)
2.  **Triaged:**  Non-substantive (Clarification) Update client Expectation that FHIR Data is Preserved [FHIR-51760](https://jira.hl7.org/browse/FHIR-51760) See Changes [Here](changes-between-versions.html#expectation-that-data-is-preserved-between-versions)
3.  **Applied:** Non-substantive (Correction) Remove Externally Published code systems section and table [FHIR-52980](https://jira.hl7.org/browse/FHIR-52980) See Changes [Here](terminology.html#code-systems)
4.  **Applied:** Compatible, Non-substantive (Correction) Update US Core Race and Ethnicity Extension descriptions [FHIR-53113](https://jira.hl7.org/browse/FHIR-53113) See Changes:
    - [US Core Race Extension](StructureDefinition-us-core-race.html)
    - [US Core Ethnicity Extension](StructureDefinition-us-core-ethnicity.html)
5.  **Applied:** Non-substantive (Enhancement) Compare US Core Profiles with International Patient Summary Profiles [FHIR-53130](https://jira.hl7.org/browse/FHIR-53130) See Changes [Here](relationship-with-other-igs.html)
6.  **Pre-Applied:**  Non-substantive (Enhancement) Add Writing Clinical Notes page to Looking Ahead Section [FHIR-53283](https://jira.hl7.org/browse/FHIR-53283) See Changes [Here](writing-clinical-notes.html)

### Version = 8.0.1 (Meets USCDI v5 Requirements)
- url: <https://hl7.org/fhir/us/core/STU8.0.1/>
- Based on FHIR version: 4.0.1

This technical update US Core have been reviewed and commented upon by the public through the HL7 errata process. The HL7 International Cross-Group Projects work group members have agreed to and voted on the resolution of the community comments.

#### What's new in Version 8.0.1 of US Core

{% include whats-new/v8.0.1.md %}

#### Changes

 - This technical update US Core has 7 changes which are listed below.

**Tracker Status**: **Change Impact** **(Change Category)** **Change Summary** **Jira Issue [Link](#)** **Updated Content [Link](#)**

##### Compatible, substantive
1. **Applied:** Compatible, substantive (Correction) Rename The USCore sex extension [FHIR-53047](https://jira.hl7.org/browse/FHIR-53047) See Changes Listed in introduction above.

##### Non-substantive
2. **Applied:** Non-substantive (Correction) Fix Link to Race & Ethnicity     - CDC (CDCREC) code system [FHIR-51137](https://jira.hl7.org/browse/FHIR-51137) See Changes:
    - [US Core Race Extension](StructureDefinition-us-core-race.html)
    - [US Core Ethnicity Extension](StructureDefinition-us-core-ethnicity.html)
3. **Applied:** Non-substantive (Correction) Typo in US Core Laboratory Result Observation Profile [FHIR-51254](https://jira.hl7.org/browse/FHIR-51254) See Changes [Here](StructureDefinition-us-core-observation-lab.html#mandatory-and-must-support-data-elements)
4. **Applied:** Non-substantive (Correction) Typo in SMART well-known example [FHIR-51363](https://jira.hl7.org/browse/FHIR-51363) See Changes [Here](scopes.html#example-well-knownsmart-configuration-file)
5. **Applied:** Non-substantive (Correction) Remove span tags [FHIR-52125](https://jira.hl7.org/browse/FHIR-52125) See Changes [Here](StructureDefinition-us-core-adi-documentreference.html)
6. **Applied:** Non-substantive (Correction) Add missing target information to Small-Provenance Table [FHIR-52997](https://jira.hl7.org/browse/FHIR-52997) See Changes [Here](basic-provenance.html#author-and-author-role-data-elements)
7. **Applied:** Non-substantive (Correction) Correct the definition of additional USCDI ServiceRequest element [FHIR-53029](https://jira.hl7.org/browse/FHIR-53029) See Changes [Here](StructureDefinition-us-core-servicerequest.html)
8. **Pre-Applied:** Update patch policy text [FHIR-53418](https://jira.hl7.org/browse/FHIR-53418) See Changes [Here](changes-between-versions.html#versioning-of-us-core)
9. **Pre-Applied:** Update CQL Library section Persuasive [FHIR-53419](https://jira.hl7.org/browse/FHIR-53419) See Changes [Here](general-guidance.html#using-cql-with-us-core)

### Version = 8.0.0
- url: <https://hl7.org/fhir/us/core/STU8/>
- Based on FHIR version: 4.0.1

The changes in this annual update to US Core have been reviewed and commented upon by the public through the January 2025 HL7 balloting process. The HL7 International Cross-Group Projects work group members have agreed to and voted on the resolution of the community comments.
#### What's new in Version 8.0.0 of US Core:

Each update to a new version of US Core changes the US Core Profiles and conformance expectations. Implementers can find detailed comparisons between the FHIR artifacts in this 8.0.0 version of US Core and each previous major release on [Changes Between Versions] page. Below is an overview of significant changes between Version 8.0.0 and Version 8.0.0-ballot of US Core.

{% include whats-new/v8.md %}

#### Changes:

The ballot-related comments resulted in over 100 changes to this specification, which are listed below:

**Tracker Status**: **Change Impact** **(Change Category)** **Change Summary** **Jira Issue [Link](#)** **Updated Content [Link](#)**

##### Non-compatible
1. **Applied:** Non-compatible (Enhancement) Added and corrected individual provenance elements [FHIR-49221](https://jira.hl7.org/browse/FHIR-49221) See the summary of changes in the [What's New](https://hl7.org/fhir/us/core/STU8/#whats-new-in-version-800-of-us-core) section above.
2. **Applied:** Non-compatible (Enhancement) Move Patient Communication Language valueset to [HL7 Terminology (THO)]. [FHIR-49397](https://jira.hl7.org/browse/FHIR-49397) See Changes [Here](https://www.hl7.org/fhir/us/core/StructureDefinition-us-core-patient.html)
3. **Applied:** Non-compatible (Clarification) Change binding for US Core ADI DocumentReference  and .type [FHIR-49615](https://jira.hl7.org/browse/FHIR-49615) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-adi-documentreference.html)
4. **Applied:** Non-compatible (Correction) Changes to comply with Executive Order 14168 [FHIR-50177](https://jira.hl7.org/browse/FHIR-50177) See the summary of changes in the [What's New](https://hl7.org/fhir/us/core/STU8/#whats-new-in-version-800-of-us-core) section above.

##### Compatible, substantive
5. **Applied:** Compatible, substantive (Clarification) Add guidance on reference to Observation target  [FHIR-48756](https://jira.hl7.org/browse/FHIR-48756) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-observation-screening-assessment.html)
6. **Applied:** Compatible, substantive (Enhancement) Change Screening Assessment Profile category:screening-assessment to Add'l USCDI [FHIR-48849](https://jira.hl7.org/browse/FHIR-48849) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-observation-screening-assessment.html)
7. **Applied:** Compatible, substantive (Enhancement) Change Problems category to Add'l USCDI [FHIR-48850](https://jira.hl7.org/browse/FHIR-48850) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-condition-problems-health-concerns.html)
8. **Applied:** Compatible, substantive (Correction) Corrected MS target for MedicationRequest.requester and .reportedReference data elements in Individual Level Provenance Table [FHIR-49066](https://jira.hl7.org/browse/FHIR-49066) See Changes [Here](https://hl7.org/fhir/us/core/STU8/basic-provenance.html#individual-level-provenance)
9. **Applied:** Compatible, substantive (Clarification) Clarify reporting specimen type best practice. [FHIR-49102](https://jira.hl7.org/browse/FHIR-49102) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-observation-lab.html#mandatory-and-must-support-data-elements)
10. **Applied:** Compatible, substantive (Enhancement) Add asked-declined to Race and Ethnicity Value Sets [FHIR-49134](https://jira.hl7.org/browse/FHIR-49134) (See Terminology Changes Listed in introduction above)
11. **Applied:** Compatible, substantive (Correction) Add ADI DocumentReference and Observation ADI Document to CapabilityStatements [FHIR-49162](https://jira.hl7.org/browse/FHIR-49162) See Changes [Here](https://hl7.org/fhir/us/core/STU8/CapabilityStatement-us-core-server.html)
12. **Applied:** Compatible, substantive (Correction) Observation should be US Core Observation Screening Assessment Profile  [FHIR-49163](https://jira.hl7.org/browse/FHIR-49163) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-observation-screening-assessment.html)
13. **Applied:** Compatible, substantive (Clarfication) Align US Core and C-CDA Race and Ethnicity Value Set Concepts [FHIR-49234](https://jira.hl7.org/browse/FHIR-49234) (See Terminology Changes Listed in introduction above)
14. **Applied:** Compatible, substantive (Correction) Update the VSAC [CVX Vaccines Administered Vaccine Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1010.6/expansion) value set [FHIR-49292](https://jira.hl7.org/browse/FHIR-49292)(StructureDefinition-us-core-immunization.html#profile)
15. **Applied:** Compatible, substantive (Enhancement) Add Observation.code.text as an *Additional USCDI* element  [FHIR-49308](https://jira.hl7.org/browse/FHIR-49308) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-observation-lab-definitions.html#Observation.code)
16. **Applied:** Compatible, substantive (Enhancement) Change the slice for category 'assess-plan' from 1..1 Must Support to 0..1 Must Support. [FHIR-49309](https://jira.hl7.org/browse/FHIR-49309) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-careplan.html)
17. **Applied:** Compatible, substantive (Correction) Update [SOP Payer Type](https://vsac.nlm.nih.gov/valueset/2.16.840.1.114222.4.11.3591/expansion) value set.[FHIR-49395](https://jira.hl7.org/browse/FHIR-49395)
18. **Applied:** Compatible, substantive (Correction) Add and apply guidance on [FHIR Maturity Level]. [FHIR-49400](https://jira.hl7.org/browse/FHIR-49400) See Changes [Here](https://hl7.org/fhir/us/core/STU8/index.html#us-core-profile-maturity)
19. **Applied:** Compatible, substantive (Correction) Update Medication Route of Admin terminology binding [FHIR-49403](https://jira.hl7.org/browse/FHIR-49403) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-medicationrequest.html)
20. **Applied:** Compatible, substantive (Correction) Add same bindings to category "slicer" and "sliced" category elements in observation profiles. [FHIR-49444](https://jira.hl7.org/browse/FHIR-49444) See Changes Here:
    - [US Core Treatment Intervention Profile](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-treatment-intervention-preference.html#profile)
    - [US Core Care Experience Profile](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-care-experience-preference.html#profile)
    - [US Core Observation ADI Documentation Profile](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-observation-adi-documentation.html#profile)
    - [US Core Simple Observation](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-simple-observation.html#profile)
21. **Applied:** Compatible, substantive (Enhancement) Add ServiceRequest.code.text as an *Additional USCDI* element [FHIR-49609](https://jira.hl7.org/browse/FHIR-49609) See Changes Here:
    - [US Core ServiceRequest Profile](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-servicerequest.html)
    - [ServiceRequest Food Pantry Referral Example](https://hl7.org/fhir/us/core/STU8/ServiceRequest-foodpantry-referral.html)
22. **Applied:** Compatible, substantive (Clarification) Clarify how to categorize CDA documents[FHIR-49612](https://jira.hl7.org/browse/FHIR-49612) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-documentreference.html#mandatory-and-must-support-data-elements)
23. **Applied:** Compatible, substantive (Enhancement) Remove US Core Laboratory Result Observation Profile as a Must Support target for the US Core DiagnosticReport Profile for Report and Note Exchange [FHIR-49906](https://jira.hl7.org/browse/FHIR-49906) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-diagnosticreport-note.html)
24. **Applied:** Compatible, substantive (Clarification) Remove ICD-9 from additional bound value set in US Core Condition profiles [FHIR-49986](https://jira.hl7.org/browse/FHIR-49986) See Changes Here
    - [US Core Condition Encounter Diagnosis Profile](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-condition-problems-health-concerns.html)
    - [US Core Condition Problems and Health Concerns Profile](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-condition-encounter-diagnosis.html)
    - [US Core Condition Codes Current](https://hl7.org/fhir/us/core/STU8/ValueSet-us-core-condition-code-current.html)
25. **Applied** Compatible, substantive (Correction) Added missing profiles to "omitted" Profile list for individual level provenance [FHIR-50163](https://jira.hl7.org/browse/FHIR-50163) See Changes [Here](https://hl7.org/fhir/us/core/STU8/basic-provenance.html#individual-level-provenance)
26. **Applied:** Compatible, substantive (Clarification) Remove MS flag for Practitioner in MedicationDispense Profile [FHIR-50239](https://jira.hl7.org/browse/FHIR-50239) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-medicationdispense.html)
27. **Applied:** Compatible, substantive (Enhancement) Align Group Number/Name with USCDI Group Identifier [FHIR-50283](https://jira.hl7.org/browse/FHIR-50283) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-coverage.html)
28. **Applied:** Compatible, substantive (Enhancement) Remove clinical Dates and statuses from the US Core Condition Encounter Diagnosis Profile [FHIR-50288](https://jira.hl7.org/browse/FHIR-50288) See Changes Here
    - [US Core Condition Encounter Diagnosis Profile](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-condition-encounter-diagnosis.html)
    - [Encounter Diagnosis Example 1](https://hl7.org/fhir/us/core/STU8/Condition-encounter-diagnosis-example1.html)
    - [Encounter Diagnosis Example 2](https://hl7.org/fhir/us/core/STU8/Condition-encounter-diagnosis-example2.html)
29. **Applied:** Compatible, substantive (Correction) Remove gender based search requirements [FHIR-50380](https://jira.hl7.org/browse/FHIR-50380) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-patient.html#notes)
30.  **Applied** Compatible, substantive (Enhancement) Move USPS value set to THO [FHIR-50143](https://jira.hl7.org/browse/FHIR-50143) See Changes [Here](http://terminology.hl7.org/ValueSet/USPS-State)

##### Non-substantive
31. **Applied:** Non-substantive (Clarification) Discourage use of  ICD-10-CM header codes. [FHIR-48742](https://jira.hl7.org/browse/FHIR-48742) See Changes Here:
    - [US Core Condition Encounter Diagnosis Profile](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-condition-encounter-diagnosis.html)
    - [US Core Condition Problems and Health Concerns Profile](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-condition-problems-health-concerns.html)
32. **Applied:** Non-substantive (Correction) Remove additional USCDI tag from Element [FHIR-48754](https://jira.hl7.org/browse/FHIR-48754) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-observation-screening-assessment.html)
33. **Applied:** Non-substantive (Clarification) Add conformance rule about using US Core profiles with Operations [FHIR-48822](https://jira.hl7.org/browse/FHIR-48822) See Changes [Here](https://hl7.org/fhir/us/core/STU8/general-guidance.html)
34. **Applied:** Non-substantive (Clarification) Remove STU Note regarding the Argonauts 2023 SMART Imaging Access project [FHIR-48851](https://jira.hl7.org/browse/FHIR-48851) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-diagnosticreport-note.html)
35. **Applied:** Non-substantive (Correction)  Typo "PractitionerRole" instead of "PracitionRole" [FHIR-48866](https://jira.hl7.org/browse/FHIR-48866) See Changes [Here](https://hl7.org/fhir/us/core/STU8/CapabilityStatement-us-core-server.html#healthcareservice)
36. **Applied:** Non-substantive (Clarification) Document how to find code systems for value sets in VSAC [FHIR-48889](https://jira.hl7.org/browse/FHIR-48889) See Changes Here:
    - [Terminology](https://hl7.org/fhir/us/core/STU8/terminology.html#the-value-set-authority-center-vsac)
    - [VSAC to FHIR Code System Mapping Table](https://hl7.org/fhir/us/core/STU8/vsacname-fhiruri-map.html)
37. **Applied** Non-substantive (Correction) Update THO code system link [FHIR-49009](https://jira.hl7.org/browse/FHIR-49009) See Changes [Here](https://hl7.org/fhir/us/core/STU8/ValueSet-us-core-provenance-participant-type.html)
38. **Applied:** Non-substantive (Correction) Typo "content.attachment.url/data" instead of "content.url/data" [FHIR-49023](https://jira.hl7.org/browse/FHIR-49023) See Changes Here:
    - [US Core DocumentReference Profile](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-documentreference.html)
    - [US Core ADI DocumentReference     - Profile ](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-adi-documentreference.html)
39. **Applied:** Non-substantive (Correction) Add Provenance Author and Author Role to USCDI Table [FHIR-49024](https://jira.hl7.org/browse/FHIR-49024) See Changes [Here](https://hl7.org/fhir/us/core/STU8/uscdi.html)
40. **Applied:** Non-substantive (Clarification) Clarify the guidance using a MedicationRequest query to access "all medications" or "all active medications". [FHIR-49038](https://jira.hl7.org/browse/FHIR-49038) See Changes [Here](https://hl7.org/fhir/us/core/STU8/medication-list.html#fetching-all-medications-active-medications-and-all-medications-for-an-encounter)
41. **Applied:** Non-substantive (Clarification) Clarify MedicationRequest Profile Specific Implementation Guidance on fetching active medications: [FHIR-49039](https://jira.hl7.org/browse/FHIR-49039) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-medicationrequest.html#mandatory-and-must-support-data-elements)
42. **Applied:** Non-substantive (Correction) Add author provenance documentation to all profiles listed Individual Level Provenance table.[FHIR-49064](https://jira.hl7.org/browse/FHIR-49064) For example, see Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-observation-screening-assessment.html)
43. **Applied:** Non-substantive (Correction) Define the use of use the term "certifying Server system" and remove it from US Core Observation Screening Assessment Profile. [FHIR-49065](https://jira.hl7.org/browse/FHIR-49065) See Changes Here:
    - [US Core Observation Screening Assessment Profile](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-observation-screening-assessment.html)
    - [Additional USCDI Requirements](https://hl7.org/fhir/us/core/STU8/must-support.html#additional-uscdi-requirements)
44. **Applied:** Non-substantive (Correction) Plural vs singular wording for provenance elements [FHIR-49067](https://jira.hl7.org/browse/FHIR-49067) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-immunization.html)
45. **Applied:** Non-substantive (Correction) Typo "service should happen" instead of "serviceSHOULDhappen" [FHIR-49068](https://jira.hl7.org/browse/FHIR-49068) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-servicerequest.html)
46. **Applied:** Non-substantive (Clarification) Clarify narrative section on ServiceRequest.code content [FHIR-49069](https://jira.hl7.org/browse/FHIR-49069) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-servicerequest.html#mandatory-and-must-support-data-elements)
47. **Applied:** Non-substantive (Correction) typo "and" instead of "amd" [FHIR-49087](https://jira.hl7.org/browse/FHIR-49087) See Changes [Here](https://hl7.org/fhir/us/core/STU8/index.html#home)
48. **Applied:** Non-substantive (Correction) Fix link [FHIR-49089](https://jira.hl7.org/browse/FHIR-49089) See Changes [Here](https://hl7.org/fhir/us/core/STU7/changes.html#the-january-2024-ballot)
49. **Applied:** Non-substantive (Correction) typo "RESTful" instead of "RESTfUl" [FHIR-49090](https://jira.hl7.org/browse/FHIR-49090) See Changes [Here](https://hl7.org/fhir/us/core/STU8/general-requirements.html#us-core-conformance-artifacts)
50. **Applied:** Non-substantive (Correction) Correct figure label [FHIR-49095](https://jira.hl7.org/browse/FHIR-49095) See Changes [Here](https://hl7.org/fhir/us/core/STU8/must-support.html#key-elements-table-view)
51. **Applied:** Non-substantive (Correction) Add missing word "support" [FHIR-49098](https://jira.hl7.org/browse/FHIR-49098) See Changes [Here](https://hl7.org/fhir/us/core/STU8/must-support.html#must-support---complex-elements)
52. **Applied:** Non-substantive (Correction) Add missing word "and" [FHIR-49099](https://jira.hl7.org/browse/FHIR-49099) See Changes [Here](https://hl7.org/fhir/us/core/STU8/must-support.html#must-support-targets-for-us-core-profiles)
53. **Applied:** Non-substantive (Correction) Update Specimen code to specimen type code in narrative [FHIR-49100](https://jira.hl7.org/browse/FHIR-49100) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-specimen.html#mandatory-and-must-support-data-elements)
54. **Applied:** Non-substantive (Clarification) Clarify how an order is linked to the DiagnosticReport [FHIR-49101](https://jira.hl7.org/browse/FHIR-49101) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-diagnosticreport-lab.html#mandatory-and-must-support-data-elements) and [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-diagnosticreport-note.html)
55. **Applied:** Non-substantive (Enhancement) Add guidance that other identifiers like NCSBN can be used. [FHIR-49122](https://jira.hl7.org/browse/FHIR-49122) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-practitioner.html#mandatory-and-must-support-data-elements)
56. **Applied:** Non-substantive (Enhancement) Clarify US Core's relationship with IPA [FHIR-49123](https://jira.hl7.org/browse/FHIR-49123) See Changes [Here](https://hl7.org/fhir/us/core/STU8/relationship-with-other-igs.html)
57. **Applied:** Non-substantive (Correction) Remove Duplicate Specific Implementation Guidance: [FHIR-49164](https://jira.hl7.org/browse/FHIR-49164) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-simple-observation.html)
58. **Applied:** Non-substantive (Clarification) Language for linking to Assessment Profile is confusing [FHIR-49197](https://jira.hl7.org/browse/FHIR-49197) See Changes [Here](https://hl7.org/fhir/us/core/STU8/screening-and-assessments.html#clinical-judgments)
59. **Applied:** Non-substantive (Enhancement) Reference and link to the USCDI page from the Home Page. [FHIR-49219](https://jira.hl7.org/browse/FHIR-49219) See Changes [Here](https://hl7.org/fhir/us/core/STU8/index.html#background)
60. **Applied:** Non-substantive (Clarification) Updated the QuickStarts for DocumentReference, Condition,  and DocumentReference profile to use profile-specific examples and language. [FHIR-49250](https://jira.hl7.org/browse/FHIR-49250) See Changes Here:
    - [US Core ADI DocumentReference Profile](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-adi-documentreference.html)
    - [US Core DocumentReference Profile](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-documentreference.html)
    - [US Core DiagnosticReport Profile for Laboratory Results Reporting](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-diagnosticreport-lab.html)
    - [US Core DiagnosticReport Profile for Report and Note Exchange](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-diagnosticreport-note.html)
    - [US Core Condition Encounter Diagnosis Profile](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-condition-encounter-diagnosis.html)
    - [US Core Condition Problems and Health Concerns Profile](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-condition-problems-health-concerns.html)
61. **Applied:** Non-substantive (Correction) Update Observation.derivedFrom examples for Observation Screening Assessment Profile [FHIR-49289](https://jira.hl7.org/browse/FHIR-49289) See Changes [Here](https://hl7.org/fhir/us/core/STU8/Observation-10-minute-apgar-score-panel.html)
62. **Applied:** Non-substantive (Correction) Correct CVX vaccine codes link [FHIR-49293](https://jira.hl7.org/browse/FHIR-49293) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-immunization.html#profile)
63. **Applied:** Non-substantive (Enhancement) Define the Acronym 'ADI' in all pages where it is used [FHIR-49299](https://jira.hl7.org/browse/FHIR-49299) See Changes:
    - [US Core ADI DocumentReference Profile](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-adi-documentreference.html)
    - [US Core Observation ADI Documentation Profile](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-observation-adi-documentation.html)
64. **Applied:** Non-substantive (Clarification) Add version lineage to the US Core Observation Screening Assessment Profile's introduction. [FHIR-49305](https://jira.hl7.org/browse/FHIR-49305) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-observation-screening-assessment.html)
65. **Applied:** Non-substantive (Correction) Corrections to typos [FHIR-49306](https://jira.hl7.org/browse/FHIR-49306)
66. **Applied:** Non-substantive (Correction) Fix typo 'Advance Directives' instead  of 'Advanced Directives' [FHIR-49307](https://jira.hl7.org/browse/FHIR-49307) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-adi-documentreference.html)
67. **Applied:** Non-substantive (Clarification) Cardinality does not match element definition [FHIR-49338](https://jira.hl7.org/browse/FHIR-49338) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-diagnosticreport-lab.html#profile)
68. **Applied** Non-substantive (Enhancement) Add "Plain Language" summary to the home page [FHIR-49367](https://jira.hl7.org/browse/FHIR-49367) See Changes [Here](https://hl7.org/fhir/us/core/STU8/index.html)
69. **Applied** Non-substantive (Correction)Fix Typo in US Core Yearly Updates diagram [FHIR-49376](https://jira.hl7.org/browse/FHIR-49376) See Changes [Here](https://hl7.org/fhir/us/core/STU8/us-core-roadmap.html)
70. **Applied:** Non-substantive (Clarification) Update the preferred language recommendation [FHIR-49391](https://jira.hl7.org/browse/FHIR-49391) See Changes Here:
    - [US Core Patient Profile](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-patient.html)
    - [US Core Encounter Profile](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-encounter.html)
71. **Applied** Non-substantive (Clarification) Clarify reference to race and ethnicity category codes  [FHIR-49392](https://jira.hl7.org/browse/FHIR-49392) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-patient.html)
72. **Applied:** Non-substantive (Clarification) Clarify reference to CDCREC [FHIR-49393](https://jira.hl7.org/browse/FHIR-49393) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-patient.html)
73. **Applied:** Non-substantive (Correction)Changed ONC to ASTP where appropriate [FHIR-49399](https://jira.hl7.org/browse/FHIR-49399)
74. **Applied:** Non-substantive (Clarification) Update US Core Location Type Value Set to meet industry use cases [FHIR-49401](https://jira.hl7.org/browse/FHIR-49401) and [FHIR-50937](https://jira.hl7.org/browse/FHIR-50937) See Changes
    -  [US Core Location Profile](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-location.html)
    -  [Healthcare Service Location Type Combined](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1267.31/expansion)
75. **Applied:** Non-substantive (Clarification) Spell out/define SOP in diagnostic report imaging study context  [FHIR-49402](https://jira.hl7.org/browse/FHIR-49402) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-diagnosticreport-note.html)
76. **Applied:** Non-substantive (Correction) Change number of common clinical notes to 10 [FHIR-49413](https://jira.hl7.org/browse/FHIR-49413) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-documentreference.html#mandatory-and-must-support-data-elements)
77. **Applied:** Non-substantive (Correction) Correction to Observation ADI Documentation Profile Introduction [FHIR-49414](https://jira.hl7.org/browse/FHIR-49414) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-observation-adi-documentation.html)
78. **Applied:** Non-substantive (Clarification) Clarify guidance for the Observation ADI Documentation Profile Observation.value element [FHIR-49415](https://jira.hl7.org/browse/FHIR-49415) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-observation-adi-documentation.html#mandatory-and-must-support-data-elements)
79. **Applied:** Non-substantive (Enhancement) Update to human readable VSAC link [FHIR-49419](https://jira.hl7.org/browse/FHIR-49419) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-adi-documentreference.html#mandatory-and-must-support-data-elements)
80. **Applied:** Non-substantive (Clarification) Update guidance if endpoint is outside the FHIR base URL [FHIR-49424](https://jira.hl7.org/browse/FHIR-49424) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-adi-documentreference.html#mandatory-and-must-support-data-elements)
81. **Applied:** Non-substantive (Correction) Remove duplicate listing and add US Core RelatedPerson Profile to listing to USCDI table [FHIR-49432](https://jira.hl7.org/browse/FHIR-49432) See Changes [Here](https://hl7.org/fhir/us/core/STU8/uscdi.html#uscdi)
82. **Applied:** Non-substantive (Enhancement) Add guidance about using CQL and provide model definitions.[FHIR-49477](https://jira.hl7.org/browse/FHIR-49477) See Changes [Here](https://hl7.org/fhir/us/core/STU8/general-guidance.html#using-cql-with-us-core)
83. **Applied:** Non-substantive (Enhancement) Add CLIA/USCDI/HL7 elements mapping table and update metabolic panel example to include order. [FHIR-49623](https://jira.hl7.org/browse/FHIR-49623) See Changes Here:
    - [US Core DiagnosticReport Profile for Laboratory Results Reporting](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-diagnosticreport-lab.html)
    - [Basic Metabolic Panel Example](https://hl7.org/fhir/us/core/STU8/DiagnosticReport-metabolic-panel.html)
    - [ServiceRequest BMP Example](https://hl7.org/fhir/us/core/STU8/ServiceRequest-bmp.html)
84. **Applied:** Non-substantive (Enhancement) Add CLIA/USCDI/HL7 elements mapping table and update CBC examples to include specimen. [FHIR-49630](https://jira.hl7.org/browse/FHIR-49630) See Changes Here:
    - [US Core Laboratory Result Observation Profile](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-observation-lab.html#mandatory-and-must-support-data-elements)
    - [Urine Specimen Example](https://hl7.org/fhir/us/core/STU8/Specimen-specimen-example-urine.html)
    - [Whole Blood Specimen Example](https://hl7.org/fhir/us/core/STU8/Specimen-specimen-example-whole-blood.html)
    - [Erythrocytes Example](https://hl7.org/fhir/us/core/STU8/Observation-cbc-erythrocytes.html)
    - [Hematocrit Example](https://hl7.org/fhir/us/core/STU8/Observation-cbc-hematocrit.html)
    - [Hemoglobin Example](https://hl7.org/fhir/us/core/STU8/Observation-cbc-hemoglobin.html)
    - [Leukocytes Example](https://hl7.org/fhir/us/core/STU8/Observation-cbc-leukocytes.html)
    - [MCH Example](https://hl7.org/fhir/us/core/STU8/Observation-cbc-mch.html)
    - [MCHC Example](https://hl7.org/fhir/us/core/STU8/Observation-cbc-mchc.html)
    - [MCV Example](https://hl7.org/fhir/us/core/STU8/Observation-cbc-mcv.html)
    - [Platelets Example](https://hl7.org/fhir/us/core/STU8/Observation-cbc-platelets.html)
85. **Applied:** Non-substantive (Correction) Update Image and typo on Figure 2: US Core DocumentReference.category [FHIR-49702](https://jira.hl7.org/browse/FHIR-49702) See Changes [Here](https://hl7.org/fhir/us/core/STU8/general-requirements.html#required-bindings-when-slicing-by-valuesets)
86. **Applied:** Non-substantive (Correction) Correct the additional binding purpose code "current" rendering [FHIR-49985](https://jira.hl7.org/browse/FHIR-49985) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-condition-encounter-diagnosis.html)
87. **Applied:** Non-substantive (Enhancement) Add Best Practices Guidance for Granular Scopes [FHIR-50002](https://jira.hl7.org/browse/FHIR-50002) See Changes [Here](https://hl7.org/fhir/us/core/STU8/scopes.html)
88. **Applied:** Non-substantive (Clarification) Add introduction to Change log to clarify how to use. [FHIR-50089](https://jira.hl7.org/browse/FHIR-50089) See Changes [Here](https://hl7.org/fhir/us/core/STU8/changes.html)
89. **Applied:** Non-substantive (Clarification) Value sets referenced by US Core reviewed annually [FHIR-50153](https://jira.hl7.org/browse/FHIR-50153)
90. **Applied:** Non-substantive (Enhancement) Created a new "Looking Ahead" menu tab  [FHIR-50154](https://jira.hl7.org/browse/FHIR-50154) See Changes [Here](https://hl7.org/fhir/us/core/STU8/looking-ahead.html)
91. **Applied:** Non-substantive (Enhancement) Added "Patient Data Feed" subscription guidance page to US Core [FHIR-50155](https://jira.hl7.org/browse/FHIR-50155) See Changes [Here](https://hl7.org/fhir/us/core/STU8/patient-data-feed.html)
92. **Applied** Non-substantive (Enhancement) Add guidance on inactive codes to the Terminology page [FHIR-50156](https://jira.hl7.org/browse/FHIR-50156) See Changes [Here](https://hl7.org/fhir/us/core/STU8/terminology.html)
93. **Applied:** Non-substantive (Enhancement) Add section on slicing on the Must Support page  [FHIR-50286](https://jira.hl7.org/browse/FHIR-50286) See Changes [Here](https://hl7.org/fhir/us/core/STU8/must-support.html#must-support---slices)
94. **Applied:** Non-substantive (Correction) Add copyright statements to Questionnaire examples [FHIR-50399](https://jira.hl7.org/browse/FHIR-50399) See Changes Here:
    - [Alcohol Use Disorder Identification Test     - Consumption (AUDIT-C) Questionnaire Example](https://hl7.org/fhir/us/core/STU8/Questionnaire-AUDIT-C.html)
    - [Exercise Vital Sign Questionnaire Example](https://hl7.org/fhir/us/core/STU8/Questionnaire-exercise-vital-sign.html)
    - [Questionnaire Hunger Vital Sign (HVS) Example](https://hl7.org/fhir/us/core/STU8/Questionnaire-hunger-vital-sign-example.html)
    - [Questionnaire PHQ-9 Example](https://hl7.org/fhir/us/core/STU8/Questionnaire-phq-9-example.html)
    - [Questionnaire PRAPARE Example](https://hl7.org/fhir/us/core/STU8/Questionnaire-prapare-example.html)
    - [Tobacco, Alcohol, Prescription medications, and other Substance use screen (TAPS) Questionnaire Example](https://hl7.org/fhir/us/core/STU8/Questionnaire-TAPS.html)
95. **Applied:** Non-substantive (Correction) Update the term "translation" to "additional coding" [FHIR-50796](https://jira.hl7.org/browse/FHIR-50796) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-immunization.html)
96.  **Applied:** Non-substantive (Clarification) Improve Language on Immunization.lotNumber for matching [FHIR-50795](https://jira.hl7.org/browse/FHIR-50795) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-immunization.html)
97. **Applied:** Non-substantive (Correction) Improve Language on boolean flag [FHIR-50794](https://jira.hl7.org/browse/FHIR-50794) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-medicationrequest.html)
98. **Applied:** Non-substantive (Correction) Improve Language: Change Name to Code [FHIR-50793](https://jira.hl7.org/browse/FHIR-50793) See Changes [Here](https://hl7.org/fhir/us/core/STU8/StructureDefinition-us-core-servicerequest.html)
99.  **Applied:** Non-substantive (Clarification) Update SMART Launch dependency to version 2.2.0 [FHIR-50787](https://jira.hl7.org/browse/FHIR-50787) See Changes [Here](https://hl7.org/fhir/us/core/STU8/scopes.html)
100. **Applied:** Non-substantive (Correction) Expand US Core Laboratory Test Codes value set [FHIR-49642](https://jira.hl7.org/browse/FHIR-49642) See Changes [Here](https://hl7.org/fhir/us/core/STU8/ValueSet-us-core-laboratory-test-codes.html)
101. **Applied:** Non-substantive (Enhancement) Add links in history page to approved patches [FHIR-49642](https://jira.hl7.org/browse/FHIR-49642) See Changes [Here](https://hl7.org/fhir/us/core/history.html)

##### Pending
The application of the following trackers are pending and will not be completed before publication

102. **Resolved - change required:** Non-substantive (Enhancement) Add codes from US Core Category to the Observation Category Codesystem [FHIR-43541](https://jira.hl7.org/browse/FHIR-43541)
103. **Resolved - change required:** Non-substantive (Correction) NAIC Code Number Identifier system not registered in THO [FHIR-46185](https://jira.hl7.org/browse/FHIR-46185)
104. **Resolved - change required:** Non-substantive (Correction) Change USEncounterDischargeDisposition from http://terminology.hl7.org/CodeSystem/nubc-UB92 to https://www.nubc.org/CodeSystem/PatDischargeStatus [FHIR-49610](https://jira.hl7.org/browse/FHIR-49610)
105. **Publishing:** Non-substantive (Enhancement) How to deal with searchparameters in the package that only convey expectations [FHIR-48876](https://jira.hl7.org/browse/FHIR-48876)

##### Publishing
The following trackers have been identified as publishing issues and we are working with HL7 publishing to resolve them.

106. **Publishing:** Non-substantive (Clarification) Confusing for commercial vendor. Reads very confusing. [FHIR-30783](https://jira.hl7.org/browse/FHIR-30783)
107. **Publishing:** Non-substantive (Correction) Override built-in examples for address elements [FHIR-43054](https://jira.hl7.org/browse/FHIR-43054)
108. **Publishing:** Non-substantive (Enhancement) Deprecate every version before 3.1.1 [FHIR-46065](https://jira.hl7.org/browse/FHIR-46065)
109. **Publishing:** Non-substantive (Correction) Fix the US Core History Page [FHIR-46749](https://jira.hl7.org/browse/FHIR-46749)
110. **Publishing:** Non-substantive (Correction) Hyperlink discrepancy [FHIR-49336](https://jira.hl7.org/browse/FHIR-49336)
111. **Publishing:** Non-substantive (Correction) Hyperlink discrepancy [FHIR-49337](https://jira.hl7.org/browse/FHIR-49337)

### Version = 8.0.0 - ballot
- url: <https://hl7.org/fhir/us/core/2025Jan/>
- Based on FHIR version : 4.0.1

#### What's new in the US Core January 2025 Ballot

{% include whats-new/v8-ballot.md %}

#### Changes:

- Implementers submitted over 60 trackers since the publication of US Core ver 8.0.0. We have addressed them and applied over 50 changes listed below:

**Tracker Status**: **Change Impact** **(Change Category)** **Change Summary** **Jira Issue [Link](#)** **Updated Content [Link](#)**

##### Non-compatible
1. **Applied:** Non-compatible (Correction) Change Average Blood Pressure Profile `Observation.subject` minimum from 0 to 1 [FHIR-45724](https://jira.hl7.org/browse/FHIR-45724) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-average-blood-pressure.html)
2. **Applied:** Non-compatible (Enhancement) Align Encounter Type between C-CDA and FHIR US Core and Replace US Core Encounter Type Value Set with equivalent Value Set Authority Center (VSAC) Value Set [FHIR-46259](https://jira.hl7.org/browse/FHIR-46259) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-encounter.html)

##### Compatible, substantive
3. **Applied:** Compatible, substantive (Enhancement) Add section on client best practices for search [FHIR-45179](https://jira.hl7.org/browse/FHIR-45179) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/general-guidance.html#client-best-practices-for-search)
4. **Applied:** Compatible, substantive (Clarification) Clarify the '_revinclude` expectations for Provenance [FHIR-46077](https://jira.hl7.org/browse/FHIR-46077) See Changes Here:
    - [US Core Provenance Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-provenance.html#mandatory-search-parameters)
    - [AllergyIntolerance Provenance Example 1](https://hl7.org/fhir/us/core/2025Jan/Bundle-allergyintolerance-provenance-example1.html)
    - [AllergyIntolerance Provenance Example 2](https://hl7.org/fhir/us/core/2025Jan/Bundle-allergyintolerance-provenance-example2.html)
5. **Applied:** Compatible, substantive (Enhancement) Continue to harmonize/share value sets used in US Core and C-CDA in the US Core 8.0 ballot and C-CDA 4.0 ballot [FHIR-46181](https://jira.hl7.org/browse/FHIR-46181) (See Changes Listed in introduction above)
6. **Applied:** Compatible, substantive (Enhancement) Updates and Corrections to Medication Clinical Drug VSAC Valueset used by US Core Medication, MedicationDispense Profile, and MedicationRequest Profiles [FHIR-46255](https://jira.hl7.org/browse/FHIR-46255) See Changes [Here](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1010.4/expansion/Latest)
7. **Applied:** Compatible, substantive (Enhancement) Replace US Core Pregnancy Status Codes Value Set with equivalent [Value Set Authority Center (VSAC)] Value Set [FHIR-46257](https://jira.hl7.org/browse/FHIR-46257) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-observation-pregnancystatus.html)
8. **Applied:** Compatible, substantive (Enhancement) Allow CMS Place of Service codes for 'location.type' in US Core Location Profile [FHIR-46258](https://jira.hl7.org/browse/FHIR-46258) See Changes Here:
    - [US Core Location Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-location.html)
    - [US Core Location Type ValueSet](https://hl7.org/fhir/us/core/2025Jan/ValueSet-us-core-location-type.html)
9. **Applied:** Compatible, substantive (Enhancement) Replace US Core Pregnancy Intent Codes Value Set with equivalent [Value Set Authority Center (VSAC)] Value Set [FHIR-46263](https://jira.hl7.org/browse/FHIR-46263) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-observation-pregnancyintent.html)
10. **Applied:** Compatible, substantive (Enhancement) Add SDOH Goals value set as "Additional Binding" in Goal Profile [FHIR-46266](https://jira.hl7.org/browse/FHIR-46266) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-goal.html)
11. **Applied:** Compatible, substantive (Correction) Specify SMART App Launch Version [FHIR-46279](https://jira.hl7.org/browse/FHIR-46279) Here:
    - [Security](https://hl7.org/fhir/us/core/2025Jan/security.html)
    - [US Core Server CapabilityStatement](https://hl7.org/fhir/us/core/2025Jan/CapabilityStatement-us-core-server.html)
12. **Applied:** Compatible, substantive (Enhancement) Replace US Core Survey Codes Value Set with [Value Set Authority Center (VSAC)] Value Set and remove Laboratory LOINCs [FHIR-46347](https://jira.hl7.org/browse/FHIR-46347) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-observation-screening-assessment.html)
13. **Applied:** Compatible, substantive (Clarification) Clarify when granular scopes overlap [FHIR-46748](https://jira.hl7.org/browse/FHIR-46748) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/scopes.html)
14. **Applied:** Compatible, substantive (Enhancement) Add USCDI v5 Data Elements to US Core [FHIR-48443](https://jira.hl7.org/browse/FHIR-48443) See Changes Listed in the [8.0.0-Ballot Introduction](https://hl7.org/fhir/us/core/2025Jan/changes.html#the-january-2025-ballot) above.
15. **Applied:** Compatible, substantive (Correction) Update US Core Clinical Note Type Valueset to align with Clinical Note Guidance [FHIR-48607](https://jira.hl7.org/browse/FHIR-48607)  Here:
    - [US Core Clinical Note Type](https://hl7.org/fhir/us/core/2025Jan/ValueSet-us-core-clinical-note-type.html)
    - [Clinical Notes](https://hl7.org/fhir/us/core/2025Jan/clinical-notes.html)
16. **Applied:** Compatible, substantive (Clarification) Update Must Support page when no reference targets labeled Must Support and update must support labels for Observation.performer targets [FHIR-48442](https://jira.hl7.org/browse/FHIR-48442) See Changes Here:
    - [Must Support     - Resource References](https://hl7.org/fhir/us/core/2025Jan/must-support.html#must-support---resource-references)
    - [US Core Simple Observation Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-simple-observation.html)
    - [US Core Observation Screening Assessment Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-observation-screening-assessment.html)
17. **Applied:** Compatible, substantive (Clarification) Clarify expectations for US@ for health systems [FHIR-46020](https://jira.hl7.org/browse/FHIR-46020) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-patient.html#mandatory-and-must-support-data-elements)
18. **Pre-Applied:** Compatible, substantive (Clarification) Clarify how "Additional USCDI" is applied for complex elements [FHIR-46028](https://jira.hl7.org/browse/FHIR-46028) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/must-support.html)
19. **Applied:** Compatible, substantive (Enhancement) Create SCT Specimen Condition value set to include SNOMED CT [FHIR-47061](https://jira.hl7.org/browse/FHIR-47061) See Changes Here:
    - [US Core Specimen Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-specimen.html)
    - [US Core Specimen Condition ValueSet](https://hl7.org/fhir/us/core/2025Jan/ValueSet-us-core-specimen-condition.html)
    - [Lipemic Serum Specimen Example](https://hl7.org/fhir/us/core/2025Jan/Specimen-example-serum-lipemic.html)

##### Non-substantive
20. **Resolved - change required:** Non-substantive (Enhancement) Fix the US Core History Page [FHIR-42950](https://jira.hl7.org/browse/FHIR-42950) and [FHIR-46749](https://jira.hl7.org/browse/FHIR-46749) See Changes [Here](https://hl7.org/fhir/us/core/history.html)
21. **Applied:** Non-substantive (Enhancement) Make Must Support Reference Table more visible [FHIR-44977](https://jira.hl7.org/browse/FHIR-44977) See Changes Here:
    - [Must Support     - Resource References](https://hl7.org/fhir/us/core/2025Jan/must-support.html#must-support---resource-references)
    - [Must Support Elements](https://hl7.org/fhir/us/core/2025Jan/must-support.html#must-support-elements)
    - [FHIR RESTful Capabilities](https://hl7.org/fhir/us/core/2025Jan/CapabilityStatement-us-core-server.html#behavior)
22. **Applied:** Non-substantive (Correction) Update Condition.code ICD9 value set link and add STU Note [FHIR-45136](https://jira.hl7.org/browse/FHIR-45136) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/ValueSet-us-core-condition-code.html)
23. **Applied:** Non-substantive (Clarification) Clarify definition of Clinical Information Reconciliation and Incorporation (CIRI) [FHIR-45267](https://jira.hl7.org/browse/FHIR-45267) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/basic-provenance.html#clinical-information-reconciliation-and-incorporation)
24. **Applied:** Non-substantive (Enhancement) Remove dated footnote from Provenance page. [FHIR-45283](https://jira.hl7.org/browse/FHIR-45283)
25. **Applied** Non-substantive (Enhancement) Add SNOMED NUCC Mapping link to US Core PractitionerRole Profile guidance[FHIR-45286](https://jira.hl7.org/browse/FHIR-45286) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-practitionerrole.html)
26. {:#fhir-45319}**Applied:** Non-substantive (Clarification) Clarify Observation Screening Assessment category Must Support requirements [FHIR-45319](https://jira.hl7.org/browse/FHIR-45319) and [FHIR-46052](https://jira.hl7.org/browse/FHIR-46052) See Changes Here:
    - [Screening and Assessments](https://hl7.org/fhir/us/core/2025Jan/screening-and-assessments.html#terminology)
    - [US Core Observation Screening Assessment Profile ](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-observation-screening-assessment.html)
    - [US Core Screening Assessment Observation Maximum Category](https://hl7.org/fhir/us/core/2025Jan/ValueSet-us-core-screening-assessment-observation-maximum-category.html)
    - [US Core Simple Observation Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-simple-observation.html)
    - [US Core Condition Problems and Health Concerns Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-condition-problems-health-concerns.html)
    - [US Core Screening Assessment Condition Category](https://hl7.org/fhir/us/core/2025Jan/ValueSet-us-core-screening-assessment-condition-category.html)
27. **Applied:** Non-substantive (Clarification) Clarify Must Support requirements for requestors [FHIR-45448](https://jira.hl7.org/browse/FHIR-45448) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/must-support.html#must-support-elements)
28. **Applied:** Non-substantive (Correction) Move "time-period" from Must Support to Must Have section in introduction. [FHIR-45726](https://jira.hl7.org/browse/FHIR-45726) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-average-blood-pressure.html)
29. **Applied:** Non-substantive (Clarification) Align the Sig description in the medication profile introductions. [FHIR-45951](https://jira.hl7.org/browse/FHIR-45951) See Changes Here:
    - [US Core MedicationDispense Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-medicationdispense.html)
    - [US Core MedicationRequest Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-medicationrequest.html)
30. **Applied:** Non-substantive (Clarification) Clarify Role and use of US Core SearchParameters vs FHIR standard SearchParameters [FHIR-46036](https://jira.hl7.org/browse/FHIR-46036) See Changes Here:
    - [US Core Search Parameters](https://hl7.org/fhir/us/core/2025Jan/search-parameters-and-operations.html#search-parameters)
    - [SearchParameter: USCoreAllergyintoleranceClinicalStatus](https://hl7.org/fhir/us/core/2025Jan/SearchParameter-us-core-allergyintolerance-clinical-status.html)
    - [US Core Server CapabilityStatement     - FHIR RESTful Capabilities](https://hl7.org/fhir/us/core/2025Jan/CapabilityStatement-us-core-server.html#behavior)
31. **Applied:** Non-substantive (Correction) Procedure.code should be Procedure.performed [FHIR-46037](https://jira.hl7.org/browse/FHIR-46037) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-procedure.html)
32. **Applied:** Non-substantive (Correction) Correct Examples [FHIR-46099](https://jira.hl7.org/browse/FHIR-46099) See Changes Here:
    - [10 Minute Apgar Score Panel Example](https://hl7.org/fhir/us/core/2025Jan/Observation-10-minute-apgar-score-panel.html)
    - [Hvs Item Example 88122-7](https://hl7.org/fhir/us/core/2025Jan/Observation-HVS-item-example-88122-7.html)
    - [Hvs Item Example 88123-5](https://hl7.org/fhir/us/core/2025Jan/Observation-HVS-item-example-88123-5.html)
    - [HVSPanel Example 88121-9](https://hl7.org/fhir/us/core/2025Jan/Observation-HVS-panel-example-88121-9.html)
33. **Applied:** Non-substantive (Clarification) Remove the Must Support on DiagnosticReport (Report and Notes) `media.link` [FHIR-46240](https://jira.hl7.org/browse/FHIR-46240) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-diagnosticreport-note.html)
34. **Applied:** Non-substantive (Clarification) Clarify the level of granular scopes server shall support [FHIR-46277](https://jira.hl7.org/browse/FHIR-46277) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/scopes.html#additional-us-core-requirements)
35. **Applied:** Non-substantive (Enhancement) Reference specific version of USCDI for each version of USCore [FHIR-46466](https://jira.hl7.org/browse/FHIR-46466)  See Changes Here:
    - [USCDI](https://hl7.org/fhir/us/core/2025Jan/uscdi.html)
    - [Publication (Version) History](https://hl7.org/fhir/us/core/history.html)
    - [Change Log](https://hl7.org/fhir/us/core/2025Jan/changes.html)
    - [Future of US Core](https://hl7.org/fhir/us/core/2025Jan/future-of-US-core.html)
36. **Applied:** Non-substantive (Correction) Change page status from "Informative" to "Trial-use" where appropriate [FHIR-46514](https://jira.hl7.org/browse/FHIR-46514) (See the tracker comments for a list of changes)
37. **Applied:** Non-substantive (Clarification) Clarify conformance requirements for structured assessments [FHIR-47139](https://jira.hl7.org/browse/FHIR-47139) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/screening-and-assessments.html#structured-screening-and-assessments)
38. **Applied:** Non-substantive (Enhancement) Replace US Core Discharge Disposition Value Set with equivalent [HL7 Terminology (THO)] Value Set [FHIR-47416](https://jira.hl7.org/browse/FHIR-47416) and [FHIR-46194](https://jira.hl7.org/browse/FHIR-46194)
    - [US Core Encounter Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-encounter.html)
    - [Encounter 1036 Example](https://hl7.org/fhir/us/core/2025Jan/Encounter-1036.html)
39. **Applied:** Non-substantive (Enhancement) Tighten constraint on name.use to support better patient matching [FHIR-48416](https://jira.hl7.org/browse/FHIR-48416) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-patient.html)
40. **Applied:** Non-substantive (Correction)Change "status" to "active flag" in US Core RelatedPerson introduction[FHIR-48439](https://jira.hl7.org/browse/FHIR-48439) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-relatedperson.html)
41. **Applied:** Non-substantive (Clarification) Remove resolves declaration from US Core CapabilityStatements [FHIR-48446](https://jira.hl7.org/browse/FHIR-48446)  See Changes Here:
    - [US Core Server CapabilityStatement     - FHIR RESTful Capabilities](https://hl7.org/fhir/us/core/2025Jan/CapabilityStatement-us-core-client.html)
    - [US Core Client CapabilityStatement     - FHIR RESTful Capabilities](https://hl7.org/fhir/us/core/2025Jan/CapabilityStatement-us-core-server.html)
html#additional-uscdi-requirements)
42. **Applied:** Non-substantive (Enhancement) Update Guidance on Sex and Gender in USCore [FHIR-44115](https://jira.hl7.org/browse/FHIR-44115) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-patient.html#mandatory-and-must-support-data-elements)
43. **Applied:** Non-substantive (Correction) Spelling errors in US Core Server Capability Statement [FHIR-45451](https://jira.hl7.org/browse/FHIR-45451)See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/CapabilityStatement-us-core-server.html)
44. **Applied:** Non-substantive (Correction) Fix broken PHINVADS links [FHIR-45494](https://jira.hl7.org/browse/FHIR-45494) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/terminology.html)
45. **Applied:** Non-substantive (Correction) Typo in Condition's granular scope [FHIR-45961](https://jira.hl7.org/browse/FHIR-45961) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-condition-encounter-diagnosis.html#us-core-scopes)
46. **Applied:** Non-substantive (Clarification) Remove `.meta.lastUpdated` STU comments [FHIR-48542](https://jira.hl7.org/browse/FHIR-48542)
47. **Applied:** Non-substantive (Correction) Update link to UDI Specification [FHIR-48688](https://jira.hl7.org/browse/FHIR-48688) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-implantable-device.html)
48. **Applied:** Non-substantive (Correction) add MS=False flag to QuestionnaireResponse.authored target [FHIR-48847](https://jira.hl7.org/browse/FHIR-48847) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-questionnaireresponse.profile.json.html)
49. **Applied:** Non-substantive (Correction) add MS=False flags to Procedure.basedOn targets [FHIR-48848](https://jira.hl7.org/browse/FHIR-48848) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-procedure.profile.json.html)
50. **Applied ** Non-substantive (Correction) US Core Survey Codes expansion error [FHIR-46272](https://jira.hl7.org/browse/FHIR-46272) See Changes [Here](https://hl7.org/fhir/us/core/STU7/ValueSet-us-core-survey-codes.html)

##### Pending
The application of the following trackers are pending and will not be completed by the ballot date.


1.  **Resolved - change required:** Compatible, substantive (Enhancement) Create a tracker to THO to add codes from US Core Category to the Observation Category Codesystem [FHIR-43541](https://jira.hl7.org/browse/FHIR-43541)
51. **Triaged:** Non-substantive (Correction) US Core Coverage Profile [FHIR-44122](https://jira.hl7.org/browse/FHIR-44122)
52. **Triaged:** Non-substantive (Correction) US Core Coverage.Type Code Link Update [FHIR-44124](https://jira.hl7.org/browse/FHIR-44124)
53. **Resolved - change required:** Non-substantive (Correction) US Core Terminology Reference List # 62 [FHIR-44138](https://jira.hl7.org/browse/FHIR-44138)
54. **Resolved - change required:** Non-substantive (Correction) NAIC Code Number Identifier system not registered in THO [FHIR-46185](https://jira.hl7.org/browse/FHIR-46185)

The following trackers have been identified as publishing issues and we are working with HL7 publishing to resolve them.
##### Publishing

1.  **Publishing:** Non-substantive (Clarification) Confusing for commercial vendor. Reads very confusing. [FHIR-30783](https://jira.hl7.org/browse/FHIR-30783)
2.  **Publishing:** Non-substantive (Correction) AllergyIntolerance does not show constraint [FHIR-34636](https://jira.hl7.org/browse/FHIR-34636)
3.  **Publishing:** Non-substantive (Correction) Override built-in examples for address elements [FHIR-43054](https://jira.hl7.org/browse/FHIR-43054)
4.  **Publishing:** Non-substantive (Correction) US Core detailed ethnicity expansion error [FHIR-46638](https://jira.hl7.org/browse/FHIR-46638) See STU Notes:
    - [Detailed ethnicity](https://hl7.org/fhir/us/core/2025Jan/ValueSet-detailed-ethnicity.html)
    - [Detailed race](https://hl7.org/fhir/us/core/2025Jan/ValueSet-detailed-race.html)
5.  **Publishing:** Non-substantive (Enhancement) Deprecate every version before 3.1.1 [FHIR-46065](https://jira.hl7.org/browse/FHIR-46065) See Changes Here:
    - [Change Log](https://hl7.org/fhir/us/core/2025Jan/changes.html)
    - [History Page](https://hl7.org/fhir/us/core/history.html)

### Version = 7.0.0 (Meets USCDI v4 Requirements)
- url: <https://hl7.org/fhir/us/core/STU7/>
- Based on FHIR version: 4.0.1

The changes in this annual update to US Core have been reviewed and commented upon by the public through the January 2024 HL7 balloting process. The HL7 International Cross-Group Projects work group members have agreed to and voted on the resolution of the community comments.
#### What's new in Version 7.0.0 of US Core:

Each update to a new version of US Core changes the US Core Profiles and conformance expectations. Implementers can find detailed comparisons between the FHIR artifacts in this 7.0.0 version of US Core and each previous major release on [Changes Between Versions] page. Below is an overview of significant changes between Version 7.0.0 and Version 7.0.0-ballot of US Core.

- [SMART on FHIR Obligations and Capabilities](https://hl7.org/fhir/us/core/STU7/scopes.html): We rewrote the SMART scopes guidance page to clarify the granular scope requirement in [HTI-1 final rule](https://www.federalregister.gov/documents/2023/04/18/2023-07229/health-data-technology-and-interoperability-certification-program-updates-algorithm-transparency-and), and expanded the guidance to include SMART on FHIR capabilities, token introspection, and `/.well-known/smart-configuration`.
- {: #last-updated }`meta.lastUpdated` and `_lastUpdated`: We added the `meta.lastUpdated` element as Must Support and recommend using the `_lastUpdated` search parameter for the US Core Profiles listed below. The General Guidance page documents how to use them to represent and search for resources whose content has changed. We also updated the guidance on the deletion of records.
  - [US Core Laboratory Result Observation Profile](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-observation-lab.html)
  - [US Core DiagnosticReport Profile for Laboratory Results Reporting](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-diagnosticreport-lab.html)
  - [US Core Condition Problems and Health Concerns Profile](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-condition-problems-health-concerns.html)
  - [US Core Encounter Profile](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-encounter.html)
  - [Searching Using lastUpdated](https://hl7.org/fhir/us/core/STU7/general-guidance.html#searching-using-lastupdated)
  - [Representing Deleted Information](https://hl7.org/fhir/us/core/STU7/general-guidance.html#representing-deleted-information)
- [US Core Medication Adherence Extension](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-medication-adherence.html): In the previous ballot version, we added support for Medication Adherence as an *Additional USCDI Requirement* using the new US Core Medication Adherence Extension. In this version, we simplified the adherence codes and changed the information source from a FHIR Reference to actor codes.
- [US Core Average Blood Pressure Profile](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-average-blood-pressure.html): In the previous ballot version, we added the US Core Average Blood Pressure Profile to support the USCDI Average Blood Pressure data element. It was rewritten, and the guidance was updated in this version. Notably, it is based upon the FHIR Observation and not the US Core Vital Signs Profile.
- [US Core Smoking Status Observation Profile](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-smokingstatus.html). This Profile and its terminology were updated to accommodate more smoking-related observations.
- We continue our efforts to link terminology directly to the FHIR® Terminology Service for VSAC Resources (Value Set Authority Center (VSAC)) where applicable and, as a result, align terminology between US Core and [HL7 C-CDA]. In this version, the following value sets have been added or moved to VSAC:

   |Pre 7.0.0  US Core ValueSet|7.0.0 VSAC ValueSet|
   |---|---|
   [US Core Smoking Status Observation Codes](https://hl7.org/fhir/us/core/STU6.1/ValueSet-us-core-smoking-status-observation-codes.html)|[Smoking status type](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1267.6/expansion)
   [Smoking Status](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113883.11.20.9.38/expansion)|[Smoking status comprehensive](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1267.3/expansion)
   [UsCoreVitalSigns](https://hl7.org/fhir/us/core/STU6.1/ValueSet-us-core-vital-signs.html)|[VitalSignResultType](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113883.3.88.12.80.62/expansion)
   [BirthSex](https://hl7.org/fhir/us/core/STU6.1/ValueSet-birthsex.html)|[Birth Sex](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1021.24/expansion)
   {: #vsac-7-0-0 .grid}

#### Changes:

The ballot-related comments resulted in over 80 changes to this specification, which are listed below:

**Tracker Status**: **Change Impact** **(Change Category)** **Change Summary** **Jira Issue [Link](#)** **Updated Content [Link](#)**

##### Non-compatible
1. **Applied:** Non-compatible (Clarification) Derive Average Blood Pressure directly from Observation [FHIR-43538](https://jira.hl7.org/browse/FHIR-43538) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-average-blood-pressure.html) and [Here](https://hl7.org/fhir/us/core/STU7/Observation-average-blood-pressure.html)

##### Compatible, substantive
2. **Applied:** Compatible, substantive (Enhancement) Updated Gender Identity binding to align with C-CDA [FHIR-43052](https://jira.hl7.org/browse/FHIR-43052) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-genderIdentity.html)
3. **Applied:** Compatible, substantive (Clarification) Clarify that only `Patient.deceasedDateTime` is "Additional USCDI Requirement" [FHIR-43431](https://jira.hl7.org/browse/FHIR-43431) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-patient.html)
4. **Applied:** Compatible, substantive (Enhancement) Change Medication Adherence Information Source from Reference to Code [FHIR-43466](https://jira.hl7.org/browse/FHIR-43466) and See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-medication-adherence.html) and [Here](https://hl7.org/fhir/us/core/STU7/MedicationRequest-medicationrequest-coded-oral-axid.html)
5. **Applied:** Compatible, substantive (Enhancement) References specific extension for measurement protocol [FHIR-43536](https://jira.hl7.org/browse/FHIR-43536) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-average-blood-pressure.html) and [Here](https://hl7.org/fhir/us/core/STU7/Observation-average-blood-pressure.html)
6. **Applied:** Compatible, substantive (Clarification) Constrain Average Blood Pressure Profile Observation.value to max = 0 [FHIR-43539](https://jira.hl7.org/browse/FHIR-43539) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-average-blood-pressure.html)
7. **Applied:** Compatible, substantive (Enhancement) Add guidance how to express conditional Goals [FHIR-43552](https://jira.hl7.org/browse/FHIR-43552) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-care-experience-preference.html) and [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-treatment-intervention-preference.html)
8. **Applied:** Compatible, substantive (Enhancement) Add choice of must support for Specimen.accessionIdentifier vs Specimen.identifier [FHIR-43585](https://jira.hl7.org/browse/FHIR-43585) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-specimen.html)
9. **Applied:** Compatible, substantive (Enhancement) Update the terminology bindings and allow effectivePeriod for Smoking Status [FHIR-43589](https://jira.hl7.org/browse/FHIR-43589) and [FHIR-43355](https://jira.hl7.org/browse/FHIR-43355) See Changes Here:
    - [US Core Smoking Status Observation Profile](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-smokingstatus.html)
    - [Smoking Status Type ValueSet](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1267.6/expansion)
    - [Smoking Status Comprehensive](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1267.3/expansion)
    - [Some Day Smoker Example](https://hl7.org/fhir/us/core/STU7/Observation-some-day-smoker.html)
    - [Cigarette Pack-Years Example](https://hl7.org/fhir/us/core/STU7/Observation-pack-years-example.html)
10. **Applied:** Compatible, substantive (Enhancement) Move US Core Vital Signs ValueSet to VSAC [FHIR-43633](https://jira.hl7.org/browse/FHIR-43633) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-vital-signs.html) and [Here](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113883.3.88.12.80.62/expansion)
11. **Resolved - change required:** Compatible, substantive (Enhancement) Add _lastUpdated search parameter guidance [FHIR-43659](https://jira.hl7.org/browse/FHIR-43659) The changes are listed [above](#last-updated)
12. **Applied:** Compatible, substantive (Enhancement) Edit Medication Adherence codes and provide examples [FHIR-43757](https://jira.hl7.org/browse/FHIR-43757) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-medication-adherence.html)
13. **Applied** Compatible, substantive (Enhancement) Update and clarify US Core Scopes requirements [FHIR-43761](https://jira.hl7.org/browse/FHIR-43761) See Changes [Here](https://hl7.org/fhir/us/core/STU7/scopes.html) and [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-allergyintolerance.html#us-core-scopes)
14. **Applied:** Compatible, substantive (Clarification) Restore the FHIR Core resource definitions and comments [FHIR-43800](https://jira.hl7.org/browse/FHIR-43800) For example See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-allergyintolerance.html)
15. **Applied** Compatible, substantive (Enhancement) Clarify the use of USCDI Health Assessment Value Sets [FHIR-43922](https://jira.hl7.org/browse/FHIR-43922) See Changes [Here](https://hl7.org/fhir/us/core/STU7/screening-and-assessments.html#terminology)
16. **Applied** Compatible, substantive (Clarification)Clarify reason for referral options [FHIR-43929](https://jira.hl7.org/browse/FHIR-43929) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-procedure.html)
17. **Applied:** Compatible, substantive (Correction) Change Quantity to SimpleQuantity MedicationRequest and MedicationDispense profiles [FHIR-43932](https://jira.hl7.org/browse/FHIR-43932) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-medicationdispense.html) and [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-medicationrequest.html)
18. **Applied:** Compatible, substantive (Correction) Move elements from "must have" to "must support" in Immunization profile introduction [FHIR-43934](https://jira.hl7.org/browse/FHIR-43934) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-immunization.html)
19. **Applied:** Compatible, substantive (Clarification) Race extension cardinality / documentation does not match value set [FHIR-43937](https://jira.hl7.org/browse/FHIR-43937) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-race.html)
20. **Applied:** Compatible, substantive (Enhancement) Add guidance/constraints for use of UCUM for reference range in Laboratory Result Observation Profile [FHIR-44023](https://jira.hl7.org/browse/FHIR-44023) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-observation-lab.html) and [Here](https://hl7.org/fhir/us/core/STU7/general-guidance.html#using-ucum-codes-in-the-quantity-datatype)
21. **Applied:** Compatible, substantive (Clarification) Clarify encounter in DiagnosticReport [FHIR-44056](https://jira.hl7.org/browse/FHIR-44056) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-diagnosticreport-note.html))
22. **Applied:** Compatible, substantive (Correction) Clarify Medication Adherence Extension definitions [FHIR-44076](https://jira.hl7.org/browse/FHIR-44076) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-medication-adherence.html)
23. **Applied:** Compatible, substantive (Enhancement) Remove ASKU from value sets and use DAR concept instead [FHIR-44127](https://jira.hl7.org/browse/FHIR-44127) and [FHIR-41571](https://jira.hl7.org/browse/FHIR-41571) See Changes:
    - [US Core Gender Identity Extension](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-genderIdentity.html)
    - [US Core Birth Sex Extension](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-birthsex.html)
    - [US Core Observation Sexual Orientation Profile](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-observation-sexual-orientation.html)
24. **Applied:** Compatible, substantive (Enhancement) Add non-binary to gender identity value set [FHIR-44132](https://jira.hl7.org/browse/FHIR-44132) See Changes [Here](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1021.32/expansion)
25. **Applied:** Compatible, substantive (Enhancement) Continue US Core and C-CDA value set alignment initiatives [FHIR-44522](https://jira.hl7.org/browse/FHIR-44522) The Value sets are listed [above](#vsac-7-0-0)
26. **Applied:** Compatible, substantive (Clarification) Update Treatment Intervention Observation.code to LOINC [FHIR-44019](https://jira.hl7.org/browse/FHIR-44019) and [FHIR-44539](https://jira.hl7.org/browse/FHIR-44539) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-treatment-intervention-preference.html)
27. **Applied:** Compatible, substantive (Correction) Add Social Determinants of Health Screening Assessments And Questions to Screening and Assessments Page [FHIR-44545](https://jira.hl7.org/browse/FHIR-44545) See Changes [Here](https://hl7.org/fhir/us/core/STU7/screening-and-assessments.html#codes-for-problemshealthconcerns-goals-service-requests-and-procedures)
28. **Applied:** Compatible, substantive (Clarification) Clarify Must Support requirements for Practitioner.address [FHIR-44693](https://jira.hl7.org/browse/FHIR-44693) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-practitioner.html) and [Here](https://hl7.org/fhir/us/core/STU7/future-of-US-core.html)
29. **Applied:** Compatible, substantive (Enhancement) Sex Extension's value set is too restrictive [FHIR-44710](https://jira.hl7.org/browse/FHIR-44710) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-sex.html)
30. **Applied:** Compatible, substantive (Enhancement) Update Condition.code and Procedure.code from extensible to current [FHIR-44715](https://jira.hl7.org/browse/FHIR-44715) See Changes Here:
    - [US Core Condition Encounter Diagnosis Profile](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-condition-encounter-diagnosis.html)
    - [US Core Condition Problems and Health Concerns Profile](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-condition-problems-health-concerns.html)
    - [US Core Procedure Profile](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-procedure.html)
    - [General Requirements](https://hl7.org/fhir/us/core/STU7/general-requirements.html#extensible-binding-for-coded-elements)
31. **Applied:** Compatible, substantive (Enhancement) Relax Sex binding to "extensible" [FHIR-44764](https://jira.hl7.org/browse/FHIR-44764) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-sex.html)
32. **Applied:** Compatible, substantive (Enhancement) Add Guidance on meeting the definition of 'X' [FHIR-45177](https://jira.hl7.org/browse/FHIR-45177) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-sex.html)
33. **Applied:** Compatible, substantive (Clarification) Clarify 𝗔𝗗𝗗𝗜𝗧𝗜𝗢𝗡𝗔𝗟 𝗨𝗦𝗖𝗗𝗜 requirements for Reference datatype [FHIR-45204](https://jira.hl7.org/browse/FHIR-45204) See Changes Here:
    - [US Core Procedure Profile](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-procedure.html#mandatory-and-must-support-data-elements)
    - [US Core ServiceRequest Profile](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-servicerequest.html#mandatory-and-must-support-data-elements)
    - [US Core MedicationRequest Profile](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-medicationrequest.html#mandatory-and-must-support-data-elements)

##### Non-substantive
34. **Applied:** Non-substantive (Clarification) Rename fhir-write to vitals-write [FHIR-43400](https://jira.hl7.org/browse/FHIR-43400) See Changes [Here](https://hl7.org/fhir/us/core/STU7/vitals-write.html)
35. **Applied:** Non-substantive (Clarification) Clarify that the Average Blood Pressure profile is protocol agnostic. [FHIR-43402](https://jira.hl7.org/browse/FHIR-43402) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-average-blood-pressure.html)
36. **Applied:** Non-substantive (Clarification) Add example to Must Support     - Complex Elements section [FHIR-43430](https://jira.hl7.org/browse/FHIR-43430) See Changes [Here](https://hl7.org/fhir/us/core/STU7/must-support.html#must-support---complex-elements)
37. **Applied:** Non-substantive (Correction) Fix table rendering to remove duplicates [FHIR-43432](https://jira.hl7.org/browse/FHIR-43432) See Changes [Here](https://hl7.org/fhir/us/core/STU7/screening-and-assessments.html#uscdi-health-assessments-data-element-category)
38. **Applied:** Non-substantive (Clarification) Clarify reference to average BP panel [FHIR-43537](https://jira.hl7.org/browse/FHIR-43537) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-average-blood-pressure.html)
39. **Applied:** Non-substantive (Clarification) Broaden Profile Purpose Statement [FHIR-43540](https://jira.hl7.org/browse/FHIR-43540) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-care-experience-preference.html)
40. **Applied:** Non-substantive (Enhancement) Add reference in the profile description to the base resource for scope and usage definitions. [FHIR-43543](https://jira.hl7.org/browse/FHIR-43543) For example [See Change Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-goal.html)
41. **Applied:** Non-substantive (Clarification) Remove note to balloters regarding the terminology [FHIR-43547](https://jira.hl7.org/browse/FHIR-43547) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-care-experience-preference.html) and [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-treatment-intervention-preference.html)
42. **Applied:** Non-substantive (Clarification) Clarify Specimen Condition definition [FHIR-43567](https://jira.hl7.org/browse/FHIR-43567) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-specimen.html)
43. **Applied:** Non-substantive (Clarification) Updates to Care Experience Preference Profile and Treatment Intervention Preference Profiles introduction [FHIR-43568](https://jira.hl7.org/browse/FHIR-43568) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-care-experience-preference.html) and [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-treatment-intervention-preference.html)
44. **Applied** Non-substantive (Clarification) Clarify location extension to use when not in Encounter [FHIR-43587](https://jira.hl7.org/browse/FHIR-43587) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-encounter.html)
45. **Applied:** Non-substantive (Clarification) Reason for Referral Clarification/Correction [FHIR-43588](https://jira.hl7.org/browse/FHIR-43588) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-procedure.html) and [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-servicerequest.html)
46. **Applied:** Non-substantive (Clarification) Clarify that not all US Core extensions are used in US Core Profiles [FHIR-43590](https://jira.hl7.org/browse/FHIR-43590) See Changes [Here](https://hl7.org/fhir/us/core/STU7/profiles-and-extensions.html#extensions)
47. **Applied:** Non-substantive (Correction) Fixed scopes formats [FHIR-43616](https://jira.hl7.org/browse/FHIR-43616) See Changes [Here](https://hl7.org/fhir/us/core/STU7/scopes.html)
48. **Applied:** Non-substantive (Clarification) Document that multiple races and ethnicities are supported in the extension [FHIR-43624](https://jira.hl7.org/browse/FHIR-43624) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-patient.html)
49. **Applied:** Non-substantive (Clarification) Added guidance for using NDC codes[FHIR-43641](https://jira.hl7.org/browse/FHIR-43641) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-medicationdispense.html#mandatory-and-must-support-data-elements)
50. **Applied:** Non-substantive (Correction) Fix Rendering in granular scope tables [FHIR-43770](https://jira.hl7.org/browse/FHIR-43770) See Changes [Here](https://hl7.org/fhir/us/core/STU7/scopes.html#us-core-scopes)
51. **Applied:** Non-substantive (Correction) Fix format error [FHIR-43773](https://jira.hl7.org/browse/FHIR-43773) See Changes [Here](https://hl7.org/fhir/us/core/STU7/general-requirements.html#missing-data)
52. **Applied:** Non-substantive (Clarification) Add Note to Vital Signs Profile regarding known validation errors[FHIR-43928](https://jira.hl7.org/browse/FHIR-43928) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-vital-signs.html)
53. **Applied:** Non-substantive (Correction) Update diagram in Section 3.6.4.3 [FHIR-43938](https://jira.hl7.org/browse/FHIR-43938) See Changes [Here](https://hl7.org/fhir/us/core/STU7/screening-and-assessments.html#codes-for-problemshealthconcerns-goals-service-requests-and-procedures)
54. **Applied:** Non-substantive (Correction) Undo copy/paste error to US Simple Observation Profile description [FHIR-43954](https://jira.hl7.org/browse/FHIR-43954) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-simple-observation.html)
55. **Applied:** Non-substantive (Correction) change "treatment-intervention" to "treatment-intervention-profile" [FHIR-44008](https://jira.hl7.org/browse/FHIR-44008) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-treatment-intervention-preference.html#mandatory-and-must-support-data-elements)
56. **Applied:** Non-substantive (Correction) Add hyperlink [FHIR-44009](https://jira.hl7.org/browse/FHIR-44009) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-location.html#mandatory-and-must-support-data-elements)
57. **Applied:** Non-substantive (Correction) Restore the missing graphics [FHIR-44010](https://jira.hl7.org/browse/FHIR-44010)  and [FHIR-44011](https://jira.hl7.org/browse/FHIR-44011) See Changes [Here](https://hl7.org/fhir/us/core/STU7/screening-and-assessments.html#us-core-observation-screening-assessment-profile) and [Here](https://hl7.org/fhir/us/core/STU7/screening-and-assessments.html#us-core-observation-screening-assessment-profile)
58. **Applied:** Non-substantive (Correction) Restore the missing example [FHIR-44012](https://jira.hl7.org/browse/FHIR-44012) See Changes [Here](https://hl7.org/fhir/us/core/STU7/screening-and-assessments.html#searching-for-screening-and-assessment-data)
59. **Applied:** Non-substantive (Correction) Fix table formatting on Screening & assessments page     - [FHIR-44014](https://jira.hl7.org/browse/FHIR-44014) See Changes [Here](https://hl7.org/fhir/us/core/STU7/screening-and-assessments.html#uscdi-health-assessments-data-element-category)
60. **Applied:** Non-substantive (Clarification) Add guidance for goals in Screening & Assessments page [FHIR-44015](https://jira.hl7.org/browse/FHIR-44015) See Changes [Here](https://hl7.org/fhir/us/core/STU7/screening-and-assessments.html#uscdi-health-assessments-data-element-category)
61. **Applied:** Non-substantive (Correction) Change "US Core Laboratory Result Observation Profile." to "US Core Observation Clinical Result Profile." [FHIR-44016](https://jira.hl7.org/browse/FHIR-44016) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-observation-lab.html#mandatory-and-must-support-data-elements)
62. **Applied:** Non-substantive (Correction) Where superfluous, Remove references to versions of USCDI [FHIR-44017](https://jira.hl7.org/browse/FHIR-44017) For example See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-medicationrequest.html)
63. **Applied:** Non-substantive (Correction) Remove erroneous text [FHIR-44018](https://jira.hl7.org/browse/FHIR-44018) and [FHIR-44022](https://jira.hl7.org/browse/FHIR-44022) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-care-experience-preference.html#mandatory-and-must-support-data-elements) and [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-treatment-intervention-preference.html#mandatory-and-must-support-data-elements)
64. **Applied:** Non-substantive (Correction) Correct "e.g." and "i.e." to "e.g.," "i.e.," throughout guide [FHIR-44053](https://jira.hl7.org/browse/FHIR-44053)
65. **Applied:** Non-substantive (Clarification) Updated to specific link text instead generic "Here" for bulleted list of changes [FHIR-44055](https://jira.hl7.org/browse/FHIR-44055) See Changes [Here](https://hl7.org/fhir/us/core/STU7/changes.html)
66. **Applied:** Non-substantive (Clarification) Change "may" to "can" to avoid conformance verbs [FHIR-44060](https://jira.hl7.org/browse/FHIR-44060) See Changes [Here](https://hl7.org/fhir/us/core/STU7/general-guidance.html#narrative) and [Here](https://hl7.org/fhir/us/core/STU7/screening-and-assessments.html#category-codes)
67. **Applied:** Non-substantive (Correction) Remove redundant sentence from Server CapabilityStatement description [FHIR-44112](https://jira.hl7.org/browse/FHIR-44112) See Changes [Here](https://hl7.org/fhir/us/core/STU7/capability-statements.html)
68. **Applied:** Non-substantive (Clarification) Clarify the use of UCUM for Quantity datatypes in Lab Observations [FHIR-44117](https://jira.hl7.org/browse/FHIR-44117) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-observation-lab.html) and [Here](https://hl7.org/fhir/us/core/STU7/general-guidance.html#using-ucum-codes-in-the-quantity-datatype)
69. **Applied:** Non-substantive (Correction) Remove US Core from CapabilityStatement.instantiates [FHIR-44121](https://jira.hl7.org/browse/FHIR-44121) See Changes [Here](https://hl7.org/fhir/us/core/STU7/CapabilityStatement-us-core-client.html)
70. **Applied:** Non-substantive (Clarification) Include FHIR R6 Sex and Gender content in Patient Profile Introduction [FHIR-44123](https://jira.hl7.org/browse/FHIR-44123) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-patient.html)
71. **Applied:** Non-substantive (Correction) Correct reference to USCDI Average Blood Pressure element from "data class" to "data element" in change log [FHIR-44405](https://jira.hl7.org/browse/FHIR-44405) See Changes [Here](https://hl7.org/fhir/us/core/STU7/changes.html#the-january-2024-ballot)
72. **Applied:** Non-substantive (Correction) bold text "SHALL NOT" [FHIR-44507](https://jira.hl7.org/browse/FHIR-44507) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-documentreference.html)
73. **Applied:** Non-substantive (Correction) fix codes in US Core Average Blood Pressure Profile search examples [FHIR-44623](https://jira.hl7.org/browse/FHIR-44623) For example, See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-average-blood-pressure.html#mandatory-search-parameters)
74. **Applied:** Non-substantive (Clarification) Update guidance for servers not supporting PractitionerRole [FHIR-44624](https://jira.hl7.org/browse/FHIR-44624) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-practitioner.html)
75. **Applied:** Non-substantive (Correction) change "resources" to "resources types" [FHIR-44650](https://jira.hl7.org/browse/FHIR-44650) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-provenance.html)
76. **Applied:** Non-substantive (Correction) Update average blood pressure example to be more realistic [FHIR-44668](https://jira.hl7.org/browse/FHIR-44668) See Changes [Here](https://hl7.org/fhir/us/core/STU7/Observation-average-blood-pressure.html)
77. **Applied:** Non-substantive (Clarification) Update Goal introduction to match profile [FHIR-44694](https://jira.hl7.org/browse/FHIR-44694) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-goal.html)
78. **Applied:** Non-substantive (Clarification) Update guidance on Referencing US Core Profiles [FHIR-44759](https://jira.hl7.org/browse/FHIR-44759) See Changes [Here](https://hl7.org/fhir/us/core/STU7/general-guidance.html#referencing-us-core-profiles)
79. **Applied:** Non-substantive (Enhancement) Combine the tables of Must Support references andAdditional USCDI references [FHIR-44946](https://jira.hl7.org/browse/FHIR-44946) See Changes [Here](https://hl7.org/fhir/us/core/STU7/CapabilityStatement-us-core-server.html#ms-ref-table)
80. **Applied:** Non-substantive (Correction) QA Error: specify version of http://terminology.hl7.org/CodeSystem/provenance-participant-type [FHIR-44967](https://jira.hl7.org/browse/FHIR-44967) See Changes [Here](https://hl7.org/fhir/us/core/STU7/ValueSet-us-core-provenance-participant-type.html#logical-definition-cld)
81. **Applied:** Non-substantive (Clarification) Align category term with community understanding [FHIR-45002](https://jira.hl7.org/browse/FHIR-45002) See Changes [Here](https://hl7.org/fhir/us/core/STU7/CodeSystem-condition-category.html)
82. **Applied:** Non-substantive (Correction) Update DocumentReference.content.format binding [FHIR-45302](https://jira.hl7.org/browse/FHIR-45302) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-documentreference.html#terminology-bindings-differential)
83. **Applied:** Non-substantive (Correction) Update code system URL in US Core Discharge Disposition [FHIR-45303](https://jira.hl7.org/browse/FHIR-45303) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/ValueSet-us-core-discharge-disposition.html)

##### Pending
The application of the following tracker is pending and will not be completed by the publication date.

1.  **Resolved - change required:** (Enhancement) Create a tracker to THO to add codes from US Core Category to the Observation Category Codesystem [FHIR-43541](https://jira.hl7.org/browse/FHIR-43541)

##### Publishing
The following trackers have been identified as publishing issues and we are working with HL7 publishing to resolve them.

1. **Publishing::** (Clarification) Confusing for commercial vendor.  Reads very confusing. [FHIR-30783](https://jira.hl7.org/browse/FHIR-30783)
2. **Publishing::** (Correction) AllergyIntolerance does not show constraint [FHIR-34636](https://jira.hl7.org/browse/FHIR-34636)
3. **Publishing:** (Correction) Override built-in examples for address elements [FHIR-43054](https://jira.hl7.org/browse/FHIR-43054)


### Version = 7.0.0 - ballot
- url: <https://hl7.org/fhir/us/core/2024Jan/>
- Based on FHIR version : 4.0.1

#### What's new in the US Core January 2024 Ballot

This ballot addresses the following:

- We have updated US Core to include the new [U.S. Core Data for Interoperability (USCDI) v4] Data Elements and Classes that the Office of the National Coordinator (ONC) published in July of 2023:

  - For the USCDI Allergies and Intolerances Substance (Non-Medication) data element, no change was needed for the [US Core AllergyIntolerance Profile] because the existing `code` element binding to [Common substances for allergy and intolerance documentation including refutations](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1186.8/expansion) already includes "Non-pharmacologic agent"

  - For the USCDI Encounter Identifier data element, no changes were needed because the [US Core Encounter Profile] already supports `Encounter.identifier` as a *Must Support* element.

  - For the USCDI Facility Information data class and elements, the [US Core Location Profile] already supports Facility Name and has been updated to support Facility Identifier and Type.  The [US Core Immunization Profile] has been updated to reference the US Core Location resource directly as a *Must Support* element, and the following US Core Profiles have been updated to *indirectly* reference the location/facility via [US Core Encounter Profile] as a *Must Support* element:
    - [US Core DiagnosticReport Profile for Laboratory Results Reporting](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-diagnosticreport-lab.html)
    - [US Core Immunization Profile](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-immunization.html)
    - [US Core MedicationDispense Profile](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-medicationdispense.html)
    - [US Core Observation Clinical Result Profile](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-observation-clinical-result.html)
    - [US Core Procedure Profile](https://hl7.org/fhir/us/core/2024Jan/profiles-and-extensions.html#procedure)
    - [US Core ServiceRequest Profile](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-servicerequest.html)

  - For the USCDI Time of Procedure data element, no changes were needed because:
    - the [US Core Procedure Profile](https://hl7.org/fhir/us/core/2024Jan/profiles-and-extensions.html#procedure) already supports `Procedure.performed[x]` as a *Must Support* element.
    - the [US Core DiagnosticReport Profile for Report and Note Exchange](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-diagnosticreport-note.html) already supports `DiagnosticReport.performed[x]` as a *Must Support* element.
    - the [US Core Immunization Profile](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-immunization.html) already supports `Immunization.occurrence[x]` as a *Must Support* element.

  - For the USCDI Average Blood Pressure data element, the new [US Core Average Blood Pressure Profile](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-average-blood-pressure.html) has been added to US Core. It is based on the [US Core Blood Pressure Profile](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-blood-pressure.html) and uses the [Vital Signs with Qualifying Elements: Average Blood Pressure Profile] as a blueprint.

  - For the USCDI Medications data class and elements, the [US Core MedicationRequest Profile](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-medicationrequest.html) already supports Medication Instructions and has been updated to support Medication Adherence as an *Additional USCDI Requirement* using the new [US Core Medication Adherence Extension].

  - For the USCDI Laboratory data class and elements, the [US Core Laboratory Result Observation Profile](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-observation-lab.html) already supports Result Unit of Measure data element for using UCUM for coded quantity units and has been updated to support Result Reference Range and Result Interpretation as *Must Support* elements. The [US Core Specimen Profile](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-specimen.html) has been updated to support Specimen Identifier as a *Must Support* element, and Specimen Source Site and Specimen Condition Acceptability as *Additional USCDI Requirements*.

  - For the USCDI Goals and Preferences data class Treatment Intervention Preference and Care Experience Preference data elements, [US Core Treatment Intervention Preference Profile](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-treatment-intervention-preference.html) and [US Core Care Experience Preference Profile](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-care-experience-preference.html) have been added to US Core and use the PACIO Advance Directive Interoperability Implementation Guide's Care Experience Preference Profile and Personal Intervention Preference Profile as blueprints.

  - For the USCDI Health Status Assessments data class, including the data elements Physical Activity, Substance Use, and Alcohol Use, US Core's [Screening and Assessments](https://hl7.org/fhir/us/core/2024Jan/screening-and-assessments.html) Guidance is used.  To enhance interoperability, an extensible "starter set" of concepts constrains each Screening and Assessments domain.  These value sets are summarized [here](https://hl7.org/fhir/us/core/2024Jan/screening-and-assessments.html#terminology).

- Clarify USCDI Requirements: We updated our documentation and approach on the relationship between USCDI and US Core how we identify [Must Support vs Additional USCDI Requirements](https://hl7.org/fhir/us/core/2024Jan/must-support.html#additional-uscdi-requirements). See examples of this and association documentation:
   - [US Core Patient Profile](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-patient.html#profile)
   - [US Core Conformance Artifacts](https://hl7.org/fhir/us/core/2024Jan/general-requirements.html#us-core-conformance-artifacts)
   - [Additional USCDI Requirements](https://hl7.org/fhir/us/core/2024Jan/must-support.html#additional-uscdi-requirements)
   - [USCDI](https://hl7.org/fhir/us/core/2024Jan/uscdi.html)
   - [Summary of Additional USCDI Requirement References](https://hl7.org/fhir/us/core/2024Jan/CapabilityStatement-us-core-server.html#summary-of-additional-uscdi-requirement-references)


- We continue our efforts to link terminology directly to the FHIR® Terminology Service for VSAC Resources ([Value Set Authority Center (VSAC)] where applicable and, as a result, align terminology between US Core and [HL7 C-CDA]. The following value sets have been moved:

   |Pre 7.0.0-Ballot US Core ValueSet|7.0.0-Ballot VSAC ValueSet|
   |---|---|
   [US Core Sexual Orientation](https://hl7.org/fhir/us/core/STU6.1/ValueSet-us-core-sexual-orientation.html)|[Sexual Orientation](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1240.11/expansion)
   {:.grid}

- Added Procedure.reasonCode and Procedure.reasonReference as *Additional USCDI Requirements* to meet the USCDI Data Element,Reason for Referral when a ServiceRequest is not used to request a procedure. See these changes:
   - [US Core Procedure](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-procedure.html)
   - [US Core ServiceRequest](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-servicerequest.html)
   - [Procedure Example](https://hl7.org/fhir/us/core/2024Jan/Procedure-defib-implant.html)
   - [USCDI](https://hl7.org/fhir/us/core/2024Jan/uscdi.html)

- Scopes: To meet the ONC’s granular scope requirement in [HTI-1 proposed rule](https://www.federalregister.gov/d/2023-07229/p-991+), we added required support for granular scopes as defined in Version 2.0.0 of [SMART App Launch] and moved the SMART scopes guidance from Future of US Core to a [Conformance Page](https://hl7.org/fhir/us/core/2024Jan/scopes.html) and updated requirements for each profile.

- FHIR Write: Add Argonaut Write Guidance for Vital Sign Observations to Record or Update Data section on the Future of US Core Page. See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/future-of-US-core.html#record-or-update-data) and [Here](https://hl7.org/fhir/us/core/2024Jan/fhir-write.html)

- Based on the feedback from the US Core variance request process, we updated several profiles to permit implementers can references to other `subject` entities as defined in the base standard.  This is in addition to the Must Support reference to US Core Patient. We are interested in comments on what the impact on client applications will be. For an example of this change [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-observation-clinical-result.html#profile))

- Implementers submitted over 60 trackers since the publication of US Core ver 6.0.0 and 6.1.0 We have addressed them and applied over 50 changes listed below:

**Tracker Status**: **Change Impact** **(Change Category)** **Change Summary** **Jira Issue [Link](#)** **Updated Content [Link](#)**

##### Non-compatible
1. **APPLIED:** Non-compatible (Enhancement)  Limit context for jurisdiction extension [FHIR-41867](https://jira.hl7.org/browse/FHIR-41867) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-jurisdiction.html)

##### Compatible, substantive
1. **APPLIED:** Compatible, substantive (Enhancement) Add Project US@ Requirements [FHIR-43025](https://jira.hl7.org/browse/FHIR-43025) See Changes:
    -  [US Core Patient](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-patient.html#mandatory-and-must-support-data-elements)
    -  [Patient Example](https://hl7.org/fhir/us/core/2024Jan/Patient-example.html)
    -  [US Core RelatedPerson](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-relatedperson.html#mandatory-and-must-support-data-elements)
    -  [US Core Organization](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-organization.html#mandatory-and-must-support-data-elements)
    -  [US Core Practitioner](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-practitioner.html#mandatory-and-must-support-data-elements)
    -  [US Core Location](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-location.html#mandatory-and-must-support-data-elements)
2. **APPLIED:** Compatible, substantive (Enhancement) Update profile + interaction requirements [FHIR-42789](https://jira.hl7.org/browse/FHIR-42789) and [FHIR-42847](https://jira.hl7.org/browse/FHIR-42847) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/general-requirements.html#conforming-to-us-core)
3. **APPLIED:** Compatible, substantive (Enhancement) Move the SMART scopes guidance from Future of US Core to a Conformance Page [FHIR-42864](https://jira.hl7.org/browse/FHIR-42864) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/scopes.html) and [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-allergyintolerance.html#mandatory-search-parameters)
4. **APPLIED:** Compatible, substantive (Enhancement)  Permit Subject element to references to other entities besides Patient [FHIR-42759](https://jira.hl7.org/browse/FHIR-42759) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-observation-clinical-result.html#profile)
5. **APPLIED:** Compatible, substantive (Enhancement)  Add USCDI Version 4 Data Elements to US Core [FHIR-42161](https://jira.hl7.org/browse/FHIR-42161) See the Introduction to this version above and Changes [Here](https://hl7.org/fhir/us/core/2024Jan/uscdi.html)
6. **APPLIED:** Compatible, substantive (Enhancement) Add Procedure.reasonCode and Procedure.reasonReference as Reason for Referral [FHIR-42136](https://jira.hl7.org/browse/FHIR-42136) and [FHIR-41761](https://jira.hl7.org/browse/FHIR-41761) See Changes:
    -  [US Core Procedure](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-procedure.html)
    -  [US Core ServiceRequest](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-servicerequest.html)
    -  [Procedre Example](https://hl7.org/fhir/us/core/2024Jan/Procedure-defib-implant.html)
    -  [USCDI](https://hl7.org/fhir/us/core/2024Jan/uscdi.html)
7. **APPLIED:** Compatible, substantive (Correction)  Change ASKU in value set to asked-declined [FHIR-41571](https://jira.hl7.org/browse/FHIR-41571) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-observation-sexual-orientation.html#terminology-bindings-differential) and [Here](https://hl7.org/fhir/us/core/2024Jan/Observation-sexual-orientation-example.html)
8. **APPLIED:** Compatible, substantive (Clarification)  update canonical urls in examples and capability statements to include the version [FHIR-41256](https://jira.hl7.org/browse/FHIR-41256) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/AllergyIntolerance-example.html) and [Here](https://hl7.org/fhir/us/core/2024Jan/CapabilityStatement-us-core-server.json.html)
9.  **APPLIED:** Compatible, substantive (Enhancement)  Added interpretation to laboratory result examples [FHIR-40297](https://jira.hl7.org/browse/FHIR-40297) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/Observation-cbc-mchc.html)

##### Non-substantive
1.  **APPLIED:** Non-substantive (Correction) Update CarePlan text status element's short description to reflect the status values [FHIR-43015](https://jira.hl7.org/browse/FHIR-43015) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-careplan.html#profile)
2.  **APPLIED:** Non-substantive (Correction) Update Smoking Status status element's short description to reflect the status values [FHIR-43118](https://jira.hl7.org/browse/FHIR-43118) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-smokingstatus.html#profile)
3.  **APPLIED:** Non-substantive (Correction) Correct invalid invariants us-core-3 and us-core-4 [FHIR-41523](https://jira.hl7.org/browse/FHIR-41523) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-observation-screening-assessment.html) and [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-observation-clinical-result.html) and [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-smokingstatus.html)
4.  **APPLIED:** Non-substantive (Correction) Correct invalid invariants pd-1 and us-core-13 [FHIR-41586](https://jira.hl7.org/browse/FHIR-41586) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-practitionerrole.html)
5.  **APPLIED:** Non-substantive (Correction) Correct invalid invariant us-core-1 [FHIR-41670](https://jira.hl7.org/browse/FHIR-41670) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-observation-screening-assessment.html) and [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-observation-clinical-result.html)
6.  **APPLIED:** Non-substantive (Correction) Correct invalid SearchParameter expression for USCoreConditionAssertedDate [FHIR-41673](https://jira.hl7.org/browse/FHIR-41673) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/SearchParameter-us-core-condition-asserted-date.html)
7.  **APPLIED:** Non-substantive (Correction) Fix Typo in Tribal Extension [FHIR-41739](https://jira.hl7.org/browse/FHIR-41739) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-tribal-affiliation.profile.json.html)
8.  **APPLIED:** Non-substantive (Correction) Fix Missing Data Example [FHIR-42805](https://jira.hl7.org/browse/FHIR-42805) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/general-requirements.html#missing-data)
9.  **APPLIED:** Non-substantive (Clarification)  Update introduction to USCDI table[FHIR-42801](https://jira.hl7.org/browse/FHIR-42801) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/uscdi.html)
10. **APPLIED:** Non-substantive (Correction) Fix us-core-5 invariant [FHIR-42814](https://jira.hl7.org/browse/FHIR-42814) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-immunization.html#constraints)
11. **APPLIED:** Non-substantive (Clarification)  Update guidance on referencing PractitionerRole [FHIR-42906](https://jira.hl7.org/browse/FHIR-42906) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/CapabilityStatement-us-core-server.html#practitionerrole) and [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-practitionerrole.html#mandatory-and-must-support-data-elements)
12. **APPLIED:** Non-substantive (Correction)  Fix Typo: Change ServiceRequest.reasonReference to Observation.derivedFrom [FHIR-43045](https://jira.hl7.org/browse/FHIR-43045) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-simple-observation.html#mandatory-and-must-support-data-elements)
13. **APPLIED:** Non-substantive (Enhancement)  Add link in history page to approved patches [FHIR-42950](https://jira.hl7.org/browse/FHIR-42950) See Changes [Here](https://hl7.org/fhir/us/core/history.html)
14. **APPLIED:** Non-substantive (Clarification) Provide guidance on NAHDO SOP codes for Medicare Part A,B,C,and D [FHIR-42793](https://jira.hl7.org/browse/FHIR-42793) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-coverage.html#mandatory-and-must-support-data-elements)
15. **APPLIED:** Non-substantive (Clarification) Correct description of Occupation Profile [FHIR-42867](https://jira.hl7.org/browse/FHIR-42867) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-observation-occupation.html)
16. **APPLIED:** Non-substantive (Enhancement) Add Argonaut Write Guidance for Vital Sign Observations to Record or Update Data section on the Future of US Core Page [FHIR-42863](https://jira.hl7.org/browse/FHIR-42863) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/future-of-US-core.html#record-or-update-data) and [Here](https://hl7.org/fhir/us/core/2024Jan/fhir-write.html)
17. **APPLIED:** Non-substantive (Enhancement) Migrate US Core Terminology to VSAC [FHIR-42846](https://jira.hl7.org/browse/FHIR-42846) See this version's introduction
18. **APPLIED:** Non-substantive (Clarification)  Clarify note in Search Parameters and Operations page [FHIR-42783](https://jira.hl7.org/browse/FHIR-42783) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/search-parameters-and-operations.html)
19. **APPLIED:** Non-substantive (Correction)  Fix errors in USCDI mapping table [FHIR-42862](https://jira.hl7.org/browse/FHIR-42862) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/uscdi.html)
20. **APPLIED:** Non-substantive (Clarification) Clarify Coverage status [FHIR-42777](https://jira.hl7.org/browse/FHIR-42777) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-coverage.html#mandatory-and-must-support-data-elements)
21. **APPLIED:** Non-substantive (Correction) Correct Regex for us-core-1 XPath invariant [FHIR-42738](https://jira.hl7.org/browse/FHIR-42738) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-observation-clinical-result.html#constraints))
22. **APPLIED:** Non-substantive (Enhancement)  Remove guidance to identify version of SNOMED in an instance [FHIR-42160](https://jira.hl7.org/browse/FHIR-42160) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/general-guidance.html#snomed-ct-united-states-edition)
23. **APPLIED:** Non-substantive (Correction) Typo [FHIR-42069](https://jira.hl7.org/browse/FHIR-42069) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-blood-pressure.html#mandatory-and-must-support-data-elements)
24. **APPLIED:** Non-substantive (Clarification)  Clarify when to include multiple attachments as part of a clinical note [FHIR-41902](https://jira.hl7.org/browse/FHIR-41902) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-documentreference.html)
25. **APPLIED:** Non-substantive (Enhancement)  Add VSAC Value Sets to Terminology Page [FHIR-41681](https://jira.hl7.org/browse/FHIR-41681) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/terminology.html)
26. **APPLIED:** Non-substantive (Correction)  APGAR should be Apgar [FHIR-41666](https://jira.hl7.org/browse/FHIR-41666) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/screening-and-assessments.html#structured-screening-and-assessments)
27. **APPLIED:** Non-substantive (Correction) Correct invalid invariants pd-1 and us-core-13 [FHIR-41586](https://jira.hl7.org/browse/FHIR-41586) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-practitionerrole.html#constraints)
28. **APPLIED:** Non-substantive (Clarification) Clarify Additional USCDI Requirements [FHIR-41572](https://jira.hl7.org/browse/FHIR-41572) See Changes:
    - [US Core Patient Profile](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-patient.html#profile)
    - [US Core Conformance Artifacts](https://hl7.org/fhir/us/core/2024Jan/general-requirements.html#us-core-conformance-artifacts)
    - [Additional USCDI Requirements](https://hl7.org/fhir/us/core/2024Jan/must-support.html#additional-uscdi-requirements)
    - [USCDI](https://hl7.org/fhir/us/core/2024Jan/uscdi.html)
    - [Summary of Additional USCDI Requirement References](https://hl7.org/fhir/us/core/2024Jan/CapabilityStatement-us-core-server.html#summary-of-additional-uscdi-requirement-references)
29. **APPLIED:** Non-substantive (Clarification)  Add Preferred Language guidance [FHIR-40773](https://jira.hl7.org/browse/FHIR-40773) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-patient.html#mandatory-and-must-support-data-elements)
30. **APPLIED:** Non-substantive (Clarification)  Update UCUM guidance [FHIR-40604](https://jira.hl7.org/browse/FHIR-40604) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/general-guidance.html#using-ucum-codes-in-the-quantity-datatype)
31. **APPLIED:** Non-substantive (Clarification) Medication Adherence Scope Clarification [FHIR-42845](https://jira.hl7.org/browse/FHIR-42845) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-medicationrequest.html#mandatory-and-must-support-data-elements) and [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-medication-adherence.html)
32. **APPLIED:** Non-substantive (Clarification) USCDI - FHIR US Core Relationship Clarification [FHIR-42130](https://jira.hl7.org/browse/FHIR-42130) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/uscdi.html)

#### Publishing
The following trackers have been identified as publishing issues and we will work with HL7 publishing to resolve them.

1. **APPLIED** Excel downloads missing header row [FHIR-41709](https://jira.hl7.org/browse/FHIR-41709)
2. **PUBLISHING** Condition profile descriptions are not appearing in IG Detailed Description Snapshot View (other places) [FHIR-40813](https://jira.hl7.org/browse/FHIR-40813)
3. **PUBLISHING** RelatedPerson relationshiptype should have binding to FHIR value set RelatedPerson-relationshiptype [FHIR-34755](https://jira.hl7.org/browse/FHIR-34755)
4. **PUBLISHING:** AllergyIntolerance does not show constraint [FHIR-34636](https://jira.hl7.org/browse/FHIR-34636)
5. **PUBLISHING** Confusing for commercial vendor.  Reads very confusing. [FHIR-30783](https://jira.hl7.org/browse/FHIR-30783)
6. **PUBLISHING** In most of the data elements – “Binding is from base FHIR and US Core Vital Signs”  Need this to be one single combined listing [FHIR-30780](https://jira.hl7.org/browse/FHIR-30780)
7. **PUBLISHING** valueset-simple-language.xml QA Error [FHIR-30107](https://jira.hl7.org/browse/FHIR-30107)
8. **APPLIED** Patient Examples QA Errors: CDCREC code system in VSAC [FHIR-30105](https://jira.hl7.org/browse/FHIR-30105)

### Version = 6.1.0 (Meets USCDI v3 Requirements)
- url: <https://hl7.org/fhir/us/core/STU6.1/>
- Based on FHIR version : 4.0.1

The changes in this STU Update to US Core 6.0.0 have been reviewed by the public through the HL7 STU update process. The resolution of the community comments has been agreed to and voted on by the members of the HL7 International Cross-Group Projects work group.
#### What's new in Version 6.1.0 of US Core:

To meet the [U.S. Core Data for Interoperability (USCDI) v3] &quot;sex&quot; data element, US Core added the [US Core Sex Extension] as a [USCDI Requirement](https://hl7.org/fhir/us/core/STU6/must-support.html#uscdi-requirements)(). The [US Core Birth Sex Extension] is no longer a *USCDI Requirement*.

#### Updates and Corrected Errata in Version 6.1.0 of US Core:

**Tracker Status**: **Change Impact** **(Change Category)** **Change Summary** **Jira Issue [Link](#)** **Updated Content [Link](#)**

##### Compatible, substantive
1. **Applied:** Compatible, substantive (Correction) Add Sex extension necessary to satisfy USCDI v3 [FHIR-41301](https://jira.hl7.org/browse/FHIR-41301) and [FHIR-41352](https://jira.hl7.org/browse/FHIR-41352) See Changes [Here](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-sex.html), [Here](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-patient.html), and [Here](https://hl7.org/fhir/us/core/STU6.1/uscdi.html)

##### Non-substantive
2. **Applied:** Non-substantive (Correction) Update link to CDC Race and Ethnicity Code Set [FHIR-41277](https://jira.hl7.org/browse/FHIR-41277) See Changes [Here](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-race.html)
3. **Applied:** Non-substantive (Correction) Typo change `Condition.onsetDate` to `Condition.onsetDateTime`  [FHIR-41239](https://jira.hl7.org/browse/FHIR-41239) See Changes [Here](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-condition-encounter-diagnosis.html)
4. **Applied:** Non-substantive (Correction) Clarify US Core USCDI Requirement Extension not intended for implementers [FHIR-41238](https://jira.hl7.org/browse/FHIR-41238) See Changes [Here](https://hl7.org/fhir/us/core/STU6.1/profiles-and-extensions.html)
5. **Applied:** Non-substantive (Correction) Correct Provenance Example [FHIR-41316](https://jira.hl7.org/browse/FHIR-41316) See Changes [Here](https://hl7.org/fhir/us/core/STU6.1/Provenance-example-targeted-provenance.json.html)
6. **Applied:** Non-substantive (Clarification) Update Changes between versions table [FHIR-41434](https://jira.hl7.org/browse/FHIR-41434) See Changes [Here](https://hl7.org/fhir/us/core/STU6.1/changes-between-versions.html#cross-version-comparisons)
7. **Applied:** Non-substantive (Correction) update us-core-3 and us-core-4 [FHIR-41454](https://jira.hl7.org/browse/FHIR-41454) See Changes [Here](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-observation-clinical-result.html)

### Version = 6.0.0
- url: <https://hl7.org/fhir/us/core/STU6/>
- Based on FHIR version : 4.0.1

The changes in this annual update to US Core have been reviewed and commented upon by the public through the January 2023 HL7 balloting process. The resolution of the community comments has been agreed to and voted on by the members of the HL7 International Cross-Group Projects work group.

#### What's new in Version 6.0.0 of US Core:

Each update to a new version of US Core changes the US Core Profiles and conformance expectations. Implementers can find detailed comparisons between the FHIR artifacts in this 6.0.0 version of US Core and each previous major release on [Changes Between Versions] page. This section provides an overview of the significant changes in Version 6.0.0 of US Core.

- New and updated resources to meet the [U.S. Core Data for Interoperability (USCDI) v3] new Data Elements and Classes that the Office of the National Coordinator (ONC) published in July of 2022. [This table](https://hl7.org/fhir/us/core/STU6/uscdi.html) summarizes the USCDI Data Classes and Data Elements and the corresponding US Core Profile(s).
  - The *new* [US Core Coverage Profile] represent and access data related to an individual's health insurance coverage for health care.
  - The profiles from version 5.0.1 have been renamed and re-scoped in this version to accommodate the USCDI Health Status/Assessments Data Classes.
    -  The [US Core Observation Screening Assessment Profile] replaces the *US Core Observation Survey Profile* and *US Core Observation SDOH Assessment Profile*, and the [US Core Simple Observation Profile] replaces the *US Core Observation Social History Profile*.  See the Cross Version Comparisons Table on the [Changes Between Versions] page for a summary of profile revisions between versions.
    - The SDOH Assessments documentation has been rewritten and renamed to [Screening and Assessments], reflecting its expanded coverage of Health Status/Assessments Data Elements including: *Functional Status*, *Disability Status*, and *Mental/Cognitive Status* in addition to *SDOH Assessments*.
  - The *new* [US Core Observation Pregnancy Status Profile] and [US Core Observation Pregnancy Intent Profile] have been added to communicate pregnancy status.
  - The [US Core Laboratory Result Observation Profile] supports the result status and terminology requirements for coded and numeric results.
  - The *new* [US Core Specimen Profile] has been added to support Specimen Type.
  - The [US Core MedicationRequest Profile] was updated to support Dose, Dose Unit of Measure, Indication,.
  - The *new* [US Core MedicationDispense Profile] has been added to support Fill Status.
  - Updated Patient Demographics/Information:
      - To support Date of Death [US Core Patient Profile] was updated
      - The *new* [US Core Tribal Affiliation Extension] has been added to support Tribal Affiliation
      - The [US Core Birth Sex Extension] meets the patient sex requirement (*NOTE: US Core 6.1.0 added the [US Core Sex Extension] as a [USCDI Requirement](https://hl7.org/fhir/us/core/STU6/must-support.html#uscdi-requirements). The US Core Birth Sex Extension is no longer a USCDI Requirement*.)
      - To support Related Person's Name and Related Person's Relationship [US Core RelatedPerson Profile] was updated
      - The *new* [US Core Observation Occupation Profile] supports a patient's Occupation and Occupation Industry
  - Reason for Referral is supported by an updated [US Core ServiceRequest Profile] and [US Core Procedure Profile]

- The [US Core Observation Clinical Result Profile] supersedes version 5.0.1  *US Core Observation Clinical Test Result Profile* and *US Core Observation Imaging Result Profile*. In addition, it is the base for the [US Core Laboratory Result Observation Profile]. The Cross Version Comparisons Table on the [Changes Between Versions] page summarized these significant revisions.

- Document the [USCDI Requirement](https://hl7.org/fhir/us/core/STU6/must-support.html#uscdi-requirements) conformance category: Besides Mandatory and Must Support elements, the US Core Profile elements consist of USCDI Requirements elements for ONC Health IT Certification. This version [clarifies the meaning](https://hl7.org/fhir/us/core/STU6/general-requirements.html#us-core-conformance-artifacts) and [documents](https://hl7.org/fhir/us/core/STU6/must-support.html#uscdi-requirements) how it is communicated in the StructureDefinitions and on the profile pages

- Expanded CapabilityStatement Narrative: Each  US Core Profile contains references to other resources that it depends on or is related to. The CapabilityStatements narrative provides a table summarizing the [Must Support references for US Core Profiles](https://hl7.org/fhir/us/core/STU6/CapabilityStatement-us-core-server.html#summary-of-must-support-references-between-profiles) to help implementers understand their required capabilities.

- Expanded documentation on the Terminology page: In addition to detailing the Code Systems unique to this guide, links [all the Code Systems](https://hl7.org/fhir/us/core/STU6/terminology.html#code-systems) used in US Core are listed.

- Introduce [US Core SMART Scopes] as a candidate requirements under consideration, and provide example for each Profile.

- We continue our efforts to link terminology directly to the FHIR® Terminology Service for VSAC Resources ([Value Set Authority Center (VSAC)] where applicable and, as a result, align terminology between US Core and [HL7 C-CDA].

#### Changes:

These changes are a result of over 150 January 2023 Ballot related trackers which are listed below:

**Tracker Status**: **Change Impact** **(Change Category)** **Change Summary** **Jira Issue [Link](#)** **Updated Content [Link](#)**

##### Non-compatible
1. **Applied:** Non-compatible (Enhancement) Add to the code systems chart [FHIR-40124](https://jira.hl7.org/browse/FHIR-40124) See Changes [Here](https://hl7.org/fhir/us/core/STU6/terminology.html#code-system-uris-used-in-us-core)
2. **Applied:** Non-compatible (Enhancement) Make Specimen.subject must support [FHIR-40136](https://jira.hl7.org/browse/FHIR-40136) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-specimen.html)

##### Compatible, substantive
3. **Applied:** Compatible, substantive (Enhancement) Change Condition patient + category search to SHALL support [FHIR-37918](https://jira.hl7.org/browse/FHIR-37918) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-condition-encounter-diagnosis.html#mandatory-search-parameters)
4. **Applied:** Compatible, substantive (Enhancement) Allow multiple NPIs for Organizations and Practitioners [FHIR-39382](https://jira.hl7.org/browse/FHIR-39382) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-practitioner.html#profile)
5. **Applied:** Compatible, substantive (Enhancement) Keep QuestionnaireResponse and Update Screening and Assessments page [FHIR-39495](https://jira.hl7.org/browse/FHIR-39495) See Changes:
    - [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html)
    - [Here](https://hl7.org/fhir/us/core/STU6/Questionnaire-phq-9-example.html)
    - [Here](https://hl7.org/fhir/us/core/STU6/Questionnaire-prapare-example.html)
    - [Here](https://hl7.org/fhir/us/core/STU6/Questionnaire-hunger-vital-sign-example.html)
    - [Here](https://hl7.org/fhir/us/core/STU6/QuestionnaireResponse-phq-9-example.html)
    - [Here](https://hl7.org/fhir/us/core/STU6/CapabilityStatement-us-core-server.html#questionnaire)
    - [Here](https://hl7.org/fhir/us/core/STU6/CapabilityStatement-us-core-server.html#questionnaireresponse)
6. **Applied:** Compatible, substantive (Enhancement) Fix slicing in Observation.component:industry[FHIR-39608](https://jira.hl7.org/browse/FHIR-39608) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html#profile)
7. **Applied:** Compatible, substantive (Correction) Revert to simplegenderIdentify extension [FHIR-39615](https://jira.hl7.org/browse/FHIR-39615) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-genderIdentity.html)
8. **Applied:** Compatible, substantive (Clarification) Clarify and  updates examples to use SNOMED CT US Edition [FHIR-39640](https://jira.hl7.org/browse/FHIR-39640) See Changes [Here](https://hl7.org/fhir/us/core/STU6/general-guidance.html#snomed-ct-united-states-edition) and [Here](https://hl7.org/fhir/us/core/STU6/AllergyIntolerance-example.html)
9. **Applied:** Compatible, substantive (Clarification) Clarify the difference between Simple Observation and Screening Assessment [FHIR-39652](https://jira.hl7.org/browse/FHIR-39652) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-clinical-result.html#profile) and [Here](https://hl7.org/fhir/us/core/STU6/ValueSet-us-core-clinical-result-observation-category.html)
10. **Applied:** Compatible, substantive (Correction) Resolve conflicting guidance in Observation Blood Pressure  [FHIR-39659](https://jira.hl7.org/browse/FHIR-39659) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-blood-pressure.html#mandatory-and-must-support-data-elements)
11. **Applied:** Compatible, substantive (Clarification) Document Must Support and Modifier Elements [FHIR-39707](https://jira.hl7.org/browse/FHIR-39707) See Changes [Here](https://hl7.org/fhir/us/core/STU6/general-requirements.html#modifier-elements)
12. **Applied:** Compatible, substantive (Clarification) The use of Observations where QuestionnaireReponse is more applicable [FHIR-39722](https://jira.hl7.org/browse/FHIR-39722) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html)
13. **Applied:** Compatible, substantive (Enhancement) Add a "memberId" slice to Coverage.identifier and add guidance[FHIR-39743](https://jira.hl7.org/browse/FHIR-39743) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-coverage.html)
14. **Applied:** Compatible, substantive (Correction) Change RelatedPerson search to combination of Patient + Name [FHIR-39791](https://jira.hl7.org/browse/FHIR-39791) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-relatedperson.html#optional-search-parameters)
15. **Applied:** Compatible, substantive (Correction) MedicationRequest     - Change prescriber to 0..1 this information is not known for patient reported medications. [FHIR-39869](https://jira.hl7.org/browse/FHIR-39869) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-medicationrequest.html)
16. **Applied:** Compatible, substantive (Clarification) Change CarePlan.text from Mandatory min = 1 to Must Support min = 0 [FHIR-39902](https://jira.hl7.org/browse/FHIR-39902) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-careplan.html)
17. **Applied:** Compatible, substantive (Clarification) Clarify that Simple Observation Profile captures any sort of “simple” observations [FHIR-39940](https://jira.hl7.org/browse/FHIR-39940) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-simple-observation.html)
18. **Applied:** Compatible, substantive (Enhancement) Remove MS from Observation Screening Assessment Observation.performer Practitioner Reference [FHIR-39964](https://jira.hl7.org/browse/FHIR-39964) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-screening-assessment.html#profile)
19. **Applied:** Compatible, substantive (Enhancement) Revert references the US Core QuestionnaireResponse Profile  [FHIR-39965](https://jira.hl7.org/browse/FHIR-39965) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-screening-assessment.html)
20. **Applied:** Compatible, substantive (Clarification) Coverage.type binding clarification [FHIR-39982](https://jira.hl7.org/browse/FHIR-39982) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-coverage.html#mandatory-and-must-support-data-elements)
21. **Applied:** Compatible, substantive (Clarification) Rename US Core Observation Category Value Set [FHIR-40034](https://jira.hl7.org/browse/FHIR-40034) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-screening-assessment.html)
22. **Applied:** Compatible, substantive (Correction) Fix Pregnancy status codes  [FHIR-40045](https://jira.hl7.org/browse/FHIR-40045) See Changes [Here](https://hl7.org/fhir/us/core/STU6/ValueSet-us-core-pregnancy-status.html)
23. **Applied:** Compatible, substantive (Enhancement) Update Condition category slices to align with Observation/ServiceRequest[FHIR-40087](https://jira.hl7.org/browse/FHIR-40087) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-condition-problems-health-concerns.html)
24. **Applied:** Compatible, substantive (Clarification) Remove MustSupport from DocumentReference.category requiring clinical-note [FHIR-40102](https://jira.hl7.org/browse/FHIR-40102) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-documentreference.html)
25. **Applied:** Compatible, substantive (Enhancement) Add Goal.startDate as 0..1 MS with choice of supporting this or Goal.target.dueDate [FHIR-40103](https://jira.hl7.org/browse/FHIR-40103) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-goal.html)
26. **Applied:** Compatible, substantive (Clarification) Clarify that other category codes are permitted and Remove MS from Observation.performer Practitioner Reference [FHIR-40104](https://jira.hl7.org/browse/FHIR-40104) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-simple-observation.html)
27. **Applied:** Compatible, substantive (Clarification) Clarify use of unknown for occupation. [FHIR-40137](https://jira.hl7.org/browse/FHIR-40137) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html), [Here](https://hl7.org/fhir/us/core/STU6/Observation-observation-occupation-industry-unknown.html) and [Here](https://hl7.org/fhir/us/core/STU6/Observation-observation-occupation-unknown.html)
28. **Applied:** Compatible, substantive (Enhancement) Give guidance on SMART v2 scopes [FHIR-40192](https://jira.hl7.org/browse/FHIR-40192) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-condition-encounter-diagnosis.html#notes) and [Here](https://hl7.org/fhir/us/core/STU6/future-of-US-core.html#us-core-smart-scopes)
29. **Applied:** Compatible, substantive (Clarification) Remove the SFCU extension, and retain the birth-sex extension to meet USCDI Patient Sex. [FHIR-40197](https://jira.hl7.org/browse/FHIR-40197) See Changes [Here](https://hl7.org/fhir/us/core/STU6/uscdi.html)
30. **Applied:** Compatible, substantive (Correction) Change Observation Occupation binding strength extensible [FHIR-40204](https://jira.hl7.org/browse/FHIR-40204) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html)
31. **Applied:** Compatible, substantive (Correction) Change whenHandedOver cardinality 0..1 [FHIR-40205](https://jira.hl7.org/browse/FHIR-40205) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-medicationdispense.html)
32. **Applied:** Compatible, substantive (Clarification) Clarify patient previous name and previous address [FHIR-40299](https://jira.hl7.org/browse/FHIR-40299) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-patient.html)
33. **Applied:** Compatible, substantive (Correction) Update PractitionerRole.role binding [FHIR-40372](https://jira.hl7.org/browse/FHIR-40372) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-practitionerrole.html)
34. **Applied:** Compatible, substantive (Clarification) Remove MS from Patient on CareTeam.participant.member [FHIR-40415](https://jira.hl7.org/browse/FHIR-40415) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-careteam.html)
35. **Applied:** Compatible, substantive (Enhancement) List only base profiles for reasonReference. [FHIR-40656](https://jira.hl7.org/browse/FHIR-40656) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-servicerequest.html#profile) and [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-medicationrequest.html#profile)
36. **Applied:** Compatible, substantive (Enhancement) Remove US Core QuestionnaireResponse Tag Element [FHIR-40742](https://jira.hl7.org/browse/FHIR-40742) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-questionnaireresponse.html) and [Here](https://hl7.org/fhir/us/core/STU6/Questionnaire-prapare-example.html)

##### Non-substantive
37. **Applied:** Non-substantive (Correction) Remove html entities from examples [FHIR-37474](https://jira.hl7.org/browse/FHIR-37474)
38. **Applied:** Non-substantive (Correction) Diagnostic Report Laboratory Codes LOINC CLASSTYPE value should be "1" [FHIR-37933](https://jira.hl7.org/browse/FHIR-37933) See Changes [Here](https://hl7.org/fhir/us/core/STU6/ValueSet-us-core-laboratory-test-codes.html)
39. **Applied:** Non-substantive (Clarification) Additional guidance for accessing imaging studies [FHIR-38808](https://jira.hl7.org/browse/FHIR-38808) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-diagnosticreport-note.html#mandatory-and-must-support-data-elements)
40. **Applied:** Non-substantive (Enhancement) Add support for Condition search that include patient + category + status [FHIR-39610](https://jira.hl7.org/browse/FHIR-39610) See Changes [Here](https://hl7.org/fhir/us/core/STU6/CapabilityStatement-us-core-server.html#condition)
41. **Applied:** Non-substantive (Clarification) Reference only reason for using MedicationDispense [FHIR-39611](https://jira.hl7.org/browse/FHIR-39611) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-medicationdispense.html)
42. **Applied:** Non-substantive (Correction) Duplicated words [FHIR-39637](https://jira.hl7.org/browse/FHIR-39637) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-condition-problems-health-concerns.html#optional-search-parameters)
43. **Applied:** Non-substantive (Correction) Missing comma [FHIR-39638](https://jira.hl7.org/browse/FHIR-39638) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-patient.html#mandatory-and-must-support-data-elements)
44. **Applied:** Non-substantive (Clarification) Clarify that Observation.specimen is a MustSupport [FHIR-39639](https://jira.hl7.org/browse/FHIR-39639) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-lab.html#mandatory-and-must-support-data-elements)
45. **Applied:** Non-substantive (Enhancement) Add NDC codes to the Medication Guidance [FHIR-39641](https://jira.hl7.org/browse/FHIR-39641) See Changes [Here](https://hl7.org/fhir/us/core/STU6/medication-list.html#options-for-representing-medication)
46. **Applied:** Non-substantive (Correction) Extra trailing parenthesis [FHIR-39643](https://jira.hl7.org/browse/FHIR-39643) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html)
47. **Applied:** Non-substantive (Correction) Clinical Judgement Profile does not exist [FHIR-39650](https://jira.hl7.org/browse/FHIR-39650) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html)
48. **Applied:** Non-substantive (Correction) uscore or us-core [FHIR-39653](https://jira.hl7.org/browse/FHIR-39653)
49. **Applied:** Non-substantive (Correction) Fix $docref examples [FHIR-39658](https://jira.hl7.org/browse/FHIR-39658) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-documentreference.html#mandatory-operation)
50. **Applied:** Non-substantive (Clarification) Clarify how profiles are defined [FHIR-39703](https://jira.hl7.org/browse/FHIR-39703) See Changes [Here](https://hl7.org/fhir/us/core/STU6/general-requirements.html#us-core-conformance-artifacts) and  [Here](https://hl7.org/fhir/us/core/STU6/index.html#introduction) and [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-allergyintolerance.html)
51. **Applied:** Non-substantive (Clarification) Clarify where the US Core Profile FHIR Restful transactions are defined? [FHIR-39704](https://jira.hl7.org/browse/FHIR-39704) See Changes [Here](https://hl7.org/fhir/us/core/STU6/general-requirements.html#profile-support--interaction-support)
52. **Applied:** Non-substantive (Correction) Use ValueSet and not value set when a FHIR ValueSet is intended [FHIR-39705](https://jira.hl7.org/browse/FHIR-39705) See Changes [Here](https://hl7.org/fhir/us/core/STU6/general-requirements.html)
53. **Applied:** Non-substantive (Correction) Use uppercase "Must Support" and not lowercase "must support" [FHIR-39706](https://jira.hl7.org/browse/FHIR-39706)
54. **Applied:** Non-substantive (Correction) Common format for Resources and Resource fields [FHIR-39708](https://jira.hl7.org/browse/FHIR-39708)
55. **Applied:** Non-substantive (Clarification) Use of mandatory text [FHIR-39709](https://jira.hl7.org/browse/FHIR-39709)
56. **Applied:** Non-substantive (Correction) Add reference to FHIR section on language support [FHIR-39710](https://jira.hl7.org/browse/FHIR-39710) See Changes [Here](https://hl7.org/fhir/us/core/STU6/general-guidance.html#language-support)
57. **Applied:** Non-substantive (Clarification) Refer to FHIR specification as base definition for RESTful operations [FHIR-39711](https://jira.hl7.org/browse/FHIR-39711) See Changes [Here](https://hl7.org/fhir/us/core/STU6/general-guidance.html#read-fetch-syntax)
58. **Applied:** Non-substantive (Correction) POST based searches [FHIR-39712](https://jira.hl7.org/browse/FHIR-39712) See Changes [Here](https://hl7.org/fhir/us/core/STU6/general-requirements.html#fhir-restful-search-api-requirements)
59. **Applied:** Non-substantive (Clarification) Clarify compartment based search [FHIR-39713](https://jira.hl7.org/browse/FHIR-39713) See Changes [Here](https://hl7.org/fhir/us/core/STU6/general-guidance.html#compartment-based-search)
60. **Applied:** Non-substantive (Clarification) Updated CapabilityStatement to list un-profiled required resources [FHIR-39714](https://jira.hl7.org/browse/FHIR-39714) See Changes [Here](https://hl7.org/fhir/us/core/STU6/CapabilityStatement-us-core-server.html#summary-of-must-support-references-between-profiles)
61. **Applied:** Non-substantive (Clarification) Change "Systems" to "Servers" [FHIR-39716](https://jira.hl7.org/browse/FHIR-39716) See Changes [Here](https://hl7.org/fhir/us/core/STU6/clinical-notes.html)
62. **Applied:** Non-substantive (Clarification) Update "Clinical Note Server" to "FHIR Server" [FHIR-39717](https://jira.hl7.org/browse/FHIR-39717) See Changes [Here](https://hl7.org/fhir/us/core/STU6/clinical-notes.html) and [Here](https://hl7.org/fhir/us/core/STU6/general-requirements.html)
63. **Applied:** Non-substantive (Clarification) DocumentReference, DiagnosticReport and embedded documents [FHIR-39718](https://jira.hl7.org/browse/FHIR-39718) See Changes [Here](https://hl7.org/fhir/us/core/STU6/clinical-notes.html)
64. **Applied:** Non-substantive (Clarification) Clarify MedicationAdministration and MedicationStatement support. [FHIR-39720](https://jira.hl7.org/browse/FHIR-39720) See Changes [Here](https://hl7.org/fhir/us/core/STU6/medication-list.html#pharmacy-fhir-resources)
65. **Applied:** Non-substantive (Clarification) Updated CapabilityStatement to list required referenced profiles and resources [FHIR-39723](https://jira.hl7.org/browse/FHIR-39723) See Changes [Here](https://hl7.org/fhir/us/core/STU6/CapabilityStatement-us-core-server.html#summary-of-must-support-references-between-profiles)
66. **Applied:** Non-substantive (Correction) External link is missing [FHIR-39725](https://jira.hl7.org/browse/FHIR-39725) See Changes [Here](https://hl7.org/fhir/us/core/STU6/general-guidance.html#search-syntax)
67. **Applied:** Non-substantive (Correction) Change whenHandedOver from min =1 to min =0 [FHIR-39732](https://jira.hl7.org/browse/FHIR-39732) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-medicationdispense.html)
68. **Applied:** Non-substantive (Correction) Wrong resource referenced [FHIR-39733](https://jira.hl7.org/browse/FHIR-39733) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-coverage.html)
69. **Applied:** Non-substantive (Correction) plural/singular mismatch [FHIR-39734](https://jira.hl7.org/browse/FHIR-39734) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-coverage.html)
70. **Applied:** Non-substantive (Correction) Screening and Assessment typo [FHIR-39735](https://jira.hl7.org/browse/FHIR-39735) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html)
71. **Applied:** Non-substantive (Correction) Missing Hyperlinks [FHIR-39736](https://jira.hl7.org/browse/FHIR-39736) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-pregnancystatus.html)
72. **Applied:** Non-substantive (Clarification) Clarify period of pregnancy intent [FHIR-39737](https://jira.hl7.org/browse/FHIR-39737) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-pregnancyintent.html)
73. **Applied:** Non-substantive (Correction) Missing Hyperlinks [FHIR-39738](https://jira.hl7.org/browse/FHIR-39738) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-pregnancyintent.html) and See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-pregnancystatus.html)
74. **Applied:** Non-substantive (Correction) RelatedPerson uses text from Observation Laboratory profile [FHIR-39792](https://jira.hl7.org/browse/FHIR-39792) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-relatedperson.html)
75. **Applied:** Non-substantive (Clarification) Reference only reason for using MedicationDispense [FHIR-39856](https://jira.hl7.org/browse/FHIR-39856) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-medicationdispense.html)
76. **Applied:** Non-substantive (Enhancement) Adjust USCDI Mapping references to MedicationRequest Profile [FHIR-39857](https://jira.hl7.org/browse/FHIR-39857) See Changes [Here](https://hl7.org/fhir/us/core/STU6/uscdi.html)
77. **Applied:** Non-substantive (Enhancement) Adjust USCDI Mapping references to DiagnosticReport Profile [FHIR-39858](https://jira.hl7.org/browse/FHIR-39858) See Changes [Here](https://hl7.org/fhir/us/core/STU6/uscdi.html)
78. **Applied:** Non-substantive (Enhancement) Add USCDI Mapping references for Disability Status and Mental/Cognitive Status [FHIR-39859](https://jira.hl7.org/browse/FHIR-39859) See Changes [Here](https://hl7.org/fhir/us/core/STU6/uscdi.html)
79. **Applied:** Non-substantive (Enhancement) Adjust USCDI Mapping references to Patient Profile [FHIR-39860](https://jira.hl7.org/browse/FHIR-39860) See Changes [Here](https://hl7.org/fhir/us/core/STU6/uscdi.html)
80. **Applied:** Non-substantive (Correction) Fix Value set expansion [FHIR-39861](https://jira.hl7.org/browse/FHIR-39861) See Changes [Here](https://hl7.org/fhir/us/core/STU6/ValueSet-us-core-pregnancy-status.html)
81. **Applied:** Non-substantive (Correction) Extensions     - context of use [FHIR-39863](https://jira.hl7.org/browse/FHIR-39863) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-race.html)
82. **Applied:** Non-substantive (Enhancement) Add more Lab Result examples [FHIR-39868](https://jira.hl7.org/browse/FHIR-39868) See Changes [Here](https://hl7.org/fhir/us/core/STU6/Observation-at-home-in-vitro-test.html)
83. **Applied:** Non-substantive (Correction) Update Profile Formal Views labels [FHIR-39873](https://jira.hl7.org/browse/FHIR-39873)
84. **Applied:** Non-substantive (Clarification) Provide guidance for Prescriptions Sent by Mail [FHIR-39878](https://jira.hl7.org/browse/FHIR-39878) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-medicationdispense.html)
85. **Applied:** Non-substantive (Correction) Using SNOMED CT United States Edition Typo [FHIR-39903](https://jira.hl7.org/browse/FHIR-39903) See Changes [Here](https://hl7.org/fhir/us/core/STU6/general-guidance.html#snomed-ct-united-states-edition)
86. **Applied:** Non-substantive (Clarification) Update the Change log [FHIR-39923](https://jira.hl7.org/browse/FHIR-39923) See Changes [Here](https://hl7.org/fhir/us/core/STU6/changes.html#whats-new-in-version-600-of-us-core)
87. **Applied:** Non-substantive (Clarification) Define the term Screening and Assessment [FHIR-39938](https://jira.hl7.org/browse/FHIR-39938) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html#introduction)
88. **Applied:** Non-substantive (Clarification) Correct the description of the Simple Observation Profile [FHIR-39942](https://jira.hl7.org/browse/FHIR-39942) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html#clinical-judgments)
89. **Applied:** Non-substantive (Clarification) Provide further guidance on use of US Core vs other domain specific IGs [FHIR-39943](https://jira.hl7.org/browse/FHIR-39943) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html#introduction)
90. **Applied:** Non-substantive (Clarification) Reframe Screening and Assessments Page [FHIR-39944](https://jira.hl7.org/browse/FHIR-39944) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html#introduction)
91. **Applied:** Non-substantive (Clarification) Update the Screening and Assessment Activities diagram [FHIR-39945](https://jira.hl7.org/browse/FHIR-39945) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html#related-activities-in-clinical-care)
92. **Applied:** Non-substantive (Correction) Update the “Screening and Assessment Activities” diagram with proper profile name [FHIR-39946](https://jira.hl7.org/browse/FHIR-39946) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html)
93. **Applied:** Non-substantive (Clarification) Update Screening and Assessments” title and content [FHIR-39947](https://jira.hl7.org/browse/FHIR-39947) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html#screening-and-assessments)
94. **Applied:** Non-substantive (Correction) Correct title[FHIR-39948](https://jira.hl7.org/browse/FHIR-39948) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html)
95. **Aoplied:** Non-substantive (Clarification) Update description of Screening Assessments Profile [FHIR-39949](https://jira.hl7.org/browse/FHIR-39949) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html)
96. **Applied:** Non-substantive (Clarification) Change Header [FHIR-39950](https://jira.hl7.org/browse/FHIR-39950) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html#us-core-observation-screening-assessment-profile)
97. **Applied:** Non-substantive (Correction) Correct title of section 3.6.2.2 US Core Observation Simple Observation Profile [FHIR-39951](https://jira.hl7.org/browse/FHIR-39951) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html)
98. **Applied:** Non-substantive (Clarification) Require US Core Server to support the Simple Observation profile for simple assessments [FHIR-39953](https://jira.hl7.org/browse/FHIR-39953) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html#clinical-judgments)
99. **Applied:** Non-substantive (Correction) Correct the link and sentence for assessment category codes [FHIR-39954](https://jira.hl7.org/browse/FHIR-39954) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html#category-codes)
100. **Applied:** Non-substantive (Clarification) Describe the purpose and intent of “Grouping” and update the diagram [FHIR-39955](https://jira.hl7.org/browse/FHIR-39955) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html#codes-for-problemshealthconcerns-goals-service-requests-and-procedures)
101. **Applied:** Non-substantive (Correction) Remove US Core Common SDOH Assessments ValueSet [FHIR-39956](https://jira.hl7.org/browse/FHIR-39956)
102. **Applied:** Non-substantive (Correction) Fix link text [FHIR-39958](https://jira.hl7.org/browse/FHIR-39958) See Changes [Here](https://hl7.org/fhir/us/core/STU6/changes.html)
103. **Applied:** Non-substantive (Correction) Correct link issue in “Profile specific implementation guidance section” of the ServiceRequest Profile [FHIR-39966](https://jira.hl7.org/browse/FHIR-39966) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-servicerequest.html)
104. **Applied:** Non-substantive (Correction) Extra ) in Screening and Assessments [FHIR-40041](https://jira.hl7.org/browse/FHIR-40041) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html)
105. **Applied:** Non-substantive (Correction) Fix the link. [FHIR-40043](https://jira.hl7.org/browse/FHIR-40043) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html#category-codes)
106. **Applied:** Non-substantive (Correction) RelatedPerson profile text contains Observation content [FHIR-40048](https://jira.hl7.org/browse/FHIR-40048) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-relatedperson.html)
107. **Applied:** Non-substantive (Correction) 2 typos in history page [FHIR-40069](https://jira.hl7.org/browse/FHIR-40069) See Changes [Here](https://hl7.org/fhir/us/core/history.html)
108. **Applied:** Non-substantive (Clarification) Reword a Quick Start example [FHIR-40072](https://jira.hl7.org/browse/FHIR-40072) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-patient.html#mandatory-search-parameters)
109. **Applied:** Non-substantive (Enhancement) Consider alternative answer choices for pregnancy intent codes [FHIR-40084](https://jira.hl7.org/browse/FHIR-40084) See Changes [Here](https://hl7.org/fhir/us/core/STU6/ValueSet-us-core-pregnancy-intent.html)
110. **Applied:** Non-substantive (Correction) Improve Screening Assessment Observation.hasMember short description [FHIR-40085](https://jira.hl7.org/browse/FHIR-40085) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-screening-assessment.html)
111. **Applied** Non-substantive (Correction) Update the “bindings when slicing by value sets” figure  [FHIR-40086](https://jira.hl7.org/browse/FHIR-40086) See Changes [Here](https://hl7.org/fhir/us/core/STU6/general-requirements.html#required-bindings-when-slicing-by-valuesets)
112. **Applied:** Non-substantive (Clarification) Add guidance to the Procedure profile to express sdoh category [FHIR-40088](https://jira.hl7.org/browse/FHIR-40088) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html) and
113. **Applied:** Non-substantive (Correction) Improve language as to the expectations of clinicalStatus when category is problem list [FHIR-40089](https://jira.hl7.org/browse/FHIR-40089) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-condition-problems-health-concerns.html)
114. **Applied:** Non-substantive (Clarification) Align with FHIR DS4P IG [FHIR-40090](https://jira.hl7.org/browse/FHIR-40090) See Changes [Here](https://hl7.org/fhir/us/core/STU6/general-guidance.html#suppressed-data)
115. **Applied:** Non-substantive (Correction) Remove AHC HRSN screening tool examples [FHIR-40091](https://jira.hl7.org/browse/FHIR-40091)
116. **Applied:** Non-substantive (Clarification) Add guidance show collection method and performer can be captured using Provenance [FHIR-40092](https://jira.hl7.org/browse/FHIR-40092) See Changes [Here](https://hl7.org/fhir/us/core/STU6/basic-provenance.html#element-level-provenance) and [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-patient.html#mandatory-and-must-support-data-elements)
117. **Applied:** Non-substantive (Clarification) Clarify applicability of DiagnosticReport in USCDI Mapping [FHIR-40138](https://jira.hl7.org/browse/FHIR-40138) See Changes [Here](https://hl7.org/fhir/us/core/STU6/clinical-notes.html)
118. **Applied:** Non-substantive (Correction) Remove the word "status" from introductory text [FHIR-40149](https://jira.hl7.org/browse/FHIR-40149) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html)
119. **Applied:** Non-substantive (Correction) Incorrect link for "record or update" and additional examples [FHIR-40151](https://jira.hl7.org/browse/FHIR-40151) See Changes [Here](https://hl7.org/fhir/us/core/STU6/future-of-US-core.html#future-candidate-requirements-under-consideration)
120. **Applied:** Non-substantive (Correction) Incorrect Resource noted in the introductory paragraph [FHIR-40155](https://jira.hl7.org/browse/FHIR-40155) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-coverage.html)
121. **Applied:** Non-substantive (Clarification) Define Job[FHIR-40158](https://jira.hl7.org/browse/FHIR-40158) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html)
122. **Applied:** Non-substantive (Correction) Member or subscriber id is must have but the element cardinality is 0..* [FHIR-40160](https://jira.hl7.org/browse/FHIR-40160) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-coverage.html)
123. **Applied:** Non-substantive (Clarification) Modify comment regarding Screening and Assessments [FHIR-40161](https://jira.hl7.org/browse/FHIR-40161) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html#us-core-observation-screening-assessment-profile)
124. **Applied:** Non-substantive (Correction) Modify Examples/ValueSet for Language Codes [FHIR-40165](https://jira.hl7.org/browse/FHIR-40165) See Changes [Here](https://hl7.org/fhir/us/core/STU6/ValueSet-simple-language.html)
125. **Applied:** Non-substantive (Clarification) Add Guidance for more advanced Occupation detail.[FHIR-40166](https://jira.hl7.org/browse/FHIR-40166) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html#profile)
126. **Applied:** Non-substantive (Clarification) Add implementer guidance [FHIR-40170](https://jira.hl7.org/browse/FHIR-40170) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html)
127. **Applied:** Non-substantive (Clarification) Add guidance for current job [FHIR-40172](https://jira.hl7.org/browse/FHIR-40172) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html)
128. **Applied:** Non-substantive (Clarification) Add guidance to clarify multiple codings can be used [FHIR-40178](https://jira.hl7.org/browse/FHIR-40178) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html)
129. **Applied:** Non-substantive (Clarification) Add _include guidance for Specimen [FHIR-40180](https://jira.hl7.org/browse/FHIR-40180) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-specimen.html#notes)
130. **Applied:** Non-substantive (Correction) Update Industry NAICS Detail (ODH) to extensible. [FHIR-40181](https://jira.hl7.org/browse/FHIR-40181) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html)
131. **Applied:** Non-substantive (Correction) Remove duplicate of Notes: Quick Start intro bullets [FHIR-40182](https://jira.hl7.org/browse/FHIR-40182) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html#profile)
132. **Applied:** Non-substantive (Clarification) Add search guidance [FHIR-40183](https://jira.hl7.org/browse/FHIR-40183) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html#mandatory-and-must-support-data-elements)
133. **Applied:** Non-substantive (Clarification) Update profile description to state the profile represents a patient's  'Past or Present Job' [FHIR-40187](https://jira.hl7.org/browse/FHIR-40187) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html)
134. **Applied:** Non-substantive (Correction) Clarify guidance [FHIR-40199](https://jira.hl7.org/browse/FHIR-40199) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-medicationrequest.html#mandatory-and-must-support-data-elements)
135. **Applied:** Non-substantive (Clarification) Document expectations for Additional USCDI Requirements [FHIR-40200](https://jira.hl7.org/browse/FHIR-40200) See Changes [Here](https://hl7.org/fhir/us/core/STU6/general-requirements.html#us-core-conformance-artifacts) and [Here](https://hl7.org/fhir/us/core/STU6/must-support.html)
136. **Applied:** Non-substantive (Correction) ServiceRequest Profile Implementation Specific Guidance     - incorrect reference to ServiceRequest.reasonCode [FHIR-40202](https://jira.hl7.org/browse/FHIR-40202) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-servicerequest.html)
137. **Applied:** Non-substantive (Clarification) Tribal Affiliation Extension     - add guidance to that extension:isEnrolled is an optional extension [FHIR-40203](https://jira.hl7.org/browse/FHIR-40203) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-tribal-affiliation.html)
138. **Applied:** Non-substantive (Correction) MedicationRequest.reasonCodeableConcept does not exist [FHIR-40235](https://jira.hl7.org/browse/FHIR-40235) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-medicationrequest.html)
139. **Applied:** Non-substantive (Correction) Update laboratory results example  [FHIR-40427](https://jira.hl7.org/browse/FHIR-40427) See Changes [Here](https://hl7.org/fhir/us/core/STU6/Observation-serum-glucose.html)
140. **Applied:** Non-substantive (Correction) Update laboratory results example [FHIR-40428](https://jira.hl7.org/browse/FHIR-40428) See Changes [Here](https://hl7.org/fhir/us/core/STU6/Observation-serum-glucose.html)
141. **Applied:** Non-substantive (Correction) Add Specimen to BUN example [FHIR-40429](https://jira.hl7.org/browse/FHIR-40429) See Changes [Here](https://hl7.org/fhir/us/core/STU6/Observation-serum-bun.html)
142. **Applied:** Non-substantive (Clarification) Additional guidance for accessing imaging studies [FHIR-40514](https://jira.hl7.org/browse/FHIR-40514) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-diagnosticreport-note.html#mandatory-and-must-support-data-elements)
143. **Applied:** Non-substantive (Correction) Update example to follow 58410-2 CBC panel [FHIR-40521](https://jira.hl7.org/browse/FHIR-40521) See Changes [Here](https://hl7.org/fhir/us/core/STU6/DiagnosticReport-cbc.html)
144. **Applied:** Non-substantive (Enhancement) Flag additional USCDI requirements in a computable way [FHIR-40553](https://jira.hl7.org/browse/FHIR-40553) See Changes [Here](https://hl7.org/fhir/us/core/STU6/must-support.html#uscdi-requirements)
145. **Applied:** Non-substantive (Correction) Corrected expression in Condition asserted-date search parameter [FHIR-40573](https://jira.hl7.org/browse/FHIR-40573) See Changes [Here](https://hl7.org/fhir/us/core/STU6/SearchParameter-us-core-condition-asserted-date.html)
146. **Applied:** Non-substantive (Clarification) Clarify Direct address options [FHIR-40583](https://jira.hl7.org/browse/FHIR-40583) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-practitionerrole.html#mandatory-and-must-support-data-elements)
147. **Applied:** Non-substantive (Correction) Correction and clarify use of $expand [FHIR-39719](https://jira.hl7.org/browse/FHIR-39719) See Changes [Here](https://hl7.org/fhir/us/core/STU6/clinical-notes.html#using-expand) and [Here](https://hl7.org/fhir/us/core/STU6/CapabilityStatement-us-core-server.html#valueset)


### Version = 6.0.0 - ballot
- url: <https://hl7.org/fhir/us/core/2023Jan/>
- Based on FHIR version : 4.0.1

#### What's new in the US Core January 2023 Ballot

This ballot addresses the following:

- We have updated US Core to include the [U.S. Core Data for Interoperability (USCDI) v3] Data Elements and Classes that the Office of the National Coordinator (ONC) published in July of 2022:

  - **Applied**: [Health Insurance Information](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-coverage.html) Using US Core to represent and access data related to an individual's insurance coverage for health care.
  - **Applied**: The SDOH Assessments documentation has been rewritten and renamed to [Screening and Assessments](https://hl7.org/fhir/us/core/2023Jan/screening-and-assessments.html), reflecting its expanded coverage of Health Status/Assessments Data Elements. It documents how to use [US Core Observation Screening Assessment Profile] and the [US Core Simple Observation Profile] to represent and access health status and assessments, including: *Functional Status*, *Disability Status*, and *Mental/Cognitive Status* in addition to *SDOH Assessments*.
  - **Applied**: [US Core Observation Pregnancy Status Profile](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-observation-pregnancystatus.html) and [US Core Observation Pregnancy Intent Profile](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-observation-pregnancyintent.html) have been added to specifically address pregnancy status.
  - **Applied**: **Laboratory:** The [US Core Laboratory Observation Profile](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-observation-lab.html) already supports the result status and terminology requirements for coded and numeric results. The [US Core Specimen Profile](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-specimen.html) has been added to support Specimen Type.
  - **Applied**: **Medications:** Updates to the [US Core MedicationRequest Profile](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-medicationrequest.html) to support Dose, Dose Unit of Measure, Indication and the [US Core MedicationDispense Profile](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-medicationdispense.html) has been added to support Fill Status.
  - **Applied**: **Patient Demographics/Information**
      - Date of Death [See Change Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-patient.html)
      - Tribal Affiliation [See Change Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-patient.html)
      - Sex (for clinical use)[See Change Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-sex-for-clinical-use.html)
        - Note that the [US Core BirthSex Extension](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-birthsex.html) will not be deprecated.
      - Related Person's Name and Related Person's Relationship [See](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-relatedperson.html)
      - Occupation and Occupation Industry [See Change Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-observation-occupation.html)
  - **Applied**: **Procedures:** Reason for Referral [See Change Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-servicerequest.html) and [See Change Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-procedure.html)

- Several profiles from version 5.0.1 have been *retired* or *renamed* and *rescoped* in this version to accommodate the USCDI Health Status/Assessments Data Classes and as a result of implementer feedback. The [Cross Version Comparisions Table](https://hl7.org/fhir/us/core/2023Jan/changes-between-versions.html#cross-version-comparisons) summarized these significant revisions.
- We continue our efforts to link terminology directly to the FHIR® Terminology Service for VSAC Resources ([Value Set Authority Center (VSAC) - NIH](https://vsac.nlm.nih.gov/)) where applicable and, as a result, align terminology between US Core and [HL7 C-CDA].
- Implementers submitted over 70 trackers since the publication of US Core ver 5.0.0 and 5.0.1. We have addressed them and applied over 50 changes listed below:

**Tracker Status**: **Change Impact** **(Change Category)** **Change Summary** **Jira Issue [Link](#)** **Updated Content [Link](#)**

##### Non-compatible
1. **Applied:** Non-compatible (Correction)  Change Immunization.primarySource to must support and update definition [FHIR-37723](https://jira.hl7.org/browse/FHIR-37723) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-immunization.html)
2. **Applied:** Non-compatible (Enhancement) Update $docref type input to multiple Codings [FHIR-37894](https://jira.hl7.org/browse/FHIR-37894) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/OperationDefinition-docref.html) and See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-documentreference.html#mandatory-operation)

##### Compatible, substantive
3. **Applied:** Compatible, substantive (Enhancement) US Core: Require Provenance Resource for Create/Update/Delete Events, AuditEvent for Read [FHIR-14388](https://jira.hl7.org/browse/FHIR-14388) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/basic-provenance.html) and See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-provenance.html)
4. **Applied:** Compatible, substantive (Enhancement) Create a US Core extension to communicate the state jurisdiction for an element [FHIR-26943](https://jira.hl7.org/browse/FHIR-26943) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-jurisdiction.html)
5. **Applied:** Compatible, substantive (Enhancement) Clarify the purpose of Clinical Test Observation Profile [FHIR-35114](https://jira.hl7.org/browse/FHIR-35114) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-observation-clinical-result.html)
6. **Applied:** Compatible, substantive (Correction) Remove effectiveDateTime invariant from Sexual Orientation and Simple Observation (aka Social History) Profiles [FHIR-36932](https://jira.hl7.org/browse/FHIR-36932) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-observation-sexual-orientation.html) and See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-simple-observation.html)
7. **Applied:** Compatible, substantive (Enhancement) Clarify Expectations for Observation.value[x] in blood pressure and pulse oximetry profiles [FHIR-37358](https://jira.hl7.org/browse/FHIR-37358) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-blood-pressure.html#mandatory-and-must-support-data-elements) and See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-pulse-oximetry.html#mandatory-and-must-support-data-elements)
8. **Applied** Compatible, substantive (Enhancement) Add Constraint to validate NPI [FHIR-37498](https://jira.hl7.org/browse/FHIR-37498) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-practitioner.html) and See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-organization.html)
9. **Applied:** Compatible, substantive (Enhancement) Change Condition patient + category search to SHALL support [FHIR-37918](https://jira.hl7.org/browse/FHIR-37918) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-condition-encounter-diagnosis.html#notes)
10. **Applied:** Compatible, substantive (Correction) Remove comment in $docref [FHIR-38686](https://jira.hl7.org/browse/FHIR-38686) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/OperationDefinition-docref.html)
11. **Applied:** Compatible, substantive (Enhancement) Add USCDI V3 Requirements [FHIR-38702](https://jira.hl7.org/browse/FHIR-38702) See Changes Listed in introduction above.
12. **Applied:** Compatible, substantive (Enhancement) Add Refill and Quantity to MedRequest [FHIR-39343](https://jira.hl7.org/browse/FHIR-39343) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-medicationrequest.html)

##### Non-substantive
13. **Applied:** Non-substantive (Enhancement) Add recommended search combination of patient + status [FHIR-19803](https://jira.hl7.org/browse/FHIR-19803) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-implantable-device.html#notes)
14. **Applied:** Non-substantive (Enhancement) Consider adding years since quite smoking [FHIR-20131](https://jira.hl7.org/browse/FHIR-20131) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-smokingstatus.html)
15. **Applied:** Non-substantive (Correction) Update missing data for coded data examples [FHIR-31381](https://jira.hl7.org/browse/FHIR-31381) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/general-requirements.html#missing-data)
16. **Applied:** Non-substantive (Clarification) Clarify how to read Profile Page [FHIR-36083](https://jira.hl7.org/browse/FHIR-36083) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/index.html#how-to-read-this-guide)
17. **Applied:** Non-substantive (Clarification) Clarify organization responsible for the DocumentReference [FHIR-36654](https://jira.hl7.org/browse/FHIR-36654) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-documentreference.html#mandatory-and-must-support-data-elements)
18. **Applied:** Non-substantive (Clarification) Clarify Device UDI-PI requirements [FHIR-36657](https://jira.hl7.org/browse/FHIR-36657) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-implantable-device.html#mandatory-and-must-support-data-elements)
19. **Applied:** Non-substantive (Enhancement) Add 'problem-list-item' condition example [FHIR-36759](https://jira.hl7.org/browse/FHIR-36759) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/Condition-condition-duodenal-ulcer.html)
20. **Applied:** Non-substantive (Correction) Fix LOINC LP code links [FHIR-36763](https://jira.hl7.org/browse/FHIR-36763) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/ValueSet-us-core-diagnosticreport-category.html)
21. **Applied:** Non-substantive (Correction) Fix Link to "Direct Secure Messaging" [FHIR-36764](https://jira.hl7.org/browse/FHIR-36764) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-direct.html)
22. **Applied:** Non-substantive (Clarification) Update US Core Practitioner to clarify work related contact information [FHIR-36765](https://jira.hl7.org/browse/FHIR-36765) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-practitioner.html)
23. **Applied:** Non-substantive (Clarification) CLD for US Core Non Laboratory Codes value set is not computable [FHIR-36789](https://jira.hl7.org/browse/FHIR-36789) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/ValueSet-us-core-diagnosticreport-report-and-note-codes.html)
24. **Applied:** Non-substantive (Enhancement) US Core Organization slice for CLIA does not list an HTA/THO approved external identifier system [FHIR-36926](https://jira.hl7.org/browse/FHIR-36926) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-organization.html)
25. **Applied:** Non-substantive (Correction) Correct code system URI for HCPCS [FHIR-37336](https://jira.hl7.org/browse/FHIR-37336) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/ValueSet-us-core-procedure-code.html)
26. **Applied** Non-substantive (Correction) change 'resources' to 'profiles' [FHIR-37343](https://jira.hl7.org/browse/FHIR-37343) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-provenance.html#mandatory-and-must-support-data-elements)
27. **Applied:** Non-substantive (Correction) Clarify vaccineCode code system URI [FHIR-37400](https://jira.hl7.org/browse/FHIR-37400) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-immunization.html#mandatory-and-must-support-data-elements)
28. **Applied:** Non-substantive (Correction) Typos on SDOH Guidance Page [FHIR-37469](https://jira.hl7.org/browse/FHIR-37469) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/screening-and-assessments.html)
29. **Applied:** Non-substantive (Correction) Remove extra instance or the word "resource" in Lab observation narrative profile [FHIR-37507](https://jira.hl7.org/browse/FHIR-37507) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-observation-lab.html)
30. **Applied:** Non-substantive (Enhancement) Allow multiple Gender Identities and associated dates. [FHIR-37509](https://jira.hl7.org/browse/FHIR-37509) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-genderIdentity.html)
31. **Applied:** Non-substantive (Correction) Typos on Patient and Practitioner "Name" SearchParameter pages [FHIR-37541](https://jira.hl7.org/browse/FHIR-37541) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/SearchParameter-us-core-patient-name.html) and See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/SearchParameter-us-core-practitioner-name.html)
32. **Applied:** Non-substantive (Clarification) Add Guidance on DocumentReference.category [FHIR-37592](https://jira.hl7.org/browse/FHIR-37592) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-documentreference.html#mandatory-and-must-support-data-elements)
33. **Applied:** Non-substantive (Correction) Correct us-core-6 invariant expression [FHIR-37704](https://jira.hl7.org/browse/FHIR-37704) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-patient.html#constraints)
34. **Applied:** Non-substantive (Correction) Added supportedProfiles to US Core CapabilityStatements[FHIR-37766](https://jira.hl7.org/browse/FHIR-37766) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/CapabilityStatement-us-core-server.html#encounter)
35. **Applied:** Non-substantive (Clarification) Clarify how to use categories vis a vis codes in US Core Diagnostic Report Category element [FHIR-37770](https://jira.hl7.org/browse/FHIR-37770) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-diagnosticreport-note.html)
36. **Applied:** Non-substantive (Clarification) Clarify that US Core requires any version of SMART? [FHIR-37813](https://jira.hl7.org/browse/FHIR-37813) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/security.html)
37. **Applied:** Non-substantive (Correction) Typo of "DiagnostisReport" in Clinical Notes Guidance [FHIR-37819](https://jira.hl7.org/browse/FHIR-37819) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/clinical-notes.html)
38. **Applied:** Non-substantive (Enhancement) Add Conformance expectation of SHOULD to resolve for server Capability [FHIR-37901](https://jira.hl7.org/browse/FHIR-37901) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/CapabilityStatement-us-core-server.html)
39. **Applied:** Non-substantive (Correction) Typo in Observation SDOH profile [FHIR-37928](https://jira.hl7.org/browse/FHIR-37928) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-observation-screening-assessment.html)
40. **Applied:** Non-substantive (Correction) Typo in Condition Problems and Health Concerns search example [FHIR-37929](https://jira.hl7.org/browse/FHIR-37929) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-condition-problems-health-concerns.html)
41. **Applied:** Non-substantive (Correction) Update Laboratory Loinc Valueset description [FHIR-37933](https://jira.hl7.org/browse/FHIR-37933) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/ValueSet-us-core-laboratory-test-codes.html)
42. **Applied:** Non-substantive (Correction) Clarify that guide uses US Edition of SNOMED and update links to it  [FHIR-38190](https://jira.hl7.org/browse/FHIR-38190) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/general-guidance.html#snomed-ct-united-states-edition)
43. **Applied:** Non-substantive (Clarification) Update QuickStart to include all the search requirements by type. [FHIR-38629](https://jira.hl7.org/browse/FHIR-38629) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-observation-sexual-orientation.html)
44. **Applied:** Non-substantive (Clarification) Specify $docref's operates on DocumentReference endpoint [FHIR-38658](https://jira.hl7.org/browse/FHIR-38658) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/OperationDefinition-docref.html)
45. **Applied:** Non-substantive (Correction) Correct documentation on Procedure.performed attribute [FHIR-38737](https://jira.hl7.org/browse/FHIR-38737) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-procedure.html#mandatory-and-must-support-data-elements)
46. **Applied:** Non-substantive (Clarification) Improve docref documentation [FHIR-38746](https://jira.hl7.org/browse/FHIR-38746) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/OperationDefinition-docref.html)
47. **Applied:** Non-substantive (Correction) Fix title for US Core Pediatric Head Occipital Frontal Circumference Observation Profile [FHIR-38794](https://jira.hl7.org/browse/FHIR-38794) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-head-occipital-frontal-circumference-percentile.html)
48. **Applied:** Non-substantive (Correction) Fix Quick Start Rendering [FHIR-39367](https://jira.hl7.org/browse/FHIR-39367) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-patient.html#notes)
49. **Applied:** Non-substantive (Correction) Remove Bulk Dependency  [FHIR-39377](https://jira.hl7.org/browse/FHIR-39377) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/CapabilityStatement-us-core-server.html#should_igs)
50. **Applied:** Non-substantive (Correction) Fix Cross Version Comparisons section [FHIR-39417](https://jira.hl7.org/browse/FHIR-39417) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/changes-between-versions.html#cross-version-comparisons)
51. **Applied:** Non-substantive (Clarification) Add Ballot Comment to CarePlan for community feedback [FHIR-32949](https://jira.hl7.org/browse/FHIR-32949) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-careplan.html)
52. **Applied:** Non-substantive (Correction) Change ServiceRequest.category to min=0 [FHIR-39493](https://jira.hl7.org/browse/FHIR-39493) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-servicerequest.html)
53. **Applied:** Non-substantive (Correction) Fix provenance-1 [FHIR-39518](https://jira.hl7.org/browse/FHIR-39518) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-provenance.html)

### Version = 5.0.1 (Meets USCDI v2 Requirements)
- url: <https://hl7.org/fhir/us/core/STU5.0.1/>
- Based on FHIR version : 4.0.1


The changes in this errata to version 5.0.0 of US Core have been reviewed by the public through the HL7 errata process. The resolution of the community comments has been agreed to and voted on by the members of the HL7 International Cross-Group Projects work group.
#### Corrected Errata in Version 5.0.1 of US Core:

**Tracker Status**: **Change Impact** **(Change Category)** **Change Summary** **Jira Issue [Link](#)** **Updated Content [Link](#)**

##### Compatible, substantive
1. **Applied:** Compatible, substantive (Clarification) Correct misapplied tracker     - for `agent.who` remove MS from reference Practitioner and add to Organization [FHIR-28517](https://jira.hl7.org/browse/FHIR-28517) [See Change Here](https://hl7.org/fhir/us/core/STU5.0.1/StructureDefinition-us-core-provenance.html)

##### Non-substantive
2. **Applied:** Non-substantive (Correction) Typos in Condition Profile URls  [FHIR-37585](https://jira.hl7.org/browse/FHIR-37585) See Changes:
    - [Here](https://hl7.org/fhir/us/core/STU5.0.1/StructureDefinition-us-core-condition-encounter-diagnosis.html)
    - [Here](https://hl7.org/fhir/us/core/STU5.0.1/StructureDefinition-us-core-condition-problems-health-concerns.html)
3. **Applied:** Non-substantive (Correction) Update VSAC dependency package version and remove STU Notes where expansion now supported by publisher  [FHIR-37586](https://jira.hl7.org/browse/FHIR-37586)


### Version = 5.0.0
- url: <https://hl7.org/fhir/us/core/STU5/>
- Based on FHIR version : 4.0.1

The changes in this annual update to US Core have been reviewed and commented upon by the public through the January 2022 HL7 balloting process. The resolution of the community comments has been agreed to and voted on by the members of the HL7 International Cross-Group Projects work group.
#### What's new in Version 5.0.0 of US Core:

- New and updated resources to meet the [U.S. Core Data for Interoperability (USCDI) v2] new Data Elements and Classes that the Office of the National Coordinator (ONC) published in July of 2021:
  -  A Social Determinants Of Health ([SDOH](https://hl7.org/fhir/us/core/STU5/sdoh.html)) guidance page on using US Core to represent and access SDOH Assessments, Goals, Interventions, and Problems/Health Concerns.
  - [US Core Observation Survey Profile](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-survey.html), [US Core Observation SDOH Assessment Profile](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-sdoh-assessment.html), and [US Core QuestionnaireResponse Profile](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-questionnaireresponse.html) to represent SDOH Assessments
  - [US Core ServiceRequest Profile](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-servicerequest.html) to represent SDOH Interventions
  - [US Core Observation Clinical Result Profile](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-clinical-test.html) to represent Clinical Test Results
  - [US Core Observation Clinical Result Profile](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-imaging.html) to represent Imaging Results
  - [US Core Gender Identity Extension](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-genderIdentity.html) for patient demographics
  - [US Core Observation Sexual Orientation Profile](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-sexual-orientation.html) for patient demographics
  - [US Core RelatedPerson Profile](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-relatedperson.html) to represent care member such as a caretaker.
  - Updates to [US Core CareTeam Profile](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-careteam.html)
  - Updates to [US Core Encounter Profile](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-encounter.html)
  - US Core Condition has been split into:
      - [US Core Condition Encounter Diagnosis Profile](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-condition-encounter-diagnosis.html) to represent encounter diagnosis
      - [US Core Condition Problems and Health Concerns Profile](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-condition-problems-health-concerns.html) to represent problems and health concerns included SDOH health concerns.
- New pages and headers:
   - [Change Log](https://hl7.org/fhir/us/core/STU5/changes.html) new header and page. content migrated from the [Directory of published versions] page to create this page
   - [Conformance](https://hl7.org/fhir/us/core/STU5/conformance.html) new Header that contains these pages:
       - [General Requirements] content migrated from version 4.0.0 *General Requirements* and *Conformance Expectation* pages
       - [Must Support] renamed and edited from version 4.0.0 *Conformance Expectation* pages
   - [USCDI](https://hl7.org/fhir/us/core/STU5/uscdi.html) content migrated from version 4.0.0 *General Requirements* Page
   - [Changes Between Versions] rewritten and renamed from version 4.0.0 *DSTU2 to R4 Conversion* page
- Link more terminology directly to the [FHIR Terminology Service for VSAC Resources] and align terminology between US Core and [HL7 C-CDA].

#### Changes:

These changes are a result of over 100 January 2022 Ballot related trackers which are listed below:

**Tracker Status**: **Change Impact** **(Change Category)** **Change Summary** **Jira Issue [Link](#)** **Updated Content [Link](#)**

##### Non-compatible
1. **Applied:** Non-compatible (Enhancement) Change Clinical Tests Observations category to "clinical-test" and add guidance [FHIR-34555](https://jira.hl7.org/browse/FHIR-34555) See Changes:
    - [Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-clinical-test.html)
    - [Here](https://hl7.org/fhir/us/core/STU5/ValueSet-us-core-observation-category.html)
    - [Here](https://hl7.org/fhir/us/core/STU5/CodeSystem-us-core-observation-category.html)
    - [Here](https://hl7.org/fhir/us/core/STU5/ValueSet-us-core-clinical-test-codes.html)
2. **Applied:** Non-compatible (Correction) Remove "OTH" from OMB Race Category valueSet [FHIR-35694](https://jira.hl7.org/browse/FHIR-35694) [See Change Here](https://hl7.org/fhir/us/core/STU5/ValueSet-omb-race-category.html)
3. **Applied:** Non-compatible (Correction) Remove "Cause of death" from Condition.category and remove US Core Condition Category Codes ValueSet [FHIR-36104](https://jira.hl7.org/browse/FHIR-36104)

##### Compatible, substantive
4. **Applied:** Compatible, substantive (Enhancement) Remove requirement for component SDOH Assessment's Observations [FHIR-34384](https://jira.hl7.org/browse/FHIR-34384) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-survey.html)
5. **Applied:** Compatible, substantive (Enhancement) Warn client that categorization is fuzzy for SDOH [FHIR-34550](https://jira.hl7.org/browse/FHIR-34550) [See Change Here](https://hl7.org/fhir/us/core/STU5/sdoh.html#category-codes)
6. **Applied:** Compatible, substantive (Enhancement) Split US Core Condition into two profile: Encounter Diagnosis and Problems/Health Concerns [FHIR-34553](https://jira.hl7.org/browse/FHIR-34553) See Change:
    - [Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-condition-problems-health-concerns.html)
    - [Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-condition-encounter-diagnosis.html)
7. **Applied:** Compatible, substantive (Correction) Fix Medication List Examples [FHIR-34630](https://jira.hl7.org/browse/FHIR-34630) [See Change Here](https://hl7.org/fhir/us/core/STU5/medication-list.html#fetching-all-medications-active-medications-and-all-medications-for-an-encounter)
8. **Applied:** Compatible, substantive (Correction) Inconsistent on conditional required element [FHIR-34643](https://jira.hl7.org/browse/FHIR-34643) See Change:
    - [Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-diagnosticreport-lab.html)
    - [Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-diagnosticreport-note.html)
9. **Applied:** Compatible, substantive (Enhancement) Remove Condition.category "us-core-1"  (due to [FHIR-34553](https://jira.hl7.org/browse/FHIR-34553)) and change Immunization.vaccineCode "us-core-1" to "us-core-5", Patient.name.family "us-core-8" to "us-core-6 " to remove duplicate invariant id, is now ['us-core-1', 'us-core-2', 'us-core-3', 'us-core-4', 'us-core-5', 'us-core-6', 'us-core-7', 'us-core-8', 'us-core-9','us-core-10','us-core-13', 'us-core-14',] [FHIR-34646](https://jira.hl7.org/browse/FHIR-34646) See Change:
    - [Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-immunization.html)
    - [Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-patient.html)
10. **Applied:** Compatible, substantive (Correction) Add 386053000 "Evaluation procedure" ,410606002 "Social service procedure" to the ServiceRequest Category Code [FHIR-34747](https://jira.hl7.org/browse/FHIR-34747) [See Change Here](https://hl7.org/fhir/us/core/STU5/ValueSet-us-core-servicerequest-category.html)
11. **Applied:** Compatible, substantive (Enhancement) Broaden Common SDOH assessment concepts and clarify is a starter set [FHIR-34752](https://jira.hl7.org/browse/FHIR-34752) See Change:
    - [Here](https://hl7.org/fhir/us/core/STU5/sdoh.html#assessment-codes)
    - [Here](https://hl7.org/fhir/us/core/STU5/ValueSet-us-core-common-sdoh-assessments.html)
    - [Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-sdoh-assessment.html)
12. **Applied:** Compatible, substantive (Correction) Clinical Test Result Observation Profile Must Have needs to address the 3 slices for procedure, exam, and activity in the explanatory text [FHIR-34753](https://jira.hl7.org/browse/FHIR-34753) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-clinical-test.html)
13. **Applied:** Compatible, substantive (Enhancement) Clarify modeling of SDOH screening using Observations, Add QuestionnaireResponse profile as alternative screening instrument [FHIR-35364](https://jira.hl7.org/browse/FHIR-35364) See Changes:
    - [Here](https://hl7.org/fhir/us/core/STU5/sdoh.html)
    - [Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-survey.html)
    - [Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-sdoh-assessment.html)
    - [Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-questionnaireresponse.html)
14. **Applied:** Compatible, substantive (Clarification) Split section on "deleted" from "entered in error" [FHIR-35622](https://jira.hl7.org/browse/FHIR-35622) [See Change Here](https://hl7.org/fhir/us/core/STU5/general-guidance.html#representing-entered-in-error-information)
15. **Applied:** Compatible, substantive (Enhancement) Use "sdoh" instead of "LG41762-2" for SDOH Categories and Tags [FHIR-35644](https://jira.hl7.org/browse/FHIR-35644) See Changes:
    - [Here](https://hl7.org/fhir/us/core/STU5/CodeSystem-us-core-tags.html)
    - [Here](https://hl7.org/fhir/us/core/STU5/ValueSet-us-core-tags.html)
    - [Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-sdoh-assessment.html)
16. **Applied:** Compatible, substantive (Enhancement) Update Gender Identity Value set[FHIR-35677](https://jira.hl7.org/browse/FHIR-35677) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-genderIdentity.html)
17. **Applied:** Compatible, substantive (Correction) Remove MS from DiagnosticReport.imagingStudy [FHIR-35759](https://jira.hl7.org/browse/FHIR-35759) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-diagnosticreport-note.html)
18. **Applied:** Compatible, substantive (Correction) Change fixed category slice to max=1 [FHIR-35854](https://jira.hl7.org/browse/FHIR-35854) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-imaging.html)
19. **Applied:** Compatible, substantive (Enhancement) allow ethnicity extension in FamilyMemberHistory [FHIR-35997](https://jira.hl7.org/browse/FHIR-35997) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-ethnicity.html)
20. **Applied:** Compatible, substantive (Enhancement) allow race extension in FamilyMemberHistory [FHIR-35998](https://jira.hl7.org/browse/FHIR-35998) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-race.html)
21. **Applied:** Compatible, substantive (Correction) Add OTH to sexual orientation ValueSet [FHIR-36166](https://jira.hl7.org/browse/FHIR-36166) [See Change Here](https://hl7.org/fhir/us/core/STU5/ValueSet-us-core-sexual-orientation.html)
22. **Applied:** Compatible, substantive (Enhancement) Add "Other Race" to OMB Race Categories [FHIR-36247](https://jira.hl7.org/browse/FHIR-36247) [See Change Here](https://hl7.org/fhir/us/core/STU5/ValueSet-omb-race-category.html)
23. **Applied:** Compatible, substantive (Enhancement) Move change log from version history to new change log  page in IG [FHIR-36703](https://jira.hl7.org/browse/FHIR-36703) [See Change Here](https://hl7.org/fhir/us/core/STU5/changes.html)
24. **Applied:** Compatible, substantive (Correction) Change Encounter.reasonReference from 0..1 to 0..* [FHIR-36862](https://jira.hl7.org/browse/FHIR-36862) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-encounter.html)

##### Non-substantive
25. **Applied:** Non-substantive (Clarification) Clarify clinicalStatus invariant [FHIR-34468](https://jira.hl7.org/browse/FHIR-34468) [See Change Here](https://hl7.org/fhir/us/core/STU5/general-requirements.html#missing-data)
26. **Applied:** Non-substantive (Correction) Fix Ethnicity ValueSet description [FHIR-34488](https://jira.hl7.org/browse/FHIR-34488) [See Change Here](https://hl7.org/fhir/us/core/STU5/ValueSet-omb-ethnicity-category.html)
27. **Applied:** Non-substantive (Clarification) Remove MS from ServiceRequest.occurrenceDateTime add MS to ServiceRequest.occurrencePeriod [FHIR-34493](https://jira.hl7.org/browse/FHIR-34493) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-servicerequest.html)
28. **Applied:** Non-substantive (Clarification) Change Goal.description search requirement from SHALL to SHOULD [FHIR-34546](https://jira.hl7.org/browse/FHIR-34546) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-goal.html#notes)
29. **Applied:** Non-substantive (Clarification) Update narrative on abatement date [FHIR-34554](https://jira.hl7.org/browse/FHIR-34554) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-condition-problems-health-concerns.html)
30. **Applied:** Non-substantive (Correction) Update all occurrences of U.S. Core Data for Interoperability (USCDI) v1 to v2 or removed specific references to version. [FHIR-34613](https://jira.hl7.org/browse/FHIR-34613) [For Example, See Change Here](https://hl7.org/fhir/us/core/STU5/index.html)
31. **Applied:** Non-substantive (Correction) Referencing US Core Profiles [FHIR-34623](https://jira.hl7.org/browse/FHIR-34623) [See Change Here](https://hl7.org/fhir/us/core/STU5/general-guidance.html#referencing-us-core-profiles)
32. **Applied:** Non-substantive (Correction) Correct code system in example snippet[FHIR-34624](https://jira.hl7.org/browse/FHIR-34624) [See Change Here](https://hl7.org/fhir/us/core/STU5/general-requirements.html#missing-data)
33. **Applied:** Non-substantive (Clarification) Add further clarification between slicing a binding (4.1.0) vs using extensible binding (4.0.0) [FHIR-34626](https://jira.hl7.org/browse/FHIR-34626) [See Change Here](https://hl7.org/fhir/us/core/STU5/general-requirements.html#required-bindings-when-slicing-by-valuesets)
34. **Applied:** Non-substantive (Correction) Fix typo [FHIR-34627](https://jira.hl7.org/browse/FHIR-34627)
35. **Applied:** Non-substantive (Correction) Clarify reported guidance on how secondary sourced MedicationRequest information can be represented. [FHIR-34628](https://jira.hl7.org/browse/FHIR-34628) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-medicationrequest.html#mandatory-and-must-support-data-elements)
36. **Applied:** Non-substantive (Correction) Fix contextDirection in Example 1[FHIR-34629](https://jira.hl7.org/browse/FHIR-34629) [See Change Here](https://hl7.org/fhir/us/core/STU5/clinical-notes.html#discovering-note-and-report-types)
37. **Applied:** Non-substantive (Correction) Correct Careteam Narrative errors (remove reference to Organization) [FHIR-34637](https://jira.hl7.org/browse/FHIR-34637) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-careteam.html#mandatory-and-must-support-data-elements)
38. **Applied:** Non-substantive (Correction) Fix typo [FHIR-34638](https://jira.hl7.org/browse/FHIR-34638)
39. **Applied:** Non-substantive (Clarification) Added missing search query parameter values [FHIR-34642](https://jira.hl7.org/browse/FHIR-34642) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-imaging.html#notes)
40. **Applied:** Non-substantive (Clarification) ServiceRequest.category:us-core should be required? [FHIR-34645](https://jira.hl7.org/browse/FHIR-34645) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-servicerequest.html#mandatory-and-must-support-data-elements)
41. **Applied:** Non-substantive (Clarification) Clarify that SDOH data elements does not include work information (see ODH) [FHIR-34701](https://jira.hl7.org/browse/FHIR-34701) See Change:
    -  [Here](https://hl7.org/fhir/us/core/STU5/sdoh.html)
    -  [Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-sdoh-assessment.html)
42. **Applied:** Non-substantive (Clarification) Clarify guidance for use of Patient.genderIdentity, Patient.birthsex, and pre-existing Patient.gender [FHIR-34754](https://jira.hl7.org/browse/FHIR-34754) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-patient.html)
43. **Resolved - change required:** Non-substantive (Clarification) List profiles by type and create table comparing Observation Profiles [FHIR-34890](https://jira.hl7.org/browse/FHIR-34890) See Changes:
    - [Here](https://hl7.org/fhir/us/core/STU5/profiles-and-extensions.html)
    - [Here](https://hl7.org/fhir/us/core/STU5/index.html#us-core-profiles)
    - [Here](https://hl7.org/fhir/us/core/STU5/downloads.html)
44. **Applied:** Non-substantive (Clarification) Lab Result and Specimen Information for RBC Observation is Missing [FHIR-34910](https://jira.hl7.org/browse/FHIR-34910) See Change
    - [Here](https://hl7.org/fhir/us/core/STU5/index.html#how-to-read-this-guide)
    - [Here](https://hl7.org/fhir/us/core/STU5/examples.html)
    - [Here](https://hl7.org/fhir/us/core/STU5/Observation-blood-glucose.html)
45. **Applied:** Non-substantive (Clarification) Added guidance on Observation.category limitations [FHIR-34949](https://jira.hl7.org/browse/FHIR-34949) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-lab.html#mandatory-and-must-support-data-elements)
46. **Applied:** Non-substantive (Correction) Add guidance on Imaging DiagnosticReport ontology [FHIR-34958](https://jira.hl7.org/browse/FHIR-34958) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-imaging.html)
47. **Applied:** Non-substantive (Clarification) Clarify that the profile guidance is not limited to profiled elements [FHIR-34971](https://jira.hl7.org/browse/FHIR-34971) [See Change Here](https://hl7.org/fhir/us/core/STU5/index.html#how-to-read-this-guide)
48. **Applied:** Non-substantive (Correction) Fix asterisk notation in profiles [FHIR-34972](https://jira.hl7.org/browse/FHIR-34972) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-imaging.html)
49. **Applied:** Non-substantive (Clarification) Clarify "time" elements used in the DiagnosticReport profiles [FHIR-34973](https://jira.hl7.org/browse/FHIR-34973) See Change:
    - [Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-diagnosticreport-lab.html)
    - [Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-diagnosticreport-note.html)
50. **Applied:** Non-substantive (Correction) Change the query parameter value to be consistent with previous statement [FHIR-35047](https://jira.hl7.org/browse/FHIR-35047) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-clinical-test.html#notes)
51. **Applied:** Non-substantive (Clarification) Re-ordered sections in *Downloads* page and provide a zip file of schematrons [FHIR-35064](https://jira.hl7.org/browse/FHIR-35064) [See Change Here](https://hl7.org/fhir/us/core/STU5/downloads.html)
52. **Applied:** Non-substantive (Enhancement)  Split General Guidance page into 1) USCDI  3)General Guidance. Split Conformance Expectations into General Requirements and Must Support. Move General Guidance to General Requirements [FHIR-35065](https://jira.hl7.org/browse/FHIR-35065) See Changes:
    - [Here](https://hl7.org/fhir/us/core/STU5/uscdi.html)
    - [Here](https://hl7.org/fhir/us/core/STU5/general-requirements.html)
    - [Here](https://hl7.org/fhir/us/core/STU5/general-guidance.html)
    - [Here](https://hl7.org/fhir/us/core/STU5/must-support.html)
53. **Applied:** Non-substantive (Clarification) Clarify expectations for supporting multiple versions of US Core.[FHIR-35067](https://jira.hl7.org/browse/FHIR-35067) [See Change Here](https://hl7.org/fhir/us/core/STU5/changes-between-versions.html)
54. **Applied:** Non-substantive (Clarification) Clarify that Changes Between Versions (né DSTU2 to R4 Conversion) page documents a set of best practices [FHIR-35068](https://jira.hl7.org/browse/FHIR-35068) [See Change Here](https://hl7.org/fhir/us/core/STU5/changes-between-versions.html)
55. **Applied:** Non-substantive (Correction) Typo in Category Codes section [FHIR-35072](https://jira.hl7.org/browse/FHIR-35072) [See Change Here](https://hl7.org/fhir/us/core/STU5/sdoh.html)
56. **Applied:** Non-substantive (Correction) Typo [FHIR-35115](https://jira.hl7.org/browse/FHIR-35115)
57. **Applied:** Non-substantive (Clarification) Provide guidance when specific code systems are to be used in ServiceRequest [FHIR-35122](https://jira.hl7.org/browse/FHIR-35122) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-servicerequest.html)
58. **Applied:** Non-substantive (Clarification) Clarify description for effective time. [FHIR-35125](https://jira.hl7.org/browse/FHIR-35125) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-diagnosticreport-lab.html)
59. **Applied:** Non-substantive (Enhancement) Fix CareTeam example's participant.role value [FHIR-35152](https://jira.hl7.org/browse/FHIR-35152) [See Change Here](https://hl7.org/fhir/us/core/STU5/CareTeam-example.html)
60. **Applied:** Non-substantive (Clarification) US Core Condition profile "status" is ambiguous; clarify to be clinicalStatus [FHIR-35280](https://jira.hl7.org/browse/FHIR-35280) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-condition-problems-health-concerns.html)
61. **Applied:** Non-substantive (Clarification) Align Observation category for SDOH assessments [FHIR-35282](https://jira.hl7.org/browse/FHIR-35282) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-social-history.html)
62. **Applied:** Non-substantive (Correction) Add effective[x] 0..1 MS to US Core Observation Social History Profile [FHIR-35283](https://jira.hl7.org/browse/FHIR-35283) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-social-history.html)
63. **Applied:** Non-substantive (Enhancement)  Clarify Condition.clinicalStatus requirements and searching using clinical-status [FHIR-35318](https://jira.hl7.org/browse/FHIR-35318) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-condition-problems-health-concerns.html)
64. **Applied:** Non-substantive (Correction) Fix link [FHIR-35362](https://jira.hl7.org/browse/FHIR-35362)
65. **Applied:** Non-substantive (Correction) Modify example usage text in all profile pages  [FHIR-35363](https://jira.hl7.org/browse/FHIR-35363) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-survey.html)
66. **Applied:** Non-substantive (Correction) Clarify $docref operation expectations [FHIR-35380](https://jira.hl7.org/browse/FHIR-35380) [See Change Here](https://hl7.org/fhir/us/core/STU5/CapabilityStatement-us-core-server.html#documentreference)
67. **Applied:** Non-substantive (Correction) Typo [FHIR-35388](https://jira.hl7.org/browse/FHIR-35388)
68. **Applied:** Non-substantive (Correction) Duplicate sections in US Core RelatedPerson Profile profile [FHIR-35452](https://jira.hl7.org/browse/FHIR-35452)
69. **Applied:** Non-substantive (Enhancement) Updated guidance on changes between versions [FHIR-35576](https://jira.hl7.org/browse/FHIR-35576) [See Change Here](https://hl7.org/fhir/us/core/STU5/changes-between-versions.html)
70. **Applied:** Non-substantive (Correction) Media example data value fails regex [FHIR-35790](https://jira.hl7.org/browse/FHIR-35790) [See Change Here](https://hl7.org/fhir/us/core/STU5/Media-ekg-strip.json.html)
71. **Applied:** Non-substantive (Correction) Typo [FHIR-35844](https://jira.hl7.org/browse/FHIR-35844)
72. **Applied:** Non-substantive (Correction) Typo [FHIR-35851](https://jira.hl7.org/browse/FHIR-35851)
73. **Applied:** Non-substantive (Clarification) Clarify narrative of status "active" element.  [FHIR-35870](https://jira.hl7.org/browse/FHIR-35870) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-organization.html)
74. **Applied:** Non-substantive (Correction) Update Condition Implementation Guidance to reflect current USCDI terminology standards [FHIR-36056](https://jira.hl7.org/browse/FHIR-36056) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-condition-encounter-diagnosis.html)
75. **Applied:** Non-substantive (Clarification) Clarify expectations for reader [FHIR-36057](https://jira.hl7.org/browse/FHIR-36057) See Changes:
    - [Here](https://hl7.org/fhir/us/core/STU5/index.html)
    - [Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-lab.html)
76. **Applied:** Non-substantive (Enhancement) Update US Core Yearly Updates [FHIR-36058](https://jira.hl7.org/browse/FHIR-36058) [See Change Here](https://hl7.org/fhir/us/core/STU5/future-of-US-core.html)
77. **Applied:** Non-substantive (Correction) Updated coding `system` in Missing Data documentation [FHIR-36177](https://jira.hl7.org/browse/FHIR-36177) [See Change Here](https://hl7.org/fhir/us/core/STU5/general-requirements.html#missing-data)
78. **Applied:** Non-substantive (Correction) Add MS to Device.distinctIdentifier to correct editorial error [FHIR-36303](https://jira.hl7.org/browse/FHIR-36303) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-implantable-device.html)
79. **Applied:** Non-substantive (Correction) Fix provenance-1 invariant [FHIR-36328](https://jira.hl7.org/browse/FHIR-36328) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-provenance.html)
80. **Applied:** Non-substantive (Correction) Correct _targetProfile element in Provenance StructureDefinition [FHIR-36344](https://jira.hl7.org/browse/FHIR-36344) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-provenance.html)
81. **Applied:** Non-substantive (Correction) Correct guidance on accessing VSAC Valuesets [FHIR-36639](https://jira.hl7.org/browse/FHIR-36639) [See Change Here](https://hl7.org/fhir/us/core/STU5/terminology.html#using-value-set-authority-center-vsac)
82. **Applied:** Non-substantive (Correction) Remove redundant example sections [FHIR-36728](https://jira.hl7.org/browse/FHIR-36728)
83. **Applied:** Non-substantive (Correction) Realign ids names and titles for all new profiles for consistency [FHIR-36766](https://jira.hl7.org/browse/FHIR-36766) [See Change Here](https://hl7.org/fhir/us/core/STU5/profiles-and-extensions.html)
84. **Applied:** Non-substantive (Correction) Move profile page introduction into StructureDefinition description [FHIR-36824](https://jira.hl7.org/browse/FHIR-36824) [See Change Here](https://hl7.org/fhir/us/core/STU5/profiles-and-extensions.html)
85. **Applied:** Non-substantive (Correction) Fixed profile, Added STU Note, Updated FHIR Core Vitals Profile binding in FHIR R4B. [FHIR-27845](https://jira.hl7.org/browse/FHIR-27845) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-pulse-oximetry.html)
86. **Applied:** Non-substantive (Correction) Change URL for CDT from http://ada.org/cdt to http://www.ada.org/cdt. [FHIR-36861](https://jira.hl7.org/browse/FHIR-36861) [See Change Here](https://hl7.org/fhir/us/core/STU5/ValueSet-us-core-procedure-code.html)
87. **Applied:**Non-substantive (Correction) Add basic introduction to the FHIR RESTful Search interaction in the home page [FHIR-35755](https://jira.hl7.org/browse/FHIR-35755) [See Change Here](https://hl7.org/fhir/us/core/STU5/index.html#us-core-fhir-restful-interactions)

#### The Following Trackers Will be Applied in Future Version

Due external dependencies and publication tooling limitations, the application of these resolutions have been deferred.

##### Working with HL7 publishing to resolve these publishing issues:

**Tracker Status**: **Summary** **Jira Issue** Application Status

1. **Resolved - change required**: Patient Examples QA Errors: CDCREC code system in VSAC [FHIR-30105](https://jira.hl7.org/browse/FHIR-30105) Manual code expansion and STU Note Present.  Working with HL7 publishing to fix integration with VSAC.
1. **Resolved - change required**: valueset-simple-language.xml QA Error [FHIR-30107](https://jira.hl7.org/browse/FHIR-30107) Working with HL7 publishing to fix.
1. **Resolved - change required**: Extensions used that are not defined in the scope [FHIR-35775](https://jira.hl7.org/browse/FHIR-35775)


##### Working with HL7 IG Authoring project to address these issues on IG readability:

**Tracker Status**: **Summary** **Jira Issue** Application Status

1. **Resolved - change required**: In most of the data elements – “Binding is from base FHIR and US Core Vital Signs” Need this to be one single combined listing [FHIR-30780](https://jira.hl7.org/browse/FHIR-30780)
1. **Resolved - change required**: AllergyIntolerance does not show constraint [FHIR-34636](https://jira.hl7.org/browse/FHIR-34636)
1. **Resolved - change required**: RelatedPerson relationshiptype should have binding to FHIR value set RelatedPerson-relationshiptype [FHIR-34755](https://jira.hl7.org/browse/FHIR-34755)


---

### Version = 4.1.0
- Publication Date: 2021-11-30
- url: <https://hl7.org/fhir/us/core/2022Jan>
- Based on FHIR version : 4.0.1

#### Changes:
 **The January 2022 Ballot**

This Ballot addresses the following issues:
- Adds [United States Core Data for Interoperability (USCDI) V2](https://www.healthit.gov/sites/default/files/page/2021-07/Standards_Bulletin_2021-3.pdf) updates that the Office of the National Coordinator (ONC) published in July of 2021 with these new Data Elements and Classes:
  - **Applied**: [A Social Determinants Of Health (SDOH) Guidance page](https://hl7.org/fhir/us/core/2022Jan/sdoh.html) to document and provide guidance on using US Core to represent and access [SDOH Assessments](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-observation-screening-response.html) and [Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-observation-social-history-assessment.html), [Goals](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-goal.html), Interventions represented by [ServiceRequest](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-servicerequest.html) + [Procedure](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-procedure.html), and [Problems/Health Concerns](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-condition.html)
  - **Applied**: [Clinical Tests](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-observation-clinical-test.html) and [Diagnostic Imaging](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-observation-imaging.html) [also see Changes Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-diagnosticreport-note.html)
  - **Applied**: [Patient Gender Identity](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-patient.html) and [Sexual Identity](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-observation-sexual-orientation.html#)
  - **Applied**: **Care Team Member:** Name, Identifier, Location, Telecom and Role [See Change Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-careteam.html) and [Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-practitioner.html) and [Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-relatedperson.html)
  - **Applied**: **Encounter:** Diagnosis, Disposition, Location, Time, Type [See Change Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-encounter.html)
  - **Applied**: **Problems:** Date of Diagnosis and Date of Resolution [See Change Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-condition.html)
- Continued efforts to link terminology directly to the FHIR® Terminology Service for VSAC Resources ([Value Set Authority Center (VSAC) - NIH](https://vsac.nlm.nih.gov/)) where applicable and as a result align terminology between US Core and [HL7 C-CDA].
- [Updated uscdii table](https://hl7.org/fhir/us/core/2022Jan/general-guidance.html) for easier browsing.
- Addition of consolidated [CSV and Excel File representations](https://hl7.org/fhir/us/core/2022Jan/downloads.html) of Profiles to  enable testers and analysts to review elements properties across profiles in a single table
- Addressed and applied over 30 trackers submitted by implementers since the previous STU2 ballot for US Core ver 4.0.0:

**Tracker Status**: **Change Impact** **(Change Category)** **Change Summary** **Jira Issue [Link](#)** **Updated Content [Link](#)**

##### Non-compatible
1. **Applied:** Non-compatible (Correction) add same Null options to Race and Ethnicity [FHIR-34036](https://jira.hl7.org/browse/FHIR-34036) See Change
    - [Here](https://hl7.org/fhir/us/core/2022Jan/ValueSet-omb-ethnicity-category.html)
    - [Here](https://hl7.org/fhir/us/core/2022Jan/ValueSet-detailed-ethnicity.html)
    - [Here](https://hl7.org/fhir/us/core/2022Jan/ValueSet-omb-race-category.html)
    - [Here](https://hl7.org/fhir/us/core/2022Jan/ValueSet-detailed-race.html)
2. **Applied:** Non-compatible (Correction) Add  Null options to US Core Birth Sex Extension [FHIR-34133](https://jira.hl7.org/browse/FHIR-34133) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/ValueSet-birthsex.html)

##### Compatible, substantive
3. **Applied:** Compatible, substantive (Correction) Make values in direct and birth sex extensions min=1 [FHIR-26459](https://jira.hl7.org/browse/FHIR-26459) See Change:
    - [Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-birthsex.html)
    - [Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-direct.html)
4. **Applied:** Compatible, substantive (Enhancement) Make Condition.encounter 0..1 MS [FHIR-32844](https://jira.hl7.org/browse/FHIR-32844) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-condition.html)
5. **Applied:** Compatible, substantive (Correction) Create US Core slices for category elements [FHIR-32857](https://jira.hl7.org/browse/FHIR-32857) See Change:
    -  [Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-documentreference.html)
    -  [Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-medicationrequest.html)
    -  [Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-servicerequest.html)
    -  [Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-condition.html)
6. **Applied:** Compatible, substantive (Enhancement) Change drug class value set for allergens to align with C-CDA [FHIR-32953](https://jira.hl7.org/browse/FHIR-32953) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-allergyintolerance.html)
7. **Applied:** Compatible, substantive (Clarification) Clarify Guidance for missing data for Coding data type element [FHIR-33048](https://jira.hl7.org/browse/FHIR-33048) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/general-guidance.html#missing-data)
8. **Applied:** Compatible, substantive (Clarification) Remove requirement to use only 401 from capabiltystatement [FHIR-33069](https://jira.hl7.org/browse/FHIR-33069) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/CapabilityStatement-us-core-server.html#behavior)
9. **Applied:** Compatible, substantive (Enhancement) Utilize "use" field for patient previous name and previous address [FHIR-33080](https://jira.hl7.org/browse/FHIR-33080) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-patient.html)
10. **Applied:** Compatible, substantive (Correction) Make Procedure.performed conditionally mandatory [FHIR-33243](https://jira.hl7.org/browse/FHIR-33243) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-procedure.html)
11. **Applied:** Compatible, substantive (Enhancement) USCDI v2 update [FHIR-34231](https://jira.hl7.org/browse/FHIR-34231) SEE SECTION ABOVE
12. **Applied:** Compatible, substantive (Correction) Make DiagnosticReport.effective and DiagnosticReport.issued conditionally mandatory [FHIR-34330](https://jira.hl7.org/browse/FHIR-34330) See Change:
    - [Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-diagnosticreport-lab.html)
    - [Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-diagnosticreport-note.html)

##### Non-substantive
13. **Applied:** Non-substantive (Correction) FIX imm-1.json NDC/CVX codes QA Error [FHIR-30104](https://jira.hl7.org/browse/FHIR-30104) See Change:
    - [Here](https://hl7.org/fhir/us/core/2022Jan/Immunization-imm-1.html)
    - [Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-immunization.html)
14. **Applied:** Non-substantive (Correction) Fix patient search parameter definitions to only target Patient  [FHIR-32305](https://jira.hl7.org/browse/FHIR-32305) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/SearchParameter-us-core-allergyintolerance-patient.json.html)
15. **Applied:** Non-substantive (Clarification) Provide a caution to the user that a query of MedicationRequest does not provide complete information. [FHIR-32720](https://jira.hl7.org/browse/FHIR-32720) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-medicationrequest.html#mandatory-and-must-support-data-elements)
16. **Applied:** Non-substantive (Correction) Fix title for BMI Profile [FHIR-32847](https://jira.hl7.org/browse/FHIR-32847) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-bmi.html)
17. **Applied:** Non-substantive (Enhancement) Remove unchanged elements from Differentials [FHIR-32848](https://jira.hl7.org/browse/FHIR-32848) [For example change see](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-diagnosticreport-lab.profile.json.html)
18. **Applied:** Non-substantive (Correction) Referencing incorrect figure [FHIR-32961](https://jira.hl7.org/browse/FHIR-32961) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/basic-provenance.html#clinical-information-reconciliation-and-incorporation)
19. **Applied:** Non-substantive (Correction) Fix us-core-1 Invariant for Observation [FHIR-33052](https://jira.hl7.org/browse/FHIR-33052) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-observation-lab.html#constraints)
20. **Applied:** Non-substantive (Correction) US Core to USCDI guidance page -    - add patient email [FHIR-33079](https://jira.hl7.org/browse/FHIR-33079) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-patient.html)
21. **Applied:** Non-substantive (Correction) Fix search parameter list [FHIR-33123](https://jira.hl7.org/browse/FHIR-33123) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/search-parameters-and-operations.html)
22. **Applied:** Non-substantive (Clarification) Clarify requirement on date searches without prefix [FHIR-33156](https://jira.hl7.org/browse/FHIR-33156) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/general-guidance.html#search-syntax.html)
23. **Applied:** Non-substantive (Clarification) Clarify distinction between repeated search params and "composite" params [FHIR-33159](https://jira.hl7.org/browse/FHIR-33159) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-observation-lab.html#notes)
24. **Applied:** Non-substantive (Correction) Add content as mandatory element in narrative for documentreference [FHIR-33160](https://jira.hl7.org/browse/FHIR-33160) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-documentreference.html)
25. **Applied:** Non-substantive (Correction) Fix invalid elements in extensions [FHIR-33233](https://jira.hl7.org/browse/FHIR-33233) See Change:
    - [Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-race.html)
    - [Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-birthsex.html)
    - [Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-direct.html)
26. **Applied:** Non-substantive (Enhancement) Clarify MustSupport for Observation.component.value[x] vs dataAbsentReason [FHIR-34061](https://jira.hl7.org/browse/FHIR-34061) See Change:
    - [Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-blood-pressure.html#mandatory-and-must-support-data-elements)
    - [Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-vital-signs.html#mandatory-and-must-support-data-elements)
27. **Applied:** Non-substantive (Correction) Fix Observation Examples using `appliesTo` [FHIR-34286](https://jira.hl7.org/browse/FHIR-34286) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/Observation-serum-calcium.html)
28. **Applied:** Non-substantive (Correction) Correct CapabilityStatement SMART IG reference [FHIR-34281](https://jira.hl7.org/browse/FHIR-34281) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/CapabilityStatement-us-core-server.html#should_igs)
29. **Applied:** Non-substantive (Correction) US Core search page is not working [FHIR-34028](https://jira.hl7.org/browse/FHIR-34028)     - Coordination with HL7 IG publishing team to Correct
30. **Applied**: Non-substantive (Correction) Correction on USCoreCarePlanProfile Binding [FHIR-32846](https://jira.hl7.org/browse/FHIR-32846) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-careplan.html)
31. **Applied**: Non-substantive (Correction) fix URL[See Change Here](https://hl7.org/fhir/us/core/2022Jan/search-parameters-and-operations.html#operations)

  **The Following Trackers Will be Applied Following this Ballot**

  Due external dependencies and publication tooling limitations, the application of these resolutions have been deferred.

 **Tracker Status**: **Change Summary** **Jira Issue [Link](#)** **Updated Content [Link](#)**

  1. **Resolved - change required**: US Core Pulse Oximetry Profile nonconformant UCUM Unit for Oxygen Concentration [FHIR-27845](https://jira.hl7.org/browse/FHIR-27845) -  Awaiting FHIR-4b updates to update base FHIR Vitals Profile, STU Note Present
  2. **Resolved - change required**: Patient Examples QA Errors: CDCREC code system in VSAC [FHIR-30105](https://jira.hl7.org/browse/FHIR-30105) - Coordination with VSAC and IG publishing team to Correct and align Code System OIDS between FHIR, CCDA, and VSAC, Note To Balloters Present
  3. **Resolved - change required**: valueset-simple-language.xml QA Error [FHIR-30107](https://jira.hl7.org/browse/FHIR-30107) - Coordination with IG publishing team to Correct - Note To Balloters present
  4. **Resolved - change required**: Display only differential invariants and terminology tables in Differential View [FHIR-30780](https://jira.hl7.org/browse/FHIR-30780) - Coordination with HL7 IG publishing team to Correct
  5. **Resolved - change required**: Confusing to reads invariants and terminology tables in Differential View [FHIR-30783](https://jira.hl7.org/browse/FHIR-30783) - Coordination with HL7 IG publishing team to Correct
  6. **Resolved - change required**: Wrong link to IG homepage from package manifest [FHIR-33132](https://jira.hl7.org/browse/FHIR-33132) - Coordination with HL7 IG publishing team to Correct


---

### Version = 4.0.0 (Meets USCDI v1 Requirements)
- Publication Date: 2021-06-28
- url: <https://hl7.org/fhir/us/core/STU4>
- Based on FHIR version : 4.0.1

#### Changes:
 The changes in this annual update to US Core have been reviewed and commented upon by the public through the January 2021 HL7 balloting process.  The resolution of the community comments has been agreed to and voted on by the members of the sponsoring work group [HL7 International Cross-Group Projects](http://www.hl7.org/Special/committees/cgp/index.cfm).

The key changes are summarized below:

1. New *Conformance Expectations* page
  - Defining different ways to implement and conform to US Core.
  - Clarification of the Must Support definitions as it relates to various FHIR elements such a choice datatype and references.
2. Publishing a set US Core Vital Signs independent of the FHIR core profile upon which it is based
  - *US Core Vital Signs Profile*
    - *US Core Blood Pressure Profile*
    - *US Core BMI Profile*
    - *US Core Head Circumference Profile*
    - *US Core Body Height Profile*
    - *US Core Body Weight Profile*
    - *US Core Body Temperature Profile*
    - *US Core Heart Rate Profile*
    - *US Core Respiratory Rate Profile*
3. Linking terminology directly to the FHIR® Terminology Service for VSAC Resources ([Value Set Authority Center (VSAC) - NIH](https://vsac.nlm.nih.gov/)) where applicable:
**US Core Value Set, VSAC Value Set, VSAC OID, extensional?** 1. Detailed ethnicity, Detailed Ethnicity, 2.16.840.1.114222.4.11.877, No 1. OMB Ethnicity Categories, Ethnicity, 2.16.840.1.114222.4.11.837, Yes 1. US Core CareTeam Provider Roles, Care Team Member Function, 2.16.840.1.113762.1.4.1099.30, Yes 1. US Core Medication Codes (RxNorm), Medication Clinical Drug, 2.16.840.1.113762.1.4.1010.4, Yes 1. US Core Provider Specialty (NUCC), Healthcare Provider Taxonomy, 2.16.840.1.114222.4.11.1066, No 1. US Core Smoking Status, Smoking Status, 2.16.840.1.113883.11.20.9.38, Yes 1. US Core Vaccine Administered Value Set (CVX), CVX Vaccines Administered Vaccine Set, 2.16.840.1.113762.1.4.1010.6, Yes 1. US Core Common substances for allergy and intolerance documentation including refutations, Common substances for allergy and intolerance documentation including refutations, 2.16.840.1.113762.1.4.1186.8, No
4. Migrating to the standard set of HL7 FHIR IG templates for publishing. Although we strove to minimize the differences between this version and the previous versions of US Core, these changes are notable:
   - Additional Features include:
        - Addition of vocabulary and constraint tables to the profile pages
        - Addition of a summary table and to the profile page introduction
        - Addition of "Snapshot Table (Must Support)" Tab to profile views
   - Due to restrictions on customizable content, the full narrative text summaries of profiles is no longer available.

5. Addressing over 90 January 2021 Ballot related trackers resulting in the followed detailed changes.

Listed below are the resolved trackers for this version:

**Tracker Status**: **Change Impact** **(Change Category)** **Change Summary** **Jira Issue [Link](#)** **Updated Content [Link](#)**

##### Non-compatible
1. **Applied:** Non-compatible (Correction)  Change $docref start and end input parameter types from `date` to `dateTime` ([FHIR-29825](https://jira.hl7.org/browse/FHIR-29825)) [See Change Here](https://hl7.org/fhir/us/core/STU4/OperationDefinition-docref.html)
2. **Applied:** Non-compatible (Correction) Allergy Intolerance example for UNKNOWN allergy status does not use unknown ([FHIR-30345](https://jira.hl7.org/browse/FHIR-30345)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-allergyintolerance.html#mandatory-and-must-support-data-elements)
3. **Applied:** Non-compatible (Enhancement)  Clarify UDI information. ([FHIR-30672](https://jira.hl7.org/browse/FHIR-30672)) See Changes:
    - [Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-implantable-device.html#mandatory-and-must-support-data-elements)
    - [Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-implantable-device.html#profile)

##### Compatible, substantive
4. **Applied:** Compatible, substantive (Correction) Update PractitionerRole.practitioner to )..1 MS ([FHIR-29681](https://jira.hl7.org/browse/FHIR-29681)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-practitionerrole.html#profile)
5. **Applied:** Compatible, substantive (Correction) Change CareTeam `status` search parameter compositeOR expectation to SHOULD ([FHIR-29768](https://jira.hl7.org/browse/FHIR-29768)) [See Change Here](https://hl7.org/fhir/us/core/STU4/SearchParameter-us-core-careteam-status.html)
6. **Applied:** Compatible, substantive (Clarification) Make custodian optional on document reference ([FHIR-30108](https://jira.hl7.org/browse/FHIR-30108)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-documentreference.html)
7. **Applied:** Compatible, substantive (Clarification) Update DocumentReference CCD operation ([FHIR-30110](https://jira.hl7.org/browse/FHIR-30110)) [See Change Here](https://hl7.org/fhir/us/core/STU4/OperationDefinition-docref.html)
8. **Applied:** Compatible, substantive (Clarification) Update DocumentReference MustSupport to choice of data or url ([FHIR-30111](https://jira.hl7.org/browse/FHIR-30111)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-documentreference.html#mandatory-and-must-support-data-elements)
9. **Applied:** Compatible, substantive (Correction) Allergy codes updated to snomed product hierarchy in VSAC([FHIR-30347](https://jira.hl7.org/browse/FHIR-30347)) [See Change Here](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1186.8/expansion)
10. **Applied:** Compatible, substantive (Enhancement) Updated MedicationRequest.authoredOn from mandatory to must support([FHIR-30430](https://jira.hl7.org/browse/FHIR-30430)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-medicationrequest.html#mandatory-and-must-support-data-elements)
11. **Applied:** Compatible, substantive (Clarification)  Update Encounter Type CPT Description ([FHIR-30470](https://jira.hl7.org/browse/FHIR-30470)) [See Change Here](https://hl7.org/fhir/us/core/STU4/ValueSet-us-core-encounter-type.html)
12. **Applied:** Compatible, substantive (Enhancement) Change URL for Healthcare Common Procedure Coding System (HCPCS) level II alphanumeric codes([FHIR-30655](https://jira.hl7.org/browse/FHIR-30655)) See Changes [Here](https://hl7.org/fhir/us/core/STU4/terminology.html#using-value-set-authority-center-vsac) and [Here](https://hl7.org/fhir/us/core/STU4/ValueSet-us-core-procedure-code.html)
13. **Applied:** Compatible, substantive (Clarification)  Make udi_HRF a *Must Support* element. ([FHIR-30670](https://jira.hl7.org/browse/FHIR-30670)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-implantable-device.html#mandatory-and-must-support-data-elements)
14. **Applied:** Compatible, substantive (Clarification) Update on Guidance on DataAbsentReason for Observations ([FHIR-30685](https://jira.hl7.org/browse/FHIR-30685)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-observation-lab.html#mandatory-and-must-support-data-elements)
15. **Applied:** Compatible, substantive (Clarification)  Update on Guidance on DataAbsentReason for Observations ([FHIR-30699](https://jira.hl7.org/browse/FHIR-30699)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-observation-lab.html#mandatory-and-must-support-data-elements)
16. **Applied:** Compatible, substantive (Clarification)  Mandate that CapabilityStatement.instantiates refer to US Core ([FHIR-30889](https://jira.hl7.org/browse/FHIR-30889)) [See Change Here](https://hl7.org/fhir/us/core/STU4/CapabilityStatement-us-core-server.html#shall_css)
17. **Applied:** Compatible, substantive (Clarification)  Update Must Support Bullet regarding missing data ([FHIR-31507](https://jira.hl7.org/browse/FHIR-31507)) [See Change Here](https://hl7.org/fhir/us/core/STU4/conformance-expectations.html#must-support-elements)
18. **Applied:** Compatible, substantive (Enhancement)  Update use context for Race and Ethnicity extensions ([FHIR-31008](https://jira.hl7.org/browse/FHIR-31008)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-race.html)
19. **Applied:** Compatible, substantive (Enhancement)  Add LOINC to procedure codes ([FHIR-31514](https://jira.hl7.org/browse/FHIR-31514)) [See Change Here](https://hl7.org/fhir/us/core/STU4/ValueSet-us-core-procedure-code.html)
20. **Applied:** Compatible, substantive (Enhancement)  Make PractitionerRole.organization must support and add invariant ([FHIR-29680](https://jira.hl7.org/browse/FHIR-29680)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-practitionerrole.html)

##### Non-substantive
21. **Applied:** Non-substantive (Enhancement) Provide guidance on the population of narrative ([FHIR-29777](https://jira.hl7.org/browse/FHIR-29777)) [See Change Here](https://hl7.org/fhir/us/core/STU4/general-guidance.html#narrative)
22. **Applied:** Non-substantive (Correction)  The history file markdown rendering of the table ([FHIR-30100](https://jira.hl7.org/browse/FHIR-30100)) [See Change Here](https://hl7.org/fhir/us/core/history.html)
23. **Applied:** Non-substantive (Correction) footnote rendering     - pre-applied ([FHIR-30101](https://jira.hl7.org/browse/FHIR-30101)) [See Change Here](https://hl7.org/fhir/us/core/STU4/general-guidance.html#guidance-on-limiting-the-number-of-search-results)
24. **Applied:** Non-substantive (Correction) Random Section Numbering (Reminder for tooling issue) ([FHIR-30102](https://jira.hl7.org/browse/FHIR-30102)) [See Change Here](https://hl7.org/fhir/us/core/STU4/toc.html)
25. **Applied:** Non-substantive (Enhancement) Move section 1.5 US Core Conformance Requirements ([FHIR-30103](https://jira.hl7.org/browse/FHIR-30103)) [See Change Here](https://hl7.org/fhir/us/core/STU4/conformance-expectations.html)
26. **Applied:** Non-substantive (Correction) Remove required binding on procedure and condition ([FHIR-30109](https://jira.hl7.org/browse/FHIR-30109)) See Changes:
    - [Here](https://hl7.org/fhir/us/core/STU4/conformance-expectations.html#extensible-binding-for-codeableconcept-datatype)
    - [Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-condition.html#profile)
    - [Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-procedure.html#profile)
27. **Applied:** Non-substantive (Clarification) Reference to 3 new document types     - addressing corresponding metadat ([FHIR-30112](https://jira.hl7.org/browse/FHIR-30112)) [See Change Here](https://hl7.org/fhir/us/core/STU4/clinical-notes-guidance.html#clinical-notes) AND [See Change Here](https://hl7.org/fhir/us/core/STU4/clinical-notes-guidance.html#support-requirements)
28. **Applied:** Non-substantive (Correction) Typo ([FHIR-30113](https://jira.hl7.org/browse/FHIR-30113))
29. **Applied:** Non-substantive (Enhancement) Clarify Must Support of Complex elements ([FHIR-30321](https://jira.hl7.org/browse/FHIR-30321)) [See Change Here](https://hl7.org/fhir/us/core/STU4/conformance-expectations.html#must-support---complex-elements)
30. **Applied:** Non-substantive (Enhancement) Clarify that VSAC FHIR API only retrieves a definition ([FHIR-30344](https://jira.hl7.org/browse/FHIR-30344)) [See Change Here](https://hl7.org/fhir/us/core/STU4/terminology.html#using-value-set-authority-center-vsac)
31. **Applied:** Non-substantive (Correction) Corrected allergy intolerance example SNOMED CT code ([FHIR-30346](https://jira.hl7.org/browse/FHIR-30346)) [See Change Here](https://hl7.org/fhir/us/core/STU4/AllergyIntolerance-example.html)
32. **Applied:** Non-substantive (Clarification) Clarify plans to align with Gender Harmony([FHIR-30350](https://jira.hl7.org/browse/FHIR-30350)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-patient.html#mandatory-and-must-support-data-elements)
33. **Applied:** Non-substantive (Correction) Typos on Conformance Expectations Page ([FHIR-30353](https://jira.hl7.org/browse/FHIR-30353)) [See Change Here](https://hl7.org/fhir/us/core/STU4/conformance-expectations.html)
34. **Applied:** Non-substantive (Enhancement) clarify use of additional codings ([FHIR-30354](https://jira.hl7.org/browse/FHIR-30354)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-vital-signs.html#mandatory-and-must-support-data-elements)
35. **Applied:** Non-substantive (Clarification) Clarify server requirements for Choice of Profile Elements scenario ([FHIR-30355](https://jira.hl7.org/browse/FHIR-30355)) [See Change Here](https://hl7.org/fhir/us/core/STU4/conformance-expectations.html#must-support---choice-of-profile-elements)
36. **Applied:** Non-substantive (Correction) Add all options to Procedure.performed[x] ([FHIR-30391](https://jira.hl7.org/browse/FHIR-30391)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-procedure.html#profile)
37. **Applied:** Non-substantive (Correction) Typo ([FHIR-30460](https://jira.hl7.org/browse/FHIR-30460)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-vital-signs.html#mandatory-and-must-support-data-elements)
38. **Applied:** Non-substantive (Clarification)  Clarify Missing Data language for coded data elements with required binding strength ([FHIR-30630](https://jira.hl7.org/browse/FHIR-30630)) [See Change Here](https://hl7.org/fhir/us/core/STU4/general-guidance.html#missing-data)
39. **Applied:** Non-substantive (Clarification) Note re language codes([FHIR-30654](https://jira.hl7.org/browse/FHIR-30654)) [See Change Here](https://hl7.org/fhir/us/core/STU4/ValueSet-simple-language.html#notes)
40. **Applied:** Non-substantive (Correction) Typo ([FHIR-30656](https://jira.hl7.org/browse/FHIR-30656))
41. **Applied:** Non-substantive (Clarification)  Explain the relationship between US CORE and an evolving USCDI. ([FHIR-30657](https://jira.hl7.org/browse/FHIR-30657)) [See Change Here](https://hl7.org/fhir/us/core/STU4/index.html)
42. **Applied:** Non-substantive (Correction) Correct 2 bullet points in section 1.2. ([FHIR-30658](https://jira.hl7.org/browse/FHIR-30658)) [See Change Here](https://hl7.org/fhir/us/core/STU4/index.html)
43. **Applied:** Non-substantive (Enhancement) Clarify actors ([FHIR-30659](https://jira.hl7.org/browse/FHIR-30659)) [See Change Here](https://hl7.org/fhir/us/core/STU4/index.html#us-core-actors)
44. **Applied:** Non-substantive (Enhancement) Edit basic provenance ([FHIR-30660](https://jira.hl7.org/browse/FHIR-30660)) [See Change Here](https://hl7.org/fhir/us/core/STU4/basic-provenance.html#clinical-information-reconciliation-and-incorporation)
45. **Applied:** Non-substantive (Clarification) Clarify the duplication requirement for scanned documents in DocumentReference and DiagnosticReport. ([FHIR-30662](https://jira.hl7.org/browse/FHIR-30662)) [See Change Here](https://hl7.org/fhir/us/core/STU4/clinical-notes-guidance.html#fhir-resources-to-exchange-clinical-notes)
46. **Applied:** Non-substantive (Clarification) Clarify that clients should retain data visualization between DSTU2 to R4 upgrades. ([FHIR-30665](https://jira.hl7.org/browse/FHIR-30665)) [See Change Here](https://hl7.org/fhir/us/core/STU4/DSTU2-to-R4-conversion.html#expectation-that-fhir-dstu2-data-is-preserved-in-fhir-r4)
47. **Applied:** Non-substantive (Clarification) Add provenance to writing/updating guidance? ([FHIR-30666](https://jira.hl7.org/browse/FHIR-30666)) [See Change Here](https://hl7.org/fhir/us/core/STU4/future-of-US-core.html)
48. **Applied:** Non-substantive (Clarification) Clarify Code System section and update codesystem table ([FHIR-30667](https://jira.hl7.org/browse/FHIR-30667)) [See Change Here](https://hl7.org/fhir/us/core/STU4/terminology.html#code-systems)
49. **Applied:** Non-substantive (Enhancement)  Clarify guidance on implantable medical devices. ([FHIR-30669](https://jira.hl7.org/browse/FHIR-30669)) [[See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-implantable-device.html#mandatory-and-must-support-data-elements)
50. **Applied:** Non-substantive (Correction) Clarify text ([FHIR-30673](https://jira.hl7.org/browse/FHIR-30673)) [See Change Here](https://hl7.org/fhir/us/core/STU4/conformance-expectations.html#conformance-expectations)
51. **Applied:** Non-substantive (Correction) Typos ([FHIR-30674](https://jira.hl7.org/browse/FHIR-30674))
52. **Applied:** Non-substantive (Clarification) Clarify prohibition on using contained resources. ([FHIR-30677](https://jira.hl7.org/browse/FHIR-30677)) [See Change Here](https://hl7.org/fhir/us/core/STU4/general-guidance.html#contained-resources)
53. **Applied:** Non-substantive (Clarification) Add guidance on suppressed data. ([FHIR-30678](https://jira.hl7.org/browse/FHIR-30678)) [See Change Here](https://hl7.org/fhir/us/core/STU4/general-guidance.html#suppressed-data)
54. **Applied:** Non-substantive (Clarification) Clarify what is meant by "support the other elements." ([FHIR-30680](https://jira.hl7.org/browse/FHIR-30680)) [See Change Here](https://hl7.org/fhir/us/core/STU4/conformance-expectations.html#must-support---choice-of-data-types)
55. **Applied:** Non-substantive (Correction) Typo([FHIR-30681](https://jira.hl7.org/browse/FHIR-30681))
56. **Applied:** Non-substantive (Correction) Fix typos ([FHIR-30683](https://jira.hl7.org/browse/FHIR-30683)) Various Changes
57. **Applied:** Non-substantive (Clarification) Clarify use of qualifier LOINCs ([FHIR-30690](https://jira.hl7.org/browse/FHIR-30690)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-vital-signs.html#mandatory-and-must-support-data-elements)
58. **Applied:** Non-substantive (Correction)  Fix Typo ([FHIR-30695](https://jira.hl7.org/browse/FHIR-30695)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-immunization-definitions.html)
59. **Applied:** Non-substantive (Correction)  Clarify what is intended with "additional observations"([FHIR-30772](https://jira.hl7.org/browse/FHIR-30772)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-vital-signs.html#mandatory-and-must-support-data-elements)
60. **Applied:** Non-substantive (Clarification)  Add statement about clinical safety to the security page ([FHIR-30776](https://jira.hl7.org/browse/FHIR-30776)) [See Change Here](https://hl7.org/fhir/us/core/STU4/security.html)
61. **Applied:** Non-substantive (Clarification)  Added clarification to vitals profile regarding use of additional codings and component observations. ([FHIR-30778](https://jira.hl7.org/browse/FHIR-30778)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-blood-pressure.html#mandatory-and-must-support-data-elements)
62. **Applied:** Non-substantive (Clarification)  Typo ([FHIR-30782](https://jira.hl7.org/browse/FHIR-30782)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-vital-signs.html#mandatory-and-must-support-data-elements)
63. **Applied:** Non-substantive (Clarification)  Clarify resource search requirements CapabilityStatements and provide guidance on search for multiple patients using Bulk data ([FHIR-30787](https://jira.hl7.org/browse/FHIR-30787)) See Changes:
    - [Here](https://hl7.org/fhir/us/core/STU4/general-guidance.html#searching-multiple-patients)
    - [Here](https://hl7.org/fhir/us/core/STU4/CapabilityStatement-us-core-server.html#condition)
64. **Applied:** Non-substantive (Clarification)  Add MedicationAdministration to the Future Page. ([FHIR-30788](https://jira.hl7.org/browse/FHIR-30788)) [See Change Here](https://hl7.org/fhir/us/core/STU4/future-of-US-core.html#future-candidate-requirements-under-consideration)
65. **Applied:** Non-substantive (Correction)  Fix text in $docref description ([FHIR-30810](https://jira.hl7.org/browse/FHIR-30810)) [See Change Here](https://hl7.org/fhir/us/core/STU4/OperationDefinition-docref.html)
66. **Applied:** Non-substantive (Correction)  Add binding so Vitals will render it in differential view ([FHIR-31391](https://jira.hl7.org/browse/FHIR-31391)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-vital-signs.html#profile)
67. **Applied:** Non-substantive (Correction)  Update to URI from OID for CDT in Procedure Code ValueSet ([FHIR-31556](https://jira.hl7.org/browse/FHIR-31556)) [See Change Here](https://hl7.org/fhir/us/core/STU4/ValueSet-us-core-procedure-code.html)
68. **Applied:** Non-substantive (Correction)  Add DocumentReference.content is under "must have" list ([FHIR-31364](https://jira.hl7.org/browse/FHIR-31364)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-documentreference.html#mandatory-and-must-support-data-elements)
69. **Applied:** Non-substantive (Clarification)  Add guidance on "POST based search" ([FHIR-31585](https://jira.hl7.org/browse/FHIR-31585)) See Changes:
    - [Here](https://hl7.org/fhir/us/core/STU4/general-guidance.html#search-syntax)
    - [Here](https://hl7.org/fhir/us/core/STU4/CapabilityStatement-us-core-server.html#behavior)
70. **Applied:** Non-substantive (Enhancement)  Add reference to Mapping from LOINC scale type to FHIR data type ([FHIR-31084](https://jira.hl7.org/browse/FHIR-31084)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-observation-lab.html#mandatory-and-must-support-data-elements)
71. **Applied:** Non-substantive (Clarification)  Update Observation.value[x] definition ([FHIR-31083](https://jira.hl7.org/browse/FHIR-31083)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-observation-lab-definitions.html#Observation.value[x])
72. **Applied:** Non-substantive (Correction)  Fix FHIRPath constraint for provenance-1([FHIR-31020](https://jira.hl7.org/browse/FHIR-31020)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-provenance.html)
73. **Applied:** Non-substantive (Correction)  Add guidance to BMI Profile([FHIR-32658](https://jira.hl7.org/browse/FHIR-32658)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-bmi.html)
74. **Applied:** Non-substantive (Clarification)  Write usage note for non-vaccination CVX codes([FHIR-31899](https://jira.hl7.org/browse/FHIR-31899)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-immunization.html#mandatory-and-must-support-data-elements)
75. **Applied:** Non-substantive (Clarification)  Clarify that Extensible binding can always provide a mapped code([FHIR-32010](https://jira.hl7.org/browse/FHIR-32010)) [See Change Here](https://hl7.org/fhir/us/core/STU4/conformance-expectations.html#extensible-binding-for-codeableconcept-datatype)
76. **Applied:** Non-substantive (Clarification)  Clarify RESTFul requirements([FHIR-31490](https://jira.hl7.org/browse/FHIR-31490)) See Changes:
    - [Here](https://hl7.org/fhir/us/core/STU4/index.html#introduction)
    - [Here](https://hl7.org/fhir/us/core/STU4/index.html#how-to-read-this-guide)
    - [Here](https://hl7.org/fhir/us/core/STU4/conformance-expectations.html#conformance-expectations)
    - [Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-allergyintolerance.html#notes)
77. **Applied:** Non-substantive (Correction)  fix Procedure Example error ([FHIR-30106](https://jira.hl7.org/browse/FHIR-30106)) [See Change Here](https://hl7.org/fhir/us/core/STU4/Procedure-rehab.html)
**Known issues:**

We are working to fix these issues that may come up when using US CORE.  We will correct them in a future version of the guide

Publishing

- [ ] **Resolved - change required**:Confusing for commercial vendor. Reads very confusing. ([FHIR-30783](https://jira.hl7.org/browse/FHIR-30783)) proposal is to make the differential tab the default view, see publishing plans [here](https://github.com/HL7/ig-template-base/issues/161)  timeline unknown.
- [ ] **Resolved - change required**:In most of the data elements – “Binding is from base FHIR and US Core Vital Signs”  Need this to be one single combined listing ([FHIR-30780](https://jira.hl7.org/browse/FHIR-30780)) proposal is to limit the terminology and invariants to view shown. see [Zulip chat](https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/Different.20views.20for.20tables.20and.20invariants) timeline unknown.
- [ ] **Resolved - change required**:Why are there separate codes for USCoreVitalSigns and the Systolic.value and the diastolic value? ([FHIR-30779](https://jira.hl7.org/browse/FHIR-30779)) proposal is to work with publishing to "clean up" terminology and invariants to view shown. see: see [Zulip chat](https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/Different.20views.20for.20tables.20and.20invariants) timeline unknown.

Terminology

- [ ] **Resolved - change required**: valueset-simple-language.xml QA error "Error from server: Language valuesets cannot be expanded as they are based on a grammar" ([FHIR-30107](https://jira.hl7.org/browse/FHIR-30107)) this error is still extant from prior version of US Core and has yet to be resolved. Work with publishing to fix and created [STU note](https://hl7.org/fhir/us/core/STU4/ValueSet-simple-language.html#notes). see [Zulip chat](https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/language.20valueset.20expansion.20error)
- [ ] **Resolved - change required**: Patient Examples QA Errors: CDCREC code system in VSAC Patient ([FHIR-30105](https://jira.hl7.org/browse/FHIR-30105)) CDCREC codes and code system value not aligned with VSAC. Workaround is to publish the [CDCREC code system and valuesets in USCore](https://hl7.org/fhir/us/core/STU4/terminology.html) until this content is moved to [HL7 Terminology](https://terminology.hl7.org/) Add an STU Note. [Zulip chat1](https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/cdcrec.20code.20errors.20in.20US.20Core) and [Zulip chat2](https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/Race.20Code.20System) and [Zulip chat3](https://chat.fhir.org/#narrow/stream/179202-terminology/topic/US.20CDCREC.20codessystems.20in.20HTA)
- [ ] **Resolved - change required**:imm-1.json NDC/CVX codes QA Error ([FHIR-30104](https://jira.hl7.org/browse/FHIR-30104)) Work with terminology server team to correct. see [Zulip chat](https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/CVX.20and.20NDC.20warnings.20in.20US.20Core)
- [ ] **Resolved - change required**:Pulse Ox Example: observation-satO2-fiO2 ([FHIR-27845](https://jira.hl7.org/browse/FHIR-27845)) Proposed Jira ticket to resolve in base made an [STU note](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-pulse-oximetry.html#mandatory-and-must-support-data-elements) that is technically not conformant with the base FHIR vital profile. See [Zulip chat](https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/US.20Core.20QA.20Issue.20.233-.20nasty.20profiling.20error)

---

### Version = 3.2.0
- Publication Date: 2021-1-30
- url: <https://hl7.org/fhir/us/core/2021Jan>
- Based on FHIR version : 4.0.1


#### Changes:
 The changes in this version have been voted on by the members of the sponsoring work group [HL7 International Cross-Group Projects](http://www.hl7.org/Special/committees/cgp/index.cfm).  This version addresses the following key issues:

1. Clarification of the Must Support definitions as it relates to:
  - Polymorphic datatypes, which of the possible types must be supported
  - Reference datatype (Reference, canonical) which of the target types must be supported
  - The vital signs profile in the Core Specification which profiles must be supported
  - New [Conformance Expectations](https://hl7.org/fhir/us/core/2021Jan/conformance-expectations.html) page
  (see individual trackers below for details)
1. Publishing a set US Core Vital Signs independent of the FHIR core profile upon which it is based (see individual trackers below for details)
  - [US Core Vital Signs Profile](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-vital-signs.html)
    - [US Core Blood Pressure Profile](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-blood-pressure.html)
    - [US Core BMI Profile](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-bmi.html)
    - [US Core Head Circumference Profile](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-head-circumference.html)
    - [US Core Body Height Profile](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-body-height.html)
    - [US Core Body Weight Profile](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-body-weight.html)
    - [US Core Body Temperature Profile](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-body-temperature.html)
    - [US Core Heart Rate Profile](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-heart-rate.html)
    - [US Core Respiratory Rate Profile](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-respiratory-rate.html)
1. Linking terminology directly to the FHIR® Terminology Service for VSAC Resources ([Value Set Authority Center (VSAC) - NIH](https://vsac.nlm.nih.gov/)) where applicable

  - We are seeking to resolve several technical and policy glitches when using VSAC directly prior to publishing which include the requirement to log in using your own UMLS API Key requiring a current UMLS account to view the value sets. [VSAC UMLS Licensing information](https://www.nlm.nih.gov/vsac/support/usingvsac/requestumlslicense.html).
  - To view the VSAC value set, use the link `https://vsac.nlm.nih.gov/valueset/{OID}/expansion` in your browser replacing the {OID} with the OID from the table below.
  - Enumerated (extensional) value sets can also be downloaded as a FHIR ValueSet resource. To do this, use the link `https://cts.nlm.nih.gov/fhir/ValueSet/{OID}` in your browser replacing the {OID} with the OID from the table below.
  - **NOTE that the Code System value used in FHIR® Terminology Service for VSAC Resources for Race and Ethnicity (CDCREC) concepts *does not* align with historical and current usage of OIDs in C-CDA and US Core. This issue has not been resolved in time for publication of the ballot version of this guide. As a result validation errors may occur when validating against this version of the US Core Patient Profile. Feedback on which code system value to use is welcome.**

    1. **US Core Value Set, VSAC Value Set, VSAC OID, extensional?**
    1. Detailed ethnicity, Detailed Ethnicity, 2.16.840.1.114222.4.11.877, No
    1. Detailed Race, Race, 2.16.840.1.113883.1.11.14914, No
    1. OMB Ethnicity Categories, Ethnicity, 2.16.840.1.114222.4.11.837, Yes
    1. US Core CareTeam Provider Roles, Care Team Member Function, 2.16.840.1.113762.1.4.1099.30, Yes
    1. US Core Medication Codes (RxNorm), Medication Clinical Drug, 2.16.840.1.113762.1.4.1010.4, Yes
    1. US Core Provider Specialty (NUCC), Healthcare Provider Taxonomy, 2.16.840.1.114222.4.11.1066, No
    1. US Core Smoking Status, Smoking Status, 2.16.840.1.113883.11.20.9.38, Yes
    1. US Core Vaccine Administered Value Set (CVX), CVX Vaccines Administered Vaccine Set, 2.16.840.1.113762.1.4.1010.6, Yes
    1. US Core Common substances for allergy and intolerance documentation including refutations, Common substances for allergy and intolerance documentation including refutations, 2.16.840.1.113762.1.4.1186.8, No

4. Migrating to the standard set of HL7 FHIR IG templates for publishing. Although we strove to minimize the differences between this version and the previous versions of US Core, these changes are notable:
   - Additional Features include:
        - Addition of vocabulary and constraint tables to the profile pages
        - Addition of a summary table and to the profile page introduction
        - Addition of "Snapshot Table (Must Support)" Tab to profile views
   - Due to restrictions on customizable content, the following features of prior versions are no longer available:
       - Full narrative text summaries of profiles  **NOTE: We are seeking feedback on whether to retain these full narrative text summaries for this guide (an example can be seen [here](https://hl7.org/fhir/us/core/StructureDefinition-us-core-allergyintolerance.html#formal-views-of-profile-content) by clicking on the "Text Summary" tab)***

5. Addressing over 95 outstanding trackers.


**Trackers items and links to the updated content**
listed below are the resolved trackers for this version:

**Tracker Status**: **Change Impact** **(Change Category)** **Change Summary** **Jira Issue [Link](#)** **Updated Content [Link](#)**

##### Non-compatible
1. **Applied:** Non-compatible (Correction)  Timing association for smoking status changed from `issued` to `effectiveDateTime` ([FHIR-28090](https://jira.hl7.org/browse/FHIR-28090)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-smokingstatus.html)
2. **Applied:** Non-compatible (Enhancement)  Change bindings from extensible to required for Condition.code value set: US Core Condition Category Codes Procedure.code value set: US Core Procedure Codes ([FHIR-29563](https://jira.hl7.org/browse/FHIR-29563)) See Changes Here:
    - [1 StructureDefinition-us-core-condition-definitions](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-condition.html)
    - [2 StructureDefinition-us-core-procedure-definitions](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-procedure.html)
3. **Applied:** Non-compatible (Correction)  Change binding for CareTeam.participant.role from NUCC to Care Team Member Function, replace the US Core Careteam Provider Roles Value Set with VSAC reference ([FHIR-27769](https://jira.hl7.org/browse/FHIR-27769)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-careteam.html)
4. **Applied:** Non-compatible (Enhancement)  Remove CVX-NDC mapping table ([FHIR-29745](https://jira.hl7.org/browse/FHIR-29745)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-immunization.html#FHIR-29745)

##### Compatible, substantive
5. **Applied:** Compatible, substantive (Enhancement)  Must Support Over Interpreted ([FHIR-28375](https://jira.hl7.org/browse/FHIR-28375)) Changes throughout the profiles -    - added conformance page [See Change Here](https://hl7.org/fhir/us/core/2021Jan/conformance-expectations.html)
6. **Applied:** Compatible, substantive (Correction)  Replace the US Core Update Allergy substances value set with VSAC reference ([FHIR-29322](https://jira.hl7.org/browse/FHIR-29322)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-allergyintolerance.html)
7. **Applied:** Compatible, substantive (Correction)  us-core-12 invariant interpretation ([FHIR-28942](https://jira.hl7.org/browse/FHIR-28942)) See Changes [Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-implantable-device.html#FHIR-28942)
8. **Applied:** Compatible, substantive (Clarification)  Make Provenance.author optional ([FHIR-28517](https://jira.hl7.org/browse/FHIR-28517)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-provenance.html#FHIR-28516)
9. **Applied:** Compatible, substantive (Clarification)  Remove Must Support from Patient.telecom ([FHIR-27731](https://jira.hl7.org/browse/FHIR-27731)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-patient.html#FHIR-27731)
10. **Applied:** Compatible, substantive (Clarification)  Remove Must Support from Patient.communication.language ([FHIR-27730](https://jira.hl7.org/browse/FHIR-27730)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-patient.html#FHIR-27731)
11. **Applied:** Compatible, substantive (Clarification)  Remove Must Support from us-core-birthsex extension ([FHIR-27729](https://jira.hl7.org/browse/FHIR-27729)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-patient.html#FHIR-27731)
12. **Applied:** Compatible, substantive (Clarification)  Remove Must Support from  us-core-ethnicity extension ([FHIR-27728](https://jira.hl7.org/browse/FHIR-27728)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-patient.html#FHIR-27731)
13. **Applied:** Compatible, substantive (Correction)  Remove Must Support from  us-core-race extension ([FHIR-27727](https://jira.hl7.org/browse/FHIR-27727)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-patient.html#FHIR-27731)
14. **Applied:** Compatible, substantive (Enhancement)  Add a required category to smoking status ([FHIR-28436](https://jira.hl7.org/browse/FHIR-28436)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-smokingstatus.html#FHIR-28436)
15. **Applied:** Compatible, substantive (Enhancement)  Encounter.serviceProvider Must Support and Encounter.location.location Optional ([FHIR-28392](https://jira.hl7.org/browse/FHIR-28392)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-encounter.html#FHIR-28392)
16. **Applied:** Compatible, substantive (Correction)  Observation.hasMember Vital Signs Panel Profile Reference Choice ([FHIR-28391](https://jira.hl7.org/browse/FHIR-28391)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/profiles-and-extensions.html#FHIR-28391)
17. **Applied:** Compatible, substantive (Clarification)  Add must support type choices for Observation.value[x] for Lab Observation Profile ([FHIR-28390](https://jira.hl7.org/browse/FHIR-28390)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-observation-lab.html)
18. **Applied:** Compatible, substantive (Correction)  Add must support type choices for Observation.effective[x] for Lab Observation Profile ([FHIR-28389](https://jira.hl7.org/browse/FHIR-28389)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-observation-lab.html)
19. **Applied:** Compatible, substantive (Clarification)  Add must support type choices for Immunization.occurrence[x] ([FHIR-28388](https://jira.hl7.org/browse/FHIR-28388)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-immunization.html)
20. **Applied:** Compatible, substantive (Clarification)  Add must support type choices for DiagnosticReport.effective[x] for Note Data ([FHIR-28387](https://jira.hl7.org/browse/FHIR-28387)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-diagnosticreport-note.html)
21. **Applied:** Compatible, substantive (Clarification)  Add must support type choices for DiagnosticReport.effective[x] for Lab Data Type ([FHIR-28385](https://jira.hl7.org/browse/FHIR-28385)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-diagnosticreport-lab.html)
22. **Applied:** Compatible, substantive (Clarification)  Add must support reference type choices for Provenance.agent.who Reference ([FHIR-28383](https://jira.hl7.org/browse/FHIR-28383)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-provenance.html)
23. **Applied:** Compatible, substantive (Clarification)  Add must support reference type choices for MedicationRequest.requester Reference ([FHIR-28382](https://jira.hl7.org/browse/FHIR-28382)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-medicationrequest.html)
24. **Applied:** Compatible, substantive (Enhancement)  Add must support reference type choices for MedicationRequest.reported Choice ([FHIR-28381](https://jira.hl7.org/browse/FHIR-28381)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-medicationrequest.html#FHIR-28381)
25. **Applied:** Compatible, substantive (Clarification)  Add must support reference type choices for  DocumentReference.author Reference ([FHIR-28380](https://jira.hl7.org/browse/FHIR-28380)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-documentreference.html)
26. **Applied:** Compatible, substantive (Clarification)  Add must support reference type choices for DiagnosticReport.performer for Note ([FHIR-28379](https://jira.hl7.org/browse/FHIR-28379)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-diagnosticreport-note.html)
27. **Applied:** Compatible, substantive (Clarification)  Add must support reference type choices for DiagnosticReport.performer for Lab ([FHIR-28378](https://jira.hl7.org/browse/FHIR-28378)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-diagnosticreport-lab.html)
28. **Applied:** Compatible, substantive (Clarification)  Add must support reference type choices for CareTeam.participant.member Reference ([FHIR-28376](https://jira.hl7.org/browse/FHIR-28376)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-careteam.html)
29. **Applied:** Compatible, substantive (Clarification)  Add choice for Procedure.performed[x] ([FHIR-29695](https://jira.hl7.org/browse/FHIR-29695)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-procedure.html)
30. **Applied:** Compatible, substantive (Clarification)  Clarify search by date precision conformance expectations ([FHIR-27906](https://jira.hl7.org/browse/FHIR-27906)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/general-guidance.html#FHIR-27906)
    - [General Guidance](https://hl7.org/fhir/us/core/2021Jan/general-guidance.html#FHIR-27906)
    - [Example in QuickStart](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-careplan.html#optional-search-parameters)
    - [Example in CapabilityStatement](https://hl7.org/fhir/us/core/2021Jan/CapabilityStatement-us-core-server.html#careplan)
31. **Applied:** Compatible, substantive (Enhancement)  Add "Cause of Death" to category codes to meet the Public Health Use Case for VRDR ([FHIR-27904](https://jira.hl7.org/browse/FHIR-27904)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/ValueSet-us-core-condition-category.html)
32. **Applied:** Compatible, substantive (Enhancement)  Change US Core Condition Codes Value Set Logical Definition ([FHIR-26060](https://jira.hl7.org/browse/FHIR-26060)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/ValueSet-us-core-condition-code.html)
33. **Applied:** Compatible, substantive (Enhancement)  Review vocabulary to align with CCDA and use VSAC valueset where possible ([FHIR-22488](https://jira.hl7.org/browse/FHIR-22488)) See Changes Here:
    - [Detailed ethnicity --> Detailed Ethnicity](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-ethnicity.html#profile)
    - [Detailed Race --> Race](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-race.html#profile)
    - [OMB Ethnicity --> Categories\|Ethnicity](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-ethnicity.html#profile)
    - [US Core Medication Codes (RxNorm) --> Medication Clinical Drug](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-medicationrequest.html) and [here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-medication.html#Medication.code)
    - [US Core Provider Specialty (NUCC) --> Healthcare Provider Taxonomy](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-practitionerrole.html)
    - [US Core Vaccine Administered Value Set (CVX) --> CVX Vaccines Administered Vaccine Set](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-immunization.html)

##### Non-substantive
34. **Applied:** Non-substantive (Correction)  Update Organization Quick Start Example Search. ([FHIR-29269](https://jira.hl7.org/browse/FHIR-29269)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-organization.html#quick-start)
35. **Applied:** Non-substantive (Correction)  birthsex binding applied to the wrong element in US Core Patient StructuredDefinition/differential ([FHIR-29262](https://jira.hl7.org/browse/FHIR-29262)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-patient.profile.json.html)
36. **Applied:** Non-substantive (Clarification)  Incorrect Description Observation.component (Pulse Ox) ([FHIR-28934](https://jira.hl7.org/browse/FHIR-28934)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-pulse-oximetry.html)
37. **Applied:** Non-substantive (Correction)  References should be constrained to use `reference` not `identifier` ([FHIR-28573](https://jira.hl7.org/browse/FHIR-28573)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/general-guidance.html#FHIR-28573)
38. **Applied:** Non-substantive (Correction)  Update USCorePatientName search description for consistency ([FHIR-28540](https://jira.hl7.org/browse/FHIR-28540)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-patient.html#quick-start)
39. **Applied:** Non-substantive (Clarification)  Add must support type choices for US Core Goal.target.due[x]. ([FHIR-28477](https://jira.hl7.org/browse/FHIR-28477)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-goal.html)
40. **Applied:** Non-substantive (Correction)  Immunization Profile Mandatory and Must Support Intro is missing attributes ([FHIR-28452](https://jira.hl7.org/browse/FHIR-28452)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-immunization.html#FHIR-28452)
41. **Applied:** Non-substantive (Correction)  DiagnosticReport-cardiology-report JSON and XML samples contain invalid hashes ([FHIR-28408](https://jira.hl7.org/browse/FHIR-28408)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/DiagnosticReport-cardiology-report.json.html)
42. **Applied:** Non-substantive (Clarification)  MedicationRequest.medication[x] ([FHIR-28395](https://jira.hl7.org/browse/FHIR-28395)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-medicationrequest.html#FHIR-28395)
43. **Applied:** Non-substantive (Correction)  Fix MedicationRequest.encounter reference ([FHIR-28258](https://jira.hl7.org/browse/FHIR-28258)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-medicationrequest.html)
44. **Applied:** Non-substantive (Correction)  Fix typo: "an another" -> "another" ([FHIR-28227](https://jira.hl7.org/browse/FHIR-28227)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-practitioner.html)
45. **Applied:** Non-substantive (Clarification)  Declare mustSupport on Organization telecom children ([FHIR-28216](https://jira.hl7.org/browse/FHIR-28216)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-organization.html)
46. **Applied:** Non-substantive (Correction)  Resolve remaining discrepancies with FHIR R4 Search Parameters ([FHIR-28181](https://jira.hl7.org/browse/FHIR-28181)) See Changes Here:
    - [1 SearchParameter-us-core-condition-onset-date](https://hl7.org/fhir/us/core/2021Jan/SearchParameter-us-core-condition-onset-date.html)
    - [2 SearchParameter-us-core-organization-name](https://hl7.org/fhir/us/core/2021Jan/SearchParameter-us-core-organization-name.html)
    - [3 SearchParameter-us-core-location-name](https://hl7.org/fhir/us/core/2021Jan/SearchParameter-us-core-location-name.html)
47. **Applied:** Non-substantive (Clarification)  Provenance without activity is not very useful ([FHIR-28179](https://jira.hl7.org/browse/FHIR-28179)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-provenance.html#FHIR-28179)
48. **Applied:** Non-substantive (Clarification)  Make Provenance.target.reference mandatory ([FHIR-28165](https://jira.hl7.org/browse/FHIR-28165)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-provenance.html)
49. **Applied:** Non-substantive (Correction)  Missing narrative Element ([FHIR-28159](https://jira.hl7.org/browse/FHIR-28159)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/Patient-example.html)
50. **Applied:** Non-substantive (Clarification)  "Updated guidance regarding gender and sex." ([FHIR-28138](https://jira.hl7.org/browse/FHIR-28138)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-patient.html#FHIR-28138)
51. **Applied:** Non-substantive (Correction)  Replace the US Core Smoking Status with VSAC reference ([FHIR-28123](https://jira.hl7.org/browse/FHIR-28123),[FHIR-26059](https://jira.hl7.org/browse/FHIR-26059)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-smokingstatus.html)
52. **Applied:** Non-substantive (Enhancement)  Expand US Core state value set to include US Military codes ([FHIR-26833](https://jira.hl7.org/browse/FHIR-26833)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/ValueSet-us-core-usps-state.html)
53. **Applied:** Non-substantive (Correction)  Fixed Value Set Expansion Operation examples ([FHIR-26625](https://jira.hl7.org/browse/FHIR-26625)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/clinical-notes-guidance.html#FHIR-26625)
54. **Applied:** Non-substantive (Correction)  Add must support reference type choices for US Core laboratory DiagnosticReport.performer ([FHIR-25120](https://jira.hl7.org/browse/FHIR-25120)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-diagnosticreport-lab.html)
55. **Applied:** Non-substantive (Correction)  Fix US-Core-1 constraint on Observation.effectivePeriod ([FHIR-29658](https://jira.hl7.org/browse/FHIR-29658)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-observation-lab.html)
56. **Applied:** Non-substantive (Clarification)  Remove text "an author responsible for the update". Keep author organization ([FHIR-28516](https://jira.hl7.org/browse/FHIR-28516)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-provenance.html#FHIR-28516)
57. **Applied:** Non-substantive (Clarification)  "Clarify expectations when accessing "other endpoint" for DocumentReference.content.attachment.url" ([FHIR-28472](https://jira.hl7.org/browse/FHIR-28472)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-documentreference.html#FHIR-28472)
58. **Applied:** Non-substantive (Clarification)  Use of US Core Profile when not explicitly referenced when using Contained resources ([FHIR-28396](https://jira.hl7.org/browse/FHIR-28396)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/general-guidance.html#FHIR-28396)
59. **Applied:** Non-substantive (Clarification)  DocumentReference.custodian to be Optional ([FHIR-28393](https://jira.hl7.org/browse/FHIR-28393)) [See *Proposed* Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-documentreference.html#FHIR-28393)
60. **Applied:** Non-substantive (Correction)  Add choice for and type choices for Encounter.reasonReference ([FHIR-27951](https://jira.hl7.org/browse/FHIR-27951)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-encounter.html#FHIR-27951)
61. **Applied:** Non-substantive (Clarification)  Clarify deleted resources requirements and guidance ([FHIR-28091](https://jira.hl7.org/browse/FHIR-28091)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/general-guidance.html#FHIR-28091)
62. **Applied:** Non-substantive (Clarification)  Clarify search by reference conformance expectations ([FHIR-27905](https://jira.hl7.org/browse/FHIR-27905)) See Changes Here:
    - [General Guidance](https://hl7.org/fhir/us/core/2021Jan/general-guidance.html#FHIR-27905)
    - [Example in QuickStart](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-careplan.html#optional-search-parameters)
    - [Example in CapabilityStatement](https://hl7.org/fhir/us/core/2021Jan/CapabilityStatement-us-core-server.html#careplan)
63. **Applied:** Non-substantive (Clarification)  Address non-implantable device and how to document usage ([FHIR-27896](https://jira.hl7.org/browse/FHIR-27896), [FHIR-23715](https://jira.hl7.org/browse/FHIR-23715), [FHIR-23715](https://jira.hl7.org/browse/FHIR-23715)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/future-of-US-core.html#FHIR-27896)
64. **Applied:** Non-substantive (Clarification)  Resource constraints based on Jurisdiction which are not well documented ([FHIR-27810](https://jira.hl7.org/browse/FHIR-27810)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-implantable-device.html#FHIR-27810)
65. **Applied:** Non-substantive (Clarification)  Updated CPT copyright to current year ([FHIR-27770](https://jira.hl7.org/browse/FHIR-27770)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/ValueSet-us-core-encounter-type.html)
66. **Applied:** Non-substantive (Enhancement)  Remove US Core Server Capability Statement *requires* support for HTTP status 410-deleted ([FHIR-26597](https://jira.hl7.org/browse/FHIR-26597)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/CapabilityStatement-us-core-server.html#behavior)
67. **Applied:** Non-substantive (Clarification)  Recommend against using SSN for Patient.identifier ([FHIR-24903](https://jira.hl7.org/browse/FHIR-24903)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-patient.html#FHIR-24903)
68. **Applied:** Non-substantive (Correction)  Remove identifier (OID) from ValueSet: US Core Encounter Type ([FHIR-29691](https://jira.hl7.org/browse/FHIR-29691)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/ValueSet-us-core-encounter-type.html)
69. **Applied:** Non-substantive (Correction)  Since CarePlan.text.div is min== 1 add must support == true element to be consistent with US Core design ([FHIR-29765](https://jira.hl7.org/browse/FHIR-29765)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-careplan.html)
70. **Applied:** Non-substantive (Correction)  Remove unused US Core ICD-10-PCS Procedure Codes valueset ([FHIR-29822](https://jira.hl7.org/browse/FHIR-29822))
71. **Applied:** Non-substantive (Correction)  Remove Clinical Notes Guidance References to ONC 2019 NPRM and move requirements to main body ([FHIR-29824](https://jira.hl7.org/browse/FHIR-29824)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/clinical-notes-guidance.html)

---

### Version = 3.1.1 (Meets USCDI V1 requirements)
- Publication Date: 2020-6-30
- url: <https://hl7.org/fhir/us/core/STU3.1.1>
- Based on FHIR version : 4.0.1

#### Changes:
 This update addresses several technical corrections and errata and clarifications. They have been reviewed and voted on by the members of the [HL7 International Cross-Group Projects WorkGroup](http://www.hl7.org/Special/committees/cgp/index.cfm) who is sponsoring this errata release and reconciliation of the comments.:

**Tracker Status**: **Change Impact** **(Change Category)** **Change Summary** **Jira Issue [Link](#)**

##### Non-compatible
1. **Applied:** Non-compatible (Correction)  Corrected [US Core Pulse Oximetry Profile](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-pulse-oximetry.html#formal-views-of-profile-content) component.valueQuantity.code and component.valueQuantity.unit min from 0 to 1 to be consistent with the valueQuantity constraints within US Core ([FHIR-27846](https://jira.hl7.org/browse/FHIR-27846))
2. **Applied:** Non-compatible (Correction)  Correct system URI for [ICD-10 procedure codes](https://hl7.org/fhir/us/core/STU3.1.1/ValueSet-us-core-procedure-icd10pcs.html) ([FHIR-26679](https://jira.hl7.org/browse/FHIR-26679)).

##### Compatible, substantive
3. **Applied:** Compatible, substantive (Correction)  Corrected [US Core DocumentReference Profile](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-documentreference-definitions.html#DocumentReference.content) to support multiple attachments ([FHIR-25778](https://jira.hl7.org/browse/FHIR-25778)).
4. **Applied:** Compatible, substantive (Correction)  [Remove Must Support References](https://hl7.org/fhir/us/core/STU3.1.1/general-guidance.html#referencing-us-core-profiles) to non US Core Profiles ([FHIR-27876](https://jira.hl7.org/browse/FHIR-27876))
5. **Applied:** Compatible, substantive (Correction)  Add missing [reaction](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-allergyintolerance-definitions.html#AllergyIntolerance.reaction) to the US Core AllergyIntolerance Profile ([FHIR-27867](https://jira.hl7.org/browse/FHIR-27867)).
6. **Applied:** Compatible, substantive (Correction)  Update [Procedure Codes Value Set](https://hl7.org/fhir/us/core/STU3.1.1/ValueSet-us-core-procedure-code.html) to include ICD-10 PCS codes ([FHIR-27836](https://jira.hl7.org/browse/FHIR-27836))
7. **Applied:** Compatible, substantive (Correction)  Update [Procedure Codes Value Set](https://hl7.org/fhir/us/core/STU3.1.1/ValueSet-us-core-procedure-code.html) to include CDT codes ([FHIR-27737](https://jira.hl7.org/browse/FHIR-27737))
8. **Applied:** Compatible, substantive (Correction)  Clarify that pediatric vital sign percentile Observations should [reference growth chart](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-pediatric-bmi-for-age.html#mandatory-and-must-support-data-elements) ([FHIR-27549](https://jira.hl7.org/browse/FHIR-27549)),
9. **Applied:** Compatible, substantive (Correction)  Added Missing [US core Head Occipital-frontal Circumference Percentile Profile](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-head-occipital-frontal-circumference-percentile.html) ([FHIR-27542](https://jira.hl7.org/browse/FHIR-27542)).
10. **Applied:** Compatible, substantive (Correction)  Correct requirements for supporting [CLIA identifiers](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-organization.html#mandatory-and-must-support-data-elements) ([FHIR-27158](https://jira.hl7.org/browse/FHIR-27158))
11. **Applied:** Compatible, substantive (Correction)  **review period comments** Update [smoking status codes](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-smokingstatus-definitions.html#Observation.value[x]:valueCodeableConcept) to align with USCDI ([FHIR-27082](https://jira.hl7.org/browse/FHIR-27082)).
12. **Applied:** Compatible, substantive (Correction)  Change valueCode min from 0 to 1 for [US Core Birth Sex Extension](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-birthsex-definitions.html#Extension.valueCode) and valueBoolean min from 0 to 1 for[US Core Direct email Extension](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-direct-definitions.html#Extension.valueBoolean) ([FHIR-26459](https://jira.hl7.org/browse/FHIR-26459)).
13. **Applied:** Compatible, substantive (Correction)  Change valueQuantity min from 1 to 0 for [US Core Pediatric BMI for Age Observation Profile](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-pediatric-bmi-for-age-definitions.html#Observation.valueQuantity) and [US Core Pediatric Weight for Height Observation Profile](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-pediatric-weight-for-height-definitions.html#Observation.valueQuantity) ([FHIR-26363](https://jira.hl7.org/browse/FHIR-26363)).
14. **Applied:** Compatible, substantive (Correction)  Corrected the wording "should support" to "shall support" in [Clinical Notes Guidance](https://hl7.org/fhir/us/core/STU3.1.1/clinical-notes-guidance.html#clinical-notes) ([FHIR-25455](https://jira.hl7.org/browse/FHIR-25455)).

##### Non-substantive
15. **Applied:** Non-substantive (Correction)  Add guidance for representing patient name suffix and previous patient name to the [US Core Patient Profile](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-patient.html#mandatory-and-must-support-data-elements) ([FHIR-28129](https://jira.hl7.org/browse/FHIR-28129))
16. **Applied:** Non-substantive (Correction)  Correct copy/paste error in [Goal Profile](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-goal-definitions.html#Goal.lifecycleStatus) ([FHIR-28109](https://jira.hl7.org/browse/FHIR-28109))
17. **Applied:** Non-substantive (Correction)  Correct [US Core Provider Specialty (NUCC) ValueSet ](https://hl7.org/fhir/us/core/STU3.1.1/ValueSet-us-core-provider-specialty.html) to hide abstract grouping codes ([FHIR-27975](https://jira.hl7.org/browse/FHIR-27975))
18. **Applied:** Non-substantive (Correction)  Added example of US Core Direct Extension to [Practitioner-2 Example](https://hl7.org/fhir/us/core/STU3.1.1/Practitioner-practitioner-2.html) ([FHIR-27947](https://jira.hl7.org/browse/FHIR-27947))
19. **Applied:** Non-substantive (Correction)  Corrected technical errors in [pediatric profiles StructureDefinitions](https://hl7.org/fhir/us/core/STU3.1.1/profiles.html#profiles) ([FHIR-27946](https://jira.hl7.org/browse/FHIR-27946))
20. **Applied:** Non-substantive (Correction)  Corrected errors in [DiagnosticReport Cardiology Example](https://hl7.org/fhir/us/core/STU3.1.1/DiagnosticReport-cardiology-report.html) ([FHIR-27913](https://jira.hl7.org/browse/FHIR-27913))
21. **Applied:** Non-substantive (Correction)  Update [Federal Register link](https://hl7.org/fhir/us/core/STU3.1.1/ValueSet-omb-race-category.html) for OMB race and ethnicity category classifications. ([FHIR-27907](https://jira.hl7.org/browse/FHIR-27907))
22. **Applied:** Non-substantive (Clarification)  Clarified [token search syntax](https://hl7.org/fhir/us/core/STU3.1.1/general-guidance.html#search-syntax) ([FHIR-27897](https://jira.hl7.org/browse/FHIR-27897)).
23. **Applied:** Non-substantive (Correction)  Fix FHIRPath Expression in [USCoreGoalTargetDate](https://hl7.org/fhir/us/core/STU3.1.1/SearchParameter-us-core-goal-target-date.html) ([FHIR-27892](https://jira.hl7.org/browse/FHIR-27892)).
24. **Applied:** Non-substantive (Correction)  Fix FHIRPath Expression in [USCoreProcedureDate](https://hl7.org/fhir/us/core/STU3.1.1/SearchParameter-us-core-procedure-date.html)([FHIR-27887](https://jira.hl7.org/browse/FHIR-27887)).
25. **Applied:** Non-substantive (Correction)  Add omitted ["ge" comparators to SearchParameters](https://hl7.org/fhir/us/core/STU3.1.1/SearchParameter-us-core-goal-target-date.html) ([FHIR-27893](https://jira.hl7.org/browse/FHIR-27893)).
26. **Applied:** Non-substantive (Correction)  Clarify [reference to US Core Patient](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-pediatric-bmi-for-age.html#mandatory-and-must-support-data-elements) in Vitals Signs Profiles ([FHIR-27857](https://jira.hl7.org/browse/FHIR-27857)).
27. **Applied:** Non-substantive (Correction)  Correct UCUM Unit in [US Core Pulse Oximetry Profile Text Summary](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-pulse-oximetry.html#summary-of-the-must-support-requirements) ([FHIR-27845](https://jira.hl7.org/browse/FHIR-27845))
28. **Applied:** Non-substantive (Clarification)  Change Description of [ICD-10-PCS Value Set](https://hl7.org/fhir/us/core/STU3.1.1/ValueSet-us-core-procedure-icd10pcs.html) ([FHIR-27116](https://jira.hl7.org/browse/FHIR-27116))
29. **Applied:** Non-substantive (Correction)  Correct [AllergyIntolerance guidance](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-allergyintolerance.html#mandatory-and-must-support-data-elements) for verificationStatus ([FHIR-27096](https://jira.hl7.org/browse/FHIR-27096))
30. **Applied:** Non-substantive (Correction)  Fix example [US Core heart-rate example](https://hl7.org/fhir/us/core/STU3.1.1/Observation-heart-rate.html) ([FHIR-27086](https://jira.hl7.org/browse/FHIR-27086))
31. **Applied:** Non-substantive (Correction)  Fix invariant [provenance-1](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-provenance-definitions.html#who) ([FHIR-27065](https://jira.hl7.org/browse/FHIR-27065))
32. **Applied:** Non-substantive (Correction)  Fix invalid [json snippet](https://hl7.org/fhir/us/core/STU3.1.1/general-guidance.html#missing-data) ([FHIR-27001](https://jira.hl7.org/browse/FHIR-27001))
33. **Applied:** Non-substantive (Clarification)  **review period comments** Remove Provenance requirement from Medication, Location, Practitioner, PractitionerRole, and Organization and correct copy and paste error to Medication and Provenance searchType support in [CapabilityStatement](https://hl7.org/fhir/us/core/STU3.1.1/CapabilityStatement-us-core-server.html#resource--details) ([FHIR-26840](https://jira.hl7.org/browse/FHIR-26840), [FHIR-28161](https://jira.hl7.org/browse/FHIR-28161)).
34. **Applied:** Non-substantive (Clarification)  Correction on [USCDI Table](https://hl7.org/fhir/us/core/STU3.1.1/general-guidance.html#us-core-data-for-interoperability-and-2015-edition-common-clinical-data-set) change "MedicationStatement" to "MedicationRequest" and remove references to MedicationStatement in the Medication Profile and CapabilityStatements ([FHIR-26840](https://jira.hl7.org/browse/FHIR-26840)).
35. **Applied:** Non-substantive (Clarification)  Clarify that US Core Location/PractitionerRole are [not being referenced](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-encounter.html#mandatory-and-must-support-data-elements) by other resources ([FHIR-26840](https://jira.hl7.org/browse/FHIR-26840)).
36. **Applied:** Non-substantive (Clarification)  Correct editing error restoring Write and Operation capability guidance into [DocumentReference QuickStart](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-documentreference.html#quick-start) ([FHIR-26840](https://jira.hl7.org/browse/FHIR-26840)).
37. **Applied:** Non-substantive (Clarification)  Clarify [guidance](https://hl7.org/fhir/us/core/STU3.1.1/general-guidance.html#search-for-servers-requiring-status) that servers SHALL support search with status if status required ([FHIR-26840](https://jira.hl7.org/browse/FHIR-26840)).
38. **Applied:** Non-substantive (Correction)  Correct canonical url for ImplementationGuide ([FHIR-26686](https://jira.hl7.org/browse/FHIR-26686)).
39. **Applied:** Non-substantive (Correction)  Fix invariant [us-core-1](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-condition-definitions.html#Condition) ([FHIR-26605](https://jira.hl7.org/browse/FHIR-26605)).
40. **Applied:** Non-substantive (Correction)  Add page contents to [Clinical Notes Guidance](https://hl7.org/fhir/us/core/STU3.1.1/clinical-notes-guidance.html) and [Basic Provenance](https://hl7.org/fhir/us/core/STU3.1.1/basic-provenance.html) pages ([FHIR-25785](https://jira.hl7.org/browse/FHIR-25785)).
41. **Applied:** Non-substantive (Correction)  Fix duplicate URL causing validation failure. ([FHIR-25536](https://jira.hl7.org/browse/FHIR-25536)).
42. **Applied:** Non-substantive (Correction)  Fix Invariant [us-core-8](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-patient-definitions.html#Patient.name) ([FHIR-25459](https://jira.hl7.org/browse/FHIR-25459)).
43. **Applied:** Non-substantive (Correction)  Fix Invariant [us-core-8](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-patient-definitions.html#Patient.name) to allow for Data Absent Reason Extension on Patient name.([FHIR-25249](https://jira.hl7.org/browse/FHIR-25249)).
44. **Applied:** Non-substantive (Correction)  Fix Link to LOINC LP29708-2 ([FHIR-25213](https://jira.hl7.org/browse/FHIR-25213)).
45. **Applied:** Non-substantive (Correction)  Corrected [guidance](https://hl7.org/fhir/us/core/STU3.1.1/all-meds.html#fetching-all-medications-active-medications-and-all-medications-for-an-encounter) for conveying "Patient-Reported medications" ([FHIR-25035](https://jira.hl7.org/browse/FHIR-25035))

---


To review changes to US Core versions earlier than 3.1.1, refer to the [USCore 7.0.0 Change Log](https://hl7.org/fhir/us/core/STU7/changes.html).

{% include link-list.md %}
