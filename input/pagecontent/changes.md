
The **US Core Implementation Guide Change Log** captures updates, enhancements, clarifications, and corrections across multiple versions, reflecting community feedback, ballot processes, and alignment with evolving USCDI standards.

### How to Review Updates Between Versions
1. **Identify Your Starting Point**: Determine the version you’re currently using (e.g., 7.0.0) and the target version (e.g., 8.0.0). Each version builds on the previous version including intermediate ballot-related updates (e.g., January 2025 for v 8.0.0) so don't skip them when reviewing changes.
1. **Review Version Summaries**: Start with the “What’s New” section for each version including intermediate ballot versions to get a summary of important updates to the guide (e.g., new profiles in v8.0.0 supporting USCDI v5).
1. **Examine Detailed Changes**: Review the “Changes” section for each version for a complete list of a changes to the guide. Click the Jira Tracker (e.g., FHIR-123) links to see the underlying issue and resolution, and click on the  “See Changes Here” links to view modified content directly in the guide.
1. **Compare Across Versions**: For a deeper analysis, refer to the [Changes Between Versions] page for detailed FHIR artifact comparisons.


### Version = 8.0.0 (Meets USCDI v5 Requirements)
- url: <https://hl7.org/fhir/us/core/STU8/>
- Based on FHIR version: 4.0.1

The changes in this annual update to US Core have been reviewed and commented upon by the public through the January 2025 HL7 balloting process. The HL7 International Cross-Group Projects work group members have agreed to and voted on the resolution of the community comments.
#### What's new in Version 8.0.0 of US Core:

Each update to a new version of US Core changes the US Core Profiles and conformance expectations. Implementers can find detailed comparisons between the FHIR artifacts in this 8.0.0 version of US Core and each previous major release on [Changes Between Versions] page. Below is an overview of significant changes between Version 8.0.0 and Version 8.0.0-ballot of US Core.

{% include whats-new/v8.md %}

#### Changes:

The ballot-related comments resulted in over 100 changes to this specification, which are listed below:

**Tracker Status**: **(Change Category)** **Summary** **[Jira Issue](#)** **[Link to Updated Content](#)**

1. **Applied:** (Clarification) Discourage use of  ICD-10-CM header codes. [FHIR-48742](https://jira.hl7.org/browse/FHIR-48742) See Changes Here:
    - [US Core Condition Encounter Diagnosis Profile](StructureDefinition-us-core-condition-encounter-diagnosis.html)
    - [US Core Condition Problems and Health Concerns Profile](StructureDefinition-us-core-condition-problems-health-concerns.html)
2. **Applied:** (Correction) Remove additional USCDI tag from Element [FHIR-48754](https://jira.hl7.org/browse/FHIR-48754) See Changes [Here](StructureDefinition-us-core-observation-screening-assessment.html)
3. **Applied:** (Clarification) Add guidance on reference to Observation target  [FHIR-48756](https://jira.hl7.org/browse/FHIR-48756) See Changes [Here](StructureDefinition-us-core-observation-screening-assessment.html)
4. **Applied:** (Clarification) Add conformance rule about using US Core profiles with Operations [FHIR-48822](https://jira.hl7.org/browse/FHIR-48822) See Changes [Here](general-guidance.html)
5. **Applied:** (Enhancement) Change Screening Assessment Profile category:screening-assessment to Add'l USCDI [FHIR-48849](https://jira.hl7.org/browse/FHIR-48849) See Changes [Here](StructureDefinition-us-core-observation-screening-assessment.html)
6. **Applied:** (Enhancement) Change Problems category to Add'l USCDI [FHIR-48850](https://jira.hl7.org/browse/FHIR-48850) See Changes [Here](StructureDefinition-us-core-condition-problems-health-concerns.html)
7. **Applied:** (Clarification) Remove STU Note regarding the Argonauts 2023 SMART Imaging Access project [FHIR-48851](https://jira.hl7.org/browse/FHIR-48851) See Changes [Here](StructureDefinition-us-core-diagnosticreport-note.html)
8. **Applied:** (Correction)  Typo "PractitionerRole" instead of "PracitionRole" [FHIR-48866](https://jira.hl7.org/browse/FHIR-48866) See Changes [Here](CapabilityStatement-us-core-server.html#healthcareservice)
9. **Applied:** (Clarification) Document how to find code systems for value sets in VSAC [FHIR-48889](https://jira.hl7.org/browse/FHIR-48889) See Changes Here: 
     - [Terminology](terminology.html#the-value-set-authority-center-vsac)
     - [VSAC to FHIR Code System Mapping Table](vsacname-fhiruri-map.html)
10. **Applied** (Correction) Update THO code system link [FHIR-49009](https://jira.hl7.org/browse/FHIR-49009) See Changes [Here](ValueSet-us-core-provenance-participant-type.html)
11. **Applied:** (Correction) Typo "content.attachment.url/data" instead of "content.url/data" [FHIR-49023](https://jira.hl7.org/browse/FHIR-49023) See Changes Here:
       - [US Core DocumentReference Profile](StructureDefinition-us-core-documentreference.html)
       - [US Core ADI DocumentReference - Profile ](StructureDefinition-us-core-adi-documentreference.html)
12. **Applied:** (Correction) Add Provenance Author and Author Role to USCDI Table [FHIR-49024](https://jira.hl7.org/browse/FHIR-49024) See Changes [Here](uscdi.html)
13. **Applied:** (Clarification) Clarify the guidance using a MedicationRequest query to access "all medications" or "all active medications". [FHIR-49038](https://jira.hl7.org/browse/FHIR-49038) See Changes [Here](medication-list.html#fetching-all-medications-active-medications-and-all-medications-for-an-encounter)
14. **Applied:** (Clarification) Clarify MedicationRequest Profile Specific Implementation Guidance on fetching active medications: [FHIR-49039](https://jira.hl7.org/browse/FHIR-49039) See Changes [Here](StructureDefinition-us-core-medicationrequest.html#mandatory-and-must-support-data-elements)
15. **Applied:** (Correction) Add author provenance documentation to all profiles listed Individual Level Provenance table.[FHIR-49064](https://jira.hl7.org/browse/FHIR-49064) For example, see Changes [Here](StructureDefinition-us-core-observation-screening-assessment.html)
16. **Applied:** (Correction) Define the use of use the term "certifying Server system" and remove it from US Core Observation Screening Assessment Profile. [FHIR-49065](https://jira.hl7.org/browse/FHIR-49065) See Changes Here:
      - [US Core Observation Screening Assessment Profile](StructureDefinition-us-core-observation-screening-assessment.html) 
      - [Additional USCDI Requirements](must-support.html#additional-uscdi-requirements) 
17. **Applied:** (Correction) Corrected MS target for MedicationRequest.requester and .reportedReference data elements in Individual Level Provenance Table [FHIR-49066](https://jira.hl7.org/browse/FHIR-49066) See Changes [Here](basic-provenance.html#individual-level-provenance)
18. **Applied:** (Correction) Plural vs singular wording for provenance elements [FHIR-49067](https://jira.hl7.org/browse/FHIR-49067) See Changes [Here](StructureDefinition-us-core-immunization.html)
19. **Applied:** (Correction) Typo "service should happen" instead of "serviceSHOULDhappen" [FHIR-49068](https://jira.hl7.org/browse/FHIR-49068) See Changes [Here](StructureDefinition-us-core-servicerequest.html)
20. **Applied:** (Clarification) Clarify narrative section on ServiceRequest.code content [FHIR-49069](https://jira.hl7.org/browse/FHIR-49069) See Changes [Here](StructureDefinition-us-core-servicerequest.html#mandatory-and-must-support-data-elements)
21. **Applied:** (Correction) typo "and" instead of "amd" [FHIR-49087](https://jira.hl7.org/browse/FHIR-49087) See Changes [Here](index.html#home)
22. **Applied:** (Correction) Fix link [FHIR-49089](https://jira.hl7.org/browse/FHIR-49089) See Changes [Here](https://hl7.org/fhir/us/core/STU7/changes.html#the-january-2024-ballot)
23. **Applied:** (Correction) typo "RESTful" instead of "RESTfUl" [FHIR-49090](https://jira.hl7.org/browse/FHIR-49090) See Changes [Here](general-requirements.html#us-core-conformance-artifacts)
24. **Applied:** (Correction) Correct figure label [FHIR-49095](https://jira.hl7.org/browse/FHIR-49095) See Changes [Here](must-support.html#key-elements-table-view)
25. **Applied:** (Correction) Add missing word "support" [FHIR-49098](https://jira.hl7.org/browse/FHIR-49098) See Changes [Here](must-support.html#must-support---complex-elements)
26. **Applied:** (Correction) Add missing word "and" [FHIR-49099](https://jira.hl7.org/browse/FHIR-49099) See Changes [Here](must-support.html#must-support-targets-for-us-core-profiles)
27. **Applied:** (Correction) Update Specimen code to specimen type code in narrative [FHIR-49100](https://jira.hl7.org/browse/FHIR-49100) See Changes [Here](StructureDefinition-us-core-specimen.html#mandatory-and-must-support-data-elements)
28. **Applied:** (Clarification) Clarify how an order is linked to the DiagnosticReport [FHIR-49101](https://jira.hl7.org/browse/FHIR-49101) See Changes [Here](StructureDefinition-us-core-diagnosticreport-lab.html#mandatory-and-must-support-data-elements) and [Here](StructureDefinition-us-core-diagnosticreport-note.html)
29. **Applied:** (Clarification) Clarify reporting specimen type best practice. [FHIR-49102](https://jira.hl7.org/browse/FHIR-49102) See Changes [Here](StructureDefinition-us-core-observation-lab.html#mandatory-and-must-support-data-elements)
30. **Applied:** (Enhancement) Add guidance that other identifiers like NCSBN can be used. [FHIR-49122](https://jira.hl7.org/browse/FHIR-49122) See Changes [Here](StructureDefinition-us-core-practitioner.html#mandatory-and-must-support-data-elements)
31. **Applied:** (Enhancement) Clarify US Core's relationship with IPA [FHIR-49123](https://jira.hl7.org/browse/FHIR-49123) See Changes [Here](relationship-with-other-igs.html)
32. **Applied:** (Enhancement) Add asked-declined to Race and Ethnicity Value Sets [FHIR-49134](https://jira.hl7.org/browse/FHIR-49134) (See Terminology Changes Listed in introduction above)
33. **Applied:** (Correction) Add ADI DocumentReference and Observation ADI Document to CapabilityStatements [FHIR-49162](https://jira.hl7.org/browse/FHIR-49162) See Changes [Here](CapabilityStatement-us-core-server.html)
34. **Applied:** (Correction) Observation should be US Core Observation Screening Assessment Profile  [FHIR-49163](https://jira.hl7.org/browse/FHIR-49163) See Changes [Here](StructureDefinition-us-core-observation-screening-assessment.html)
35. **Applied:** (Correction) Remove Duplicate Specific Implementation Guidance: [FHIR-49164](https://jira.hl7.org/browse/FHIR-49164) See Changes [Here](StructureDefinition-us-core-simple-observation.html)
36. **Applied:** (Clarification) Language for linking to Assessment Profile is confusing [FHIR-49197](https://jira.hl7.org/browse/FHIR-49197) See Changes [Here](screening-and-assessments.html#clinical-judgments)
37. **Applied:** (Enhancement) Reference and link to the USCDI page from the Home Page. [FHIR-49219](https://jira.hl7.org/browse/FHIR-49219) See Changes [Here](index.html#background)
38. **Applied:** (Enhancement) Added and corrected individual provenance elements [FHIR-49221](https://jira.hl7.org/browse/FHIR-49221) See the summary of changes in the [What's New](#whats-new-in-version-800-of-us-core) section above.
39. **Applied:** (Clarfication) Align US Core and C-CDA Race and Ethnicity Value Set Concepts [FHIR-49234](https://jira.hl7.org/browse/FHIR-49234) (See Terminology Changes Listed in introduction above)
40. **Applied:** (Clarification) Updated the QuickStarts for DocumentReference, Condition,  and DocumentReference profile to use profile-specific examples and language. [FHIR-49250](https://jira.hl7.org/browse/FHIR-49250) See Changes Here:
      - [US Core ADI DocumentReference Profile](StructureDefinition-us-core-adi-documentreference.html)
      - [US Core DocumentReference Profile](StructureDefinition-us-core-documentreference.html)
      - [US Core DiagnosticReport Profile for Laboratory Results Reporting](StructureDefinition-us-core-diagnosticreport-lab.html)
      - [US Core DiagnosticReport Profile for Report and Note Exchange](StructureDefinition-us-core-diagnosticreport-note.html)
      - [US Core Condition Encounter Diagnosis Profile](StructureDefinition-us-core-condition-encounter-diagnosis.html)
      - [US Core Condition Problems and Health Concerns Profile](StructureDefinition-us-core-condition-problems-health-concerns.html)
  
41. **Applied:** (Correction) Update Observation.derivedFrom examples for Observation Screening Assessment Profile [FHIR-49289](https://jira.hl7.org/browse/FHIR-49289) See Changes [Here](Observation-10-minute-apgar-score-panel.html)
42. **Applied:** (Correction) Update the VSAC [CVX Vaccines Administered Vaccine Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1010.6/expansion) value set [FHIR-49292](https://jira.hl7.org/browse/FHIR-49292)(StructureDefinition-us-core-immunization.html#profile)
43. **Applied:** (Correction) Correct CVX vaccine codes link [FHIR-49293](https://jira.hl7.org/browse/FHIR-49293) See Changes [Here](StructureDefinition-us-core-immunization.html#profile)
44. **Applied:** (Enhancement) Define the Acronym 'ADI' in all pages where it is used [FHIR-49299](https://jira.hl7.org/browse/FHIR-49299) See Changes:
       - [US Core ADI DocumentReference Profile](StructureDefinition-us-core-adi-documentreference.html)
       - [US Core Observation ADI Documentation Profile](StructureDefinition-us-core-observation-adi-documentation.html)
46. **Applied:** (Clarification) Add version lineage to the US Core Observation Screening Assessment Profile's introduction. [FHIR-49305](https://jira.hl7.org/browse/FHIR-49305) See Changes [Here](StructureDefinition-us-core-observation-screening-assessment.html)
47. **Applied:** (Correction) Corrections to typos [FHIR-49306](https://jira.hl7.org/browse/FHIR-49306)
48. **Applied:** (Correction) Fix typo 'Advance Directives' instead  of 'Advanced Directives' [FHIR-49307](https://jira.hl7.org/browse/FHIR-49307) See Changes [Here](StructureDefinition-us-core-adi-documentreference.html)
49. **Applied:** (Enhancement) Add Observation.code.text as an *Additional USCDI* element  [FHIR-49308](https://jira.hl7.org/browse/FHIR-49308) See Changes [Here](StructureDefinition-us-core-observation-lab-definitions.html#Observation.code)
50. **Applied:** (Enhancement) Change the slice for category 'assess-plan' from 1..1 Must Support to 0..1 Must Support. [FHIR-49309](https://jira.hl7.org/browse/FHIR-49309) See Changes [Here](StructureDefinition-us-core-careplan.html)
51. **Applied:** (Clarification) Cardinality does not match element definition [FHIR-49338](https://jira.hl7.org/browse/FHIR-49338) See Changes [Here](StructureDefinition-us-core-diagnosticreport-lab.html#profile)
52. **Applied** (Enhancement) Add "Plain Language" summary to the home page [FHIR-49367](https://jira.hl7.org/browse/FHIR-49367) See Changes [Here](index.html)
53. **Applied** (Correction)Fix Typo in US Core Yearly Updates diagram [FHIR-49376](https://jira.hl7.org/browse/FHIR-49376) See Changes [Here](us-core-roadmap.html)
54. **Applied:** (Clarification) Update the preferred language recommendation [FHIR-49391](https://jira.hl7.org/browse/FHIR-49391) See Changes Here:
     - [US Core Patient Profile](StructureDefinition-us-core-patient.html)
     - [US Core Encounter Profile](StructureDefinition-us-core-encounter.html)
55. **Applied** (Clarification) Clarify reference to race and ethnicity category codes  [FHIR-49392](https://jira.hl7.org/browse/FHIR-49392) See Changes [Here](StructureDefinition-us-core-patient.html)
56. **Applied:** (Clarification) Clarify reference to CDCREC [FHIR-49393](https://jira.hl7.org/browse/FHIR-49393) See Changes [Here](StructureDefinition-us-core-patient.html)
57. **Applied:** (Correction) Update [SOP Payer Type](https://vsac.nlm.nih.gov/valueset/2.16.840.1.114222.4.11.3591/expansion) value set.[FHIR-49395](https://jira.hl7.org/browse/FHIR-49395)
58. **Applied:** (Enhancement) Move Patient Communication Language valueset to [HL7 Terminology (THO)]. [FHIR-49397](https://jira.hl7.org/browse/FHIR-49397) See Changes [Here](https://www.hl7.org/fhir/us/core/StructureDefinition-us-core-patient.html)
59. **Applied:** (Correction)Changed ONC to ASTP where appropriate [FHIR-49399](https://jira.hl7.org/browse/FHIR-49399)
60. **Applied:** (Correction) Add and apply guidance on [FHIR Maturity Level]. [FHIR-49400](https://jira.hl7.org/browse/FHIR-49400) See Changes [Here](index.html#us-core-profile-maturity)
61. **Applied:** (Clarification) Update US Core Location Type Value Set to meet industry use cases [FHIR-49401](https://jira.hl7.org/browse/FHIR-49401) and [FHIR-50937](https://jira.hl7.org/browse/FHIR-50937) See Changes
    -  [US Core Location Profile](StructureDefinition-us-core-location.html)
    -  [Healthcare Service Location Type Combined](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1267.31/expansion)
62. **Applied:** (Clarification) Spell out/define SOP in diagnostic report imaging study context  [FHIR-49402](https://jira.hl7.org/browse/FHIR-49402) See Changes [Here](StructureDefinition-us-core-diagnosticreport-note.html)
63. **Applied:** (Correction) Update Medication Route of Admin terminology binding [FHIR-49403](https://jira.hl7.org/browse/FHIR-49403) See Changes [Here](StructureDefinition-us-core-medicationrequest.html)
64. **Applied:** (Correction) Change number of common clinical notes to 10 [FHIR-49413](https://jira.hl7.org/browse/FHIR-49413) See Changes [Here](StructureDefinition-us-core-documentreference.html#mandatory-and-must-support-data-elements)
65. **Applied:** (Correction) Correction to Observation ADI Documentation Profile Introduction [FHIR-49414](https://jira.hl7.org/browse/FHIR-49414) See Changes [Here](StructureDefinition-us-core-observation-adi-documentation.html)
66. **Applied:** (Clarification) Clarify guidance for the Observation ADI Documentation Profile Observation.value element [FHIR-49415](https://jira.hl7.org/browse/FHIR-49415) See Changes [Here](StructureDefinition-us-core-observation-adi-documentation.html#mandatory-and-must-support-data-elements)
67. **Applied:** (Enhancement) Update to human readable VSAC link [FHIR-49419](https://jira.hl7.org/browse/FHIR-49419) See Changes [Here](StructureDefinition-us-core-adi-documentreference.html#mandatory-and-must-support-data-elements)
68. **Applied:** (Clarification) Update guidance if endpoint is outside the FHIR base URL [FHIR-49424](https://jira.hl7.org/browse/FHIR-49424) See Changes [Here](StructureDefinition-us-core-adi-documentreference.html#mandatory-and-must-support-data-elements)
69. **Applied:** (Correction) Remove duplicate listing and add US Core RelatedPerson Profile to listing to USCDI table [FHIR-49432](https://jira.hl7.org/browse/FHIR-49432) See Changes [Here](uscdi.html#uscdi)
70. **Applied:** (Correction) Add same bindings to category "slicer" and "sliced" category elements in observation profiles. [FHIR-49444](https://jira.hl7.org/browse/FHIR-49444) See Changes Here:
     - [US Core Treatment Intervention Profile](StructureDefinition-us-core-treatment-intervention-preference.html#profile)
     - [US Core Care Experience Profile](StructureDefinition-us-core-care-experience-preference.html#profile)
     - [US Core Observation ADI Documentation Profile](StructureDefinition-us-core-observation-adi-documentation.html#profile)
     - [US Core Simple Observation](StructureDefinition-us-core-simple-observation.html#profile)
71. **Applied:** (Enhancement) Add guidance about using CQL and provide model definitions.[FHIR-49477](https://jira.hl7.org/browse/FHIR-49477) See Changes [Here](general-guidance.html#using-cql-with-us-core)
72. **Applied:** (Enhancement) Add ServiceRequest.code.text as an *Additional USCDI* element [FHIR-49609](https://jira.hl7.org/browse/FHIR-49609) See Changes Here:
     - [US Core ServiceRequest Profile](StructureDefinition-us-core-servicerequest.html)
     - [ServiceRequest Food Pantry Referral Example](ServiceRequest-foodpantry-referral.html)
73. **Applied:** (Clarification) Clarify how to categorize CDA documents[FHIR-49612](https://jira.hl7.org/browse/FHIR-49612) See Changes [Here](StructureDefinition-us-core-documentreference.html#mandatory-and-must-support-data-elements)
74. **Applied:** (Clarification) Change binding for US Core ADI DocumentReference  and .type [FHIR-49615](https://jira.hl7.org/browse/FHIR-49615) See Changes [Here](StructureDefinition-us-core-adi-documentreference.html)
75. **Applied:** (Enhancement) Add CLIA/USCDI/HL7 elements mapping table and update metabolic panel example to include order. [FHIR-49623](https://jira.hl7.org/browse/FHIR-49623) See Changes Here:
      - [US Core DiagnosticReport Profile for Laboratory Results Reporting](StructureDefinition-us-core-diagnosticreport-lab.html)
      - [Basic Metabolic Panel Example](DiagnosticReport-metabolic-panel.html)
      - [ServiceRequest BMP Example](ServiceRequest-bmp.html)
76. **Applied:** (Enhancement) Add CLIA/USCDI/HL7 elements mapping table and update CBC examples to include specimen. [FHIR-49630](https://jira.hl7.org/browse/FHIR-49630) See Changes Here:
     - [US Core Laboratory Result Observation Profile](StructureDefinition-us-core-observation-lab.html#mandatory-and-must-support-data-elements)
     - [Urine Specimen Example](Specimen-specimen-example-urine.html)
     - [Whole Blood Specimen Example](Specimen-specimen-example-whole-blood.html)
     - [Erythrocytes Example](Observation-cbc-erythrocytes.html)
     - [Hematocrit Example](Observation-cbc-hematocrit.html)
     - [Hemoglobin Example](Observation-cbc-hemoglobin.html)
     - [Leukocytes Example](Observation-cbc-leukocytes.html)
     - [MCH Example](Observation-cbc-mch.html)
     - [MCHC Example](Observation-cbc-mchc.html)
     - [MCV Example](Observation-cbc-mcv.html)
     - [Platelets Example](Observation-cbc-platelets.html)
77. **Applied:** (Correction) Update Image and typo on Figure 2: US Core DocumentReference.category [FHIR-49702](https://jira.hl7.org/browse/FHIR-49702) See Changes [Here](general-requirements.html#required-bindings-when-slicing-by-valuesets)
78. **Applied:** (Enhancement) Remove US Core Laboratory Result Observation Profile as a Must Support target for the US Core DiagnosticReport Profile for Report and Note Exchange [FHIR-49906](https://jira.hl7.org/browse/FHIR-49906) See Changes [Here](StructureDefinition-us-core-diagnosticreport-note.html)
79. **Applied:** (Correction) Correct the additional binding purpose code "current" rendering [FHIR-49985](https://jira.hl7.org/browse/FHIR-49985) See Changes [Here](StructureDefinition-us-core-condition-encounter-diagnosis.html)
80. **Applied:** (Clarification) Remove ICD-9 from additional bound value set in US Core Condition profiles [FHIR-49986](https://jira.hl7.org/browse/FHIR-49986) See Changes Here
      - [US Core Condition Encounter Diagnosis Profile](StructureDefinition-us-core-condition-problems-health-concerns.html)
      - [US Core Condition Problems and Health Concerns Profile](StructureDefinition-us-core-condition-encounter-diagnosis.html)
      - [US Core Condition Codes Current](ValueSet-us-core-condition-code-current.html)
81. **Applied:** (Enhancement) Add Best Practices Guidance for Granular Scopes [FHIR-50002](https://jira.hl7.org/browse/FHIR-50002) See Changes [Here](scopes.html)
82. **Applied:** (Clarification) Add introduction to Change log to clarify how to use. [FHIR-50089](https://jira.hl7.org/browse/FHIR-50089) See Changes [Here](changes.html)
83. **Applied:** (Clarification) Value sets referenced by US Core reviewed annually [FHIR-50153](https://jira.hl7.org/browse/FHIR-50153)
84. **Applied:** (Enhancement) Created a new "Looking Ahead" menu tab  [FHIR-50154](https://jira.hl7.org/browse/FHIR-50154) See Changes [Here](looking-ahead.html)
85. **Applied:** (Enhancement) Added "Patient Data Feed" subscription guidance page to US Core [FHIR-50155](https://jira.hl7.org/browse/FHIR-50155) See Changes [Here](patient-data-feed.html)
86. **Applied** (Enhancement) Add guidance on inactive codes to the Terminology page [FHIR-50156](https://jira.hl7.org/browse/FHIR-50156) See Changes [Here](terminology.html)
87. **Applied** (Correction) Added missing profiles to "omitted" Profile list for individual level provenance [FHIR-50163](https://jira.hl7.org/browse/FHIR-50163) See Changes [Here](basic-provenance.html#individual-level-provenance)
88. **Applied:** (Correction) Changes to comply with Executive Order 14168 [FHIR-50177](https://jira.hl7.org/browse/FHIR-50177) See the summary of changes in the [What's New](#whats-new-in-version-800-of-us-core) section above.
89. **Applied:** (Clarification) Remove MS flag for Practitioner in MedicationDispense Profile [FHIR-50239](https://jira.hl7.org/browse/FHIR-50239) See Changes [Here](StructureDefinition-us-core-medicationdispense.html)
90. **Applied:** (Enhancement) Align Group Number/Name with USCDI Group Identifier [FHIR-50283](https://jira.hl7.org/browse/FHIR-50283) See Changes [Here](StructureDefinition-us-core-coverage.html)
91. **Applied:** (Enhancement) Add section on slicing on the Must Support page  [FHIR-50286](https://jira.hl7.org/browse/FHIR-50286) See Changes [Here](must-support.html#must-support---slices)
92. **Applied:** (Enhancement) Remove clinical Dates and statuses from the US Core Condition Encounter Diagnosis Profile [FHIR-50288](https://jira.hl7.org/browse/FHIR-50288) See Changes Here
     - [US Core Condition Encounter Diagnosis Profile](StructureDefinition-us-core-condition-encounter-diagnosis.html)
     - [Encounter Diagnosis Example 1](Condition-encounter-diagnosis-example1.html)
     - [Encounter Diagnosis Example 2](Condition-encounter-diagnosis-example2.html)
93. **Applied:** (Correction) Remove gender based search requirements [FHIR-50380](https://jira.hl7.org/browse/FHIR-50380) See Changes [Here](StructureDefinition-us-core-patient.html#notes)
94. **Applied:** (Correction) Add copyright statements to Questionnaire examples [FHIR-50399](https://jira.hl7.org/browse/FHIR-50399) See Changes Here:
     - [Alcohol Use Disorder Identification Test - Consumption (AUDIT-C) Questionnaire Example](Questionnaire-AUDIT-C.html)
     - [Exercise Vital Sign Questionnaire Example](Questionnaire-exercise-vital-sign.html)
     - [Questionnaire Hunger Vital Sign (HVS) Example](Questionnaire-hunger-vital-sign-example.html)
     - [Questionnaire PHQ-9 Example](Questionnaire-phq-9-example.html)
     - [Questionnaire PRAPARE Example](Questionnaire-prapare-example.html)
     - [Tobacco, Alcohol, Prescription medications, and other Substance use screen (TAPS) Questionnaire Example](Questionnaire-TAPS.html)
95. **Applied:** (Correction) Update the term "translation" to "additional coding" [FHIR-50796](https://jira.hl7.org/browse/FHIR-50796) See Changes [Here](https://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-immunization.html)
96.  **Applied:** (Clarification) Improve Language on Immunization.lotNumber for matching [FHIR-50795](https://jira.hl7.org/browse/FHIR-50795) See Changes [Here](https://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-immunization.html)
97. **Applied:** (Correction) Improve Language on boolean flag [FHIR-50794](https://jira.hl7.org/browse/FHIR-50794) See Changes [Here](https://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-medicationrequest.html)
98. **Applied:** (Correction) Improve Language: Change Name to Code [FHIR-50793](https://jira.hl7.org/browse/FHIR-50793) See Changes [Here](https://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-servicerequest.html)
99.  **Applied:** (Clarification) Update SMART Launch dependency to version 2.2.0 [FHIR-50787](https://jira.hl7.org/browse/FHIR-50787) See Changes [Here](scopes.html)
100. **Applied** (Enhancement) Move USPS value set to THO [FHIR-50143](https://jira.hl7.org/browse/FHIR-50143) See Changes [Here](http://terminology.hl7.org/ValueSet/USPS-State)
101. **Applied:** (Correction) Expand US Core Laboratory Test Codes value set [FHIR-49642](https://jira.hl7.org/browse/FHIR-49642) See Changes [Here](ValueSet-us-core-laboratory-test-codes.html)
102. **Applied:** (Enhancement) Add links in history page to approved patches [FHIR-49642](https://jira.hl7.org/browse/FHIR-49642) See Changes [Here](https://hl7.org/fhir/us/core/history.html)

The application of the following trackers are pending and will not be completed before publication

1. **Resolved - change required:** (Enhancement) Add codes from US Core Category to the Observation Category Codesystem [FHIR-43541](https://jira.hl7.org/browse/FHIR-43541)
2. **Resolved - change required:** (Correction) NAIC Code Number Identifier system not registered in THO [FHIR-46185](https://jira.hl7.org/browse/FHIR-46185)
3. **Resolved - change required:** (Correction) Change USEncounterDischargeDisposition from http://terminology.hl7.org/CodeSystem/nubc-UB92 to https://www.nubc.org/CodeSystem/PatDischargeStatus [FHIR-49610](https://jira.hl7.org/browse/FHIR-49610)
4. **Publishing:** (Enhancement) How to deal with searchparameters in the package that only convey expectations [FHIR-48876](https://jira.hl7.org/browse/FHIR-48876)


The following trackers have been identified as publishing issues and we are working with HL7 publishing to resolve them.

1. **Publishing:** (Clarification) Confusing for commercial vendor.  Reads very confusing. [FHIR-30783](https://jira.hl7.org/browse/FHIR-30783)
2. **Publishing:** (Correction) Override built-in examples for address elements [FHIR-43054](https://jira.hl7.org/browse/FHIR-43054)
3. **Publishing:** (Enhancement) Deprecate every version before 3.1.1  [FHIR-46065](https://jira.hl7.org/browse/FHIR-46065)
4. **Publishing:** (Correction) Fix the US Core History Page [FHIR-46749](https://jira.hl7.org/browse/FHIR-46749)
5. **Publishing:** (Correction) Hyperlink discrepancy [FHIR-49336](https://jira.hl7.org/browse/FHIR-49336), [FHIR-49337](https://jira.hl7.org/browse/FHIR-49337)

### Version = 8.0.0 - ballot
- url: <https://hl7.org/fhir/us/core/2025Jan/>
- Based on FHIR version : 4.0.1


#### The January 2025 Ballot

The January 2025 ballot addresses the following:

{% include whats-new/v8-ballot.md %}

#### Changes:

- Implementers submitted over 60 trackers since the publication of US Core ver 8.0.0. We have addressed them and applied over 50 changes listed below:

**Tracker Status**: **(Change Category)** **Summary** **[Jira Issue](#)** **[Link to Updated Content](#)**


1. **Resolved - change required:** (Enhancement) Fix the US Core History Page [FHIR-42950](https://jira.hl7.org/browse/FHIR-42950) and [FHIR-46749](https://jira.hl7.org/browse/FHIR-46749) See Changes [Here](https://hl7.org/fhir/us/core/history.html)
1. **Applied:** (Enhancement) Make Must Support Reference Table more visible [FHIR-44977](https://jira.hl7.org/browse/FHIR-44977) See Changes Here:
    - [Must Support - Resource References](https://hl7.org/fhir/us/core/2025Jan/must-support.html#must-support---resource-references)
    - [Must Support Elements](https://hl7.org/fhir/us/core/2025Jan/must-support.html#must-support-elements)
    - [FHIR RESTful Capabilities](https://hl7.org/fhir/us/core/2025Jan/CapabilityStatement-us-core-server.html#behavior)
2. **Applied:** (Correction) Update Condition.code ICD9 value set link and add STU Note [FHIR-45136](https://jira.hl7.org/browse/FHIR-45136) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/ValueSet-us-core-condition-code.html)
3. **Applied:** (Clarification) Clarify definition of Clinical Information Reconciliation and Incorporation (CIRI) [FHIR-45267](https://jira.hl7.org/browse/FHIR-45267) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/basic-provenance.html#clinical-information-reconciliation-and-incorporation)
4. **Applied:** (Enhancement) Remove dated footnote from Provenance page. [FHIR-45283](https://jira.hl7.org/browse/FHIR-45283)
5. **Applied** (Enhancement) Add SNOMED NUCC Mapping link to US Core PractitionerRole Profile guidance[FHIR-45286](https://jira.hl7.org/browse/FHIR-45286) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-practitionerrole.html)
6. {:#fhir-45319}**Applied:** (Clarification) Clarify Observation Screening Assessment category Must Support requirements [FHIR-45319](https://jira.hl7.org/browse/FHIR-45319) and [FHIR-46052](https://jira.hl7.org/browse/FHIR-46052) See Changes Here:
    - [Screening and Assessments](https://hl7.org/fhir/us/core/2025Jan/screening-and-assessments.html#terminology)
    - [US Core Observation Screening Assessment Profile ](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-observation-screening-assessment.html)
    - [US Core Screening Assessment Observation Maximum Category](https://hl7.org/fhir/us/core/2025Jan/ValueSet-us-core-screening-assessment-observation-maximum-category.html)
    - [US Core Simple Observation Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-simple-observation.html)
    - [US Core Condition Problems and Health Concerns Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-condition-problems-health-concerns.html)
    - [US Core Screening Assessment Condition Category](https://hl7.org/fhir/us/core/2025Jan/ValueSet-us-core-screening-assessment-condition-category.html)
1. **Applied:** (Clarification) Clarify Must Support requirements for requestors [FHIR-45448](https://jira.hl7.org/browse/FHIR-45448) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/must-support.html#must-support-elements)
2. **Applied:** (Correction) Move "time-period" from Must Support to Must Have section in introduction. [FHIR-45726](https://jira.hl7.org/browse/FHIR-45726) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-average-blood-pressure.html)
3. **Applied:** (Clarification) Align the Sig description in the medication profile introductions. [FHIR-45951](https://jira.hl7.org/browse/FHIR-45951) See Changes Here:
    - [US Core MedicationDispense Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-medicationdispense.html)
    - [US Core MedicationRequest Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-medicationrequest.html)
4. **Applied:** (Clarification) Clarify Role and use of US Core SearchParameters vs FHIR standard SearchParameters [FHIR-46036](https://jira.hl7.org/browse/FHIR-46036) See Changes Here:
    - [US Core Search Parameters](https://hl7.org/fhir/us/core/2025Jan/search-parameters-and-operations.html#search-parameters)
    - [SearchParameter: USCoreAllergyintoleranceClinicalStatus](https://hl7.org/fhir/us/core/2025Jan/SearchParameter-us-core-allergyintolerance-clinical-status.html)
    - [US Core Server CapabilityStatement - FHIR RESTful Capabilities](https://hl7.org/fhir/us/core/2025Jan/CapabilityStatement-us-core-server.html#behavior)
5. **Applied:** (Correction) Procedure.code should be Procedure.performed [FHIR-46037](https://jira.hl7.org/browse/FHIR-46037) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-procedure.html)
6. **Applied:** (Correction) Correct Examples [FHIR-46099](https://jira.hl7.org/browse/FHIR-46099) See Changes Here:
    - [10 Minute Apgar Score Panel Example](https://hl7.org/fhir/us/core/2025Jan/Observation-10-minute-apgar-score-panel.html)
    - [Hvs Item Example 88122-7](https://hl7.org/fhir/us/core/2025Jan/Observation-HVS-item-example-88122-7.html)
    - [Hvs Item Example 88123-5](https://hl7.org/fhir/us/core/2025Jan/Observation-HVS-item-example-88123-5.html)
    - [HVSPanel Example 88121-9](https://hl7.org/fhir/us/core/2025Jan/Observation-HVS-panel-example-88121-9.html)
7. **Applied:** (Clarification) Remove the Must Support on DiagnosticReport (Report and Notes) `media.link` [FHIR-46240](https://jira.hl7.org/browse/FHIR-46240) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-diagnosticreport-note.html)
8. **Applied:** (Clarification) Clarify the level of granular scopes server shall support [FHIR-46277](https://jira.hl7.org/browse/FHIR-46277) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/scopes.html#additional-us-core-requirements)
9. **Applied:** (Enhancement) Reference specific version of USCDI for each version of USCore [FHIR-46466](https://jira.hl7.org/browse/FHIR-46466)  See Changes Here:
    - [USCDI](https://hl7.org/fhir/us/core/2025Jan/uscdi.html)
    - [Publication (Version) History](https://hl7.org/fhir/us/core/history.html)
    - [Change Log](https://hl7.org/fhir/us/core/2025Jan/changes.html)
    - [Future of US Core](https://hl7.org/fhir/us/core/2025Jan/future-of-US-core.html)
10. **Applied:** (Correction) Change page status from "Informative" to "Trial-use" where appropriate [FHIR-46514](https://jira.hl7.org/browse/FHIR-46514) (See the tracker comments for a list of changes)
11. **Applied:** (Clarification) Clarify conformance requirements for structured assessments [FHIR-47139](https://jira.hl7.org/browse/FHIR-47139) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/screening-and-assessments.html#structured-screening-and-assessments)
12. **Applied:** (Enhancement) Replace US Core Discharge Disposition Value Set with equivalent [HL7 Terminology (THO)] Value Set [FHIR-47416](https://jira.hl7.org/browse/FHIR-47416) and [FHIR-46194](https://jira.hl7.org/browse/FHIR-46194)
  - [US Core Encounter Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-encounter.html)
  - [Encounter 1036 Example](https://hl7.org/fhir/us/core/2025Jan/Encounter-1036.html)
13. **Applied:** (Enhancement) Tighten constraint on name.use to support better patient matching [FHIR-48416](https://jira.hl7.org/browse/FHIR-48416) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-patient.html)
14. **Applied:** (Correction)Change "status" to "active flag" in US Core RelatedPerson introduction[FHIR-48439](https://jira.hl7.org/browse/FHIR-48439) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-relatedperson.html)
15. **Applied:** (Clarification) Remove resolves declaration from US Core CapabilityStatements [FHIR-48446](https://jira.hl7.org/browse/FHIR-48446)  See Changes Here:
    - [US Core Server CapabilityStatement - FHIR RESTful Capabilities](https://hl7.org/fhir/us/core/2025Jan/CapabilityStatement-us-core-client.html)
    - [US Core Client CapabilityStatement - FHIR RESTful Capabilities](https://hl7.org/fhir/us/core/2025Jan/CapabilityStatement-us-core-server.html)
html#additional-uscdi-requirements)
1. **Applied:** (Enhancement) Add section on client best practices for search [FHIR-45179](https://jira.hl7.org/browse/FHIR-45179) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/general-guidance.html#client-best-practices-for-search)
2. **Applied:** (Clarification) Clarify the '_revinclude` expectations for Provenance [FHIR-46077](https://jira.hl7.org/browse/FHIR-46077) See Changes Here:
    - [US Core Provenance Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-provenance.html#mandatory-search-parameters)
    - [AllergyIntolerance Provenance Example 1](https://hl7.org/fhir/us/core/2025Jan/Bundle-allergyintolerance-provenance-example1.html)
    - [AllergyIntolerance Provenance Example 2](https://hl7.org/fhir/us/core/2025Jan/Bundle-allergyintolerance-provenance-example2.html)
3. **Applied:** (Enhancement) Continue to harmonize/share value sets used in US Core and C-CDA in the US Core 8.0 ballot and C-CDA 4.0 ballot [FHIR-46181](https://jira.hl7.org/browse/FHIR-46181) (See Changes Listed in introduction above)
4. **Applied:** (Enhancement) Updates and Corrections to Medication Clinical Drug VSAC Valueset used by US Core Medication, MedicationDispense Profile, and MedicationRequest Profiles [FHIR-46255](https://jira.hl7.org/browse/FHIR-46255) See Changes [Here](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1010.4/expansion/Latest)
5. **Applied:** (Enhancement) Replace US Core Pregnancy Status Codes Value Set with equivalent [Value Set Authority Center (VSAC)] Value Set [FHIR-46257](https://jira.hl7.org/browse/FHIR-46257) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-observation-pregnancystatus.html)
6. **Applied:** (Enhancement) Allow CMS Place of Service codes for 'location.type' in US Core Location Profile [FHIR-46258](https://jira.hl7.org/browse/FHIR-46258) See Changes Here:
    - [US Core Location Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-location.html)
    - [US Core Location Type ValueSet](https://hl7.org/fhir/us/core/2025Jan/ValueSet-us-core-location-type.html)
7. **Applied:** (Enhancement) Replace US Core Pregnancy Intent Codes Value Set with equivalent [Value Set Authority Center (VSAC)] Value Set [FHIR-46263](https://jira.hl7.org/browse/FHIR-46263) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-observation-pregnancyintent.html)
8. **Applied:** (Enhancement) Add SDOH Goals value set as "Additional Binding" in Goal Profile [FHIR-46266](https://jira.hl7.org/browse/FHIR-46266) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-goal.html)
9. **Applied:** (Correction) Specify SMART App Launch Version [FHIR-46279](https://jira.hl7.org/browse/FHIR-46279) Here:
    - [Security](https://hl7.org/fhir/us/core/2025Jan/security.html)
    - [US Core Server CapabilityStatement](https://hl7.org/fhir/us/core/2025Jan/CapabilityStatement-us-core-server.html)
10. **Applied:** (Enhancement) Replace US Core Survey Codes Value Set with [Value Set Authority Center (VSAC)] Value Set and remove Laboratory LOINCs [FHIR-46347](https://jira.hl7.org/browse/FHIR-46347) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-observation-screening-assessment.html)
11. **Applied:** (Clarification) Clarify when granular scopes overlap [FHIR-46748](https://jira.hl7.org/browse/FHIR-46748) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/scopes.html)
12. **Applied:** (Enhancement) Add USCDI v5 Data Elements to US Core [FHIR-48443](https://jira.hl7.org/browse/FHIR-48443) See Changes Listed in the [8.0.0-Ballot Introduction](https://hl7.org/fhir/us/core/2025Jan/changes.html#the-january-2025-ballot) above.
13. **Applied:** (Correction) Update US Core Clinical Note Type Valueset to align with Clinical Note Guidance [FHIR-48607](https://jira.hl7.org/browse/FHIR-48607)  Here:
    - [US Core Clinical Note Type](https://hl7.org/fhir/us/core/2025Jan/ValueSet-us-core-clinical-note-type.html)
    - [Clinical Notes](https://hl7.org/fhir/us/core/2025Jan/clinical-notes.html)
14. **Applied:** (Correction) Change Average Blood Pressure Profile `Observation.subject` minimum from 0 to 1 [FHIR-45724](https://jira.hl7.org/browse/FHIR-45724) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-average-blood-pressure.html)
15. **Applied:** (Enhancement) Align Encounter Type between C-CDA and FHIR US Core and Replace US Core Encounter Type Value Set with equivalent Value Set Authority Center (VSAC) Value Set [FHIR-46259](https://jira.hl7.org/browse/FHIR-46259) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-encounter.html)
16. **Applied:** (Clarification) Update Must Support page when no reference targets labeled Must Support and update must support labels for Observation.performer targets [FHIR-48442](https://jira.hl7.org/browse/FHIR-48442) See Changes Here:
   - [Must Support - Resource References](https://hl7.org/fhir/us/core/2025Jan/must-support.html#must-support---resource-references)
   - [US Core Simple Observation Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-simple-observation.html)
   - [US Core Observation Screening Assessment Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-observation-screening-assessment.html)
17. **Applied:** (Enhancement) Update Guidance on Sex and Gender in USCore [FHIR-44115](https://jira.hl7.org/browse/FHIR-44115) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-patient.html#mandatory-and-must-support-data-elements)
18. **Applied:** (Correction) Spelling errors in US Core Server Capability Statement [FHIR-45451](https://jira.hl7.org/browse/FHIR-45451)See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/CapabilityStatement-us-core-server.html)
19. **Applied:** (Correction) Fix broken PHINVADS links [FHIR-45494](https://jira.hl7.org/browse/FHIR-45494) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/terminology.html)
20. **Applied:** (Correction) Typo in Condition's granular scope [FHIR-45961](https://jira.hl7.org/browse/FHIR-45961) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-condition-encounter-diagnosis.html#us-core-scopes)
21. **Applied:** (Clarification) Clarify expectations for US@ for health systems [FHIR-46020](https://jira.hl7.org/browse/FHIR-46020) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-patient.html#mandatory-and-must-support-data-elements)
22. **Pre-Applied:** (Clarification) Clarify how "Additional USCDI" is applied for complex elements [FHIR-46028](https://jira.hl7.org/browse/FHIR-46028) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/must-support.html)
23. **Applied:** (Enhancement) Create SCT Specimen Condition value set to include SNOMED CT [FHIR-47061](https://jira.hl7.org/browse/FHIR-47061) See Changes Here:
    - [US Core Specimen Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-specimen.html)
    - [US Core Specimen Condition ValueSet](https://hl7.org/fhir/us/core/2025Jan/ValueSet-us-core-specimen-condition.html)
    - [Lipemic Serum Specimen Example](https://hl7.org/fhir/us/core/2025Jan/Specimen-example-serum-lipemic.html)
24. **Applied:** (Clarification) Remove `.meta.lastUpdated` STU comments [FHIR-48542](https://jira.hl7.org/browse/FHIR-48542)
25. **Applied:** (Correction) Update link to UDI Specification [FHIR-48688](https://jira.hl7.org/browse/FHIR-48688) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-implantable-device.html)
26. **Applied:** (Correction) add MS=False flag to QuestionnaireResponse.authored target [FHIR-48847](https://jira.hl7.org/browse/FHIR-48847) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-questionnaireresponse.profile.json.html)
27. **Applied:** (Correction) add MS=False flags to Procedure.basedOn targets [FHIR-48848](https://jira.hl7.org/browse/FHIR-48848) See Changes [Here](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-procedure.profile.json.html)
28. **Applied ** (Correction) US Core Survey Codes expansion error [FHIR-46272](https://jira.hl7.org/browse/FHIR-46272) See Changes [Here](https://hl7.org/fhir/us/core/STU7/ValueSet-us-core-survey-codes.html)

The application of the following trackers are pending and will not be completed by the ballot date.

1. **Resolved - change required:** (Enhancement) Create a tracker to THO to add codes from US Core Category to the Observation Category Codesystem [FHIR-43541](https://jira.hl7.org/browse/FHIR-43541)
2. **Triaged:** (Correction) US Core Coverage Profile [FHIR-44122](https://jira.hl7.org/browse/FHIR-44122)
3. **Triaged:** (Correction) US Core Coverage.Type Code Link Update  [FHIR-44124](https://jira.hl7.org/browse/FHIR-44124)
4. **Triaged:** (Correction) US Core Terminology Reference List # 62 [FHIR-44138](https://jira.hl7.org/browse/FHIR-44138)
5. **Resolved - change required:** (Correction) NAIC Code Number Identifier system not registered in THO [FHIR-46185](https://jira.hl7.org/browse/FHIR-46185)

The following trackers have been identified as publishing issues and we are working with HL7 publishing to resolve them.

1. **Publishing:** (Clarification) Confusing for commercial vendor.  Reads very confusing. [FHIR-30783](https://jira.hl7.org/browse/FHIR-30783)
2. **Publishing:** (Correction) AllergyIntolerance does not show constraint [FHIR-34636](https://jira.hl7.org/browse/FHIR-34636)
3. **Publishing:** (Correction) Override built-in examples for address elements [FHIR-43054](https://jira.hl7.org/browse/FHIR-43054)
5. **Publishing:** (Correction) US Core detailed ethnicity expansion error [FHIR-46638](https://jira.hl7.org/browse/FHIR-46638) See STU Notes:
   - [Detailed ethnicity](https://hl7.org/fhir/us/core/2025Jan/ValueSet-detailed-ethnicity.html)
   - [Detailed race](https://hl7.org/fhir/us/core/2025Jan/ValueSet-detailed-race.html)
6. **Publishing:** (Enhancement) Deprecate every version before 3.1.1  [FHIR-46065](https://jira.hl7.org/browse/FHIR-46065) See Changes Here:
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

**Tracker Status**: **(Change Category)** **Summary** **[Jira Issue](#)** **[Link to Updated Content](#)**


1. **Applied:** (Enhancement) Updated Gender Identity binding to align with C-CDA [FHIR-43052](https://jira.hl7.org/browse/FHIR-43052) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-genderIdentity.html)
2. **Applied:** (Clarification) Rename fhir-write to vitals-write [FHIR-43400](https://jira.hl7.org/browse/FHIR-43400) See Changes [Here](https://hl7.org/fhir/us/core/STU7/vitals-write.html)
3. **Applied:** (Clarification) Clarify that the Average Blood Pressure profile is protocol agnostic. [FHIR-43402](https://jira.hl7.org/browse/FHIR-43402) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-average-blood-pressure.html)
4. **Applied:** (Clarification) Add example to Must Support - Complex Elements section [FHIR-43430](https://jira.hl7.org/browse/FHIR-43430) See Changes [Here](https://hl7.org/fhir/us/core/STU7/must-support.html#must-support---complex-elements)
5. **Applied:** (Clarification) Clarify that only `Patient.deceasedDateTime` is "Additional USCDI Requirement" [FHIR-43431](https://jira.hl7.org/browse/FHIR-43431) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-patient.html)
6. **Applied:** (Correction) Fix table rendering to remove duplicates [FHIR-43432](https://jira.hl7.org/browse/FHIR-43432) See Changes [Here](https://hl7.org/fhir/us/core/STU7/screening-and-assessments.html#uscdi-health-assessments-data-element-category)
7. **Applied:** (Enhancement) Change Medication Adherence Information Source from Reference to Code [FHIR-43466](https://jira.hl7.org/browse/FHIR-43466) and See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-medication-adherence.html) and [Here](https://hl7.org/fhir/us/core/STU7/MedicationRequest-medicationrequest-coded-oral-axid.html)
8. **Applied:** (Enhancement) References specific extension for measurement protocol [FHIR-43536](https://jira.hl7.org/browse/FHIR-43536) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-average-blood-pressure.html) and [Here](https://hl7.org/fhir/us/core/STU7/Observation-average-blood-pressure.html)
9. **Applied:** (Clarification) Clarify reference to average BP panel [FHIR-43537](https://jira.hl7.org/browse/FHIR-43537) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-average-blood-pressure.html)
10. **Applied:** (Clarification) Derive Average Blood Pressure directly from Observation [FHIR-43538](https://jira.hl7.org/browse/FHIR-43538) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-average-blood-pressure.html) and [Here](https://hl7.org/fhir/us/core/STU7/Observation-average-blood-pressure.html)
11. **Applied:** (Clarification) Constrain Average Blood Pressure Profile Observation.value to max = 0 [FHIR-43539](https://jira.hl7.org/browse/FHIR-43539) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-average-blood-pressure.html)
12. **Applied:** (Clarification) Broaden Profile Purpose Statement [FHIR-43540](https://jira.hl7.org/browse/FHIR-43540) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-care-experience-preference.html)
13. **Applied:** (Enhancement) Add reference in the profile description to the base resource for scope and usage definitions. [FHIR-43543](https://jira.hl7.org/browse/FHIR-43543) For example [See Change Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-goal.html)
14. **Applied:** (Clarification) Remove note to balloters regarding the terminology [FHIR-43547](https://jira.hl7.org/browse/FHIR-43547) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-care-experience-preference.html) and [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-treatment-intervention-preference.html)
15. **Applied:** (Enhancement) Add guidance how to express conditional Goals [FHIR-43552](https://jira.hl7.org/browse/FHIR-43552) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-care-experience-preference.html) and [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-treatment-intervention-preference.html)
16. **Applied:** (Clarification) Clarify Specimen Condition definition [FHIR-43567](https://jira.hl7.org/browse/FHIR-43567) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-specimen.html)
17. **Applied:** (Clarification) Updates to Care Experience Preference Profile and Treatment Intervention Preference Profiles introduction [FHIR-43568](https://jira.hl7.org/browse/FHIR-43568) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-care-experience-preference.html) and [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-treatment-intervention-preference.html)
18. **Applied:** (Enhancement) Add choice of must support for Specimen.accessionIdentifier vs Specimen.identifier [FHIR-43585](https://jira.hl7.org/browse/FHIR-43585) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-specimen.html)
19. **Applied** (Clarification) Clarify location extension to use when not in Encounter [FHIR-43587](https://jira.hl7.org/browse/FHIR-43587) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-encounter.html)
20. **Applied:** (Clarification) Reason for Referral Clarification/Correction [FHIR-43588](https://jira.hl7.org/browse/FHIR-43588) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-procedure.html) and [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-servicerequest.html)
21. **Applied:** (Enhancement) Update the terminology bindings and allow effectivePeriod for Smoking Status [FHIR-43589](https://jira.hl7.org/browse/FHIR-43589) and [FHIR-43355](https://jira.hl7.org/browse/FHIR-43355) See Changes Here:
   - [US Core Smoking Status Observation Profile](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-smokingstatus.html)
   - [Smoking Status Type ValueSet](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1267.6/expansion)
   - [Smoking Status Comprehensive](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1267.3/expansion)
   - [Some Day Smoker Example](https://hl7.org/fhir/us/core/STU7/Observation-some-day-smoker.html)
   - [Cigarette Pack-Years Example](https://hl7.org/fhir/us/core/STU7/Observation-pack-years-example.html)
22. **Applied:** (Clarification) Clarify that not all US Core extensions are used in US Core Profiles [FHIR-43590](https://jira.hl7.org/browse/FHIR-43590) See Changes [Here](https://hl7.org/fhir/us/core/STU7/profiles-and-extensions.html#extensions)
23. **Applied:** (Correction) Fixed scopes formats [FHIR-43616](https://jira.hl7.org/browse/FHIR-43616) See Changes [Here](https://hl7.org/fhir/us/core/STU7/scopes.html)
24. **Applied:** (Clarification) Document that multiple races and ethnicities are supported in the extension [FHIR-43624](https://jira.hl7.org/browse/FHIR-43624) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-patient.html)
25. **Applied:** (Enhancement) Move US Core Vital Signs ValueSet to VSAC [FHIR-43633](https://jira.hl7.org/browse/FHIR-43633) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-vital-signs.html) and [Here](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113883.3.88.12.80.62/expansion)
26. **Applied:** (Clarification) Added guidance for using NDC codes[FHIR-43641](https://jira.hl7.org/browse/FHIR-43641) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-medicationdispense.html#mandatory-and-must-support-data-elements)
27. **Resolved - change required:** (Enhancement) Add _lastUpdated search parameter guidance [FHIR-43659](https://jira.hl7.org/browse/FHIR-43659) The changes are listed [above](#last-updated)
28. **Applied:** (Enhancement) Edit Medication Adherence codes and provide examples [FHIR-43757](https://jira.hl7.org/browse/FHIR-43757) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-medication-adherence.html)
29. **Applied** (Enhancement) Update and clarify US Core Scopes requirements [FHIR-43761](https://jira.hl7.org/browse/FHIR-43761) See Changes [Here](https://hl7.org/fhir/us/core/STU7/scopes.html) and [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-allergyintolerance.html#us-core-scopes)
30. **Applied:** (Correction) Fix Rendering in granular scope tables [FHIR-43770](https://jira.hl7.org/browse/FHIR-43770) See Changes [Here](https://hl7.org/fhir/us/core/STU7/scopes.html#us-core-scopes)
31. **Applied:** (Correction) Fix format error [FHIR-43773](https://jira.hl7.org/browse/FHIR-43773) See Changes [Here](https://hl7.org/fhir/us/core/STU7/general-requirements.html#missing-data)
32. **Applied:** (Clarification) Restore the FHIR Core resource definitions and comments [FHIR-43800](https://jira.hl7.org/browse/FHIR-43800) For example See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-allergyintolerance.html)
33. **Applied** (Enhancement) Clarify the use of USCDI Health Assessment Value Sets [FHIR-43922](https://jira.hl7.org/browse/FHIR-43922) See Changes [Here](https://hl7.org/fhir/us/core/STU7/screening-and-assessments.html#terminology)
34. **Applied:** (Clarification) Add Note to Vital Signs Profile regarding known validation errors[FHIR-43928](https://jira.hl7.org/browse/FHIR-43928) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-vital-signs.html)
35. **Applied** (Clarification)Clarify reason for referral options [FHIR-43929](https://jira.hl7.org/browse/FHIR-43929) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-procedure.html)
36. **Applied:** (Correction) Change Quantity to SimpleQuantity MedicationRequest and MedicationDispense profiles [FHIR-43932](https://jira.hl7.org/browse/FHIR-43932) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-medicationdispense.html) and [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-medicationrequest.html)
37. **Applied:** (Correction) Move elements from "must have" to "must support" in Immunization profile introduction [FHIR-43934](https://jira.hl7.org/browse/FHIR-43934) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-immunization.html)
38. **Applied:** (Clarification) Race extension cardinality / documentation does not match value set [FHIR-43937](https://jira.hl7.org/browse/FHIR-43937) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-race.html)
39. **Applied:** (Correction) Update diagram in Section 3.6.4.3 [FHIR-43938](https://jira.hl7.org/browse/FHIR-43938) See Changes [Here](https://hl7.org/fhir/us/core/STU7/screening-and-assessments.html#codes-for-problemshealthconcerns-goals-service-requests-and-procedures)
40. **Applied:** (Correction) Undo copy/paste error to US Simple Observation Profile description [FHIR-43954](https://jira.hl7.org/browse/FHIR-43954) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-simple-observation.html)
41. **Applied:** (Correction) change "treatment-intervention" to "treatment-intervention-profile" [FHIR-44008](https://jira.hl7.org/browse/FHIR-44008) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-treatment-intervention-preference.html#mandatory-and-must-support-data-elements)
42. **Applied:** (Correction) Add hyperlink [FHIR-44009](https://jira.hl7.org/browse/FHIR-44009) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-location.html#mandatory-and-must-support-data-elements)
43. **Applied:** (Correction) Restore the missing graphics [FHIR-44010](https://jira.hl7.org/browse/FHIR-44010)  and [FHIR-44011](https://jira.hl7.org/browse/FHIR-44011) See Changes [Here](https://hl7.org/fhir/us/core/STU7/screening-and-assessments.html#us-core-observation-screening-assessment-profile) and [Here](https://hl7.org/fhir/us/core/STU7/screening-and-assessments.html#us-core-observation-screening-assessment-profile)
44. **Applied:** (Correction) Restore the missing example [FHIR-44012](https://jira.hl7.org/browse/FHIR-44012) See Changes [Here](https://hl7.org/fhir/us/core/STU7/screening-and-assessments.html#searching-for-screening-and-assessment-data)
45. **Applied:** (Correction) Fix table formatting on Screening & assessments page - [FHIR-44014](https://jira.hl7.org/browse/FHIR-44014) See Changes [Here](https://hl7.org/fhir/us/core/STU7/screening-and-assessments.html#uscdi-health-assessments-data-element-category)
46. **Applied:** (Clarification) Add guidance for goals in Screening & Assessments page [FHIR-44015](https://jira.hl7.org/browse/FHIR-44015) See Changes [Here](https://hl7.org/fhir/us/core/STU7/screening-and-assessments.html#uscdi-health-assessments-data-element-category)
47. **Applied:** (Correction) Change "US Core Laboratory Result Observation Profile." to "US Core Observation Clinical Result Profile." [FHIR-44016](https://jira.hl7.org/browse/FHIR-44016) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-observation-lab.html#mandatory-and-must-support-data-elements)
48. **Applied:** (Correction) Where superfluous, Remove references to versions of USCDI [FHIR-44017](https://jira.hl7.org/browse/FHIR-44017) For example See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-medicationrequest.html)
49. **Applied:** (Correction) Remove erroneous text [FHIR-44018](https://jira.hl7.org/browse/FHIR-44018) and [FHIR-44022](https://jira.hl7.org/browse/FHIR-44022) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-care-experience-preference.html#mandatory-and-must-support-data-elements) and [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-treatment-intervention-preference.html#mandatory-and-must-support-data-elements)
50. **Applied:** (Enhancement) Add guidance/constraints for use of UCUM for reference range in Laboratory Result Observation Profile [FHIR-44023](https://jira.hl7.org/browse/FHIR-44023) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-observation-lab.html) and [Here](https://hl7.org/fhir/us/core/STU7/general-guidance.html#using-ucum-codes-in-the-quantity-datatype)
51. **Applied:** (Correction) Correct "e.g." and "i.e." to "e.g.," "i.e.," throughout guide [FHIR-44053](https://jira.hl7.org/browse/FHIR-44053)
52. **Applied:** (Clarification) Updated to specific link text instead generic "Here" for bulleted list of changes [FHIR-44055](https://jira.hl7.org/browse/FHIR-44055) See Changes [Here](https://hl7.org/fhir/us/core/STU7/changes.html)
53. **Applied:** (Clarification) Clarify encounter in DiagnosticReport [FHIR-44056](https://jira.hl7.org/browse/FHIR-44056) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-diagnosticreport-note.html))
54. **Applied:** (Clarification) Change "may" to "can" to avoid conformance verbs [FHIR-44060](https://jira.hl7.org/browse/FHIR-44060) See Changes [Here](https://hl7.org/fhir/us/core/STU7/general-guidance.html#narrative) and [Here](https://hl7.org/fhir/us/core/STU7/screening-and-assessments.html#category-codes)
55. **Applied:** (Correction) Clarify Medication Adherence Extension definitions [FHIR-44076](https://jira.hl7.org/browse/FHIR-44076) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-medication-adherence.html)
56. **Applied:** (Correction) Remove redundant sentence from Server CapabilityStatement description [FHIR-44112](https://jira.hl7.org/browse/FHIR-44112) See Changes [Here](https://hl7.org/fhir/us/core/STU7/capability-statements.html)
57. **Applied:** (Clarification) Clarify the use of UCUM for Quantity datatypes in Lab Observations [FHIR-44117](https://jira.hl7.org/browse/FHIR-44117) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-observation-lab.html) and [Here](https://hl7.org/fhir/us/core/STU7/general-guidance.html#using-ucum-codes-in-the-quantity-datatype)
58. **Applied:** (Correction) Remove US Core from CapabilityStatement.instantiates [FHIR-44121](https://jira.hl7.org/browse/FHIR-44121) See Changes [Here](https://hl7.org/fhir/us/core/STU7/CapabilityStatement-us-core-client.html)
59. **Applied:** (Clarification) Include FHIR R6 Sex and Gender content in Patient Profile Introduction [FHIR-44123](https://jira.hl7.org/browse/FHIR-44123) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-patient.html)
60. **Applied:** (Enhancement) Remove ASKU from value sets and use DAR concept instead [FHIR-44127](https://jira.hl7.org/browse/FHIR-44127) and [FHIR-41571](https://jira.hl7.org/browse/FHIR-41571) See Changes:
   - [US Core Gender Identity Extension](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-genderIdentity.html)
   - [US Core Birth Sex Extension](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-birthsex.html)
   - [US Core Observation Sexual Orientation Profile](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-observation-sexual-orientation.html)
61. **Applied:** (Enhancement) Add non-binary to gender identity value set [FHIR-44132](https://jira.hl7.org/browse/FHIR-44132) See Changes [Here](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1021.32/expansion)
62. **Applied:** (Correction) Correct reference to USCDI Average Blood Pressure element from "data class" to "data element" in change log [FHIR-44405](https://jira.hl7.org/browse/FHIR-44405) See Changes [Here](https://hl7.org/fhir/us/core/STU7/changes.html#the-january-2024-ballot) 
63. **Applied:** (Correction) bold text "SHALL NOT" [FHIR-44507](https://jira.hl7.org/browse/FHIR-44507) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-documentreference.html)
64. **Applied:** (Enhancement) Continue US Core and C-CDA value set alignment initiatives [FHIR-44522](https://jira.hl7.org/browse/FHIR-44522) The Value sets are listed [above](#vsac-7-0-0)
65. **Applied:** (Clarification) Update Treatment Intervention Observation.code to LOINC [FHIR-44019](https://jira.hl7.org/browse/FHIR-44019) and [FHIR-44539](https://jira.hl7.org/browse/FHIR-44539) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-treatment-intervention-preference.html)
66. **Applied:** (Correction) Add Social Determinants of Health Screening Assessments And Questions to Screening and Assessments Page [FHIR-44545](https://jira.hl7.org/browse/FHIR-44545) See Changes [Here](https://hl7.org/fhir/us/core/STU7/screening-and-assessments.html#codes-for-problemshealthconcerns-goals-service-requests-and-procedures)
67. **Applied:** (Correction) fix codes in US Core Average Blood Pressure Profile search examples [FHIR-44623](https://jira.hl7.org/browse/FHIR-44623) For example, See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-average-blood-pressure.html#mandatory-search-parameters)
68. **Applied:** (Clarification) Update guidance for servers not supporting PractitionerRole [FHIR-44624](https://jira.hl7.org/browse/FHIR-44624) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-practitioner.html)
69. **Applied:** (Correction) change "resources" to "resources types" [FHIR-44650](https://jira.hl7.org/browse/FHIR-44650) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-provenance.html)
70. **Applied:** (Correction) Update average blood pressure example to be more realistic [FHIR-44668](https://jira.hl7.org/browse/FHIR-44668) See Changes [Here](https://hl7.org/fhir/us/core/STU7/Observation-average-blood-pressure.html)
71. **Applied:** (Clarification) Clarify Must Support requirements for Practitioner.address [FHIR-44693](https://jira.hl7.org/browse/FHIR-44693) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-practitioner.html) and [Here](https://hl7.org/fhir/us/core/STU7/future-of-US-core.html)
72. **Applied:** (Clarification) Update Goal introduction to match profile [FHIR-44694](https://jira.hl7.org/browse/FHIR-44694) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-goal.html)
73. **Applied:** (Enhancement) Sex Extension's value set is too restrictive [FHIR-44710](https://jira.hl7.org/browse/FHIR-44710) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-sex.html)
74. **Applied:** (Enhancement) Update Condition.code and Procedure.code from extensible to current [FHIR-44715](https://jira.hl7.org/browse/FHIR-44715) See Changes Here:
  - [US Core Condition Encounter Diagnosis Profile](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-condition-encounter-diagnosis.html)
  - [US Core Condition Problems and Health Concerns Profile](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-condition-problems-health-concerns.html)
  - [US Core Procedure Profile](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-procedure.html)
  - [General Requirements](https://hl7.org/fhir/us/core/STU7/general-requirements.html#extensible-binding-for-coded-elements)
75. **Applied:** (Clarification) Update guidance on Referencing US Core Profiles [FHIR-44759](https://jira.hl7.org/browse/FHIR-44759) See Changes [Here](https://hl7.org/fhir/us/core/STU7/general-guidance.html#referencing-us-core-profiles)
76. **Applied:** (Enhancement) Relax Sex binding to "extensible" [FHIR-44764](https://jira.hl7.org/browse/FHIR-44764) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-sex.html)
77. **Applied:** (Enhancement) Combine the tables of Must Support references andAdditional USCDI references [FHIR-44946](https://jira.hl7.org/browse/FHIR-44946) See Changes [Here](https://hl7.org/fhir/us/core/STU7/CapabilityStatement-us-core-server.html#ms-ref-table)
78. **Applied:** (Correction) QA Error: specify version of http://terminology.hl7.org/CodeSystem/provenance-participant-type [FHIR-44967](https://jira.hl7.org/browse/FHIR-44967) See Changes [Here](https://hl7.org/fhir/us/core/STU7/ValueSet-us-core-provenance-participant-type.html#logical-definition-cld)
79. **Applied:** (Clarification) Align category term with community understanding [FHIR-45002](https://jira.hl7.org/browse/FHIR-45002) See Changes [Here](https://hl7.org/fhir/us/core/STU7/CodeSystem-condition-category.html)
80. **Applied:** (Enhancement) Add Guidance on meeting the definition of 'X' [FHIR-45177](https://jira.hl7.org/browse/FHIR-45177) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-sex.html)
81. **Applied:** (Clarification) Clarify 𝗔𝗗𝗗𝗜𝗧𝗜𝗢𝗡𝗔𝗟 𝗨𝗦𝗖𝗗𝗜 requirements for Reference datatype [FHIR-45204](https://jira.hl7.org/browse/FHIR-45204) See Changes Here:
  - [US Core Procedure Profile](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-procedure.html#mandatory-and-must-support-data-elements)
  - [US Core ServiceRequest Profile](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-servicerequest.html#mandatory-and-must-support-data-elements)
  - [US Core MedicationRequest Profile](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-medicationrequest.html#mandatory-and-must-support-data-elements)
82. **Applied:** (Correction) Update DocumentReference.content.format binding [FHIR-45302](https://jira.hl7.org/browse/FHIR-45302) See Changes [Here](https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-documentreference.html#terminology-bindings-differential)
83. **Applied:** (Correction) Update code system URL in US Core Discharge Disposition [FHIR-45303](https://jira.hl7.org/browse/FHIR-45303) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/ValueSet-us-core-discharge-disposition.html)

The application of the following tracker is pending and will not be completed by the publication date.

1.  **Resolved - change required:** (Enhancement) Create a tracker to THO to add codes from US Core Category to the Observation Category Codesystem [FHIR-43541](https://jira.hl7.org/browse/FHIR-43541)

The following trackers have been identified as publishing issues and we are working with HL7 publishing to resolve them.

1. **Publishing::** (Clarification) Confusing for commercial vendor.  Reads very confusing. [FHIR-30783](https://jira.hl7.org/browse/FHIR-30783)
2. **Publishing::** (Correction) AllergyIntolerance does not show constraint [FHIR-34636](https://jira.hl7.org/browse/FHIR-34636)
3. **Publishing:** (Correction) Override built-in examples for address elements [FHIR-43054](https://jira.hl7.org/browse/FHIR-43054)


### Version = 7.0.0 - ballot
- url: <https://hl7.org/fhir/us/core/2024Jan/>
- Based on FHIR version : 4.0.1

#### The January 2024 Ballot

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

 **Tracker Status**: **Summary** **Jira Issue** **Link to Updated Content**
1. **APPLIED:** Update CarePlan text status element's short description to reflect the status values [FHIR-43015](https://jira.hl7.org/browse/FHIR-43015) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-careplan.html#profile)
2. **APPLIED:** Update Smoking Status status element's short description to reflect the status values [FHIR-43118](https://jira.hl7.org/browse/FHIR-43118) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-smokingstatus.html#profile)
3. **APPLIED:** Correct invalid invariants us-core-3 and us-core-4 [FHIR-41523](https://jira.hl7.org/browse/FHIR-41523) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-observation-screening-assessment.html) and [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-observation-clinical-result.html) and [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-smokingstatus.html)
4. **APPLIED:** Correct invalid invariants pd-1 and us-core-13 [FHIR-41586](https://jira.hl7.org/browse/FHIR-41586) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-practitionerrole.html)
5. **APPLIED:** Correct invalid invariant us-core-1 [FHIR-41670](https://jira.hl7.org/browse/FHIR-41670) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-observation-screening-assessment.html) and [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-observation-clinical-result.html)
6. **APPLIED:** Correct invalid SearchParameter expression for USCoreConditionAssertedDate [FHIR-41673](https://jira.hl7.org/browse/FHIR-41673) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/SearchParameter-us-core-condition-asserted-date.html)
7. **APPLIED:** Fix Typo in Tribal Extension [FHIR-41739](https://jira.hl7.org/browse/FHIR-41739) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-tribal-affiliation.profile.json.html)
8. **APPLIED:** Fix Missing Data Example [FHIR-42805](https://jira.hl7.org/browse/FHIR-42805) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/general-requirements.html#missing-data)
9. **APPLIED:**  Update introduction to USCDI table[FHIR-42801](https://jira.hl7.org/browse/FHIR-42801) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/uscdi.html)
10. **APPLIED:** Fix us-core-5 invariant [FHIR-42814](https://jira.hl7.org/browse/FHIR-42814) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-immunization.html#constraints)
1. **APPLIED:**  Update guidance on referencing PractitionerRole [FHIR-42906](https://jira.hl7.org/browse/FHIR-42906) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/CapabilityStatement-us-core-server.html#practitionerrole) and [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-practitionerrole.html#mandatory-and-must-support-data-elements)
2. **APPLIED:** Add Project US@ Requirements [FHIR-43025](https://jira.hl7.org/browse/FHIR-43025) See Changes:
    -  [US Core Patient](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-patient.html#mandatory-and-must-support-data-elements)
    -  [Patient Example](https://hl7.org/fhir/us/core/2024Jan/Patient-example.html)
    -  [US Core RelatedPerson](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-relatedperson.html#mandatory-and-must-support-data-elements)
    -  [US Core Organization](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-organization.html#mandatory-and-must-support-data-elements)
    -  [US Core Practitioner](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-practitioner.html#mandatory-and-must-support-data-elements)
    -  [US Core Location](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-location.html#mandatory-and-must-support-data-elements)
3. **APPLIED:**  Fix Typo: Change ServiceRequest.reasonReference to Observation.derivedFrom [FHIR-43045](https://jira.hl7.org/browse/FHIR-43045) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-simple-observation.html#mandatory-and-must-support-data-elements)
4. **APPLIED:**  Add link in history page to approved patches [FHIR-42950](https://jira.hl7.org/browse/FHIR-42950) See Changes [Here](https://hl7.org/fhir/us/core/history.html)
5. **APPLIED:** Medication Adherence Scope Clarification [FHIR-42845](https://jira.hl7.org/browse/FHIR-42845) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-medicationrequest.html#mandatory-and-must-support-data-elements) and [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-medication-adherence.html)
6. **APPLIED:** Update profile + interaction requirements [FHIR-42789](https://jira.hl7.org/browse/FHIR-42789) and [FHIR-42847](https://jira.hl7.org/browse/FHIR-42847) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/general-requirements.html#conforming-to-us-core)
7. **APPLIED:** Provide guidance on NAHDO SOP codes for Medicare Part A,B,C,and D [FHIR-42793](https://jira.hl7.org/browse/FHIR-42793) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-coverage.html#mandatory-and-must-support-data-elements)
8. **APPLIED:** Correct description of Occupation Profile [FHIR-42867](https://jira.hl7.org/browse/FHIR-42867) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-observation-occupation.html)
9. **APPLIED:** Move the SMART scopes guidance from Future of US Core to a Conformance Page [FHIR-42864](https://jira.hl7.org/browse/FHIR-42864) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/scopes.html) and [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-allergyintolerance.html#mandatory-search-parameters) 
10. **APPLIED:** Add Argonaut Write Guidance for Vital Sign Observations to Record or Update Data section on the Future of US Core Page [FHIR-42863](https://jira.hl7.org/browse/FHIR-42863) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/future-of-US-core.html#record-or-update-data) and [Here](https://hl7.org/fhir/us/core/2024Jan/fhir-write.html)
11. **APPLIED:** Migrate US Core Terminology to VSAC [FHIR-42846](https://jira.hl7.org/browse/FHIR-42846) See this version's introduction
12. **APPLIED:**  Clarify note in Search Parameters and Operations page [FHIR-42783](https://jira.hl7.org/browse/FHIR-42783) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/search-parameters-and-operations.html)
13. **APPLIED:**  Fix errors in USCDI mapping table [FHIR-42862](https://jira.hl7.org/browse/FHIR-42862) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/uscdi.html)
14. **APPLIED:** Clarify Coverage status [FHIR-42777](https://jira.hl7.org/browse/FHIR-42777) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-coverage.html#mandatory-and-must-support-data-elements)
15. **APPLIED:**  Permit Subject element to references to other entities besides Patient [FHIR-42759](https://jira.hl7.org/browse/FHIR-42759) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-observation-clinical-result.html#profile)
16. **APPLIED:** Correct Regex for us-core-1 XPath invariant [FHIR-42738](https://jira.hl7.org/browse/FHIR-42738) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-observation-clinical-result.html#constraints))
17. **APPLIED:**  Add USCDI Version 4 Data Elements to US Core [FHIR-42161](https://jira.hl7.org/browse/FHIR-42161) See the Introduction to this version above and Changes [Here](https://hl7.org/fhir/us/core/2024Jan/uscdi.html)
18. **APPLIED:**  Remove guidance to identify version of SNOMED in an instance [FHIR-42160](https://jira.hl7.org/browse/FHIR-42160) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/general-guidance.html#snomed-ct-united-states-edition)
19. **APPLIED:** Add Procedure.reasonCode and Procedure.reasonReference as Reason for Referral [FHIR-42136](https://jira.hl7.org/browse/FHIR-42136) and [FHIR-41761](https://jira.hl7.org/browse/FHIR-41761) See Changes:
   -  [US Core Procedure](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-procedure.html)
   -  [US Core ServiceRequest](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-servicerequest.html)
   -  [Procedre Example](https://hl7.org/fhir/us/core/2024Jan/Procedure-defib-implant.html)
   -  [USCDI](https://hl7.org/fhir/us/core/2024Jan/uscdi.html)
20. **APPLIED:**  USCDI - FHIR US Core Relationship Clarification [FHIR-42130](https://jira.hl7.org/browse/FHIR-42130) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/uscdi.html)
21. **APPLIED:** Typo [FHIR-42069](https://jira.hl7.org/browse/FHIR-42069) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-blood-pressure.html#mandatory-and-must-support-data-elements)
22. **APPLIED:**  Clarify when to include multiple attachments as part of a clinical note [FHIR-41902](https://jira.hl7.org/browse/FHIR-41902) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-documentreference.html)
23. **APPLIED:**  Limit context for jurisdiction extension [FHIR-41867](https://jira.hl7.org/browse/FHIR-41867) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-jurisdiction.html)
24. **APPLIED:**  Add VSAC Value Sets to Terminology Page [FHIR-41681](https://jira.hl7.org/browse/FHIR-41681) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/terminology.html)
25. **APPLIED:**  APGAR should be Apgar [FHIR-41666](https://jira.hl7.org/browse/FHIR-41666) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/screening-and-assessments.html#structured-screening-and-assessments)
26. **APPLIED:** Correct invalid invariants pd-1 and us-core-13 [FHIR-41586](https://jira.hl7.org/browse/FHIR-41586) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-practitionerrole.html#constraints)
27. **APPLIED:** Clarify Additional USCDI Requirements [FHIR-41572](https://jira.hl7.org/browse/FHIR-41572) See Changes:
   - [US Core Patient Profile](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-patient.html#profile)
   - [US Core Conformance Artifacts](https://hl7.org/fhir/us/core/2024Jan/general-requirements.html#us-core-conformance-artifacts)
   - [Additional USCDI Requirements](https://hl7.org/fhir/us/core/2024Jan/must-support.html#additional-uscdi-requirements)
   - [USCDI](https://hl7.org/fhir/us/core/2024Jan/uscdi.html)
   - [Summary of Additional USCDI Requirement References](https://hl7.org/fhir/us/core/2024Jan/CapabilityStatement-us-core-server.html#summary-of-additional-uscdi-requirement-references)
28. **APPLIED:**  Change ASKU in value set to asked-declined [FHIR-41571](https://jira.hl7.org/browse/FHIR-41571) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-observation-sexual-orientation.html#terminology-bindings-differential) and [Here](https://hl7.org/fhir/us/core/2024Jan/Observation-sexual-orientation-example.html)
29. **APPLIED:**  update canonical urls in examples and capability statements to include the version [FHIR-41256](https://jira.hl7.org/browse/FHIR-41256) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/AllergyIntolerance-example.html) and [Here](https://hl7.org/fhir/us/core/2024Jan/CapabilityStatement-us-core-server.json.html)
30. **APPLIED:**  Add Preferred Language guidance [FHIR-40773](https://jira.hl7.org/browse/FHIR-40773) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-patient.html#mandatory-and-must-support-data-elements)
31. **APPLIED:**  Update UCUM guidance [FHIR-40604](https://jira.hl7.org/browse/FHIR-40604) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/general-guidance.html#using-ucum-codes-in-the-quantity-datatype)
32. **APPLIED:**  Added interpretation to laboratory result examples [FHIR-40297](https://jira.hl7.org/browse/FHIR-40297) See Changes [Here](https://hl7.org/fhir/us/core/2024Jan/Observation-cbc-mchc.html)


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

**Tracker Status**: **Summary** **Jira Issue** **Link to Updated Content**

1. **Applied**: Add Sex extension necessary to satisfy USCDI v3 [FHIR-41301](https://jira.hl7.org/browse/FHIR-41301) and [FHIR-41352](https://jira.hl7.org/browse/FHIR-41352) See Changes [Here](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-sex.html), [Here](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-patient.html), and [Here](https://hl7.org/fhir/us/core/STU6.1/uscdi.html)
2. **Applied**: Update link to CDC Race and Ethnicity Code Set [FHIR-41277](https://jira.hl7.org/browse/FHIR-41277) See Changes [Here](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-race.html)
3. **Applied**: Typo change `Condition.onsetDate` to `Condition.onsetDateTime`  [FHIR-41239](https://jira.hl7.org/browse/FHIR-41239) See Changes [Here](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-condition-encounter-diagnosis.html)
4. **Applied**: Clarify US Core USCDI Requirement Extension not intended for implementers [FHIR-41238](https://jira.hl7.org/browse/FHIR-41238) See Changes [Here](https://hl7.org/fhir/us/core/STU6.1/profiles-and-extensions.html)
5. **Applied**: Correct Provenance Example [FHIR-41316](https://jira.hl7.org/browse/FHIR-41316) See Changes [Here](https://hl7.org/fhir/us/core/STU6.1/Provenance-example-targeted-provenance.json.html)
6. **Applied**: Update Changes between versions table [FHIR-41434](https://jira.hl7.org/browse/FHIR-41434) See Changes [Here](https://hl7.org/fhir/us/core/STU6.1/changes-between-versions.html#cross-version-comparisons)
7. **Applied**: update us-core-3 and us-core-4 [FHIR-41454](https://jira.hl7.org/browse/FHIR-41454) See Changes [Here](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-observation-clinical-result.html)

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

 **Tracker Status**: **Summary** **Jira Issue** **Link to Updated Content**

1. **Applied:** Remove html entities from examples [FHIR-37474](https://jira.hl7.org/browse/FHIR-37474) 
2. **Applied:** Change Condition patient + category search to SHALL support [FHIR-37918](https://jira.hl7.org/browse/FHIR-37918) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-condition-encounter-diagnosis.html#mandatory-search-parameters)
3. **Applied:** Diagnostic Report Laboratory Codes LOINC CLASSTYPE value should be "1" [FHIR-37933](https://jira.hl7.org/browse/FHIR-37933) See Changes [Here](https://hl7.org/fhir/us/core/STU6/ValueSet-us-core-laboratory-test-codes.html)
4. **Applied:** Additional guidance for accessing imaging studies [FHIR-38808](https://jira.hl7.org/browse/FHIR-38808) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-diagnosticreport-note.html#mandatory-and-must-support-data-elements)
5. **Applied:** Allow multiple NPIs for Organizations and Practitioners [FHIR-39382](https://jira.hl7.org/browse/FHIR-39382) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-practitioner.html#profile)
6. **Applied:** Keep QuestionnaireResponse and Update Screening and Assessments page [FHIR-39495](https://jira.hl7.org/browse/FHIR-39495) See Changes: 
   - [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html)
   - [Here](https://hl7.org/fhir/us/core/STU6/Questionnaire-phq-9-example.html)
   - [Here](https://hl7.org/fhir/us/core/STU6/Questionnaire-prapare-example.html)
   - [Here](https://hl7.org/fhir/us/core/STU6/Questionnaire-hunger-vital-sign-example.html)
   - [Here](https://hl7.org/fhir/us/core/STU6/QuestionnaireResponse-phq-9-example.html)
   - [Here](https://hl7.org/fhir/us/core/STU6/CapabilityStatement-us-core-server.html#questionnaire)
   - [Here](https://hl7.org/fhir/us/core/STU6/CapabilityStatement-us-core-server.html#questionnaireresponse)
7. **Applied:** Fix slicing in Observation.component:industry[FHIR-39608](https://jira.hl7.org/browse/FHIR-39608) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html#profile)
8. **Applied:** Add support for Condition search that include patient + category + status [FHIR-39610](https://jira.hl7.org/browse/FHIR-39610) See Changes [Here](https://hl7.org/fhir/us/core/STU6/CapabilityStatement-us-core-server.html#condition)
9. **Applied:** Reference only reason for using MedicationDispense [FHIR-39611](https://jira.hl7.org/browse/FHIR-39611) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-medicationdispense.html)
10. **Applied:** Revert to simplegenderIdentify extension [FHIR-39615](https://jira.hl7.org/browse/FHIR-39615) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-genderIdentity.html)
11. **Applied:** Duplicated words [FHIR-39637](https://jira.hl7.org/browse/FHIR-39637) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-condition-problems-health-concerns.html#optional-search-parameters)
12. **Applied:** Missing comma [FHIR-39638](https://jira.hl7.org/browse/FHIR-39638) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-patient.html#mandatory-and-must-support-data-elements)
13. **Applied:** Clarify that Observation.specimen is a MustSupport [FHIR-39639](https://jira.hl7.org/browse/FHIR-39639) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-lab.html#mandatory-and-must-support-data-elements)
14. **Applied:** Clarify and  updates examples to use SNOMED CT US Edition [FHIR-39640](https://jira.hl7.org/browse/FHIR-39640) See Changes [Here](https://hl7.org/fhir/us/core/STU6/general-guidance.html#snomed-ct-united-states-edition) and [Here](https://hl7.org/fhir/us/core/STU6/AllergyIntolerance-example.html)
15. **Applied:** Add NDC codes to the Medication Guidance [FHIR-39641](https://jira.hl7.org/browse/FHIR-39641) See Changes [Here](https://hl7.org/fhir/us/core/STU6/medication-list.html#options-for-representing-medication)
16. **Applied:** Extra trailing parenthesis [FHIR-39643](https://jira.hl7.org/browse/FHIR-39643) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html)
17. **Applied:** Clinical Judgement Profile does not exist [FHIR-39650](https://jira.hl7.org/browse/FHIR-39650) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html)
18. **Applied:** Clarify the difference between Simple Observation and Screening Assessment [FHIR-39652](https://jira.hl7.org/browse/FHIR-39652) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-clinical-result.html#profile) and [Here](https://hl7.org/fhir/us/core/STU6/ValueSet-us-core-clinical-result-observation-category.html)
19. **Applied:** uscore or us-core [FHIR-39653](https://jira.hl7.org/browse/FHIR-39653)
20. **Applied:** Fix $docref examples [FHIR-39658](https://jira.hl7.org/browse/FHIR-39658) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-documentreference.html#mandatory-operation)
21. **Applied:** Resolve conflicting guidance in Observation Blood Pressure  [FHIR-39659](https://jira.hl7.org/browse/FHIR-39659) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-blood-pressure.html#mandatory-and-must-support-data-elements)
22. **Applied:** Clarify how profiles are defined [FHIR-39703](https://jira.hl7.org/browse/FHIR-39703) See Changes [Here](https://hl7.org/fhir/us/core/STU6/general-requirements.html#us-core-conformance-artifacts) and  [Here](https://hl7.org/fhir/us/core/STU6/index.html#introduction) and [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-allergyintolerance.html)
23. **Applied:** Clarify where the US Core Profile FHIR Restful transactions are defined? [FHIR-39704](https://jira.hl7.org/browse/FHIR-39704) See Changes [Here](https://hl7.org/fhir/us/core/STU6/general-requirements.html#profile-support--interaction-support)
24. **Applied:** Use ValueSet and not value set when a FHIR ValueSet is intended [FHIR-39705](https://jira.hl7.org/browse/FHIR-39705) See Changes [Here](https://hl7.org/fhir/us/core/STU6/general-requirements.html)
25. **Applied:** Use uppercase "Must Support" and not lowercase "must support" [FHIR-39706](https://jira.hl7.org/browse/FHIR-39706)
26. **Applied:** Document Must Support and Modifier Elements [FHIR-39707](https://jira.hl7.org/browse/FHIR-39707) See Changes [Here](https://hl7.org/fhir/us/core/STU6/general-requirements.html#modifier-elements)
27. **Applied:** Common format for Resources and Resource fields [FHIR-39708](https://jira.hl7.org/browse/FHIR-39708)
28. **Applied:** Use of mandatory text [FHIR-39709](https://jira.hl7.org/browse/FHIR-39709)
29. **Applied:** Add reference to FHIR section on language support [FHIR-39710](https://jira.hl7.org/browse/FHIR-39710) See Changes [Here](https://hl7.org/fhir/us/core/STU6/general-guidance.html#language-support)
30. **Applied:** Refer to FHIR specification as base definition for RESTful operations [FHIR-39711](https://jira.hl7.org/browse/FHIR-39711) See Changes [Here](https://hl7.org/fhir/us/core/STU6/general-guidance.html#read-fetch-syntax)
31. **Applied:** POST based searches [FHIR-39712](https://jira.hl7.org/browse/FHIR-39712) See Changes [Here](https://hl7.org/fhir/us/core/STU6/general-requirements.html#fhir-restful-search-api-requirements)
32. **Applied:** Clarify compartment based search [FHIR-39713](https://jira.hl7.org/browse/FHIR-39713) See Changes [Here](https://hl7.org/fhir/us/core/STU6/general-guidance.html#compartment-based-search)
33. **Applied:** Updated CapabilityStatement to list un-profiled required resources [FHIR-39714](https://jira.hl7.org/browse/FHIR-39714) See Changes [Here](https://hl7.org/fhir/us/core/STU6/CapabilityStatement-us-core-server.html#summary-of-must-support-references-between-profiles)
34. **Applied:** Change "Systems" to "Servers" [FHIR-39716](https://jira.hl7.org/browse/FHIR-39716) See Changes [Here](https://hl7.org/fhir/us/core/STU6/clinical-notes.html)
35. **Applied:** Update "Clinical Note Server" to "FHIR Server" [FHIR-39717](https://jira.hl7.org/browse/FHIR-39717) See Changes [Here](https://hl7.org/fhir/us/core/STU6/clinical-notes.html) and [Here](https://hl7.org/fhir/us/core/STU6/general-requirements.html)
36. **Applied:** DocumentReference, DiagnosticReport and embedded documents [FHIR-39718](https://jira.hl7.org/browse/FHIR-39718) See Changes [Here](https://hl7.org/fhir/us/core/STU6/clinical-notes.html)
37. **Applied:** Correction and clarify use of $expand [FHIR-39719](https://jira.hl7.org/browse/FHIR-39719) See Changes [Here](https://hl7.org/fhir/us/core/STU6/clinical-notes.html#using-expand) and [Here](https://hl7.org/fhir/us/core/STU6/CapabilityStatement-us-core-server.html#valueset)
38. **Applied:** Clarify MedicationAdministration and MedicationStatement support. [FHIR-39720](https://jira.hl7.org/browse/FHIR-39720) See Changes [Here](https://hl7.org/fhir/us/core/STU6/medication-list.html#pharmacy-fhir-resources)
39. **Applied:** The use of Observations where QuestionnaireReponse is more applicable [FHIR-39722](https://jira.hl7.org/browse/FHIR-39722) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html)
40. **Applied:** Updated CapabilityStatement to list required referenced profiles and resources [FHIR-39723](https://jira.hl7.org/browse/FHIR-39723) See Changes [Here](https://hl7.org/fhir/us/core/STU6/CapabilityStatement-us-core-server.html#summary-of-must-support-references-between-profiles)
41. **Applied:** External link is missing [FHIR-39725](https://jira.hl7.org/browse/FHIR-39725) See Changes [Here](https://hl7.org/fhir/us/core/STU6/general-guidance.html#search-syntax)
42. **Applied:** Change whenHandedOver from min =1 to min =0 [FHIR-39732](https://jira.hl7.org/browse/FHIR-39732) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-medicationdispense.html)
43. **Applied:** Wrong resource referenced [FHIR-39733](https://jira.hl7.org/browse/FHIR-39733) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-coverage.html)
44. **Applied:** plural/singular mismatch [FHIR-39734](https://jira.hl7.org/browse/FHIR-39734) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-coverage.html)
45. **Applied:** Screening and Assessment typo [FHIR-39735](https://jira.hl7.org/browse/FHIR-39735) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html)
46. **Applied:** Missing Hyperlinks [FHIR-39736](https://jira.hl7.org/browse/FHIR-39736) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-pregnancystatus.html)
47. **Applied:** Clarify period of pregnancy intent [FHIR-39737](https://jira.hl7.org/browse/FHIR-39737) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-pregnancyintent.html)
48. **Applied:** Missing Hyperlinks [FHIR-39738](https://jira.hl7.org/browse/FHIR-39738) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-pregnancyintent.html) and See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-pregnancystatus.html)
49. **Applied:** Add a "memberId" slice to Coverage.identifier and add guidance[FHIR-39743](https://jira.hl7.org/browse/FHIR-39743) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-coverage.html)
50. **Applied:** Change RelatedPerson search to combination of Patient + Name [FHIR-39791](https://jira.hl7.org/browse/FHIR-39791) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-relatedperson.html#optional-search-parameters)
51. **Applied:** RelatedPerson uses text from Observation Laboratory profile [FHIR-39792](https://jira.hl7.org/browse/FHIR-39792) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-relatedperson.html)
52. **Applied:** Reference only reason for using MedicationDispense [FHIR-39856](https://jira.hl7.org/browse/FHIR-39856) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-medicationdispense.html)
53. **Applied:** Adjust USCDI Mapping references to MedicationRequest Profile [FHIR-39857](https://jira.hl7.org/browse/FHIR-39857) See Changes [Here](https://hl7.org/fhir/us/core/STU6/uscdi.html)
54. **Applied:** Adjust USCDI Mapping references to DiagnosticReport Profile [FHIR-39858](https://jira.hl7.org/browse/FHIR-39858) See Changes [Here](https://hl7.org/fhir/us/core/STU6/uscdi.html)
55. **Applied:** Add USCDI Mapping references for Disability Status and Mental/Cognitive Status [FHIR-39859](https://jira.hl7.org/browse/FHIR-39859) See Changes [Here](https://hl7.org/fhir/us/core/STU6/uscdi.html)
56. **Applied:** Adjust USCDI Mapping references to Patient Profile [FHIR-39860](https://jira.hl7.org/browse/FHIR-39860) See Changes [Here](https://hl7.org/fhir/us/core/STU6/uscdi.html)
57. **Applied:** Fix Value set expansion [FHIR-39861](https://jira.hl7.org/browse/FHIR-39861) See Changes [Here](https://hl7.org/fhir/us/core/STU6/ValueSet-us-core-pregnancy-status.html)
58. **Applied:** Extensions - context of use [FHIR-39863](https://jira.hl7.org/browse/FHIR-39863) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-race.html)
59. **Applied:** Add more Lab Result examples [FHIR-39868](https://jira.hl7.org/browse/FHIR-39868) See Changes [Here](https://hl7.org/fhir/us/core/STU6/Observation-at-home-in-vitro-test.html)
60. **Applied:** MedicationRequest - Change prescriber to 0..1 this information is not known for patient reported medications. [FHIR-39869](https://jira.hl7.org/browse/FHIR-39869) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-medicationrequest.html)
61. **Applied:** Update Profile Formal Views labels [FHIR-39873](https://jira.hl7.org/browse/FHIR-39873)
62. **Applied:** Provide guidance for Prescriptions Sent by Mail [FHIR-39878](https://jira.hl7.org/browse/FHIR-39878) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-medicationdispense.html)
63. **Applied:** Change CarePlan.text from Mandatory min = 1 to Must Support min = 0 [FHIR-39902](https://jira.hl7.org/browse/FHIR-39902) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-careplan.html)
64. **Applied:** Using SNOMED CT United States Edition Typo [FHIR-39903](https://jira.hl7.org/browse/FHIR-39903) See Changes [Here](https://hl7.org/fhir/us/core/STU6/general-guidance.html#snomed-ct-united-states-edition)
65. **Applied:** Update the Change log [FHIR-39923](https://jira.hl7.org/browse/FHIR-39923) See Changes [Here](https://hl7.org/fhir/us/core/STU6/changes.html#whats-new-in-version-600-of-us-core)
66. **Applied:** Define the term Screening and Assessment [FHIR-39938](https://jira.hl7.org/browse/FHIR-39938) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html#introduction)
67. **Applied:** Clarify that Simple Observation Profile captures any sort of “simple” observations [FHIR-39940](https://jira.hl7.org/browse/FHIR-39940) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-simple-observation.html)
68. **Applied:** Correct the description of the Simple Observation Profile [FHIR-39942](https://jira.hl7.org/browse/FHIR-39942) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html#clinical-judgments)
69. **Applied:** Provide further guidance on use of US Core vs other domain specific IGs [FHIR-39943](https://jira.hl7.org/browse/FHIR-39943) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html#introduction)
70. **Applied:** Reframe Screening and Assessments Page [FHIR-39944](https://jira.hl7.org/browse/FHIR-39944) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html#introduction)
71. **Applied:** Update the Screening and Assessment Activities diagram [FHIR-39945](https://jira.hl7.org/browse/FHIR-39945) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html#related-activities-in-clinical-care)
72. **Applied:** Update the “Screening and Assessment Activities” diagram with proper profile name [FHIR-39946](https://jira.hl7.org/browse/FHIR-39946) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html)
73. **Applied:** Update Screening and Assessments” title and content [FHIR-39947](https://jira.hl7.org/browse/FHIR-39947) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html#screening-and-assessments)
74. **Applied:** Correct title[FHIR-39948](https://jira.hl7.org/browse/FHIR-39948) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html)
75. **Aoplied:** Update description of Screening Assessments Profile [FHIR-39949](https://jira.hl7.org/browse/FHIR-39949) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html)
76. **Applied:** Change Header [FHIR-39950](https://jira.hl7.org/browse/FHIR-39950) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html#us-core-observation-screening-assessment-profile)
77. **Applied:** Correct title of section 3.6.2.2 US Core Observation Simple Observation Profile [FHIR-39951](https://jira.hl7.org/browse/FHIR-39951) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html)
78. **Applied:** Require US Core Server to support the Simple Observation profile for simple assessments [FHIR-39953](https://jira.hl7.org/browse/FHIR-39953) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html#clinical-judgments)
79. **Applied:** Correct the link and sentence for assessment category codes [FHIR-39954](https://jira.hl7.org/browse/FHIR-39954) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html#category-codes)
80. **Applied:** Describe the purpose and intent of “Grouping” and update the diagram [FHIR-39955](https://jira.hl7.org/browse/FHIR-39955) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html#codes-for-problemshealthconcerns-goals-service-requests-and-procedures)
81. **Applied:** Remove US Core Common SDOH Assessments ValueSet [FHIR-39956](https://jira.hl7.org/browse/FHIR-39956)
82. **Applied:** Fix link text [FHIR-39958](https://jira.hl7.org/browse/FHIR-39958) See Changes [Here](https://hl7.org/fhir/us/core/STU6/changes.html)
83. **Applied:** Remove MS from Observation Screening Assessment Observation.performer Practitioner Reference [FHIR-39964](https://jira.hl7.org/browse/FHIR-39964) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-screening-assessment.html#profile)
84. **Applied:** Revert references the US Core QuestionnaireResponse Profile  [FHIR-39965](https://jira.hl7.org/browse/FHIR-39965) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-screening-assessment.html)
85. **Applied:** Correct link issue in “Profile specific implementation guidance section” of the ServiceRequest Profile [FHIR-39966](https://jira.hl7.org/browse/FHIR-39966) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-servicerequest.html)
86. **Applied:** Coverage.type binding clarification [FHIR-39982](https://jira.hl7.org/browse/FHIR-39982) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-coverage.html#mandatory-and-must-support-data-elements)
87. **Applied:** Rename US Core Observation Category Value Set [FHIR-40034](https://jira.hl7.org/browse/FHIR-40034) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-screening-assessment.html)
88. **Applied:** Extra ) in Screening and Assessments [FHIR-40041](https://jira.hl7.org/browse/FHIR-40041) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html)
89. **Applied:** Fix the link. [FHIR-40043](https://jira.hl7.org/browse/FHIR-40043) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html#category-codes)
90. **Applied:** Fix Pregnancy status codes  [FHIR-40045](https://jira.hl7.org/browse/FHIR-40045) See Changes [Here](https://hl7.org/fhir/us/core/STU6/ValueSet-us-core-pregnancy-status.html)
91. **Applied:** RelatedPerson profile text contains Observation content [FHIR-40048](https://jira.hl7.org/browse/FHIR-40048) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-relatedperson.html)
92. **Applied:** 2 typos in history page [FHIR-40069](https://jira.hl7.org/browse/FHIR-40069) See Changes [Here](https://hl7.org/fhir/us/core/history.html)
93. **Applied:** Reword a Quick Start example [FHIR-40072](https://jira.hl7.org/browse/FHIR-40072) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-patient.html#mandatory-search-parameters)
94. **Applied:** Consider alternative answer choices for pregnancy intent codes [FHIR-40084](https://jira.hl7.org/browse/FHIR-40084) See Changes [Here](https://hl7.org/fhir/us/core/STU6/ValueSet-us-core-pregnancy-intent.html)
95. **Applied:** Improve Screening Assessment Observation.hasMember short description [FHIR-40085](https://jira.hl7.org/browse/FHIR-40085) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-screening-assessment.html)
96. **Applied** Update the “bindings when slicing by value sets” figure  [FHIR-40086](https://jira.hl7.org/browse/FHIR-40086) See Changes [Here](https://hl7.org/fhir/us/core/STU6/general-requirements.html#required-bindings-when-slicing-by-valuesets)
97. **Applied:** Update Condition category slices to align with Observation/ServiceRequest[FHIR-40087](https://jira.hl7.org/browse/FHIR-40087) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-condition-problems-health-concerns.html)
98. **Applied:** Add guidance to the Procedure profile to express sdoh category [FHIR-40088](https://jira.hl7.org/browse/FHIR-40088) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html) and 
99. **Applied:** Improve language as to the expectations of clinicalStatus when category is problem list [FHIR-40089](https://jira.hl7.org/browse/FHIR-40089) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-condition-problems-health-concerns.html)
100. **Applied:** Align with FHIR DS4P IG [FHIR-40090](https://jira.hl7.org/browse/FHIR-40090) See Changes [Here](https://hl7.org/fhir/us/core/STU6/general-guidance.html#suppressed-data)
101. **Applied:** Remove AHC HRSN screening tool examples [FHIR-40091](https://jira.hl7.org/browse/FHIR-40091)
102. **Applied:** Add guidance show collection method and performer can be captured using Provenance [FHIR-40092](https://jira.hl7.org/browse/FHIR-40092) See Changes [Here](https://hl7.org/fhir/us/core/STU6/basic-provenance.html#element-level-provenance) and [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-patient.html#mandatory-and-must-support-data-elements)
103. **Applied:** Remove MustSupport from DocumentReference.category requiring clinical-note [FHIR-40102](https://jira.hl7.org/browse/FHIR-40102) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-documentreference.html)
104. **Applied:** Add Goal.startDate as 0..1 MS with choice of supporting this or Goal.target.dueDate [FHIR-40103](https://jira.hl7.org/browse/FHIR-40103) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-goal.html)
105. **Applied:** Clarify that other category codes are permitted and Remove MS from Observation.performer Practitioner Reference [FHIR-40104](https://jira.hl7.org/browse/FHIR-40104) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-simple-observation.html)
106. **Applied:** Add to the code systems chart [FHIR-40124](https://jira.hl7.org/browse/FHIR-40124) See Changes [Here](https://hl7.org/fhir/us/core/STU6/terminology.html#code-system-uris-used-in-us-core)
107. **Applied:** Make Specimen.subject must support [FHIR-40136](https://jira.hl7.org/browse/FHIR-40136) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-specimen.html)
108. **Applied:** Clarify use of unknown for occupation. [FHIR-40137](https://jira.hl7.org/browse/FHIR-40137) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html), [Here](https://hl7.org/fhir/us/core/STU6/Observation-observation-occupation-industry-unknown.html) and [Here](https://hl7.org/fhir/us/core/STU6/Observation-observation-occupation-unknown.html)
109. **Applied:** Clarify applicability of DiagnosticReport in USCDI Mapping [FHIR-40138](https://jira.hl7.org/browse/FHIR-40138) See Changes [Here](https://hl7.org/fhir/us/core/STU6/clinical-notes.html)
110. **Applied:** Remove the word "status" from introductory text [FHIR-40149](https://jira.hl7.org/browse/FHIR-40149) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html)
111. **Applied:** Incorrect link for "record or update" and additional examples [FHIR-40151](https://jira.hl7.org/browse/FHIR-40151) See Changes [Here](https://hl7.org/fhir/us/core/STU6/future-of-US-core.html#future-candidate-requirements-under-consideration)
112. **Applied:** Incorrect Resource noted in the introductory paragraph [FHIR-40155](https://jira.hl7.org/browse/FHIR-40155) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-coverage.html)
113. **Applied:** Define Job[FHIR-40158](https://jira.hl7.org/browse/FHIR-40158) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html)
114. **Applied:** Member or subscriber id is must have but the element cardinality is 0..* [FHIR-40160](https://jira.hl7.org/browse/FHIR-40160) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-coverage.html)
115. **Applied:** Modify comment regarding Screening and Assessments [FHIR-40161](https://jira.hl7.org/browse/FHIR-40161) See Changes [Here](https://hl7.org/fhir/us/core/STU6/screening-and-assessments.html#us-core-observation-screening-assessment-profile)
116. **Applied:** Modify Examples/ValueSet for Language Codes [FHIR-40165](https://jira.hl7.org/browse/FHIR-40165) See Changes [Here](https://hl7.org/fhir/us/core/STU6/ValueSet-simple-language.html)
117. **Applied:** Add Guidance for more advanced Occupation detail.[FHIR-40166](https://jira.hl7.org/browse/FHIR-40166) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html#profile)
118. **Applied:** Add implementer guidance [FHIR-40170](https://jira.hl7.org/browse/FHIR-40170) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html)
119. **Applied:** Add guidance for current job [FHIR-40172](https://jira.hl7.org/browse/FHIR-40172) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html)
120. **Applied:** Add guidance to clarify multiple codings can be used [FHIR-40178](https://jira.hl7.org/browse/FHIR-40178) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html)
121. **Applied:** Add _include guidance for Specimen [FHIR-40180](https://jira.hl7.org/browse/FHIR-40180) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-specimen.html#notes)
122. **Applied:** Update Industry NAICS Detail (ODH) to extensible. [FHIR-40181](https://jira.hl7.org/browse/FHIR-40181) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html)
123. **Applied:** Remove duplicate of Notes: Quick Start intro bullets [FHIR-40182](https://jira.hl7.org/browse/FHIR-40182) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html#profile)
124. **Applied:** Add search guidance [FHIR-40183](https://jira.hl7.org/browse/FHIR-40183) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html#mandatory-and-must-support-data-elements)
125. **Applied:** Update profile description to state the profile represents a patient's  'Past or Present Job' [FHIR-40187](https://jira.hl7.org/browse/FHIR-40187) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html)
126. **Applied:** Give guidance on SMART v2 scopes [FHIR-40192](https://jira.hl7.org/browse/FHIR-40192) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-condition-encounter-diagnosis.html#notes) and [Here](https://hl7.org/fhir/us/core/STU6/future-of-US-core.html#us-core-smart-scopes)
127. **Applied:** Remove the SFCU extension, and retain the birth-sex extension to meet USCDI Patient Sex. [FHIR-40197](https://jira.hl7.org/browse/FHIR-40197) See Changes [Here](https://hl7.org/fhir/us/core/STU6/uscdi.html)
128. **Applied:** Clarify guidance [FHIR-40199](https://jira.hl7.org/browse/FHIR-40199) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-medicationrequest.html#mandatory-and-must-support-data-elements)
129. **Applied:** Document expectations for Additional USCDI Requirements [FHIR-40200](https://jira.hl7.org/browse/FHIR-40200) See Changes [Here](https://hl7.org/fhir/us/core/STU6/general-requirements.html#us-core-conformance-artifacts) and [Here](https://hl7.org/fhir/us/core/STU6/must-support.html)
130. **Applied:** ServiceRequest Profile Implementation Specific Guidance - incorrect reference to ServiceRequest.reasonCode [FHIR-40202](https://jira.hl7.org/browse/FHIR-40202) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-servicerequest.html)
131. **Applied:** Tribal Affiliation Extension - add guidance to that extension:isEnrolled is an optional extension [FHIR-40203](https://jira.hl7.org/browse/FHIR-40203) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-tribal-affiliation.html)
132. **Applied:** Change Observation Occupation binding strength extensible [FHIR-40204](https://jira.hl7.org/browse/FHIR-40204) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html)
133. **Applied:** Change whenHandedOver cardinality 0..1 [FHIR-40205](https://jira.hl7.org/browse/FHIR-40205) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-medicationdispense.html)
134. **Applied:** MedicationRequest.reasonCodeableConcept does not exist [FHIR-40235](https://jira.hl7.org/browse/FHIR-40235) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-medicationrequest.html)
135. **Applied:** Clarify patient previous name and previous address [FHIR-40299](https://jira.hl7.org/browse/FHIR-40299) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-patient.html)
136. **Applied:** Update PractitionerRole.role binding [FHIR-40372](https://jira.hl7.org/browse/FHIR-40372) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-practitionerrole.html)
137. **Applied:** Remove MS from Patient on CareTeam.participant.member [FHIR-40415](https://jira.hl7.org/browse/FHIR-40415) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-careteam.html)
138. **Applied:** Update laboratory results example  [FHIR-40427](https://jira.hl7.org/browse/FHIR-40427) See Changes [Here](https://hl7.org/fhir/us/core/STU6/Observation-serum-glucose.html)
139. **Applied:** Update laboratory results example [FHIR-40428](https://jira.hl7.org/browse/FHIR-40428) See Changes [Here](https://hl7.org/fhir/us/core/STU6/Observation-serum-glucose.html)
140. **Applied:** Add Specimen to BUN example [FHIR-40429](https://jira.hl7.org/browse/FHIR-40429) See Changes [Here](https://hl7.org/fhir/us/core/STU6/Observation-serum-bun.html)
141. **Applied:** Additional guidance for accessing imaging studies [FHIR-40514](https://jira.hl7.org/browse/FHIR-40514) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-diagnosticreport-note.html#mandatory-and-must-support-data-elements)
142. **Applied:** Update example to follow 58410-2 CBC panel [FHIR-40521](https://jira.hl7.org/browse/FHIR-40521) See Changes [Here](https://hl7.org/fhir/us/core/STU6/DiagnosticReport-cbc.html)
143. **Applied:** Flag additional USCDI requirements in a computable way [FHIR-40553](https://jira.hl7.org/browse/FHIR-40553) See Changes [Here](https://hl7.org/fhir/us/core/STU6/must-support.html#uscdi-requirements)
144. **Applied:** Corrected expression in Condition asserted-date search parameter [FHIR-40573](https://jira.hl7.org/browse/FHIR-40573) See Changes [Here](https://hl7.org/fhir/us/core/STU6/SearchParameter-us-core-condition-asserted-date.html)
145. **Applied:** List only base profiles for reasonReference. [FHIR-40656](https://jira.hl7.org/browse/FHIR-40656) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-servicerequest.html#profile) and [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-medicationrequest.html#profile)
146. **Applied:** Remove US Core QuestionnaireResponse Tag Element [FHIR-40742](https://jira.hl7.org/browse/FHIR-40742) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-questionnaireresponse.html) and [Here](https://hl7.org/fhir/us/core/STU6/Questionnaire-prapare-example.html)
147. **Applied:** Clarify Direct address options [FHIR-40583](https://jira.hl7.org/browse/FHIR-40583) See Changes [Here](https://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-practitionerrole.html#mandatory-and-must-support-data-elements)


### Version = 6.0.0 - ballot
- url: <https://hl7.org/fhir/us/core/2023Jan/>
- Based on FHIR version : 4.0.1


#### The January 2023 Ballot

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

 **Tracker Status**: **Summary** **Jira Issue** **Link to Updated Content**
1. **Applied:** US Core: Require Provenance Resource for Create/Update/Delete Events, AuditEvent for Read [FHIR-14388](https://jira.hl7.org/browse/FHIR-14388) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/basic-provenance.html) and See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-provenance.html)
2. **Applied:** Add recommended search combination of patient + status [FHIR-19803](https://jira.hl7.org/browse/FHIR-19803) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-implantable-device.html#notes)
3. **Applied:** Consider adding years since quite smoking [FHIR-20131](https://jira.hl7.org/browse/FHIR-20131) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-smokingstatus.html)
4. **Applied:** Create a US Core extension to communicate the state jurisdiction for an element [FHIR-26943](https://jira.hl7.org/browse/FHIR-26943) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-jurisdiction.html)
5. **Applied:** Update missing data for coded data examples [FHIR-31381](https://jira.hl7.org/browse/FHIR-31381) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/general-requirements.html#missing-data)
6. **Applied:** Clarify the purpose of Clinical Test Observation Profile [FHIR-35114](https://jira.hl7.org/browse/FHIR-35114) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-observation-clinical-result.html)
7. **Applied:** Clarify how to read Profile Page [FHIR-36083](https://jira.hl7.org/browse/FHIR-36083) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/index.html#how-to-read-this-guide)
8. **Applied:** Clarify organization responsible for the DocumentReference [FHIR-36654](https://jira.hl7.org/browse/FHIR-36654) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-documentreference.html#mandatory-and-must-support-data-elements)
9. **Applied:** Clarify Device UDI-PI requirements [FHIR-36657](https://jira.hl7.org/browse/FHIR-36657) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-implantable-device.html#mandatory-and-must-support-data-elements)
10. **Applied:** Add 'problem-list-item' condition example [FHIR-36759](https://jira.hl7.org/browse/FHIR-36759) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/Condition-condition-duodenal-ulcer.html)
11. **Applied:** Fix LOINC LP code links [FHIR-36763](https://jira.hl7.org/browse/FHIR-36763) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/ValueSet-us-core-diagnosticreport-category.html)
12. **Applied:** Fix Link to "Direct Secure Messaging" [FHIR-36764](https://jira.hl7.org/browse/FHIR-36764) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-direct.html)
13. **Applied:** Update US Core Practitioner to clarify work related contact information [FHIR-36765](https://jira.hl7.org/browse/FHIR-36765) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-practitioner.html)
14. **Applied:** CLD for US Core Non Laboratory Codes value set is not computable [FHIR-36789](https://jira.hl7.org/browse/FHIR-36789) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/ValueSet-us-core-diagnosticreport-report-and-note-codes.html)
15. **Applied:** US Core Organization slice for CLIA does not list an HTA/THO approved external identifier system [FHIR-36926](https://jira.hl7.org/browse/FHIR-36926) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-organization.html)
16. **Applied:** Remove effectiveDateTime invariant from Sexual Orientation and Simple Observation (aka Social History) Profiles [FHIR-36932](https://jira.hl7.org/browse/FHIR-36932) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-observation-sexual-orientation.html) and See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-simple-observation.html)
17. **Applied:** Correct code system URI for HCPCS [FHIR-37336](https://jira.hl7.org/browse/FHIR-37336) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/ValueSet-us-core-procedure-code.html)
18. **Applied** change 'resources' to 'profiles' [FHIR-37343](https://jira.hl7.org/browse/FHIR-37343) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-provenance.html#mandatory-and-must-support-data-elements)
19. **Applied:** Clarify Expectations for Observation.value[x] in blood pressure and pulse oximetry profiles [FHIR-37358](https://jira.hl7.org/browse/FHIR-37358) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-blood-pressure.html#mandatory-and-must-support-data-elements) and See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-pulse-oximetry.html#mandatory-and-must-support-data-elements)
20. **Applied:** Clarify vaccineCode code system URI [FHIR-37400](https://jira.hl7.org/browse/FHIR-37400) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-immunization.html#mandatory-and-must-support-data-elements)
21. **Applied:** Typos on SDOH Guidance Page [FHIR-37469](https://jira.hl7.org/browse/FHIR-37469) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/screening-and-assessments.html)
22. **Applied** Add Constraint to validate NPI [FHIR-37498](https://jira.hl7.org/browse/FHIR-37498) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-practitioner.html) and See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-organization.html)
23. **Applied:** Remove extra instance or the word "resource" in Lab observation narrative profile [FHIR-37507](https://jira.hl7.org/browse/FHIR-37507) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-observation-lab.html)
24. **Applied:** Allow multiple Gender Identities and associated dates. [FHIR-37509](https://jira.hl7.org/browse/FHIR-37509) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-genderIdentity.html)
25. **Applied:** Typos on Patient and Practitioner "Name" SearchParameter pages [FHIR-37541](https://jira.hl7.org/browse/FHIR-37541) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/SearchParameter-us-core-patient-name.html) and See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/SearchParameter-us-core-practitioner-name.html)
26. **Applied:** Add Guidance on DocumentReference.category [FHIR-37592](https://jira.hl7.org/browse/FHIR-37592) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-documentreference.html#mandatory-and-must-support-data-elements)
27. **Applied:** Correct us-core-6 invariant expression [FHIR-37704](https://jira.hl7.org/browse/FHIR-37704) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-patient.html#constraints)
28. **Applied:**  Change Immunization.primarySource to must support and update definition [FHIR-37723](https://jira.hl7.org/browse/FHIR-37723) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-immunization.html)
29. **Applied:** Added supportedProfiles to US Core CapabilityStatements[FHIR-37766](https://jira.hl7.org/browse/FHIR-37766) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/CapabilityStatement-us-core-server.html#encounter)
30. **Applied:** Clarify how to use categories vis a vis codes in US Core Diagnostic Report Category element [FHIR-37770](https://jira.hl7.org/browse/FHIR-37770) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-diagnosticreport-note.html)
31. **Applied:** Clarify that US Core requires any version of SMART? [FHIR-37813](https://jira.hl7.org/browse/FHIR-37813) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/security.html)
32. **Applied:** Typo of "DiagnostisReport" in Clinical Notes Guidance [FHIR-37819](https://jira.hl7.org/browse/FHIR-37819) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/clinical-notes.html)
33. **Applied:** Update $docref type input to multiple Codings [FHIR-37894](https://jira.hl7.org/browse/FHIR-37894) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/OperationDefinition-docref.html) and See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-documentreference.html#mandatory-operation)
34. **Applied:** Add Conformance expectation of SHOULD to resolve for server Capability [FHIR-37901](https://jira.hl7.org/browse/FHIR-37901) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/CapabilityStatement-us-core-server.html)
35. **Applied:** Change Condition patient + category search to SHALL support [FHIR-37918](https://jira.hl7.org/browse/FHIR-37918) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-condition-encounter-diagnosis.html#notes)
36. **Applied:** Typo in Observation SDOH profile [FHIR-37928](https://jira.hl7.org/browse/FHIR-37928) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-observation-screening-assessment.html)
37. **Applied:** Typo in Condition Problems and Health Concerns search example [FHIR-37929](https://jira.hl7.org/browse/FHIR-37929) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-condition-problems-health-concerns.html)
38. **Applied:** Update Laboratory Loinc Valueset description [FHIR-37933](https://jira.hl7.org/browse/FHIR-37933) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/ValueSet-us-core-laboratory-test-codes.html)
39. **Applied:** Clarify that guide uses US Edition of SNOMED and update links to it  [FHIR-38190](https://jira.hl7.org/browse/FHIR-38190) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/general-guidance.html#snomed-ct-united-states-edition)
40. **Applied:** Update QuickStart to include all the search requirements by type. [FHIR-38629](https://jira.hl7.org/browse/FHIR-38629) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-observation-sexual-orientation.html)
41. **Applied:** Specify $docref's operates on DocumentReference endpoint [FHIR-38658](https://jira.hl7.org/browse/FHIR-38658) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/OperationDefinition-docref.html)
42. **Applied:** Remove comment in $docref [FHIR-38686](https://jira.hl7.org/browse/FHIR-38686) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/OperationDefinition-docref.html)
43. **Applied:** Add USCDI V3 Requirements [FHIR-38702](https://jira.hl7.org/browse/FHIR-38702) See Changes Listed in introduction above.
44. **Applied:** Correct documentation on Procedure.performed attribute [FHIR-38737](https://jira.hl7.org/browse/FHIR-38737) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-procedure.html#mandatory-and-must-support-data-elements)
45. **Applied:** Improve docref documentation [FHIR-38746](https://jira.hl7.org/browse/FHIR-38746) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/OperationDefinition-docref.html)
46. **Applied:** Fix title for US Core Pediatric Head Occipital Frontal Circumference Observation Profile [FHIR-38794](https://jira.hl7.org/browse/FHIR-38794) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-head-occipital-frontal-circumference-percentile.html)
47. **Applied:** Add Refill and Quantity to MedRequest [FHIR-39343](https://jira.hl7.org/browse/FHIR-39343) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-medicationrequest.html)
48. **Applied:** Fix Quick Start Rendering [FHIR-39367](https://jira.hl7.org/browse/FHIR-39367) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-patient.html#notes)
49. **Applied:** Remove Bulk Dependency  [FHIR-39377](https://jira.hl7.org/browse/FHIR-39377) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/CapabilityStatement-us-core-server.html#should_igs)
50. **Applied:** Fix Cross Version Comparisons section [FHIR-39417](https://jira.hl7.org/browse/FHIR-39417) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/changes-between-versions.html#cross-version-comparisons)
51. **Applied:** Add Ballot Comment to CarePlan for community feedback [FHIR-32949](https://jira.hl7.org/browse/FHIR-32949) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-careplan.html)
52. **Applied:** Change ServiceRequest.category to min=0 [FHIR-39493](https://jira.hl7.org/browse/FHIR-39493) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-servicerequest.html)
53. **Applied:** Fix provenance-1 [FHIR-39518](https://jira.hl7.org/browse/FHIR-39518) See Changes [Here](https://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-provenance.html)

### Version = 5.0.1 (Meets USCDI v2 Requirements)
- url: <https://hl7.org/fhir/us/core/STU5.0.1/>
- Based on FHIR version : 4.0.1


The changes in this errata to version 5.0.0 of US Core have been reviewed by the public through the HL7 errata process. The resolution of the community comments has been agreed to and voted on by the members of the HL7 International Cross-Group Projects work group.
#### Corrected Errata in Version 5.0.1 of US Core:

**Tracker Status**: **Summary** **Jira Issue** **Link to Updated Content**

1. **Applied**: Typos in Condition Profile URls  [FHIR-37585](https://jira.hl7.org/browse/FHIR-37585) See Changes:
   - [Here](https://hl7.org/fhir/us/core/STU5.0.1/StructureDefinition-us-core-condition-encounter-diagnosis.html)
   - [Here](https://hl7.org/fhir/us/core/STU5.0.1/StructureDefinition-us-core-condition-problems-health-concerns.html)
2. **Applied**: Update VSAC dependency package version and remove STU Notes where expansion now supported by publisher  [FHIR-37586](https://jira.hl7.org/browse/FHIR-37586)
3. **Applied**: Correct misapplied tracker - for `agent.who` remove MS from reference Practitioner and add to Organization [FHIR-28517](https://jira.hl7.org/browse/FHIR-28517) [See Change Here](https://hl7.org/fhir/us/core/STU5.0.1/StructureDefinition-us-core-provenance.html)


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

**Tracker Status**: **Summary** **Jira Issue** **Link to Updated Content**

1. **Applied**: Remove requirement for component SDOH Assessment's Observations [FHIR-34384](https://jira.hl7.org/browse/FHIR-34384) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-survey.html)
1. **Applied**: Clarify clinicalStatus invariant [FHIR-34468](https://jira.hl7.org/browse/FHIR-34468) [See Change Here](https://hl7.org/fhir/us/core/STU5/general-requirements.html#missing-data)
1. **Applied**: Fix Ethnicity ValueSet description [FHIR-34488](https://jira.hl7.org/browse/FHIR-34488) [See Change Here](https://hl7.org/fhir/us/core/STU5/ValueSet-omb-ethnicity-category.html)
1. **Applied**: Remove MS from ServiceRequest.occurrenceDateTime add MS to ServiceRequest.occurrencePeriod [FHIR-34493](https://jira.hl7.org/browse/FHIR-34493) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-servicerequest.html)
1. **Applied**: Change Goal.description search requirement from SHALL to SHOULD [FHIR-34546](https://jira.hl7.org/browse/FHIR-34546) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-goal.html#notes)
1. **Applied**: Warn client that categorization is fuzzy for SDOH [FHIR-34550](https://jira.hl7.org/browse/FHIR-34550) [See Change Here](https://hl7.org/fhir/us/core/STU5/sdoh.html#category-codes)
1. **Applied**: Split US Core Condition into two profile: Encounter Diagnosis and Problems/Health Concerns [FHIR-34553](https://jira.hl7.org/browse/FHIR-34553) See Change:
    - [Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-condition-problems-health-concerns.html)
    - [Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-condition-encounter-diagnosis.html)
1. **Applied**: Update narrative on abatement date [FHIR-34554](https://jira.hl7.org/browse/FHIR-34554) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-condition-problems-health-concerns.html)
1. **Applied**: Change Clinical Tests Observations category to "clinical-test" and add guidance [FHIR-34555](https://jira.hl7.org/browse/FHIR-34555) See Changes:
   - [Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-clinical-test.html)
   - [Here](https://hl7.org/fhir/us/core/STU5/ValueSet-us-core-observation-category.html)
   - [Here](https://hl7.org/fhir/us/core/STU5/CodeSystem-us-core-observation-category.html)
   - [Here](https://hl7.org/fhir/us/core/STU5/ValueSet-us-core-clinical-test-codes.html)
1. **Applied**: Update all occurrences of U.S. Core Data for Interoperability (USCDI) v1 to v2 or removed specific references to version. [FHIR-34613](https://jira.hl7.org/browse/FHIR-34613) [For Example, See Change Here](https://hl7.org/fhir/us/core/STU5/index.html)
1. **Applied**: Referencing US Core Profiles [FHIR-34623](https://jira.hl7.org/browse/FHIR-34623) [See Change Here](https://hl7.org/fhir/us/core/STU5/general-guidance.html#referencing-us-core-profiles)
1. **Applied**: Correct code system in example snippet[FHIR-34624](https://jira.hl7.org/browse/FHIR-34624) [See Change Here](https://hl7.org/fhir/us/core/STU5/general-requirements.html#missing-data)
1. **Applied**: Add further clarification between slicing a binding (4.1.0) vs using extensible binding (4.0.0) [FHIR-34626](https://jira.hl7.org/browse/FHIR-34626) [See Change Here](https://hl7.org/fhir/us/core/STU5/general-requirements.html#required-bindings-when-slicing-by-valuesets)
1. **Applied**: Fix typo [FHIR-34627](https://jira.hl7.org/browse/FHIR-34627)
1. **Applied**: Clarify reported guidance on how secondary sourced MedicationRequest information can be represented. [FHIR-34628](https://jira.hl7.org/browse/FHIR-34628) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-medicationrequest.html#mandatory-and-must-support-data-elements)
1. **Applied**: Fix contextDirection in Example 1[FHIR-34629](https://jira.hl7.org/browse/FHIR-34629) [See Change Here](https://hl7.org/fhir/us/core/STU5/clinical-notes.html#discovering-note-and-report-types)
1. **Applied**: Fix Medication List Examples [FHIR-34630](https://jira.hl7.org/browse/FHIR-34630) [See Change Here](https://hl7.org/fhir/us/core/STU5/medication-list.html#fetching-all-medications-active-medications-and-all-medications-for-an-encounter)
1. **Applied**: Correct Careteam Narrative errors (remove reference to Organization) [FHIR-34637](https://jira.hl7.org/browse/FHIR-34637) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-careteam.html#mandatory-and-must-support-data-elements)
1. **Applied**: Fix typo [FHIR-34638](https://jira.hl7.org/browse/FHIR-34638)
1. **Applied**: Added missing search query parameter values [FHIR-34642](https://jira.hl7.org/browse/FHIR-34642) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-imaging.html#notes)
1. **Applied**: Inconsistent on conditional required element [FHIR-34643](https://jira.hl7.org/browse/FHIR-34643) See Change:
  - [Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-diagnosticreport-lab.html)
  - [Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-diagnosticreport-note.html)
1. **Applied**: ServiceRequest.category:us-core should be required? [FHIR-34645](https://jira.hl7.org/browse/FHIR-34645) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-servicerequest.html#mandatory-and-must-support-data-elements)
1. **Applied**: Remove Condition.category "us-core-1"  (due to [FHIR-34553](https://jira.hl7.org/browse/FHIR-34553)) and change Immunization.vaccineCode "us-core-1" to "us-core-5", Patient.name.family "us-core-8" to "us-core-6 " to remove duplicate invariant id, is now ['us-core-1', 'us-core-2', 'us-core-3', 'us-core-4', 'us-core-5', 'us-core-6', 'us-core-7', 'us-core-8', 'us-core-9','us-core-10','us-core-13', 'us-core-14',] [FHIR-34646](https://jira.hl7.org/browse/FHIR-34646) See Change:
   - [Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-immunization.html)
   - [Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-patient.html)
1. **Applied**: Clarify that SDOH data elements does not include work information (see ODH) [FHIR-34701](https://jira.hl7.org/browse/FHIR-34701) See Change:
  -  [Here](https://hl7.org/fhir/us/core/STU5/sdoh.html)
  -  [Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-sdoh-assessment.html)
1. **Applied**: Add 386053000 "Evaluation procedure" ,410606002 "Social service procedure" to the ServiceRequest Category Code [FHIR-34747](https://jira.hl7.org/browse/FHIR-34747) [See Change Here](https://hl7.org/fhir/us/core/STU5/ValueSet-us-core-servicerequest-category.html)
1. **Applied**: Broaden Common SDOH assessment concepts and clarify is a starter set [FHIR-34752](https://jira.hl7.org/browse/FHIR-34752) See Change:
   - [Here](https://hl7.org/fhir/us/core/STU5/sdoh.html#assessment-codes)
   - [Here](https://hl7.org/fhir/us/core/STU5/ValueSet-us-core-common-sdoh-assessments.html)
   - [Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-sdoh-assessment.html)
1. **Applied**: Clinical Test Result Observation Profile Must Have needs to address the 3 slices for procedure, exam, and activity in the explanatory text [FHIR-34753](https://jira.hl7.org/browse/FHIR-34753) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-clinical-test.html)
1. **Applied**: Clarify guidance for use of Patient.genderIdentity, Patient.birthsex, and pre-existing Patient.gender [FHIR-34754](https://jira.hl7.org/browse/FHIR-34754) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-patient.html)
1. **Resolved - change required**: List profiles by type and create table comparing Observation Profiles [FHIR-34890](https://jira.hl7.org/browse/FHIR-34890) See Changes:
 - [Here](https://hl7.org/fhir/us/core/STU5/profiles-and-extensions.html)
 - [Here](https://hl7.org/fhir/us/core/STU5/index.html#us-core-profiles)
 - [Here](https://hl7.org/fhir/us/core/STU5/downloads.html)
1. **Applied**: Lab Result and Specimen Information for RBC Observation is Missing [FHIR-34910](https://jira.hl7.org/browse/FHIR-34910) See Change
   - [Here](https://hl7.org/fhir/us/core/STU5/index.html#how-to-read-this-guide)
   - [Here](https://hl7.org/fhir/us/core/STU5/examples.html)
   - [Here](https://hl7.org/fhir/us/core/STU5/Observation-blood-glucose.html)
1. **Applied**: Added guidance on Observation.category limitations [FHIR-34949](https://jira.hl7.org/browse/FHIR-34949) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-lab.html#mandatory-and-must-support-data-elements)
1. **Applied**: Add guidance on Imaging DiagnosticReport ontology [FHIR-34958](https://jira.hl7.org/browse/FHIR-34958) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-imaging.html)
1. **Applied**: Clarify that the profile guidance is not limited to profiled elements [FHIR-34971](https://jira.hl7.org/browse/FHIR-34971) [See Change Here](https://hl7.org/fhir/us/core/STU5/index.html#how-to-read-this-guide)
1. **Applied**: Fix asterisk notation in profiles [FHIR-34972](https://jira.hl7.org/browse/FHIR-34972) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-imaging.html)
1. **Applied**: Clarify "time" elements used in the DiagnosticReport profiles [FHIR-34973](https://jira.hl7.org/browse/FHIR-34973) See Change:
   - [Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-diagnosticreport-lab.html)
   - [Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-diagnosticreport-note.html)
1. **Applied**: Change the query parameter value to be consistent with previous statement [FHIR-35047](https://jira.hl7.org/browse/FHIR-35047) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-clinical-test.html#notes)
1. **Applied**: Re-ordered sections in *Downloads* page and provide a zip file of schematrons [FHIR-35064](https://jira.hl7.org/browse/FHIR-35064) [See Change Here](https://hl7.org/fhir/us/core/STU5/downloads.html)
1. **Applied**:  Split General Guidance page into 1) USCDI  3)General Guidance. Split Conformance Expectations into General Requirements and Must Support. Move General Guidance to General Requirements [FHIR-35065](https://jira.hl7.org/browse/FHIR-35065) See Changes:
  - [Here](https://hl7.org/fhir/us/core/STU5/uscdi.html)
  - [Here](https://hl7.org/fhir/us/core/STU5/general-requirements.html)
  - [Here](https://hl7.org/fhir/us/core/STU5/general-guidance.html)
  - [Here](https://hl7.org/fhir/us/core/STU5/must-support.html)
1. **Applied**: Clarify expectations for supporting multiple versions of US Core.[FHIR-35067](https://jira.hl7.org/browse/FHIR-35067) [See Change Here](https://hl7.org/fhir/us/core/STU5/changes-between-versions.html)
1. **Applied**: Clarify that Changes Between Versions (né DSTU2 to R4 Conversion) page documents a set of best practices [FHIR-35068](https://jira.hl7.org/browse/FHIR-35068) [See Change Here](https://hl7.org/fhir/us/core/STU5/changes-between-versions.html)
1. **Applied**: Typo in Category Codes section [FHIR-35072](https://jira.hl7.org/browse/FHIR-35072) [See Change Here](https://hl7.org/fhir/us/core/STU5/sdoh.html)
1. **Applied:** Typo [FHIR-35115](https://jira.hl7.org/browse/FHIR-35115)
1. **Applied**: Provide guidance when specific code systems are to be used in ServiceRequest [FHIR-35122](https://jira.hl7.org/browse/FHIR-35122) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-servicerequest.html)
1. **Applied**: Clarify description for effective time. [FHIR-35125](https://jira.hl7.org/browse/FHIR-35125) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-diagnosticreport-lab.html)
1. **Applied**: Fix CareTeam example's participant.role value [FHIR-35152](https://jira.hl7.org/browse/FHIR-35152) [See Change Here](https://hl7.org/fhir/us/core/STU5/CareTeam-example.html)
1. **Applied**: US Core Condition profile "status" is ambiguous; clarify to be clinicalStatus [FHIR-35280](https://jira.hl7.org/browse/FHIR-35280) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-condition-problems-health-concerns.html)
1. **Applied**: Align Observation category for SDOH assessments [FHIR-35282](https://jira.hl7.org/browse/FHIR-35282) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-social-history.html)
1. **Applied**: Add effective[x] 0..1 MS to US Core Observation Social History Profile [FHIR-35283](https://jira.hl7.org/browse/FHIR-35283) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-social-history.html)
1. **Applied**:  Clarify Condition.clinicalStatus requirements and searching using clinical-status [FHIR-35318](https://jira.hl7.org/browse/FHIR-35318) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-condition-problems-health-concerns.html)
1. **Applied**: Fix link [FHIR-35362](https://jira.hl7.org/browse/FHIR-35362)
1. **Applied**: Modify example usage text in all profile pages  [FHIR-35363](https://jira.hl7.org/browse/FHIR-35363) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-survey.html)
1. **Applied**: Clarify modeling of SDOH screening using Observations, Add QuestionnaireResponse profile as alternative screening instrument [FHIR-35364](https://jira.hl7.org/browse/FHIR-35364) See Changes:
  - [Here](https://hl7.org/fhir/us/core/STU5/sdoh.html)
  - [Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-survey.html)
  - [Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-sdoh-assessment.html)
  - [Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-questionnaireresponse.html)
1. **Applied**: Clarify $docref operation expectations [FHIR-35380](https://jira.hl7.org/browse/FHIR-35380) [See Change Here](https://hl7.org/fhir/us/core/STU5/CapabilityStatement-us-core-server.html#documentreference)
1. **Applied**: Typo [FHIR-35388](https://jira.hl7.org/browse/FHIR-35388)
1. **Applied**: Duplicate sections in US Core RelatedPerson Profile profile [FHIR-35452](https://jira.hl7.org/browse/FHIR-35452)
1. **Applied**: Updated guidance on changes between versions [FHIR-35576](https://jira.hl7.org/browse/FHIR-35576) [See Change Here](https://hl7.org/fhir/us/core/STU5/changes-between-versions.html)
1. **Applied**: Split section on "deleted" from "entered in error" [FHIR-35622](https://jira.hl7.org/browse/FHIR-35622) [See Change Here](https://hl7.org/fhir/us/core/STU5/general-guidance.html#representing-entered-in-error-information)
1. **Applied**: Use "sdoh" instead of "LG41762-2" for SDOH Categories and Tags [FHIR-35644](https://jira.hl7.org/browse/FHIR-35644) See Changes:
   - [Here](https://hl7.org/fhir/us/core/STU5/CodeSystem-us-core-tags.html)
   - [Here](https://hl7.org/fhir/us/core/STU5/ValueSet-us-core-tags.html)
   - [Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-sdoh-assessment.html)
1. **Applied**: Update Gender Identity Value set[FHIR-35677](https://jira.hl7.org/browse/FHIR-35677) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-genderIdentity.html)
1. **Applied**: Remove "OTH" from OMB Race Category valueSet [FHIR-35694](https://jira.hl7.org/browse/FHIR-35694) [See Change Here](https://hl7.org/fhir/us/core/STU5/ValueSet-omb-race-category.html)
1. **Applied**:Add basic introduction to the FHIR RESTful Search interaction in the home page [FHIR-35755](https://jira.hl7.org/browse/FHIR-35755) [See Change Here](https://hl7.org/fhir/us/core/STU5/index.html#us-core-fhir-restful-interactions)
1. **Applied**: Remove MS from DiagnosticReport.imagingStudy [FHIR-35759](https://jira.hl7.org/browse/FHIR-35759) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-diagnosticreport-note.html)
1. **Applied**: Media example data value fails regex [FHIR-35790](https://jira.hl7.org/browse/FHIR-35790) [See Change Here](https://hl7.org/fhir/us/core/STU5/Media-ekg-strip.json.html)
1. **Applied**: Typo [FHIR-35844](https://jira.hl7.org/browse/FHIR-35844)
1. **Applied**: Typo [FHIR-35851](https://jira.hl7.org/browse/FHIR-35851)
1. **Applied**: Change fixed category slice to max=1 [FHIR-35854](https://jira.hl7.org/browse/FHIR-35854) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-imaging.html)
1. **Applied**: Clarify narrative of status "active" element.  [FHIR-35870](https://jira.hl7.org/browse/FHIR-35870) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-organization.html)
1. **Applied**: allow ethnicity extension in FamilyMemberHistory [FHIR-35997](https://jira.hl7.org/browse/FHIR-35997) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-ethnicity.html)
1. **Applied**: allow race extension in FamilyMemberHistory [FHIR-35998](https://jira.hl7.org/browse/FHIR-35998) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-race.html)
1. **Applied**: Update Condition Implementation Guidance to reflect current USCDI terminology standards [FHIR-36056](https://jira.hl7.org/browse/FHIR-36056) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-condition-encounter-diagnosis.html)
1. **Applied**: Clarify expectations for reader [FHIR-36057](https://jira.hl7.org/browse/FHIR-36057) See Changes:
   - [Here](https://hl7.org/fhir/us/core/STU5/index.html)
   - [Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-lab.html)
1. **Applied**: Update US Core Yearly Updates [FHIR-36058](https://jira.hl7.org/browse/FHIR-36058) [See Change Here](https://hl7.org/fhir/us/core/STU5/future-of-US-core.html)
1. **Applied**: Remove "Cause of death" from Condition.category and remove US Core Condition Category Codes ValueSet [FHIR-36104](https://jira.hl7.org/browse/FHIR-36104)
1. **Applied**: Add OTH to sexual orientation ValueSet [FHIR-36166](https://jira.hl7.org/browse/FHIR-36166) [See Change Here](https://hl7.org/fhir/us/core/STU5/ValueSet-us-core-sexual-orientation.html)
1. **Applied**: Updated coding `system` in Missing Data documentation [FHIR-36177](https://jira.hl7.org/browse/FHIR-36177) [See Change Here](https://hl7.org/fhir/us/core/STU5/general-requirements.html#missing-data)
1. **Applied**: Add "Other Race" to OMB Race Categories [FHIR-36247](https://jira.hl7.org/browse/FHIR-36247) [See Change Here](https://hl7.org/fhir/us/core/STU5/ValueSet-omb-race-category.html)
1. **Applied**: Add MS to Device.distinctIdentifier to correct editorial error [FHIR-36303](https://jira.hl7.org/browse/FHIR-36303) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-implantable-device.html)
1. **Applied**: Fix provenance-1 invariant [FHIR-36328](https://jira.hl7.org/browse/FHIR-36328) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-provenance.html)
1. **Applied**: Correct _targetProfile element in Provenance StructureDefinition [FHIR-36344](https://jira.hl7.org/browse/FHIR-36344) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-provenance.html)
1. **Applied**: Correct guidance on accessing VSAC Valuesets [FHIR-36639](https://jira.hl7.org/browse/FHIR-36639) [See Change Here](https://hl7.org/fhir/us/core/STU5/terminology.html#using-value-set-authority-center-vsac)
1. **Applied**: Move change log from version history to new change log  page in IG [FHIR-36703](https://jira.hl7.org/browse/FHIR-36703) [See Change Here](https://hl7.org/fhir/us/core/STU5/changes.html)
1. **Applied**: Remove redundant example sections [FHIR-36728](https://jira.hl7.org/browse/FHIR-36728)
1. **Applied**: Realign ids names and titles for all new profiles for consistency [FHIR-36766](https://jira.hl7.org/browse/FHIR-36766) [See Change Here](https://hl7.org/fhir/us/core/STU5/profiles-and-extensions.html)
1. **Applied**: Move profile page introduction into StructureDefinition description [FHIR-36824](https://jira.hl7.org/browse/FHIR-36824) [See Change Here](https://hl7.org/fhir/us/core/STU5/profiles-and-extensions.html)
1. **Applied**: Fixed profile, Added STU Note, Updated FHIR Core Vitals Profile binding in FHIR R4B. [FHIR-27845](https://jira.hl7.org/browse/FHIR-27845) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-pulse-oximetry.html)
1. **Applied**: Change Encounter.reasonReference from 0..1 to 0..* [FHIR-36862](https://jira.hl7.org/browse/FHIR-36862) [See Change Here](https://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-encounter.html)
1. **Applied**: Change URL for CDT from http://ada.org/cdt to http://www.ada.org/cdt. [FHIR-36861](https://jira.hl7.org/browse/FHIR-36861) [See Change Here](https://hl7.org/fhir/us/core/STU5/ValueSet-us-core-procedure-code.html)

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

 **Tracker Status**: **Summary** **Jira Issue** **Link to Updated Content**
  1. **Applied**: Make values in direct and birth sex extensions min=1 [FHIR-26459](https://jira.hl7.org/browse/FHIR-26459) See Change:
     - [Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-birthsex.html)
     - [Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-direct.html)
  2. **Applied**: FIX imm-1.json NDC/CVX codes QA Error [FHIR-30104](https://jira.hl7.org/browse/FHIR-30104) See Change:
     - [Here](https://hl7.org/fhir/us/core/2022Jan/Immunization-imm-1.html)
     - [Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-immunization.html)
  3. **Applied**: Fix patient search parameter definitions to only target Patient  [FHIR-32305](https://jira.hl7.org/browse/FHIR-32305) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/SearchParameter-us-core-allergyintolerance-patient.json.html)
  4. **Applied**: Provide a caution to the user that a query of MedicationRequest does not provide complete information. [FHIR-32720](https://jira.hl7.org/browse/FHIR-32720) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-medicationrequest.html#mandatory-and-must-support-data-elements)
  5. **Applied**: Make Condition.encounter 0..1 MS [FHIR-32844](https://jira.hl7.org/browse/FHIR-32844) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-condition.html)
  6. **Applied**: Correction on USCoreCarePlanProfile Binding [FHIR-32846](https://jira.hl7.org/browse/FHIR-32846) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-careplan.html)
  7. **Applied**: Fix title for BMI Profile [FHIR-32847](https://jira.hl7.org/browse/FHIR-32847) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-bmi.html)
  8. **Applied**: Remove unchanged elements from Differentials [FHIR-32848](https://jira.hl7.org/browse/FHIR-32848) [For example change see](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-diagnosticreport-lab.profile.json.html)
  9. **Applied**: Create US Core slices for category elements [FHIR-32857](https://jira.hl7.org/browse/FHIR-32857) See Change:
     -  [Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-documentreference.html)
     -  [Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-medicationrequest.html)
     -  [Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-servicerequest.html)
     -  [Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-condition.html)
  10. **Applied**: Change drug class value set for allergens to align with C-CDA [FHIR-32953](https://jira.hl7.org/browse/FHIR-32953) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-allergyintolerance.html)
  11. **Applied**: Referencing incorrect figure [FHIR-32961](https://jira.hl7.org/browse/FHIR-32961) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/basic-provenance.html#clinical-information-reconciliation-and-incorporation)
  12. **Applied**: Clarify Guidance for missing data for Coding data type element [FHIR-33048](https://jira.hl7.org/browse/FHIR-33048) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/general-guidance.html#missing-data)
  13. **Applied**: Fix us-core-1 Invariant for Observation [FHIR-33052](https://jira.hl7.org/browse/FHIR-33052) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-observation-lab.html#constraints)
  14. **Applied**: Remove requirement to use only 401 from capabiltystatement [FHIR-33069](https://jira.hl7.org/browse/FHIR-33069) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/CapabilityStatement-us-core-server.html#behavior)
  15. **Applied**: US Core to USCDI guidance page -- add patient email [FHIR-33079](https://jira.hl7.org/browse/FHIR-33079) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-patient.html)
  16. **Applied**: Utilize "use" field for patient previous name and previous address [FHIR-33080](https://jira.hl7.org/browse/FHIR-33080) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-patient.html)
  17. **Applied**: Fix search parameter list [FHIR-33123](https://jira.hl7.org/browse/FHIR-33123) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/search-parameters-and-operations.html)
  18. **Applied**: Clarify requirement on date searches without prefix [FHIR-33156](https://jira.hl7.org/browse/FHIR-33156) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/general-guidance.html#search-syntax.html)
  19. **Applied**: Clarify distinction between repeated search params and "composite" params [FHIR-33159](https://jira.hl7.org/browse/FHIR-33159) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-observation-lab.html#notes)
  20. **Applied**: Add content as mandatory element in narrative for documentreference [FHIR-33160](https://jira.hl7.org/browse/FHIR-33160) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-documentreference.html)
  21. **Applied**: Fix invalid elements in extensions [FHIR-33233](https://jira.hl7.org/browse/FHIR-33233) See Change:
     - [Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-race.html)
     - [Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-birthsex.html)
     - [Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-direct.html)
  22. **Applied**: Make Procedure.performed conditionally mandatory [FHIR-33243](https://jira.hl7.org/browse/FHIR-33243) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-procedure.html)
  23. **Applied**: add same Null options to Race and Ethnicity [FHIR-34036](https://jira.hl7.org/browse/FHIR-34036) See Change
     - [Here](https://hl7.org/fhir/us/core/2022Jan/ValueSet-omb-ethnicity-category.html)
     - [Here](https://hl7.org/fhir/us/core/2022Jan/ValueSet-detailed-ethnicity.html)
     - [Here](https://hl7.org/fhir/us/core/2022Jan/ValueSet-omb-race-category.html)
     - [Here](https://hl7.org/fhir/us/core/2022Jan/ValueSet-detailed-race.html)
  24. **Applied**: Clarify MustSupport for Observation.component.value[x] vs dataAbsentReason [FHIR-34061](https://jira.hl7.org/browse/FHIR-34061) See Change:
     - [Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-blood-pressure.html#mandatory-and-must-support-data-elements)
     - [Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-vital-signs.html#mandatory-and-must-support-data-elements)
  25. **Applied**: Add  Null options to US Core Birth Sex Extension [FHIR-34133](https://jira.hl7.org/browse/FHIR-34133) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/ValueSet-birthsex.html)
  26. **Applied**: USCDI v2 update [FHIR-34231](https://jira.hl7.org/browse/FHIR-34231) SEE SECTION ABOVE
  27. **Applied**: Fix Observation Examples using `appliesTo` [FHIR-34286](https://jira.hl7.org/browse/FHIR-34286) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/Observation-serum-calcium.html)
  28. **Applied**: Correct CapabilityStatement SMART IG reference [FHIR-34281](https://jira.hl7.org/browse/FHIR-34281) [See Change Here](https://hl7.org/fhir/us/core/2022Jan/CapabilityStatement-us-core-server.html#should_igs)
  29. **Applied**: Make DiagnosticReport.effective and DiagnosticReport.issued conditionally mandatory [FHIR-34330](https://jira.hl7.org/browse/FHIR-34330) See Change:
      - [Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-diagnosticreport-lab.html)
      - [Here](https://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-diagnosticreport-note.html)
  30. **Applied**: fix URL[See Change Here](https://hl7.org/fhir/us/core/2022Jan/search-parameters-and-operations.html#operations)
  31. **Applied**: US Core search page is not working [FHIR-34028](https://jira.hl7.org/browse/FHIR-34028) - Coordination with HL7 IG publishing team to Correct

  **The Following Trackers Will be Applied Following this Ballot**

  Due external dependencies and publication tooling limitations, the application of these resolutions have been deferred.

  **Tracker Status**: **Summary** **Jira Issue** **Link to Updated Content**
  
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

**Status**: **Summary**:(**Jira Issue**) **Link to Change**
1. **Applied**:Update PractitionerRole.practitioner to )..1 MS ([FHIR-29681](https://jira.hl7.org/browse/FHIR-29681)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-practitionerrole.html#profile)
1. **Applied**:Change CareTeam `status` search parameter compositeOR expectation to SHOULD ([FHIR-29768](https://jira.hl7.org/browse/FHIR-29768)) [See Change Here](https://hl7.org/fhir/us/core/STU4/SearchParameter-us-core-careteam-status.html)
1. **Applied**:Provide guidance on the population of narrative ([FHIR-29777](https://jira.hl7.org/browse/FHIR-29777)) [See Change Here](https://hl7.org/fhir/us/core/STU4/general-guidance.html#narrative)
1. **Applied**: Change $docref start and end input parameter types from `date` to `dateTime` ([FHIR-29825](https://jira.hl7.org/browse/FHIR-29825)) [See Change Here](https://hl7.org/fhir/us/core/STU4/OperationDefinition-docref.html)
1. **Applied**: The history file markdown rendering of the table ([FHIR-30100](https://jira.hl7.org/browse/FHIR-30100)) [See Change Here](https://hl7.org/fhir/us/core/history.html)
1. **Applied**:footnote rendering - pre-applied ([FHIR-30101](https://jira.hl7.org/browse/FHIR-30101)) [See Change Here](https://hl7.org/fhir/us/core/STU4/general-guidance.html#guidance-on-limiting-the-number-of-search-results)
1. **Applied**:Random Section Numbering (Reminder for tooling issue) ([FHIR-30102](https://jira.hl7.org/browse/FHIR-30102)) [See Change Here](https://hl7.org/fhir/us/core/STU4/toc.html)
1. **Applied**:Move section 1.5 US Core Conformance Requirements ([FHIR-30103](https://jira.hl7.org/browse/FHIR-30103)) [See Change Here](https://hl7.org/fhir/us/core/STU4/conformance-expectations.html)
1. **Applied**:Make custodian optional on document reference ([FHIR-30108](https://jira.hl7.org/browse/FHIR-30108)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-documentreference.html)
1. **Applied**:Remove required binding on procedure and condition ([FHIR-30109](https://jira.hl7.org/browse/FHIR-30109)) See Changes:
   - [Here](https://hl7.org/fhir/us/core/STU4/conformance-expectations.html#extensible-binding-for-codeableconcept-datatype)
   - [Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-condition.html#profile)
   - [Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-procedure.html#profile)

1. **Applied**:Update DocumentReference CCD operation ([FHIR-30110](https://jira.hl7.org/browse/FHIR-30110)) [See Change Here](https://hl7.org/fhir/us/core/STU4/OperationDefinition-docref.html)
1. **Applied**:Update DocumentReference MustSupport to choice of data or url ([FHIR-30111](https://jira.hl7.org/browse/FHIR-30111)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-documentreference.html#mandatory-and-must-support-data-elements)
1. **Applied**:Reference to 3 new document types - addressing corresponding metadat ([FHIR-30112](https://jira.hl7.org/browse/FHIR-30112)) [See Change Here](https://hl7.org/fhir/us/core/STU4/clinical-notes-guidance.html#clinical-notes) AND [See Change Here](https://hl7.org/fhir/us/core/STU4/clinical-notes-guidance.html#support-requirements)
1. **Applied**:Typo ([FHIR-30113](https://jira.hl7.org/browse/FHIR-30113))
1. **Applied**:Clarify Must Support of Complex elements ([FHIR-30321](https://jira.hl7.org/browse/FHIR-30321)) [See Change Here](https://hl7.org/fhir/us/core/STU4/conformance-expectations.html#must-support---complex-elements)
1. **Applied**:Clarify that VSAC FHIR API only retrieves a definition ([FHIR-30344](https://jira.hl7.org/browse/FHIR-30344)) [See Change Here](https://hl7.org/fhir/us/core/STU4/terminology.html#using-value-set-authority-center-vsac)
1. **Applied**:Allergy Intolerance example for UNKNOWN allergy status does not use unknown ([FHIR-30345](https://jira.hl7.org/browse/FHIR-30345)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-allergyintolerance.html#mandatory-and-must-support-data-elements)
1. **Applied**:Corrected allergy intolerance example SNOMED CT code ([FHIR-30346](https://jira.hl7.org/browse/FHIR-30346)) [See Change Here](https://hl7.org/fhir/us/core/STU4/AllergyIntolerance-example.html)
1. **Applied**:Allergy codes updated to snomed product hierarchy in VSAC([FHIR-30347](https://jira.hl7.org/browse/FHIR-30347)) [See Change Here](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1186.8/expansion)
1. **Applied**:Clarify plans to align with Gender Harmony([FHIR-30350](https://jira.hl7.org/browse/FHIR-30350)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-patient.html#mandatory-and-must-support-data-elements)
1. **Applied**:Typos on Conformance Expectations Page ([FHIR-30353](https://jira.hl7.org/browse/FHIR-30353)) [See Change Here](https://hl7.org/fhir/us/core/STU4/conformance-expectations.html)
1. **Applied**:clarify use of additional codings ([FHIR-30354](https://jira.hl7.org/browse/FHIR-30354)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-vital-signs.html#mandatory-and-must-support-data-elements)
1. **Applied**:Clarify server requirements for Choice of Profile Elements scenario ([FHIR-30355](https://jira.hl7.org/browse/FHIR-30355)) [See Change Here](https://hl7.org/fhir/us/core/STU4/conformance-expectations.html#must-support---choice-of-profile-elements)
1. **Applied**:Add all options to Procedure.performed[x] ([FHIR-30391](https://jira.hl7.org/browse/FHIR-30391)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-procedure.html#profile)
1. **Applied**:Updated MedicationRequest.authoredOn from mandatory to must support([FHIR-30430](https://jira.hl7.org/browse/FHIR-30430)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-medicationrequest.html#mandatory-and-must-support-data-elements)
1. **Applied**:Typo ([FHIR-30460](https://jira.hl7.org/browse/FHIR-30460)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-vital-signs.html#mandatory-and-must-support-data-elements)
1. **Applied**: Update Encounter Type CPT Description ([FHIR-30470](https://jira.hl7.org/browse/FHIR-30470)) [See Change Here](https://hl7.org/fhir/us/core/STU4/ValueSet-us-core-encounter-type.html)
1. **Applied**: Clarify Missing Data language for coded data elements with required binding strength ([FHIR-30630](https://jira.hl7.org/browse/FHIR-30630)) [See Change Here](https://hl7.org/fhir/us/core/STU4/general-guidance.html#missing-data)
1. **Applied**:Note re language codes([FHIR-30654](https://jira.hl7.org/browse/FHIR-30654)) [See Change Here](https://hl7.org/fhir/us/core/STU4/ValueSet-simple-language.html#notes)
1. **Applied**:Change URL for Healthcare Common Procedure Coding System (HCPCS) level II alphanumeric codes([FHIR-30655](https://jira.hl7.org/browse/FHIR-30655)) See Changes [Here](https://hl7.org/fhir/us/core/STU4/terminology.html#using-value-set-authority-center-vsac) and [Here](https://hl7.org/fhir/us/core/STU4/ValueSet-us-core-procedure-code.html)
1. **Applied**:Typo ([FHIR-30656](https://jira.hl7.org/browse/FHIR-30656))
1. **Applied**: Explain the relationship between US CORE and an evolving USCDI. ([FHIR-30657](https://jira.hl7.org/browse/FHIR-30657)) [See Change Here](https://hl7.org/fhir/us/core/STU4/index.html)
1. **Applied**:Correct 2 bullet points in section 1.2. ([FHIR-30658](https://jira.hl7.org/browse/FHIR-30658)) [See Change Here](https://hl7.org/fhir/us/core/STU4/index.html)
1. **Applied**:Clarify actors ([FHIR-30659](https://jira.hl7.org/browse/FHIR-30659)) [See Change Here](https://hl7.org/fhir/us/core/STU4/index.html#us-core-actors)
1. **Applied**:Edit basic provenance ([FHIR-30660](https://jira.hl7.org/browse/FHIR-30660)) [See Change Here](https://hl7.org/fhir/us/core/STU4/basic-provenance.html#clinical-information-reconciliation-and-incorporation)
1. **Applied**:Clarify the duplication requirement for scanned documents in DocumentReference and DiagnosticReport. ([FHIR-30662](https://jira.hl7.org/browse/FHIR-30662)) [See Change Here](https://hl7.org/fhir/us/core/STU4/clinical-notes-guidance.html#fhir-resources-to-exchange-clinical-notes)
1. **Applied**:Clarify that clients should retain data visualization between DSTU2 to R4 upgrades. ([FHIR-30665](https://jira.hl7.org/browse/FHIR-30665)) [See Change Here](https://hl7.org/fhir/us/core/STU4/DSTU2-to-R4-conversion.html#expectation-that-fhir-dstu2-data-is-preserved-in-fhir-r4)
1. **Applied**:Add provenance to writing/updating guidance? ([FHIR-30666](https://jira.hl7.org/browse/FHIR-30666)) [See Change Here](https://hl7.org/fhir/us/core/STU4/future-of-US-core.html)
1. **Applied**:Clarify Code System section and update codesystem table ([FHIR-30667](https://jira.hl7.org/browse/FHIR-30667)) [See Change Here](https://hl7.org/fhir/us/core/STU4/terminology.html#code-systems)
1. **Applied**: Clarify guidance on implantable medical devices. ([FHIR-30669](https://jira.hl7.org/browse/FHIR-30669)) [[See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-implantable-device.html#mandatory-and-must-support-data-elements)
1. **Applied**: Make udi_HRF a *Must Support* element. ([FHIR-30670](https://jira.hl7.org/browse/FHIR-30670)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-implantable-device.html#mandatory-and-must-support-data-elements)
1. **Applied**: Clarify UDI information. ([FHIR-30672](https://jira.hl7.org/browse/FHIR-30672)) See Changes:
    - [Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-implantable-device.html#mandatory-and-must-support-data-elements)
    - [Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-implantable-device.html#profile)
1. **Applied**:Clarify text ([FHIR-30673](https://jira.hl7.org/browse/FHIR-30673)) [See Change Here](https://hl7.org/fhir/us/core/STU4/conformance-expectations.html#conformance-expectations)
1. **Applied**:Typos ([FHIR-30674](https://jira.hl7.org/browse/FHIR-30674))
1. **Applied**:Clarify prohibition on using contained resources. ([FHIR-30677](https://jira.hl7.org/browse/FHIR-30677)) [See Change Here](https://hl7.org/fhir/us/core/STU4/general-guidance.html#contained-resources)
1. **Applied**:Add guidance on suppressed data. ([FHIR-30678](https://jira.hl7.org/browse/FHIR-30678)) [See Change Here](https://hl7.org/fhir/us/core/STU4/general-guidance.html#suppressed-data)
1. **Applied**:Clarify what is meant by "support the other elements." ([FHIR-30680](https://jira.hl7.org/browse/FHIR-30680)) [See Change Here](https://hl7.org/fhir/us/core/STU4/conformance-expectations.html#must-support---choice-of-data-types)
1. **Applied**:Typo([FHIR-30681](https://jira.hl7.org/browse/FHIR-30681))
1. **Applied**:Fix typos ([FHIR-30683](https://jira.hl7.org/browse/FHIR-30683)) Various Changes
1. **Applied**:Update on Guidance on DataAbsentReason for Observations ([FHIR-30685](https://jira.hl7.org/browse/FHIR-30685)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-observation-lab.html#mandatory-and-must-support-data-elements)
1. **Applied**:Clarify use of qualifier LOINCs ([FHIR-30690](https://jira.hl7.org/browse/FHIR-30690)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-vital-signs.html#mandatory-and-must-support-data-elements)
1. **Applied**: Fix Typo ([FHIR-30695](https://jira.hl7.org/browse/FHIR-30695)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-immunization-definitions.html)
1. **Applied**: Update on Guidance on DataAbsentReason for Observations ([FHIR-30699](https://jira.hl7.org/browse/FHIR-30699)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-observation-lab.html#mandatory-and-must-support-data-elements)
1. **Applied**: Clarify what is intended with "additional observations"([FHIR-30772](https://jira.hl7.org/browse/FHIR-30772)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-vital-signs.html#mandatory-and-must-support-data-elements)
1. **Applied**: Add statement about clinical safety to the security page ([FHIR-30776](https://jira.hl7.org/browse/FHIR-30776)) [See Change Here](https://hl7.org/fhir/us/core/STU4/security.html)
1. **Applied**: Added clarification to vitals profile regarding use of additional codings and component observations. ([FHIR-30778](https://jira.hl7.org/browse/FHIR-30778)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-blood-pressure.html#mandatory-and-must-support-data-elements)
2. **Applied**: Typo ([FHIR-30782](https://jira.hl7.org/browse/FHIR-30782)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-vital-signs.html#mandatory-and-must-support-data-elements)
3. **Applied**: Clarify resource search requirements CapabilityStatements and provide guidance on search for multiple patients using Bulk data ([FHIR-30787](https://jira.hl7.org/browse/FHIR-30787)) See Changes:
   - [Here](https://hl7.org/fhir/us/core/STU4/general-guidance.html#searching-multiple-patients)
   - [Here](https://hl7.org/fhir/us/core/STU4/CapabilityStatement-us-core-server.html#condition)
4. **Applied**: Add MedicationAdministration to the Future Page. ([FHIR-30788](https://jira.hl7.org/browse/FHIR-30788)) [See Change Here](https://hl7.org/fhir/us/core/STU4/future-of-US-core.html#future-candidate-requirements-under-consideration)
5. **Applied**: Fix text in $docref description ([FHIR-30810](https://jira.hl7.org/browse/FHIR-30810)) [See Change Here](https://hl7.org/fhir/us/core/STU4/OperationDefinition-docref.html)
6. **Applied**: Mandate that CapabilityStatement.instantiates refer to US Core ([FHIR-30889](https://jira.hl7.org/browse/FHIR-30889)) [See Change Here](https://hl7.org/fhir/us/core/STU4/CapabilityStatement-us-core-server.html#shall_css)
7. **Applied**: Add binding so Vitals will render it in differential view ([FHIR-31391](https://jira.hl7.org/browse/FHIR-31391)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-vital-signs.html#profile)
8. **Applied**: Update to URI from OID for CDT in Procedure Code ValueSet ([FHIR-31556](https://jira.hl7.org/browse/FHIR-31556)) [See Change Here](https://hl7.org/fhir/us/core/STU4/ValueSet-us-core-procedure-code.html)
9. **Applied**: Add DocumentReference.content is under "must have" list ([FHIR-31364](https://jira.hl7.org/browse/FHIR-31364)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-documentreference.html#mandatory-and-must-support-data-elements)
10. **Applied**: Update Must Support Bullet regarding missing data ([FHIR-31507](https://jira.hl7.org/browse/FHIR-31507)) [See Change Here](https://hl7.org/fhir/us/core/STU4/conformance-expectations.html#must-support-elements)
11. **Applied**: Update use context for Race and Ethnicity extensions ([FHIR-31008](https://jira.hl7.org/browse/FHIR-31008)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-race.html)
12. **Applied**: Add guidance on "POST based search" ([FHIR-31585](https://jira.hl7.org/browse/FHIR-31585)) See Changes:
   - [Here](https://hl7.org/fhir/us/core/STU4/general-guidance.html#search-syntax)
   - [Here](https://hl7.org/fhir/us/core/STU4/CapabilityStatement-us-core-server.html#behavior)
13. **Applied**: Add reference to Mapping from LOINC scale type to FHIR data type ([FHIR-31084](https://jira.hl7.org/browse/FHIR-31084)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-observation-lab.html#mandatory-and-must-support-data-elements)
14. **Applied**: Update Observation.value[x] definition ([FHIR-31083](https://jira.hl7.org/browse/FHIR-31083)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-observation-lab-definitions.html#Observation.value[x])
15. **Applied**: Add LOINC to procedure codes ([FHIR-31514](https://jira.hl7.org/browse/FHIR-31514)) [See Change Here](https://hl7.org/fhir/us/core/STU4/ValueSet-us-core-procedure-code.html)
16. **Applied**: Make PractitionerRole.organization must support and add invariant ([FHIR-29680](https://jira.hl7.org/browse/FHIR-29680)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-practitionerrole.html)
17. **Applied**: Fix FHIRPath constraint for provenance-1([FHIR-31020](https://jira.hl7.org/browse/FHIR-31020)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-provenance.html)
18. **Applied**: Add guidance to BMI Profile([FHIR-32658](https://jira.hl7.org/browse/FHIR-32658)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-bmi.html)
19. **Applied**: Write usage note for non-vaccination CVX codes([FHIR-31899](https://jira.hl7.org/browse/FHIR-31899)) [See Change Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-immunization.html#mandatory-and-must-support-data-elements)
20. **Applied**: Clarify that Extensible binding can always provide a mapped code([FHIR-32010](https://jira.hl7.org/browse/FHIR-32010)) [See Change Here](https://hl7.org/fhir/us/core/STU4/conformance-expectations.html#extensible-binding-for-codeableconcept-datatype)
21. **Applied**: Clarify RESTFul requirements([FHIR-31490](https://jira.hl7.org/browse/FHIR-31490)) See Changes:
   - [Here](https://hl7.org/fhir/us/core/STU4/index.html#introduction)
   - [Here](https://hl7.org/fhir/us/core/STU4/index.html#how-to-read-this-guide)
   - [Here](https://hl7.org/fhir/us/core/STU4/conformance-expectations.html#conformance-expectations)
   - [Here](https://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-allergyintolerance.html#notes)
22. **Applied**: fix Procedure Example error ([FHIR-30106](https://jira.hl7.org/browse/FHIR-30106)) [See Change Here](https://hl7.org/fhir/us/core/STU4/Procedure-rehab.html)

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

1. Must Support Over Interpreted ([FHIR-28375](https://jira.hl7.org/browse/FHIR-28375)) Changes throughout the profiles -- added conformance page [See Change Here](https://hl7.org/fhir/us/core/2021Jan/conformance-expectations.html)

1. Replace the US Core Update Allergy substances value set with VSAC reference ([FHIR-29322](https://jira.hl7.org/browse/FHIR-29322)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-allergyintolerance.html)

1. Update Organization Quick Start Example Search. ([FHIR-29269](https://jira.hl7.org/browse/FHIR-29269)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-organization.html#quick-start)

1. birthsex binding applied to the wrong element in US Core Patient StructuredDefinition/differential ([FHIR-29262](https://jira.hl7.org/browse/FHIR-29262)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-patient.profile.json.html)

1. us-core-12 invariant interpretation ([FHIR-28942](https://jira.hl7.org/browse/FHIR-28942)) See Changes [Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-implantable-device.html#FHIR-28942)

1. Incorrect Description Observation.component (Pulse Ox) ([FHIR-28934](https://jira.hl7.org/browse/FHIR-28934)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-pulse-oximetry.html)

1. References should be constrained to use `reference` not `identifier` ([FHIR-28573](https://jira.hl7.org/browse/FHIR-28573)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/general-guidance.html#FHIR-28573)

1. Update USCorePatientName search description for consistency ([FHIR-28540](https://jira.hl7.org/browse/FHIR-28540)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-patient.html#quick-start)

1. Make Provenance.author optional ([FHIR-28517](https://jira.hl7.org/browse/FHIR-28517)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-provenance.html#FHIR-28516)

1. Add must support type choices for US Core Goal.target.due[x]. ([FHIR-28477](https://jira.hl7.org/browse/FHIR-28477)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-goal.html)

1. Immunization Profile Mandatory and Must Support Intro is missing attributes ([FHIR-28452](https://jira.hl7.org/browse/FHIR-28452)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-immunization.html#FHIR-28452)

1. DiagnosticReport-cardiology-report JSON and XML samples contain invalid hashes ([FHIR-28408](https://jira.hl7.org/browse/FHIR-28408)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/DiagnosticReport-cardiology-report.json.html)

1. MedicationRequest.medication[x] ([FHIR-28395](https://jira.hl7.org/browse/FHIR-28395)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-medicationrequest.html#FHIR-28395)

1. Fix MedicationRequest.encounter reference ([FHIR-28258](https://jira.hl7.org/browse/FHIR-28258)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-medicationrequest.html)

1. Fix typo: "an another" -> "another" ([FHIR-28227](https://jira.hl7.org/browse/FHIR-28227)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-practitioner.html)

1. Declare mustSupport on Organization telecom children ([FHIR-28216](https://jira.hl7.org/browse/FHIR-28216)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-organization.html)

1. Resolve remaining discrepancies with FHIR R4 Search Parameters ([FHIR-28181](https://jira.hl7.org/browse/FHIR-28181)) See Changes Here:
    - [1 SearchParameter-us-core-condition-onset-date](https://hl7.org/fhir/us/core/2021Jan/SearchParameter-us-core-condition-onset-date.html)
    - [2 SearchParameter-us-core-organization-name](https://hl7.org/fhir/us/core/2021Jan/SearchParameter-us-core-organization-name.html)
    - [3 SearchParameter-us-core-location-name](https://hl7.org/fhir/us/core/2021Jan/SearchParameter-us-core-location-name.html)

1. Provenance without activity is not very useful ([FHIR-28179](https://jira.hl7.org/browse/FHIR-28179)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-provenance.html#FHIR-28179)

1. Make Provenance.target.reference mandatory ([FHIR-28165](https://jira.hl7.org/browse/FHIR-28165)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-provenance.html)

1. Missing narrative Element ([FHIR-28159](https://jira.hl7.org/browse/FHIR-28159)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/Patient-example.html)

1. "Updated guidance regarding gender and sex." ([FHIR-28138](https://jira.hl7.org/browse/FHIR-28138)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-patient.html#FHIR-28138)

1. Replace the US Core Smoking Status with VSAC reference ([FHIR-28123](https://jira.hl7.org/browse/FHIR-28123),[FHIR-26059](https://jira.hl7.org/browse/FHIR-26059)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-smokingstatus.html)

1. Timing association for smoking status changed from `issued` to `effectiveDateTime` ([FHIR-28090](https://jira.hl7.org/browse/FHIR-28090)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-smokingstatus.html)

1. Remove Must Support from Patient.telecom ([FHIR-27731](https://jira.hl7.org/browse/FHIR-27731)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-patient.html#FHIR-27731)

1. Remove Must Support from Patient.communication.language ([FHIR-27730](https://jira.hl7.org/browse/FHIR-27730)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-patient.html#FHIR-27731)

1. Remove Must Support from us-core-birthsex extension ([FHIR-27729](https://jira.hl7.org/browse/FHIR-27729)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-patient.html#FHIR-27731)

1. Remove Must Support from  us-core-ethnicity extension ([FHIR-27728](https://jira.hl7.org/browse/FHIR-27728)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-patient.html#FHIR-27731)

1. Remove Must Support from  us-core-race extension ([FHIR-27727](https://jira.hl7.org/browse/FHIR-27727)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-patient.html#FHIR-27731)

1. Expand US Core state value set to include US Military codes ([FHIR-26833](https://jira.hl7.org/browse/FHIR-26833)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/ValueSet-us-core-usps-state.html)

1. Fixed Value Set Expansion Operation examples ([FHIR-26625](https://jira.hl7.org/browse/FHIR-26625)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/clinical-notes-guidance.html#FHIR-26625)

1. Add must support reference type choices for US Core laboratory DiagnosticReport.performer ([FHIR-25120](https://jira.hl7.org/browse/FHIR-25120)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-diagnosticreport-lab.html)

1. Fix US-Core-1 constraint on Observation.effectivePeriod ([FHIR-29658](https://jira.hl7.org/browse/FHIR-29658)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-observation-lab.html)

1. Change bindings from extensible to required for Condition.code value set: US Core Condition Category Codes Procedure.code value set: US Core Procedure Codes ([FHIR-29563](https://jira.hl7.org/browse/FHIR-29563)) See Changes Here:
      - [1 StructureDefinition-us-core-condition-definitions](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-condition.html)
      - [2 StructureDefinition-us-core-procedure-definitions](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-procedure.html)

1. Remove text "an author responsible for the update". Keep author organization ([FHIR-28516](https://jira.hl7.org/browse/FHIR-28516)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-provenance.html#FHIR-28516)

1. "Clarify expectations when accessing "other endpoint" for DocumentReference.content.attachment.url" ([FHIR-28472](https://jira.hl7.org/browse/FHIR-28472)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-documentreference.html#FHIR-28472)

1. Add a required category to smoking status ([FHIR-28436](https://jira.hl7.org/browse/FHIR-28436)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-smokingstatus.html#FHIR-28436)

1. Use of US Core Profile when not explicitly referenced when using Contained resources ([FHIR-28396](https://jira.hl7.org/browse/FHIR-28396)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/general-guidance.html#FHIR-28396)

1. DocumentReference.custodian to be Optional ([FHIR-28393](https://jira.hl7.org/browse/FHIR-28393)) [See *Proposed* Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-documentreference.html#FHIR-28393)

1. Encounter.serviceProvider Must Support and Encounter.location.location Optional ([FHIR-28392](https://jira.hl7.org/browse/FHIR-28392)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-encounter.html#FHIR-28392)

1. Observation.hasMember Vital Signs Panel Profile Reference Choice ([FHIR-28391](https://jira.hl7.org/browse/FHIR-28391)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/profiles-and-extensions.html#FHIR-28391)

1. Add must support type choices for Observation.value[x] for Lab Observation Profile ([FHIR-28390](https://jira.hl7.org/browse/FHIR-28390)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-observation-lab.html)

1. Add must support type choices for Observation.effective[x] for Lab Observation Profile ([FHIR-28389](https://jira.hl7.org/browse/FHIR-28389)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-observation-lab.html)

1. Add must support type choices for Immunization.occurrence[x] ([FHIR-28388](https://jira.hl7.org/browse/FHIR-28388)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-immunization.html)

1. Add must support type choices for DiagnosticReport.effective[x] for Note Data ([FHIR-28387](https://jira.hl7.org/browse/FHIR-28387)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-diagnosticreport-note.html)

1. Add must support type choices for DiagnosticReport.effective[x] for Lab Data Type ([FHIR-28385](https://jira.hl7.org/browse/FHIR-28385)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-diagnosticreport-lab.html)

1. Add must support reference type choices for Provenance.agent.who Reference ([FHIR-28383](https://jira.hl7.org/browse/FHIR-28383)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-provenance.html)

1. Add must support reference type choices for MedicationRequest.requester Reference ([FHIR-28382](https://jira.hl7.org/browse/FHIR-28382)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-medicationrequest.html)

1. Add must support reference type choices for MedicationRequest.reported Choice ([FHIR-28381](https://jira.hl7.org/browse/FHIR-28381)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-medicationrequest.html#FHIR-28381)

1. Add must support reference type choices for  DocumentReference.author Reference ([FHIR-28380](https://jira.hl7.org/browse/FHIR-28380)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-documentreference.html)

1. Add must support reference type choices for DiagnosticReport.performer for Note ([FHIR-28379](https://jira.hl7.org/browse/FHIR-28379)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-diagnosticreport-note.html)

1. Add must support reference type choices for DiagnosticReport.performer for Lab ([FHIR-28378](https://jira.hl7.org/browse/FHIR-28378)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-diagnosticreport-lab.html)

1. Add must support reference type choices for CareTeam.participant.member Reference ([FHIR-28376](https://jira.hl7.org/browse/FHIR-28376)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-careteam.html)

1. Add choice for and type choices for Encounter.reasonReference ([FHIR-27951](https://jira.hl7.org/browse/FHIR-27951)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-encounter.html#FHIR-27951)

1. Add choice for Procedure.performed[x] ([FHIR-29695](https://jira.hl7.org/browse/FHIR-29695)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-procedure.html)

1. Clarify deleted resources requirements and guidance ([FHIR-28091](https://jira.hl7.org/browse/FHIR-28091)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/general-guidance.html#FHIR-28091)

1. Clarify search by date precision conformance expectations ([FHIR-27906](https://jira.hl7.org/browse/FHIR-27906)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/general-guidance.html#FHIR-27906)
   - [General Guidance](https://hl7.org/fhir/us/core/2021Jan/general-guidance.html#FHIR-27906)
   - [Example in QuickStart](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-careplan.html#optional-search-parameters)
   - [Example in CapabilityStatement](https://hl7.org/fhir/us/core/2021Jan/CapabilityStatement-us-core-server.html#careplan)

1. Clarify search by reference conformance expectations ([FHIR-27905](https://jira.hl7.org/browse/FHIR-27905)) See Changes Here:
   - [General Guidance](https://hl7.org/fhir/us/core/2021Jan/general-guidance.html#FHIR-27905)
   - [Example in QuickStart](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-careplan.html#optional-search-parameters)
   - [Example in CapabilityStatement](https://hl7.org/fhir/us/core/2021Jan/CapabilityStatement-us-core-server.html#careplan)

1. Add "Cause of Death" to category codes to meet the Public Health Use Case for VRDR ([FHIR-27904](https://jira.hl7.org/browse/FHIR-27904)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/ValueSet-us-core-condition-category.html)

1. Address non-implantable device and how to document usage ([FHIR-27896](https://jira.hl7.org/browse/FHIR-27896), [FHIR-23715](https://jira.hl7.org/browse/FHIR-23715), [FHIR-23715](https://jira.hl7.org/browse/FHIR-23715)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/future-of-US-core.html#FHIR-27896)

1. Resource constraints based on Jurisdiction which are not well documented ([FHIR-27810](https://jira.hl7.org/browse/FHIR-27810)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-implantable-device.html#FHIR-27810)

1. Updated CPT copyright to current year ([FHIR-27770](https://jira.hl7.org/browse/FHIR-27770)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/ValueSet-us-core-encounter-type.html)

1. Change binding for CareTeam.participant.role from NUCC to Care Team Member Function, replace the US Core Careteam Provider Roles Value Set with VSAC reference ([FHIR-27769](https://jira.hl7.org/browse/FHIR-27769)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-careteam.html)

1. Remove US Core Server Capability Statement *requires* support for HTTP status 410-deleted ([FHIR-26597](https://jira.hl7.org/browse/FHIR-26597)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/CapabilityStatement-us-core-server.html#behavior)

1. Change US Core Condition Codes Value Set Logical Definition ([FHIR-26060](https://jira.hl7.org/browse/FHIR-26060)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/ValueSet-us-core-condition-code.html)

1. Recommend against using SSN for Patient.identifier ([FHIR-24903](https://jira.hl7.org/browse/FHIR-24903)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-patient.html#FHIR-24903)

1. Remove identifier (OID) from ValueSet: US Core Encounter Type ([FHIR-29691](https://jira.hl7.org/browse/FHIR-29691)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/ValueSet-us-core-encounter-type.html)

1. Review vocabulary to align with CCDA and use VSAC valueset where possible ([FHIR-22488](https://jira.hl7.org/browse/FHIR-22488)) See Changes Here:
    - [Detailed ethnicity --> Detailed Ethnicity](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-ethnicity.html#profile)
    - [Detailed Race --> Race](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-race.html#profile)
    - [OMB Ethnicity --> Categories\|Ethnicity](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-ethnicity.html#profile)
    - [US Core Medication Codes (RxNorm) --> Medication Clinical Drug](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-medicationrequest.html) and [here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-medication.html#Medication.code)
    - [US Core Provider Specialty (NUCC) --> Healthcare Provider Taxonomy](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-practitionerrole.html)
    - [US Core Vaccine Administered Value Set (CVX) --> CVX Vaccines Administered Vaccine Set](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-immunization.html)

1. Remove CVX-NDC mapping table ([FHIR-29745](https://jira.hl7.org/browse/FHIR-29745)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-immunization.html#FHIR-29745)

1. Since CarePlan.text.div is min== 1 add must support == true element to be consistent with US Core design ([FHIR-29765](https://jira.hl7.org/browse/FHIR-29765)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-careplan.html)

1. Remove unused US Core ICD-10-PCS Procedure Codes valueset ([FHIR-29822](https://jira.hl7.org/browse/FHIR-29822))

1. Remove Clinical Notes Guidance References to ONC 2019 NPRM and move requirements to main body ([FHIR-29824](https://jira.hl7.org/browse/FHIR-29824)) [See Change Here](https://hl7.org/fhir/us/core/2021Jan/clinical-notes-guidance.html)

---

### Version = 3.1.1 (Meets USCDI V1 requirements)
- Publication Date: 2020-6-30
- url: <https://hl7.org/fhir/us/core/STU3.1.1>
- Based on FHIR version : 4.0.1

#### Changes:
 This update addresses several technical corrections and errata and clarifications. They have been reviewed and voted on by the members of the [HL7 International Cross-Group Projects WorkGroup](http://www.hl7.org/Special/committees/cgp/index.cfm) who is sponsoring this errata release and reconciliation of the comments.:
1. Add guidance for representing patient name suffix and previous patient name to the [US Core Patient Profile](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-patient.html#mandatory-and-must-support-data-elements) ([FHIR-28129](https://jira.hl7.org/browse/FHIR-28129))
1. Correct copy/paste error in [Goal Profile](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-goal-definitions.html#Goal.lifecycleStatus) ([FHIR-28109](https://jira.hl7.org/browse/FHIR-28109))
1. Correct [US Core Provider Specialty (NUCC) ValueSet ](https://hl7.org/fhir/us/core/STU3.1.1/ValueSet-us-core-provider-specialty.html) to hide abstract grouping codes ([FHIR-27975](https://jira.hl7.org/browse/FHIR-27975))
1. Added example of US Core Direct Extension to [Practitioner-2 Example](https://hl7.org/fhir/us/core/STU3.1.1/Practitioner-practitioner-2.html) ([FHIR-27947](https://jira.hl7.org/browse/FHIR-27947))
1. Corrected technical errors in [pediatric profiles StructureDefinitions](https://hl7.org/fhir/us/core/STU3.1.1/profiles.html#profiles) ([FHIR-27946](https://jira.hl7.org/browse/FHIR-27946))
1. Corrected errors in [DiagnosticReport Cardiology Example](https://hl7.org/fhir/us/core/STU3.1.1/DiagnosticReport-cardiology-report.html) ([FHIR-27913](https://jira.hl7.org/browse/FHIR-27913))
1. Update [Federal Register link](https://hl7.org/fhir/us/core/STU3.1.1/ValueSet-omb-race-category.html) for OMB race and ethnicity category classifications. ([FHIR-27907](https://jira.hl7.org/browse/FHIR-27907))
1. Clarified [token search syntax](https://hl7.org/fhir/us/core/STU3.1.1/general-guidance.html#search-syntax) ([FHIR-27897](https://jira.hl7.org/browse/FHIR-27897)).
1. Corrected [US Core DocumentReference Profile](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-documentreference-definitions.html#DocumentReference.content) to support multiple attachments ([FHIR-25778](https://jira.hl7.org/browse/FHIR-25778)).
1. Fix FHIRPath Expression in [USCoreGoalTargetDate](https://hl7.org/fhir/us/core/STU3.1.1/SearchParameter-us-core-goal-target-date.html) ([FHIR-27892](https://jira.hl7.org/browse/FHIR-27892)).
1. Fix FHIRPath Expression in [USCoreProcedureDate](https://hl7.org/fhir/us/core/STU3.1.1/SearchParameter-us-core-procedure-date.html)([FHIR-27887](https://jira.hl7.org/browse/FHIR-27887)).
1. Add omitted ["ge" comparators to SearchParameters](https://hl7.org/fhir/us/core/STU3.1.1/SearchParameter-us-core-goal-target-date.html) ([FHIR-27893](https://jira.hl7.org/browse/FHIR-27893)).
1. [Remove Must Support References](https://hl7.org/fhir/us/core/STU3.1.1/general-guidance.html#referencing-us-core-profiles) to non US Core Profiles ([FHIR-27876](https://jira.hl7.org/browse/FHIR-27876))
1. Add missing [reaction](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-allergyintolerance-definitions.html#AllergyIntolerance.reaction) to the US Core AllergyIntolerance Profile ([FHIR-27867](https://jira.hl7.org/browse/FHIR-27867)).
1. Clarify [reference to US Core Patient](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-pediatric-bmi-for-age.html#mandatory-and-must-support-data-elements) in Vitals Signs Profiles ([FHIR-27857](https://jira.hl7.org/browse/FHIR-27857)).
1. Corrected [US Core Pulse Oximetry Profile](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-pulse-oximetry.html#formal-views-of-profile-content) component.valueQuantity.code and component.valueQuantity.unit min from 0 to 1 to be consistent with the valueQuantity constraints within US Core ([FHIR-27846](https://jira.hl7.org/browse/FHIR-27846))
1. Correct UCUM Unit in [US Core Pulse Oximetry Profile Text Summary](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-pulse-oximetry.html#summary-of-the-must-support-requirements) ([FHIR-27845](https://jira.hl7.org/browse/FHIR-27845))
1. Update [Procedure Codes Value Set](https://hl7.org/fhir/us/core/STU3.1.1/ValueSet-us-core-procedure-code.html) to include ICD-10 PCS codes ([FHIR-27836](https://jira.hl7.org/browse/FHIR-27836))
1. Update [Procedure Codes Value Set](https://hl7.org/fhir/us/core/STU3.1.1/ValueSet-us-core-procedure-code.html) to include CDT codes ([FHIR-27737](https://jira.hl7.org/browse/FHIR-27737))
1. Clarify that pediatric vital sign percentile Observations should [reference growth chart](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-pediatric-bmi-for-age.html#mandatory-and-must-support-data-elements) ([FHIR-27549](https://jira.hl7.org/browse/FHIR-27549)),
1. Added Missing [US core Head Occipital-frontal Circumference Percentile Profile](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-head-occipital-frontal-circumference-percentile.html) ([FHIR-27542](https://jira.hl7.org/browse/FHIR-27542)).
1. Correct requirements for supporting [CLIA identifiers](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-organization.html#mandatory-and-must-support-data-elements) ([FHIR-27158](https://jira.hl7.org/browse/FHIR-27158))
1. Change Description of [ICD-10-PCS Value Set](https://hl7.org/fhir/us/core/STU3.1.1/ValueSet-us-core-procedure-icd10pcs.html) ([FHIR-27116](https://jira.hl7.org/browse/FHIR-27116))
1. Correct [AllergyIntolerance guidance](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-allergyintolerance.html#mandatory-and-must-support-data-elements) for verificationStatus ([FHIR-27096](https://jira.hl7.org/browse/FHIR-27096))
1. Fix example [US Core heart-rate example](https://hl7.org/fhir/us/core/STU3.1.1/Observation-heart-rate.html) ([FHIR-27086](https://jira.hl7.org/browse/FHIR-27086))
1. **review period comments** Update [smoking status codes](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-smokingstatus-definitions.html#Observation.value[x]:valueCodeableConcept) to align with USCDI ([FHIR-27082](https://jira.hl7.org/browse/FHIR-27082)).
1. Fix invariant [provenance-1](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-provenance-definitions.html#who) ([FHIR-27065](https://jira.hl7.org/browse/FHIR-27065))
1. Fix invalid [json snippet](https://hl7.org/fhir/us/core/STU3.1.1/general-guidance.html#missing-data) ([FHIR-27001](https://jira.hl7.org/browse/FHIR-27001))
1. **review period comments** Remove Provenance requirement from Medication, Location, Practitioner, PractitionerRole, and Organization and correct copy and paste error to Medication and Provenance searchType support in [CapabilityStatement](https://hl7.org/fhir/us/core/STU3.1.1/CapabilityStatement-us-core-server.html#resource--details) ([FHIR-26840](https://jira.hl7.org/browse/FHIR-26840), [FHIR-28161](https://jira.hl7.org/browse/FHIR-28161)).
1. Correction on [USCDI Table](https://hl7.org/fhir/us/core/STU3.1.1/general-guidance.html#us-core-data-for-interoperability-and-2015-edition-common-clinical-data-set) change "MedicationStatement" to "MedicationRequest" and remove references to MedicationStatement in the Medication Profile and CapabilityStatements ([FHIR-26840](https://jira.hl7.org/browse/FHIR-26840)).
1. Clarify that US Core Location/PractitionerRole are [not being referenced](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-encounter.html#mandatory-and-must-support-data-elements) by other resources ([FHIR-26840](https://jira.hl7.org/browse/FHIR-26840)).
1. Correct editing error restoring Write and Operation capability guidance into [DocumentReference QuickStart](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-documentreference.html#quick-start) ([FHIR-26840](https://jira.hl7.org/browse/FHIR-26840)).
1. Clarify [guidance](https://hl7.org/fhir/us/core/STU3.1.1/general-guidance.html#search-for-servers-requiring-status) that servers SHALL support search with status if status required ([FHIR-26840](https://jira.hl7.org/browse/FHIR-26840)).
1. Correct canonical url for ImplementationGuide ([FHIR-26686](https://jira.hl7.org/browse/FHIR-26686)).
1. Correct system URI for [ICD-10 procedure codes](https://hl7.org/fhir/us/core/STU3.1.1/ValueSet-us-core-procedure-icd10pcs.html) ([FHIR-26679](https://jira.hl7.org/browse/FHIR-26679)).
1. Fix invariant [us-core-1](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-condition-definitions.html#Condition) ([FHIR-26605](https://jira.hl7.org/browse/FHIR-26605)).
1. Change valueCode min from 0 to 1 for [US Core Birth Sex Extension](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-birthsex-definitions.html#Extension.valueCode) and valueBoolean min from 0 to 1 for[US Core Direct email Extension](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-direct-definitions.html#Extension.valueBoolean) ([FHIR-26459](https://jira.hl7.org/browse/FHIR-26459)).
1. Change valueQuantity min from 1 to 0 for [US Core Pediatric BMI for Age Observation Profile](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-pediatric-bmi-for-age-definitions.html#Observation.valueQuantity) and [US Core Pediatric Weight for Height Observation Profile](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-pediatric-weight-for-height-definitions.html#Observation.valueQuantity) ([FHIR-26363](https://jira.hl7.org/browse/FHIR-26363)).
1. Add page contents to [Clinical Notes Guidance](https://hl7.org/fhir/us/core/STU3.1.1/clinical-notes-guidance.html) and [Basic Provenance](https://hl7.org/fhir/us/core/STU3.1.1/basic-provenance.html) pages ([FHIR-25785](https://jira.hl7.org/browse/FHIR-25785)).
1. Fix duplicate URL causing validation failure. ([FHIR-25536](https://jira.hl7.org/browse/FHIR-25536)).
1. Fix Invariant [us-core-8](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-patient-definitions.html#Patient.name) ([FHIR-25459](https://jira.hl7.org/browse/FHIR-25459)).
1. Corrected the wording "should support" to "shall support" in [Clinical Notes Guidance](https://hl7.org/fhir/us/core/STU3.1.1/clinical-notes-guidance.html#clinical-notes) ([FHIR-25455](https://jira.hl7.org/browse/FHIR-25455)).
1. Fix Invariant [us-core-8](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-patient-definitions.html#Patient.name) to allow for Data Absent Reason Extension on Patient name.([FHIR-25249](https://jira.hl7.org/browse/FHIR-25249)).
1. Fix Link to LOINC LP29708-2 ([FHIR-25213](https://jira.hl7.org/browse/FHIR-25213)).
1. Corrected [guidance](https://hl7.org/fhir/us/core/STU3.1.1/all-meds.html#fetching-all-medications-active-medications-and-all-medications-for-an-encounter) for conveying "Patient-Reported medications" ([FHIR-25035](https://jira.hl7.org/browse/FHIR-25035))

---


To review changes to US Core versions earlier than 3.1.1, refer to the [USCore 7.0.0 Change Log](https://hl7.org/fhir/us/core/STU7/changes.html).

{% include link-list.md %}