### Version = 7.0.0
- url: <http://hl7.org/fhir/us/core/STU7/>
- Based on FHIR version : 4.0.1

The changes in this annual update to US Core have been reviewed and commented upon by the public through the January 2024 HL7 balloting process. The resolution of over 130 community comments has been agreed to and voted on by the members of the HL7 International Cross-Group Projects work group.
#### What's new in Version 7.0.0 of US Core:
 
Each update to a new version of US Core changes the US Core Profiles and conformance expectations. Implementers can find detailed comparisons between the FHIR artifacts in this 7.0.0 version of US Core and each previous major release on [Changes Between Versions] page. This section provides an overview of the significant changes in Version 7.0.0 of US Core.

{% include img-small.html img="todo.png" %}

#### Changes:

The ballot-related comments resulted in over 80 changes to this specification, which are listed below:

**Tracker Status**: **(Change Category)** **Summary** **[Jira Issue](#)** **[Link to Updated Content](#)**

1. **Resolved - change required:** (Correction) Change ASKU in value set to asked-declined [FHIR-41571](https://jira.hl7.org/browse/FHIR-41571) [See Changes Here](#.html)
2. **Resolved - change required:** (Enhancement) Migrate US Core Terminology to VSAC [FHIR-42846](https://jira.hl7.org/browse/FHIR-42846) [See Changes Here](#.html)
3. **Resolved - change required:** (Enhancement) Add link in history page to approved pages [FHIR-42950](https://jira.hl7.org/browse/FHIR-42950) [See Changes Here](#.html)
4. **Resolved - change required:** (Enhancement) Gender Identity binding out of sync with C-CDA [FHIR-43052](https://jira.hl7.org/browse/FHIR-43052) [See Changes Here](#.html)
5. **Resolved - change required:** (Enhancement) Change Smoking History profile to allow effectivePeriod instead of effectiveDateTime [FHIR-43355](https://jira.hl7.org/browse/FHIR-43355) [See Changes Here](#.html)
6. **Resolved - change required:** (Clarification) rename fhir-write to vitals-write [FHIR-43400](https://jira.hl7.org/browse/FHIR-43400) [See Changes Here](#.html)
7. **Resolved - change required:** (Clarification) what does average mean?  [FHIR-43402](https://jira.hl7.org/browse/FHIR-43402) [See Changes Here](#.html)
8. **Resolved - change required:** (Clarification) Sub-elements are MS but parent element is not [FHIR-43430](https://jira.hl7.org/browse/FHIR-43430) [See Changes Here](#.html)
9. **Resolved - change required:** (Clarification) Only deceasedDateTime is ""Additional USCDI Requirement"" [FHIR-43431](https://jira.hl7.org/browse/FHIR-43431) [See Changes Here](#.html)
10. **Applied:** (Correction) Fix table rendering to remove duplicates[FHIR-43432](https://jira.hl7.org/browse/FHIR-43432) [See Changes Here](screening-and-assessments.html#uscdi-health-assessments-data-element-category)
11. **Resolved - change required:** (Enhancement) Expand options for medication adherence information source [FHIR-43466](https://jira.hl7.org/browse/FHIR-43466) [See Changes Here](#.html)
12. **Resolved - change required:** (Enhancement) References specific extension for measurement protocol [FHIR-43536](https://jira.hl7.org/browse/FHIR-43536) [See Changes Here](#.html)
13. **Resolved - change required:** (Clarification) Clarify reference to average BP panel [FHIR-43537](https://jira.hl7.org/browse/FHIR-43537) [See Changes Here](#.html)
14. **Resolved - change required:** (Clarification) Confusing use of Observation.code values [FHIR-43538](https://jira.hl7.org/browse/FHIR-43538) [See Changes Here](#.html)
15. **Resolved - change required:** (Clarification) Observation.value Omission [FHIR-43539](https://jira.hl7.org/browse/FHIR-43539) [See Changes Here](#.html)
16. **Resolved - change required:** (Clarification) Broaden Profile Purpose Statement [FHIR-43540](https://jira.hl7.org/browse/FHIR-43540) [See Changes Here](#.html)
17. **Resolved - change required:** (Enhancement) Seems like observation-category CodeSystem needs to be extended to include a concept for care-experience-preference [FHIR-43541](https://jira.hl7.org/browse/FHIR-43541) [See Changes Here](#.html)
18. **Resolved - change required:** (Enhancement) Modify Profile Purpose Statement to match CDA Patient Goal template purpose statement [FHIR-43543](https://jira.hl7.org/browse/FHIR-43543) [See Changes Here](#.html)
19. **Resolved - change required:** (Clarification) a Broader Intervention Preferences Grouping VS needs to be defined which is a broader value set.  [FHIR-43547](https://jira.hl7.org/browse/FHIR-43547) [See Changes Here](#.html)
20. **Resolved - change required:** (Enhancement) Need the ability to express conditional Goals [FHIR-43552](https://jira.hl7.org/browse/FHIR-43552) [See Changes Here](#.html)
21. **Triaged:** (Clarification) Specimen Condition Clarification [FHIR-43567](https://jira.hl7.org/browse/FHIR-43567) [See Changes Here](#.html)
22. **Resolved - change required:** (Clarification) Patient-authored vs. Patient-expressed Differentiation [FHIR-43568](https://jira.hl7.org/browse/FHIR-43568) [See Changes Here](#.html)
23. **Resolved - change required:** (Enhancement) Specimen.accessionIdentifier vs. .identifier [FHIR-43585](https://jira.hl7.org/browse/FHIR-43585) [See Changes Here](#.html)
24. **Triaged:** (Clarification) Clarify location extension to use when not in Encounter [FHIR-43587](https://jira.hl7.org/browse/FHIR-43587) [See Changes Here](#.html)
25. **Resolved - change required:** (Clarification) Reason for Referral Clarification/Correction [FHIR-43588](https://jira.hl7.org/browse/FHIR-43588) [See Changes Here](#.html)
26. **Resolved - change required:** (Enhancement) Smoking Status Max Binding addition [FHIR-43589](https://jira.hl7.org/browse/FHIR-43589) [See Changes Here](#.html)
27. **Resolved - change required:** (Clarification) Remove US Core Jurisdiction Extension [FHIR-43590](https://jira.hl7.org/browse/FHIR-43590) [See Changes Here](#.html)
28. **Resolved - change required:** (Correction) granular scope has wrong format [FHIR-43616](https://jira.hl7.org/browse/FHIR-43616) [See Changes Here](#.html)
29. **Resolved - change required:** (Clarification) Race needs to allow more than one occurrence [FHIR-43624](https://jira.hl7.org/browse/FHIR-43624) [See Changes Here](#.html)
30. **Resolved - change required:** (Enhancement) In ""base"" US Core Vital sign observation, Please update Observation.code binding  [FHIR-43633](https://jira.hl7.org/browse/FHIR-43633) [See Changes Here](#.html)
31. **Resolved - change required:** (Clarification) Use of NDC in medicationCodeableConcept [FHIR-43641](https://jira.hl7.org/browse/FHIR-43641) [See Changes Here](#.html)
32. **Triaged:** () Add _lastUpdated search parameter for all resources [FHIR-43659](https://jira.hl7.org/browse/FHIR-43659) [See Changes Here](#.html)
33. **Resolved - change required:** (Enhancement) Value set for medication adherence extension is unclear [FHIR-43757](https://jira.hl7.org/browse/FHIR-43757) [See Changes Here](#.html)
34. **Triaged:** (Enhancement) Granular scopes extend beyond regulatory requirement  [FHIR-43761](https://jira.hl7.org/browse/FHIR-43761) [See Changes Here](#.html)
35. **Applied:** (Correction) Fix Rendering in granular scope tables[FHIR-43770](https://jira.hl7.org/browse/FHIR-43770) [See Changes Here](scopes.html#us-core-scopes)
36. **Applied:** (Correction) Fix format error [FHIR-43773](https://jira.hl7.org/browse/FHIR-43773) [See Changes Here](general-requirements.html#missing-data)
37. **Resolved - change required:** (Clarification) AllergyIntolerance Definition [FHIR-43800](https://jira.hl7.org/browse/FHIR-43800) [See Changes Here](#.html)
38. **Triaged:** (Enhancement) USCDI Health Assessment Value Sets are Missing Some Panel Codes [FHIR-43922](https://jira.hl7.org/browse/FHIR-43922) [See Changes Here](#.html)
39. **Resolved - change required:** (Clarification) Vital Signs Profile: Cannot change binding from required to extensible [FHIR-43928](https://jira.hl7.org/browse/FHIR-43928) [See Changes Here](#.html)
40. **Triaged:** () Reason for Referral option clarification [FHIR-43929](https://jira.hl7.org/browse/FHIR-43929) [See Changes Here](#.html)
41. **Resolved - change required:** (Correction) SimpleQuantity cannot be constrained to Quantity in a profile [FHIR-43932](https://jira.hl7.org/browse/FHIR-43932) [See Changes Here](#.html)
42. **Resolved - change required:** (Correction) change must support elements for Immunization profile [FHIR-43934](https://jira.hl7.org/browse/FHIR-43934) [See Changes Here](#.html)
43. **Resolved - change required:** (Clarification) Race extension cardinality / documentation does not match value set [FHIR-43937](https://jira.hl7.org/browse/FHIR-43937) [See Changes Here](#.html)
44. **Resolved - change required:** (Correction) Update to figure in Section 3.6.4.3 [FHIR-43938](https://jira.hl7.org/browse/FHIR-43938) [See Changes Here](#.html)
45. **Applied:** (Correction) Undo copy/paste error to US Simple Observation Profile description [FHIR-43954](https://jira.hl7.org/browse/FHIR-43954) [See Changes Here](StructureDefinition-us-core-simple-observation.html)
46. **Applied:** (Correction) change "treatment-intervention" to "treatment-intervention-profile" [FHIR-44008](https://jira.hl7.org/browse/FHIR-44008) [See Changes Here](StructureDefinition-us-core-treatment-intervention-preference.html#mandatory-and-must-support-data-elements)
47. **Applied:** (Correction) Add hyperlink [FHIR-44009](https://jira.hl7.org/browse/FHIR-44009) [See Changes Here](StructureDefinition-us-core-location.html#mandatory-and-must-support-data-elementsl)
48. **Applied:** (Correction) Restore the missing graphic [FHIR-44010](https://jira.hl7.org/browse/FHIR-44010) [See Changes Here](screening-and-assessments.html#us-core-observation-screening-assessment-profile
49. **Applied:** (Correction) Restore the missing graphic [FHIR-44011](https://jira.hl7.org/browse/FHIR-44011) [See Changes Here](screening-and-assessments.html#us-core-observation-screening-assessment-profile)
50. **Applied:** (Correction) Restore the missing example [FHIR-44012](https://jira.hl7.org/browse/FHIR-44012) [See Changes Here](screening-and-assessments.html#searching-for-screening-and-assessment-data)
51. **Resolved - change required:** (Correction) Fix table formatting on Screening & assessments page - [FHIR-44014](https://jira.hl7.org/browse/FHIR-44014) [See Changes Here](screening-and-assessments.html#uscdi-health-assessments-data-element-category)
52. **Resolved - change required:** (Clarification) Screening & Assessments page - add guidance for goals [FHIR-44015](https://jira.hl7.org/browse/FHIR-44015) [See Changes Here](#.html)
53. **Applied:** (Correction) Change "US Core Laboratory Result Observation Profile." to "US Core Observation Clinical Result Profile." [FHIR-44016](https://jira.hl7.org/browse/FHIR-44016) [See Changes Here](StructureDefinition-us-core-observation-lab.html#mandatory-and-must-support-data-elements)
54. **Resolved - change required:** (Correction) Where superfluous, Remove references to versions of USCDI [FHIR-44017](https://jira.hl7.org/browse/FHIR-44017) For example [See Changes Here](StructureDefinition-us-core-medicationrequest.html)
55. **Resolved - change required:** (Correction) Should Treatment Intervention Preference Profile derive from Simple Observation? [FHIR-44018](https://jira.hl7.org/browse/FHIR-44018) [See Changes Here](#.html)
56. **Resolved - change required:** (Enhancement) Clarify/correct use of .code and .category in Treatment Intervention Preference profile [FHIR-44019](https://jira.hl7.org/browse/FHIR-44019) [See Changes Here](#.html)
57. **Applied:** (Correction) Remove erroneous text [FHIR-44022](https://jira.hl7.org/browse/FHIR-44022) [See Changes Here](StructureDefinition-us-core-care-experience-preference.html#mandatory-and-must-support-data-elements) and [Here](StructureDefinition-us-core-treatment-intervention-preference.html#mandatory-and-must-support-data-elements)
58. **Applied:** (Enhancement) Add guidance/constraints for use of UCUM for reference range in Laboratory Result Observation Profile [FHIR-44023](https://jira.hl7.org/browse/FHIR-44023) [See Changes Here](StructureDefinition-us-core-observation-lab.html) and [Here](general-guidance.html#using-ucum-codes-in-the-quantity-datatype)
59. **Applied:** (Correction) Correct "e.g." and "i.e." to "e.g.," "i.e.," throughout guide [FHIR-44053](https://jira.hl7.org/browse/FHIR-44053)
60. **Applied:** (Clarification) Updated to specific link text instead generic "Here" for bulleted list of changes [FHIR-44055](https://jira.hl7.org/browse/FHIR-44055) [See Changes Here](changes.html)
61. **Applied:** (Clarification) What encounter is pointed to from a DiagnosticReport? [FHIR-44056](https://jira.hl7.org/browse/FHIR-44056) [See Changes Here](StructureDefinition-us-core-diagnosticreport-note.html))
62. **Applied:** (Clarification) Change "may" to "can" to avoid conformance verbs [FHIR-44060](https://jira.hl7.org/browse/FHIR-44060) [See Changes Here](general-guidance.html#narrative) and [Here](screening-and-assessments.html#category-codes)
63. **Applied:** (Correction) Clarify Medication Adherence Extension definitions [FHIR-44076](https://jira.hl7.org/browse/FHIR-44076) [See Changes Here](StructureDefinition-us-core-medication-adherence.html)
64. **Applied:** (Correction) Remove redundant sentence from Server CapabilityStatement description [FHIR-44112](https://jira.hl7.org/browse/FHIR-44112) [See Changes Here](capability-statements.html)
65. **Resolved - change required:** (Clarification) Clarify the use of UCUM for Quantity datatypes in Lab Observations [FHIR-44117](https://jira.hl7.org/browse/FHIR-44117) [See Changes Here](StructureDefinition-us-core-observation-lab.html) and [Here](general-guidance.html#using-ucum-codes-in-the-quantity-datatype)
66. **Applied:** (Correction) Remove US Core from CapabilityStatement.instantiates [FHIR-44121](https://jira.hl7.org/browse/FHIR-44121) [See Changes Here](CapabilityStatement-us-core-server.html)
67. **Applied:** (Clarification) Include FHIR R6 Sex and Gender content in Patient Profile Introduction [FHIR-44123](https://jira.hl7.org/browse/FHIR-44123) [See Changes Here](StructureDefinition-us-core-patient.html)
68. **Resolved - change required:** (Enhancement) Remove ASKU from value sets and use DAR concept instead [FHIR-44127](https://jira.hl7.org/browse/FHIR-44127) See Changes:
   - [Gender Identity Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1021.32/expansion)
   - [Birth Sex](ValueSet-birthsex.html)
   - [Sexual Orientation](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1240.11/expansion)
69. **Applied:** (Enhancement) Add non-binary to gender identity value set [FHIR-44132](https://jira.hl7.org/browse/FHIR-44132) [See Changes Here](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1021.32/expansion)
70. **Applied:** (Correction) Correct reference to USCDI Average Blood Pressure element from "data class" to "data element" in change log [FHIR-44405](https://jira.hl7.org/browse/FHIR-44405) [See Changes Here](changes.html#the-january-2024-ballot) 
71. **Applied:** (Correction) bold text "SHALL NOT" [FHIR-44507](https://jira.hl7.org/browse/FHIR-44507) [See Changes Here](tructureDefinition-us-core-documentreference.html)
72. **Resolved - change required:** (Enhancement) Continue US Core and C-CDA value set alignment initiatives [FHIR-44522](https://jira.hl7.org/browse/FHIR-44522) [See Changes Here](#.html)
73. **Resolved - change required:** (Clarification) Update Profile Specific Implementation Guidance” with context specific examples [FHIR-44525](https://jira.hl7.org/browse/FHIR-44525) [See Changes Here](#.html)
74. **Applied:** (Clarification) Update Treatment Intervention Observation.code to LOINC [FHIR-44539](https://jira.hl7.org/browse/FHIR-44539) [See Changes Here](StructureDefinition-us-core-treatment-intervention-preference.html)
75. **Applied:** (Correction) Add Social Determinants of Health Screening Assessments And Questions to Screening and Assessments Page [FHIR-44545](https://jira.hl7.org/browse/FHIR-44545) [See Changes Here](screening-and-assessments.html#codes-for-problemshealthconcerns-goals-service-requests-and-procedures)
76. **Resolved - change required:** (Correction) fix codes in US Core Average Blood Pressure Profile search examples [FHIR-44623](https://jira.hl7.org/browse/FHIR-44623) For example, [See Changes Here](StructureDefinition-us-core-average-blood-pressure.html#mandatory-search-parameters)
77. **Applied:** (Clarification) Update guidance for servers not supporting PractitionerRole [FHIR-44624](https://jira.hl7.org/browse/FHIR-44624) [See Changes Here](StructureDefinition-us-core-practitioner.html)
78. **Resolved - change required:** (Correction) change ""resources"" to ""resources types"" [FHIR-44650](https://jira.hl7.org/browse/FHIR-44650) [See Changes Here](StructureDefinition-us-core-provenance.html)
79. **Applied:** (Correction) Update average blood pressure example to be more realistic [FHIR-44668](https://jira.hl7.org/browse/FHIR-44668) [See Changes Here](Observation-average-blood-pressure.html)
80. **Triaged:** (Clarification) Clarify address MS requirements for Practitioner [FHIR-44693](https://jira.hl7.org/browse/FHIR-44693) [See Changes Here](#.html)
81. **Applied:** (Clarification) Update Goal introduction to match profile [FHIR-44694](https://jira.hl7.org/browse/FHIR-44694) [See Changes Here](StructureDefinition-us-core-goal.html)
82. **Applied:** (Enhancement) Sex Extension's value set is too restrictive [FHIR-44710](https://jira.hl7.org/browse/FHIR-44710) [See Changes Here](StructureDefinition-us-core-sex.html)
83. **Triaged:** () It doesn't make sense for Condition.code to be extensible [FHIR-44715](https://jira.hl7.org/browse/FHIR-44715) [See Changes Here](#.html)
84. **Applied:** (Clarification) Update guidance on Referencing US Core Profiles [FHIR-44759](https://jira.hl7.org/browse/FHIR-44759) [See Changes Here](general-guidance.html#referencing-us-core-profiles)
85. **Reopen???:** (Enhancement) Relax Sex binding to "extensible" [FHIR-44764](https://jira.hl7.org/browse/FHIR-44764) [See Changes Here](StructureDefinition-us-core-sex.html)
86. **Reopen???:** (Enhancement) Relax Sex binding to "preferred" [FHIR-44785](https://jira.hl7.org/browse/FHIR-44785) [See Changes Here](StructureDefinition-us-core-sex.html)
87. **Applied:** (Enhancement) Combine the tables of Must Support references andAdditional USCDI references [FHIR-44946](https://jira.hl7.org/browse/FHIR-44946) [See Changes Here](CapabilityStatement-us-core-server.html#ms-ref-table)
88. **Applied:** (Correction) QA Error: specify version of http://terminology.hl7.org/CodeSystem/provenance-participant-type [FHIR-44967](https://jira.hl7.org/browse/FHIR-44967) [See Changes Here](ValueSet-us-core-provenance-participant-type.html#logical-definition-cld)

### Version = 7.0.0 - ballot
- url: <http://hl7.org/fhir/us/core/2024Jan/>
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
  
  - For the USCDI Average Blood Pressure data <span class="bg-success" markdown="1">element</span><!-- new-content -->, the new [US Core Average Blood Pressure Profile](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-average-blood-pressure.html) has been added to US Core. It is based on the [US Core Blood Pressure Profile](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-blood-pressure.html) and uses the [Vital Signs with Qualifying Elements: Average Blood Pressure Profile] as a blueprint.
  
  - For the USCDI Medications data class and elements, the [US Core MedicationRequest Profile](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-medicationrequest.html) already supports Medication Instructions and has been updated to support Medication Adherence as an *Additional USCDI Requirement* using the new [US Core Medication Adherence Extension].

  - For the USCDI Laboratory data class and elements, the [US Core Laboratory Result Observation Profile](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-observation-lab.html) already supports Result Unit of Measure data element for using UCUM for coded quantity units and has been updated to support Result Reference Range and Result Interpretation as a *Must Support* elements. The [US Core Specimen Profile](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-specimen.html) has been updated to support Specimen Identifier as a *Must Support* element, and Specimen Source Site and Specimen Condition Acceptability as *Additional USCDI Requirements*.

  - For the USCDI Goals and Preferences data class Treatment Intervention Preference and Care Experience Preference data elements, [US Core Treatment Intervention Preference Profile](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-treatment-intervention-preference.html) and [US Core Care Experience Preference Profile](https://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-care-experience-preference.html) have been added to US Core and use the PACIO Advance Directive Interoperability Implementation Guide's Care Experience Preference Profile and Personal Intervention Preference Profile as blueprints.

  - For the USCDI Health Status Assessments data class, including the data elements Physical Activity, Substance Use, and Alcohol Use, US Core's [Screening and Assessments](https://hl7.org/fhir/us/core/2024Jan/screening-and-assessments.html) Guidance is used.  To enhance interoperability, an extensible "starter set" of concepts constrains each Screening and Assessments domain.  These value sets are summarized [here](http://hl7.org/fhir/us/core/2024Jan/screening-and-assessments.html#terminology).

- Clarify USCDI Requirements: We updated our documentation and approach on the relationship between USCDI and US Core how we identify [Must Support vs Additional USCDI Requirements](http://hl7.org/fhir/us/core/2024Jan/must-support.html#additional-uscdi-requirements). See examples of this and association documentation:
   - [US Core Patient Profile](http://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-patient.html#profile)
   - [US Core Conformance Artifacts](http://hl7.org/fhir/us/core/2024Jan/general-requirements.html#us-core-conformance-artifacts)
   - [Additional USCDI Requirements](http://hl7.org/fhir/us/core/2024Jan/must-support.html#additional-uscdi-requirements)
   - [USCDI](http://hl7.org/fhir/us/core/2024Jan/uscdi.html)
   - [Summary of Additional USCDI Requirement References](http://hl7.org/fhir/us/core/2024Jan/CapabilityStatement-us-core-server.html#summary-of-additional-uscdi-requirement-references)


- We continue our efforts to link terminology directly to the FHIR® Terminology Service for VSAC Resources ([Value Set Authority Center (VSAC)] where applicable and, as a result, align terminology between US Core and [HL7 C-CDA]. The Following Valueset has been moved:
  
   |Pre 7.0.0-Ballot US Core ValueSet|7.0.0-Ballot VSAC ValueSet|
   |---|---|
   [US Core Sexual Orientation](https://hl7.org/fhir/us/core/STU6.1/ValueSet-us-core-sexual-orientation.html)|[Sexual Orientation](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1240.11/expansion)
   {:.grid}

- Added Procedure.reasonCode and Procedure.reasonReference as *Additional USCDI Requirements* to meet the USCDI Data Element,Reason for Referral when a ServiceRequest is not used to request a procedure. See these changes: 
   - [US Core Procedure](http://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-procedure.html)
   - [US Core ServiceRequest](http://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-servicerequest.html)
   - [Procedure Example](http://hl7.org/fhir/us/core/2024Jan/Procedure-defib-implant.html)
   - [USCDI](http://hl7.org/fhir/us/core/2024Jan/uscdi.html)

- Scopes: To meet the ONC’s granular scope requirement in [HTI-1 proposed rule](https://www.federalregister.gov/d/2023-07229/p-991+), we added required support for granular scopes as defined in Version 2.0.0 of [SMART App Launch] and moved the SMART scopes guidance from Future of US Core to a [Conformance Page](http://hl7.org/fhir/us/core/2024Jan/scopes.html) and updated requirements for each profile.
  
- FHIR Write: Add Argonaut Write Guidance for Vital Sign Observations to Record or Update Data section on the Future of US Core Page. [See Changes Here](http://hl7.org/fhir/us/core/2024Jan/future-of-US-core.html#record-or-update-data) and [Here](http://hl7.org/fhir/us/core/2024Jan/fhir-write.html)
  
- Based on the feedback from the US Core variance request process, we updated several profiles to permit implementers can references to other `subject` entities as defined in the base standard.  This is in addition to the Must Support reference to US Core Patient. We are interested in comments on what the impact on client applications will be. For an example of this change [Here](http://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-observation-clinical-result.html#profile))
  
- Implementers submitted over 60 trackers since the publication of US Core ver 6.0.0 and 6.1.0 We have addressed them and applied over 50 changes listed below:

 **Tracker Status**: **Summary** **Jira Issue** **Link to Updated Content**
1. **APPLIED:** Update CarePlan text status element's short description to reflect the status values [FHIR-43015](https://jira.hl7.org/browse/FHIR-43015) [See Changes Here](http://hl7.org/fhir/us/core/2024Jan/tructureDefinition-us-core-careplan.html#profile)
1. **APPLIED:** Update Smoking Status status element's short description to reflect the status values [FHIR-43118](https://jira.hl7.org/browse/FHIR-43118) [See Changes Here](http://hl7.org/fhir/us/core/2024Jan/tructureDefinition-us-core-smokingstatus.html#profile)
1. **APPLIED:** Correct invalid invariants us-core-3 and us-core-4 [FHIR-41523](https://jira.hl7.org/browse/FHIR-41523) [See Changes Here](http://hl7.org/fhir/us/core/2024Jan/tructureDefinition-us-core-observation-screening-assessment.html) and [Here](http://hl7.org/fhir/us/core/2024Jan/tructureDefinition-us-core-observation-clinical-result.html) and [Here](http://hl7.org/fhir/us/core/2024Jan/tructureDefinition-us-core-smokingstatus.html)
2. **APPLIED:** Correct invalid invariants pd-1 and us-core-13 [FHIR-41586](https://jira.hl7.org/browse/FHIR-41586) [See Changes Here](http://hl7.org/fhir/us/core/2024Jan/tructureDefinition-us-core-practitionerrole.html)
3. **APPLIED:** Correct invalid invariant us-core-1 [FHIR-41670](https://jira.hl7.org/browse/FHIR-41670) [See Changes Here](http://hl7.org/fhir/us/core/2024Jan/tructureDefinition-us-core-observation-screening-assessment.html) and [Here](http://hl7.org/fhir/us/core/2024Jan/tructureDefinition-us-core-observation-clinical-result.html)
4. **APPLIED:** Correct invalid SearchParameter expression for USCoreConditionAssertedDate [FHIR-41673](https://jira.hl7.org/browse/FHIR-41673) [See Changes Here](http://hl7.org/fhir/us/core/2024Jan/earchParameter-us-core-condition-asserted-date.html)
5. **APPLIED:** Fix Typo in Tribal Extension [FHIR-41739](https://jira.hl7.org/browse/FHIR-41739) [See Changes Here](http://hl7.org/fhir/us/core/2024Jan/tructureDefinition-us-core-tribal-affiliation.profile.json.html)
6. **APPLIED:** Fix Missing Data Example [FHIR-42805](https://jira.hl7.org/browse/FHIR-42805) [See Changes Here](http://hl7.org/fhir/us/core/2024Jan/eneral-requirements.html#missing-data)
7. **APPLIED:**  Update introduction to USCDI table[FHIR-42801](https://jira.hl7.org/browse/FHIR-42801) [See Changes Here](http://hl7.org/fhir/us/core/2024Jan/scdi.html)
8. **APPLIED:** Fix us-core-5 invariant [FHIR-42814](https://jira.hl7.org/browse/FHIR-42814) [See Changes Here](http://hl7.org/fhir/us/core/2024Jan/tructureDefinition-us-core-immunization.html#constraints)
9.  **APPLIED:**  Update guidance on referencing PractitionerRole [FHIR-42906](https://jira.hl7.org/browse/FHIR-42906) [See Changes Here](http://hl7.org/fhir/us/core/2024Jan/apabilityStatement-us-core-server.html#practitionerrole) and [Here](http://hl7.org/fhir/us/core/2024Jan/tructureDefinition-us-core-practitionerrole.html#mandatory-and-must-support-data-elements)
10. **APPLIED:** Add Project US@ Requirements [FHIR-43025](https://jira.hl7.org/browse/FHIR-43025) See Changes:
    -  [US Core Patient](http://hl7.org/fhir/us/core/2024Jan/tructureDefinition-us-core-patient.html#mandatory-and-must-support-data-elements)
    -  [Patient Example](http://hl7.org/fhir/us/core/2024Jan/atient-example.html)
    -  [US Core RelatedPerson](http://hl7.org/fhir/us/core/2024Jan/tructureDefinition-us-core-relatedperson.html#mandatory-and-must-support-data-elements)
    -  [US Core Organization](http://hl7.org/fhir/us/core/2024Jan/tructureDefinition-us-core-organization.html#mandatory-and-must-support-data-elements)
    -  [US Core Practitioner](http://hl7.org/fhir/us/core/2024Jan/tructureDefinition-us-core-practitioner.html#mandatory-and-must-support-data-elements)
    -  [US Core Location](http://hl7.org/fhir/us/core/2024Jan/tructureDefinition-us-core-location.html#mandatory-and-must-support-data-elements)
11. **APPLIED:**  Fix Typo: Change ServiceRequest.reasonReference to Observation.derivedFrom [FHIR-43045](https://jira.hl7.org/browse/FHIR-43045) [See Changes Here](http://hl7.org/fhir/us/core/2024Jan/tructureDefinition-us-core-simple-observation.html#mandatory-and-must-support-data-elements)
12. **APPLIED:**  Add link in history page to approved patches [FHIR-42950](https://jira.hl7.org/browse/FHIR-42950) [See Changes Here](https://hl7.org/fhir/us/core/history.html)
14. **APPLIED:** Medication Adherence Scope Clarification [FHIR-42845](https://jira.hl7.org/browse/FHIR-42845) [See Changes Here](http://hl7.org/fhir/us/core/2024Jan/tructureDefinition-us-core-medicationrequest.html#mandatory-and-must-support-data-elements) and [Here](http://hl7.org/fhir/us/core/2024Jan/tructureDefinition-us-core-medication-adherence.html)
15. **APPLIED:** Update profile + interaction requirements [FHIR-42789](https://jira.hl7.org/browse/FHIR-42789) and [FHIR-42847](https://jira.hl7.org/browse/FHIR-42847) [See Changes Here](http://hl7.org/fhir/us/core/2024Jan/eneral-requirements.html#conforming-to-us-core)
16. **APPLIED:** Provide guidance on NAHDO SOP codes for Medicare Part A,B,C,and D [FHIR-42793](https://jira.hl7.org/browse/FHIR-42793) [See Changes Here](http://hl7.org/fhir/us/core/2024Jan/tructureDefinition-us-core-coverage.html#mandatory-and-must-support-data-elements)
17. **APPLIED:** Correct description of Occupation Profile [FHIR-42867](https://jira.hl7.org/browse/FHIR-42867) [See Changes Here](http://hl7.org/fhir/us/core/2024Jan/tructureDefinition-us-core-observation-occupation.html)
18. **APPLIED:** Move the SMART scopes guidance from Future of US Core to a Conformance Page [FHIR-42864](https://jira.hl7.org/browse/FHIR-42864) [See Changes Here](http://hl7.org/fhir/us/core/2024Jan/copes.html) and [Here](http://hl7.org/fhir/us/core/2024Jan/tructureDefinition-us-core-allergyintolerance.html#mandatory-search-parameters) 
19. **APPLIED:** Add Argonaut Write Guidance for Vital Sign Observations to Record or Update Data section on the Future of US Core Page [FHIR-42863](https://jira.hl7.org/browse/FHIR-42863) [See Changes Here](http://hl7.org/fhir/us/core/2024Jan/uture-of-US-core.html#record-or-update-data) and [Here](http://hl7.org/fhir/us/core/2024Jan/hir-write.html)
20. **APPLIED:** Migrate US Core Terminology to VSAC [FHIR-42846](https://jira.hl7.org/browse/FHIR-42846) See this version's introduction
21. **APPLIED:**  Clarify note in Search Parameters and Operations page [FHIR-42783](https://jira.hl7.org/browse/FHIR-42783) [See Changes Here](http://hl7.org/fhir/us/core/2024Jan/earch-parameters-and-operations.html)
22. **APPLIED:**  Fix errors in USCDI mapping table [FHIR-42862](https://jira.hl7.org/browse/FHIR-42862) [See Changes Here](http://hl7.org/fhir/us/core/2024Jan/scdi.html)
23. **APPLIED:** Clarify Coverage status [FHIR-42777](https://jira.hl7.org/browse/FHIR-42777) [See Changes Here](http://hl7.org/fhir/us/core/2024Jan/tructureDefinition-us-core-coverage.html#mandatory-and-must-support-data-elements)
24. **APPLIED:**  Permit Subject element to references to other entities besides Patient [FHIR-42759](https://jira.hl7.org/browse/FHIR-42759) [See Changes Here](http://hl7.org/fhir/us/core/2024Jan/tructureDefinition-us-core-observation-clinical-result.html#profile)
25. **APPLIED:** Correct Regex for us-core-1 XPath invariant [FHIR-42738](https://jira.hl7.org/browse/FHIR-42738) [See Changes Here](http://hl7.org/fhir/us/core/2024Jan/tructureDefinition-us-core-observation-clinical-result.html#constraints))
26. **APPLIED:**  Add USCDI Version 4 Data Elements to US Core [FHIR-42161](https://jira.hl7.org/browse/FHIR-42161) See the Introduction to this version above and Changes [Here](http://hl7.org/fhir/us/core/2024Jan/scdi.html)
27. **APPLIED:**  Remove guidance to identify version of SNOMED in an instance [FHIR-42160](https://jira.hl7.org/browse/FHIR-42160) [See Changes Here](http://hl7.org/fhir/us/core/2024Jan/eneral-guidance.html#snomed-ct-united-states-edition)
28. **APPLIED:** Add Procedure.reasonCode and Procedure.reasonReference as Reason for Referral [FHIR-42136](https://jira.hl7.org/browse/FHIR-42136) and [FHIR-41761](https://jira.hl7.org/browse/FHIR-41761) See Changes:
   -  [US Core Procedure](http://hl7.org/fhir/us/core/2024Jan/tructureDefinition-us-core-procedure.html)
   -  [US Core ServiceRequest](http://hl7.org/fhir/us/core/2024Jan/tructureDefinition-us-core-servicerequest.html)
   -  [Procedre Example](http://hl7.org/fhir/us/core/2024Jan/rocedure-defib-implant.html)
   -  [USCDI](http://hl7.org/fhir/us/core/2024Jan/scdi.html)
29. **APPLIED:**  USCDI - FHIR US Core Relationship Clarification [FHIR-42130](https://jira.hl7.org/browse/FHIR-42130) [See Changes Here](http://hl7.org/fhir/us/core/2024Jan/scdi.html)
30. **APPLIED:** Typo [FHIR-42069](https://jira.hl7.org/browse/FHIR-42069) [See Changes Here](http://hl7.org/fhir/us/core/2024Jan/tructureDefinition-us-core-blood-pressure.html#mandatory-and-must-support-data-elements)
31. **APPLIED:**  Clarify when to include multiple attachments as part of a clinical note [FHIR-41902](https://jira.hl7.org/browse/FHIR-41902) [See Changes Here](http://hl7.org/fhir/us/core/2024Jan/tructureDefinition-us-core-documentreference.html)
32. **APPLIED:**  Limit context for jurisdiction extension [FHIR-41867](https://jira.hl7.org/browse/FHIR-41867) [See Changes Here](http://hl7.org/fhir/us/core/2024Jan/tructureDefinition-us-core-jurisdiction.html)
33. **APPLIED:**  Add VSAC Value Sets to Terminology Page [FHIR-41681](https://jira.hl7.org/browse/FHIR-41681) [See Changes Here](http://hl7.org/fhir/us/core/2024Jan/erminology.html)
34. **APPLIED:**  APGAR should be Apgar [FHIR-41666](https://jira.hl7.org/browse/FHIR-41666) [See Changes Here](http://hl7.org/fhir/us/core/2024Jan/creening-and-assessments.html#structured-screening-and-assessments)
35. **APPLIED:** Correct invalid invariants pd-1 and us-core-13 [FHIR-41586](https://jira.hl7.org/browse/FHIR-41586) [See Changes Here](http://hl7.org/fhir/us/core/2024Jan/tructureDefinition-us-core-practitionerrole.html#constraints)
36. **APPLIED:** Clarify Additional USCDI Requirements [FHIR-41572](https://jira.hl7.org/browse/FHIR-41572) See Changes:
   - [US Core Patient Profile](http://hl7.org/fhir/us/core/2024Jan/StructureDefinition-us-core-patient.html#profile)
   - [US Core Conformance Artifacts](http://hl7.org/fhir/us/core/2024Jan/general-requirements.html#us-core-conformance-artifacts)
   - [Additional USCDI Requirements](http://hl7.org/fhir/us/core/2024Jan/must-support.html#additional-uscdi-requirements)
   - [USCDI](http://hl7.org/fhir/us/core/2024Jan/uscdi.html)
   - [Summary of Additional USCDI Requirement References](http://hl7.org/fhir/us/core/2024Jan/CapabilityStatement-us-core-server.html#summary-of-additional-uscdi-requirement-references)
37. **APPLIED:**  Change ASKU in value set to asked-declined [FHIR-41571](https://jira.hl7.org/browse/FHIR-41571) [See Changes Here](http://hl7.org/fhir/us/core/2024Jan/tructureDefinition-us-core-observation-sexual-orientation.html#terminology-bindings-differential) and [Here](http://hl7.org/fhir/us/core/2024Jan/bservation-sexual-orientation-example.html)
38. **APPLIED:**  update canonical urls in examples and capability statements to include the version [FHIR-41256](https://jira.hl7.org/browse/FHIR-41256) [See Changes Here](http://hl7.org/fhir/us/core/2024Jan/llergyIntolerance-example.html) and [Here](http://hl7.org/fhir/us/core/2024Jan/apabilityStatement-us-core-server.json.html)
39. **APPLIED:**  Add Preferred Language guidance [FHIR-40773](https://jira.hl7.org/browse/FHIR-40773) [See Changes Here](http://hl7.org/fhir/us/core/2024Jan/tructureDefinition-us-core-patient.html#mandatory-and-must-support-data-elements)
40. **APPLIED:**  Update UCUM guidance [FHIR-40604](https://jira.hl7.org/browse/FHIR-40604) [See Changes Here](http://hl7.org/fhir/us/core/2024Jan/eneral-guidance.html#using-ucum-codes-in-the-quantity-datatype)
41. **APPLIED:**  Added interpretation to laboratory result examples [FHIR-40297](https://jira.hl7.org/browse/FHIR-40297) [See Changes Here](http://hl7.org/fhir/us/core/2024Jan/bservation-cbc-mchc.html)

The following trackers have been identified as publishing issues and we will work with HL7 publishing to resolve them.

1. **APPLIED** Excel downloads missing header row [FHIR-41709](https://jira.hl7.org/browse/FHIR-41709)
2. **PUBLISHING** Condition profile descriptions are not appearing in IG Detailed Description Snapshot View (other places) [FHIR-40813](https://jira.hl7.org/browse/FHIR-40813)
3. **PUBLISHING** RelatedPerson relationshiptype should have binding to FHIR value set RelatedPerson-relationshiptype [FHIR-34755](https://jira.hl7.org/browse/FHIR-34755)
4. **PUBLISHING:** AllergyIntolerance does not show constraint [FHIR-34636](https://jira.hl7.org/browse/FHIR-34636)
5. **PUBLISHING** Confusing for commercial vendor.  Reads very confusing. [FHIR-30783](https://jira.hl7.org/browse/FHIR-30783)
6. **PUBLISHING** In most of the data elements – “Binding is from base FHIR and US Core Vital Signs”  Need this to be one single combined listing [FHIR-30780](https://jira.hl7.org/browse/FHIR-30780)
7. **PUBLISHING** valueset-simple-language.xml QA Error [FHIR-30107](https://jira.hl7.org/browse/FHIR-30107)
8. **APPLIED** Patient Examples QA Errors: CDCREC code system in VSAC [FHIR-30105](https://jira.hl7.org/browse/FHIR-30105)

### Version = 6.1.0
- url: <http://hl7.org/fhir/us/core/STU6.1/>
- Based on FHIR version : 4.0.1

The changes in this STU Update to US Core 6.0.0 have been reviewed by the public through the HL7 STU update process. The resolution of the community comments has been agreed to and voted on by the members of the HL7 International Cross-Group Projects work group.
#### What's new in Version 6.1.0 of US Core:

To meet the [U.S. Core Data for Interoperability (USCDI) v3] &quot;sex&quot; data element, US Core added the [US Core Sex Extension] as a [USCDI Requirement](http://hl7.org/fhir/us/core/STU6/must-support.html#uscdi-requirements)(). The [US Core Birth Sex Extension] is no longer a *USCDI Requirement*.

#### Updates and Corrected Errata in Version 6.1.0 of US Core:

**Tracker Status**: **Summary** **Jira Issue** **Link to Updated Content**

1. **Applied**: Add Sex extension necessary to satisfy USCDI v3 [FHIR-41301](https://jira.hl7.org/browse/FHIR-41301) and [FHIR-41352](https://jira.hl7.org/browse/FHIR-41352) See Changes [Here](http://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-sex.html), [Here](http://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-patient.html), and [Here](http://hl7.org/fhir/us/core/STU6.1/uscdi.html)
2. **Applied**: Update link to CDC Race and Ethnicity Code Set [FHIR-41277](https://jira.hl7.org/browse/FHIR-41277) See Changes [Here](http://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-race.html)
3.  **Applied**: Typo change `Condition.onsetDate` to `Condition.onsetDateTime`  [FHIR-41239](https://jira.hl7.org/browse/FHIR-41239) See Changes [Here](http://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-condition-encounter-diagnosis.html)
4.  **Applied**: Clarify US Core USCDI Requirement Extension not intended for implementers [FHIR-41238](https://jira.hl7.org/browse/FHIR-41238) See Changes [Here](http://hl7.org/fhir/us/core/STU6.1/profiles-and-extensions.html)
5.  **Applied**: Correct Provenance Example [FHIR-41316](https://jira.hl7.org/browse/FHIR-41316) See Changes [Here](http://hl7.org/fhir/us/core/STU6.1/Provenance-example-targeted-provenance.json.html)
6.  **Applied**: Update Changes between versions table [FHIR-41434](https://jira.hl7.org/browse/FHIR-41434) See Changes [Here](http://hl7.org/fhir/us/core/STU6.1/changes-between-versions.html#cross-version-comparisons)
7.  **Applied**: update us-core-3 and us-core-4 [FHIR-41454](https://jira.hl7.org/browse/FHIR-41454) See Changes [Here](http://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-observation-clinical-result.html)

### Version = 6.0.0
- url: <http://hl7.org/fhir/us/core/STU6/>
- Based on FHIR version : 4.0.1

The changes in this annual update to US Core have been reviewed and commented upon by the public through the January 2023 HL7 balloting process. The resolution of the community comments has been agreed to and voted on by the members of the HL7 International Cross-Group Projects work group.
#### What's new in Version 6.0.0 of US Core:

 
Each update to a new version of US Core changes the US Core Profiles and conformance expectations. Implementers can find detailed comparisons between the FHIR artifacts in this 6.0.0 version of US Core and each previous major release on [Changes Between Versions] page. This section provides an overview of the significant changes in Version 6.0.0 of US Core.

- New and updated resources to meet the [U.S. Core Data for Interoperability (USCDI) v3] new Data Elements and Classes that the Office of the National Coordinator (ONC) published in July of 2022. [This table](http://hl7.org/fhir/us/core/STU6/uscdi.html) summarizes the USCDI Data Classes and Data Elements and the corresponding US Core Profile(s).
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
      - The [US Core Birth Sex Extension] meets the patient sex requirement (*NOTE: US Core 6.1.0 added the [US Core Sex Extension] as a [USCDI Requirement](http://hl7.org/fhir/us/core/STU6/must-support.html#uscdi-requirements). The US Core Birth Sex Extension is no longer a USCDI Requirement*.)
      - To support Related Person's Name and Related Person's Relationship [US Core RelatedPerson Profile] was updated
      - The *new* [US Core Observation Occupation Profile] supports a patient's Occupation and Occupation Industry
  - Reason for Referral is supported by an updated [US Core ServiceRequest Profile] and [US Core Procedure Profile]

- The [US Core Observation Clinical Result Profile] supersedes version 5.0.1  *US Core Observation Clinical Test Result Profile* and *US Core Observation Imaging Result Profile*. In addition, it is the base for the [US Core Laboratory Result Observation Profile]. The Cross Version Comparisons Table on the [Changes Between Versions] page summarized these significant revisions.

- Document the [USCDI Requirement](http://hl7.org/fhir/us/core/STU6/must-support.html#uscdi-requirements) conformance category: Besides Mandatory and Must Support elements, the US Core Profile elements consist of USCDI Requirements elements for ONC Health IT Certification. This version [clarifies the meaning](http://hl7.org/fhir/us/core/STU6/general-requirements.html#us-core-conformance-artifacts) and [documents](http://hl7.org/fhir/us/core/STU6/must-support.html#uscdi-requirements) how it is communicated in the StructureDefinitions and on the profile pages

- Expanded CapabilityStatement Narrative: Each  US Core Profile contains references to other resources that it depends on or is related to. The CapabilityStatements narrative provides a table summarizing the [Must Support references for US Core Profiles](http://hl7.org/fhir/us/core/STU6/CapabilityStatement-us-core-server.html#summary-of-must-support-references-between-profiles) to help implementers understand their required capabilities.

- Expanded documentation on the Terminology page: In addition to detailing the Code Systems unique to this guide, links [all the Code Systems](http://hl7.org/fhir/us/core/STU6/terminology.html#code-systems) used in US Core are listed.

- Introduce [US Core SMART Scopes] as a candidate requirements under consideration, and provide example for each Profile.

- We continue our efforts to link terminology directly to the FHIR® Terminology Service for VSAC Resources ([Value Set Authority Center (VSAC)] where applicable and, as a result, align terminology between US Core and [HL7 C-CDA].

#### Changes:

These changes are a result of over 150 January 2023 Ballot related trackers which are listed below:

 **Tracker Status**: **Summary** **Jira Issue** **Link to Updated Content**

1. **Applied:** Remove html entities from examples [FHIR-37474](https://jira.hl7.org/browse/FHIR-37474) 
2. **Applied:** Change Condition patient + category search to SHALL support [FHIR-37918](https://jira.hl7.org/browse/FHIR-37918) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-condition-encounter-diagnosis.html#mandatory-search-parameters)
3. **Applied:** Diagnostic Report Laboratory Codes LOINC CLASSTYPE value should be ""1"" [FHIR-37933](https://jira.hl7.org/browse/FHIR-37933) [See Changes Here](http://hl7.org/fhir/us/core/STU6/ValueSet-us-core-laboratory-test-codes.html)
4.  **Applied:** Additional guidance for accessing imaging studies [FHIR-38808](https://jira.hl7.org/browse/FHIR-38808) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-diagnosticreport-note.html#mandatory-and-must-support-data-elements)
5.  **Applied:** Allow multiple NPIs for Organizations and Practitioners [FHIR-39382](https://jira.hl7.org/browse/FHIR-39382) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-practitioner.html#profile)
6.  **Applied:** Keep QuestionnaireResponse and Update Screening and Assessments page [FHIR-39495](https://jira.hl7.org/browse/FHIR-39495) See Changes: 
   - [Here](http://hl7.org/fhir/us/core/STU6/screening-and-assessments.html)
   - [Here](http://hl7.org/fhir/us/core/STU6/Questionnaire-phq-9-example.html)
   - [Here](http://hl7.org/fhir/us/core/STU6/Questionnaire-prapare-example.html)
   - [Here](http://hl7.org/fhir/us/core/STU6/Questionnaire-hunger-vital-sign-example.html)
   - [Here](http://hl7.org/fhir/us/core/STU6/QuestionnaireResponse-phq-9-example.html)
   - [Here](http://hl7.org/fhir/us/core/STU6/CapabilityStatement-us-core-server.html#questionnaire)
   - [Here](http://hl7.org/fhir/us/core/STU6/CapabilityStatement-us-core-server.html#questionnaireresponse)
7.  **Applied:** Fix slicing in Observation.component:industry[FHIR-39608](https://jira.hl7.org/browse/FHIR-39608) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html#profile)
8.  **Applied:** Add support for Condition search that include patient + category + status [FHIR-39610](https://jira.hl7.org/browse/FHIR-39610) [See Changes Here](http://hl7.org/fhir/us/core/STU6/CapabilityStatement-us-core-server.html#condition)
9.  **Applied:** Reference only reason for using MedicationDispense [FHIR-39611](https://jira.hl7.org/browse/FHIR-39611) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-medicationdispense.html)
10. **Applied:** Revert to simplegenderIdentify extension [FHIR-39615](https://jira.hl7.org/browse/FHIR-39615) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-genderIdentity.html)
11. **Applied:** Duplicated words [FHIR-39637](https://jira.hl7.org/browse/FHIR-39637) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-condition-problems-health-concerns.html#optional-search-parameters)
12. **Applied:** Missing comma [FHIR-39638](https://jira.hl7.org/browse/FHIR-39638) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-patient.html#mandatory-and-must-support-data-elements)
13. **Applied:** Clarify that Observation.specimen is a MustSupport [FHIR-39639](https://jira.hl7.org/browse/FHIR-39639) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-lab.html#mandatory-and-must-support-data-elements)
14. **Applied:** Clarify and  updates examples to use SNOMED CT US Edition [FHIR-39640](https://jira.hl7.org/browse/FHIR-39640) [See Changes Here](http://hl7.org/fhir/us/core/STU6/general-guidance.html#snomed-ct-united-states-edition) and [Here](http://hl7.org/fhir/us/core/STU6/AllergyIntolerance-example.html)
15. **Applied:** Add NDC codes to the Medication Guidance [FHIR-39641](https://jira.hl7.org/browse/FHIR-39641) [See Changes Here](http://hl7.org/fhir/us/core/STU6/medication-list.html#options-for-representing-medication)
16. **Applied:** Extra trailing parenthesis [FHIR-39643](https://jira.hl7.org/browse/FHIR-39643) [See Changes Here](http://hl7.org/fhir/us/core/STU6/screening-and-assessments.html)
17. **Applied:** Clinical Judgement Profile does not exist [FHIR-39650](https://jira.hl7.org/browse/FHIR-39650) [See Changes Here](http://hl7.org/fhir/us/core/STU6/screening-and-assessments.html)
18. **Applied:** Clarify the difference between Simple Observation and Screening Assessment [FHIR-39652](https://jira.hl7.org/browse/FHIR-39652) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-clinical-result.html#profile) and [Here](http://hl7.org/fhir/us/core/STU6/ValueSet-us-core-clinical-result-observation-category.html)
19. **Applied:** uscore or us-core [FHIR-39653](https://jira.hl7.org/browse/FHIR-39653)
20. **Applied:** Fix $docref examples [FHIR-39658](https://jira.hl7.org/browse/FHIR-39658) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-documentreference.html#mandatory-operation)
21. **Applied:** Resolve conflicting guidance in Observation Blood Pressure  [FHIR-39659](https://jira.hl7.org/browse/FHIR-39659) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-blood-pressure.html#mandatory-and-must-support-data-elements)
22. **Applied:** Clarify how profiles are defined [FHIR-39703](https://jira.hl7.org/browse/FHIR-39703) [See Changes Here](http://hl7.org/fhir/us/core/STU6/general-requirements.html#us-core-conformance-artifacts) and  [Here](http://hl7.org/fhir/us/core/STU6/index.html#introduction) and [Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-allergyintolerance.html)
23. **Applied:** Clarify where the US Core Profile FHIR Restful transactions are defined? [FHIR-39704](https://jira.hl7.org/browse/FHIR-39704) [See Changes Here](http://hl7.org/fhir/us/core/STU6/general-requirements.html#profile-support--interaction-support)
24. **Applied:** Use ValueSet and not value set when a FHIR ValueSet is intended [FHIR-39705](https://jira.hl7.org/browse/FHIR-39705) [See Changes Here](http://hl7.org/fhir/us/core/STU6/general-requirements.html)
25. **Applied:** Use uppercase "Must Support" and not lowercase "must suppor"t [FHIR-39706](https://jira.hl7.org/browse/FHIR-39706)
26. **Applied:** Document Must Support and Modifier Elements [FHIR-39707](https://jira.hl7.org/browse/FHIR-39707) [See Changes Here](http://hl7.org/fhir/us/core/STU6/general-requirements.html#modifier-elements)
27. **Applied:** Common format for Resources and Resource fields [FHIR-39708](https://jira.hl7.org/browse/FHIR-39708)
28. **Applied:** Use of mandatory text [FHIR-39709](https://jira.hl7.org/browse/FHIR-39709)
29. **Applied:** Add reference to FHIR section on language support [FHIR-39710](https://jira.hl7.org/browse/FHIR-39710) [See Changes Here](http://hl7.org/fhir/us/core/STU6/general-guidance.html#language-support)
30. **Applied:** Refer to FHIR specification as base definition for RESTful operations [FHIR-39711](https://jira.hl7.org/browse/FHIR-39711) [See Changes Here](http://hl7.org/fhir/us/core/STU6/general-guidance.html#read-fetch-syntax)
31. **Applied:** POST based searches [FHIR-39712](https://jira.hl7.org/browse/FHIR-39712) [See Changes Here](http://hl7.org/fhir/us/core/STU6/general-requirements.html#fhir-restful-search-api-requirements)
32. **Applied:** Clarify compartment based search [FHIR-39713](https://jira.hl7.org/browse/FHIR-39713) [See Changes Here](http://hl7.org/fhir/us/core/STU6/general-guidance.html#compartment-based-search)
33. **Applied:** Updated CapabilityStatement to list un-profiled required resources [FHIR-39714](https://jira.hl7.org/browse/FHIR-39714) [See Changes Here](http://hl7.org/fhir/us/core/STU6/CapabilityStatement-us-core-server.html#summary-of-must-support-references-between-profiles)
34. **Applied:** Change "Systems" to "Servers" [FHIR-39716](https://jira.hl7.org/browse/FHIR-39716) [See Changes Here](http://hl7.org/fhir/us/core/STU6/clinical-notes.html)
35. **Applied:** Update "Clinical Note Server" to "FHIR Server" [FHIR-39717](https://jira.hl7.org/browse/FHIR-39717) [See Changes Here](http://hl7.org/fhir/us/core/STU6/clinical-notes.html) and [Here](http://hl7.org/fhir/us/core/STU6/general-requirements.html)
36. **Applied:** DocumentReference, DiagnosticReport and embedded documents [FHIR-39718](https://jira.hl7.org/browse/FHIR-39718) [See Changes Here](http://hl7.org/fhir/us/core/STU6/clinical-notes.html)
37. **Applied:** Correction and clarify use of $expand [FHIR-39719](https://jira.hl7.org/browse/FHIR-39719) [See Changes Here](http://hl7.org/fhir/us/core/STU6/clinical-notes.html#using-expand) and [Here](http://hl7.org/fhir/us/core/STU6/CapabilityStatement-us-core-server.html#valueset)
38. **Applied:** Clarify MedicationAdministration and MedicationStatement support. [FHIR-39720](https://jira.hl7.org/browse/FHIR-39720) [See Changes Here](http://hl7.org/fhir/us/core/STU6/medication-list.html#pharmacy-fhir-resources)
39. **Applied:** The use of Observations where QuestionnaireReponse is more applicable [FHIR-39722](https://jira.hl7.org/browse/FHIR-39722) [See Changes Here](http://hl7.org/fhir/us/core/STU6/screening-and-assessments.html)
40. **Applied:** Updated CapabilityStatement to list required referenced profiles and resources [FHIR-39723](https://jira.hl7.org/browse/FHIR-39723) [See Changes Here](http://hl7.org/fhir/us/core/STU6/CapabilityStatement-us-core-server.html#summary-of-must-support-references-between-profiles)
41. **Applied:** External link is missing [FHIR-39725](https://jira.hl7.org/browse/FHIR-39725) [See Changes Here](http://hl7.org/fhir/us/core/STU6/general-guidance.html#search-syntax)
42. **Applied:** Change whenHandedOver from min =1 to min =0 [FHIR-39732](https://jira.hl7.org/browse/FHIR-39732) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-medicationdispense.html)
43. **Applied:** Wrong resource referenced [FHIR-39733](https://jira.hl7.org/browse/FHIR-39733) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-coverage.html)
44. **Applied:** plural/singular mismatch [FHIR-39734](https://jira.hl7.org/browse/FHIR-39734) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-coverage.html)
45. **Applied:** Screening and Assessment typo [FHIR-39735](https://jira.hl7.org/browse/FHIR-39735) [See Changes Here](http://hl7.org/fhir/us/core/STU6/screening-and-assessments.html)
46. **Applied:** Missing Hyperlinks [FHIR-39736](https://jira.hl7.org/browse/FHIR-39736) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-pregnancystatus.html)
47. **Applied:** Clarify period of pregnancy intent [FHIR-39737](https://jira.hl7.org/browse/FHIR-39737) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-pregnancyintent.html)
48. **Applied:** Missing Hyperlinks [FHIR-39738](https://jira.hl7.org/browse/FHIR-39738) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-pregnancyintent.html) and [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-pregnancystatus.html)
49. **Applied:** Add a "memberId" slice to Coverage.identifier and add guidance[FHIR-39743](https://jira.hl7.org/browse/FHIR-39743) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-coverage.html)
50. **Applied:** Change RelatedPerson search to combination of Patient + Name [FHIR-39791](https://jira.hl7.org/browse/FHIR-39791) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-relatedperson.html#optional-search-parameters)
51. **Applied:** RelatedPerson uses text from Observation Laboratory profile [FHIR-39792](https://jira.hl7.org/browse/FHIR-39792) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-relatedperson.html)
52. **Applied:** Reference only reason for using MedicationDispense [FHIR-39856](https://jira.hl7.org/browse/FHIR-39856) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-medicationdispense.html)
53. **Applied:** Adjust USCDI Mapping references to MedicationRequest Profile [FHIR-39857](https://jira.hl7.org/browse/FHIR-39857) [See Changes Here](http://hl7.org/fhir/us/core/STU6/uscdi.html)
54. **Applied:** Adjust USCDI Mapping references to DiagnosticReport Profile [FHIR-39858](https://jira.hl7.org/browse/FHIR-39858) [See Changes Here](http://hl7.org/fhir/us/core/STU6/uscdi.html)
55. **Applied:** Add USCDI Mapping references for Disability Status and Mental/Cognitive Status [FHIR-39859](https://jira.hl7.org/browse/FHIR-39859) [See Changes Here](http://hl7.org/fhir/us/core/STU6/uscdi.html)
56. **Applied:** Adjust USCDI Mapping references to Patient Profile [FHIR-39860](https://jira.hl7.org/browse/FHIR-39860) [See Changes Here](http://hl7.org/fhir/us/core/STU6/uscdi.html)
57. **Applied:** Fix Value set expansion [FHIR-39861](https://jira.hl7.org/browse/FHIR-39861) [See Changes Here](http://hl7.org/fhir/us/core/STU6/ValueSet-us-core-pregnancy-status.html)
58. **Applied:** Extensions - context of use [FHIR-39863](https://jira.hl7.org/browse/FHIR-39863) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-race.html)
59. **Applied:** Add more Lab Result examples [FHIR-39868](https://jira.hl7.org/browse/FHIR-39868) [See Changes Here](http://hl7.org/fhir/us/core/STU6/Observation-at-home-in-vitro-test.html)
60. **Applied:** MedicationRequest - Change prescriber to 0..1 this information is not known for patient reported medications. [FHIR-39869](https://jira.hl7.org/browse/FHIR-39869) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-medicationrequest.html)
61. **Applied:** Update Profile Formal Views labels [FHIR-39873](https://jira.hl7.org/browse/FHIR-39873)
62. **Applied:** Provide guidance for Prescriptions Sent by Mail [FHIR-39878](https://jira.hl7.org/browse/FHIR-39878) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-medicationdispense.html)
63. **Applied:** Change CarePlan.text from Mandatory min = 1 to Must Support min = 0 [FHIR-39902](https://jira.hl7.org/browse/FHIR-39902) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-careplan.html)
64. **Applied:** Using SNOMED CT United States Edition Typo [FHIR-39903](https://jira.hl7.org/browse/FHIR-39903) [See Changes Here](http://hl7.org/fhir/us/core/STU6/general-guidance.html#snomed-ct-united-states-edition)
65. **Applied:** Update the Change log [FHIR-39923](https://jira.hl7.org/browse/FHIR-39923) [See Changes Here](http://hl7.org/fhir/us/core/STU6/changes.html#whats-new-in-version-600-of-us-core)
66. **Applied:** Define the term Screening and Assessment [FHIR-39938](https://jira.hl7.org/browse/FHIR-39938) See Changes Here](http://hl7.org/fhir/us/core/STU6/screening-and-assessments.html#introduction)
67. **Applied:** Clarify that Simple Observation Profile captures any sort of “simple” observations [FHIR-39940](https://jira.hl7.org/browse/FHIR-39940) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-simple-observation.html)
68. **Applied:** Correct the description of the Simple Observation Profile [FHIR-39942](https://jira.hl7.org/browse/FHIR-39942) [See Changes Here](http://hl7.org/fhir/us/core/STU6/screening-and-assessments.html#clinical-judgments)
69. **Applied:** Provide further guidance on use of US Core vs other domain specific IGs [FHIR-39943](https://jira.hl7.org/browse/FHIR-39943) [See Changes Here](http://hl7.org/fhir/us/core/STU6/screening-and-assessments.html#introduction)
70. **Applied:** Reframe Screening and Assessments Page [FHIR-39944](https://jira.hl7.org/browse/FHIR-39944) [See Changes Here](http://hl7.org/fhir/us/core/STU6/screening-and-assessments.html#introduction)
71. **Applied:** Update the Screening and Assessment Activities diagram [FHIR-39945](https://jira.hl7.org/browse/FHIR-39945) [See Changes Here](http://hl7.org/fhir/us/core/STU6/screening-and-assessments.html#related-activities-in-clinical-care)
72. **Applied:** Update the “Screening and Assessment Activities” diagram with proper profile name [FHIR-39946](https://jira.hl7.org/browse/FHIR-39946) [See Changes Here](http://hl7.org/fhir/us/core/STU6/screening-and-assessments.html)
73. **Applied:** Update Screening and Assessments” title and content [FHIR-39947](https://jira.hl7.org/browse/FHIR-39947) [See Changes Here](http://hl7.org/fhir/us/core/STU6/screening-and-assessments.html#screening-and-assessments)
74. **Applied:** Correct title[FHIR-39948](https://jira.hl7.org/browse/FHIR-39948) [See Changes Here](http://hl7.org/fhir/us/core/STU6/screening-and-assessments.html)
75. **Aoplied:** Update description of Screening Assessments Profile [FHIR-39949](https://jira.hl7.org/browse/FHIR-39949) [See Changes Here](http://hl7.org/fhir/us/core/STU6/screening-and-assessments.html)
76. **Applied:** Change Header [FHIR-39950](https://jira.hl7.org/browse/FHIR-39950) [See Changes Here](http://hl7.org/fhir/us/core/STU6/screening-and-assessments.html#us-core-observation-screening-assessment-profile)
77. **Applied:** Correct title of section 3.6.2.2 US Core Observation Simple Observation Profile [FHIR-39951](https://jira.hl7.org/browse/FHIR-39951) [See Changes Here](http://hl7.org/fhir/us/core/STU6/screening-and-assessments.html)
78. **Applied:** Require US Core Server to support the Simple Observation profile for simple assessments [FHIR-39953](https://jira.hl7.org/browse/FHIR-39953) [See Changes Here](http://hl7.org/fhir/us/core/STU6/screening-and-assessments.html#clinical-judgments)
79. **Applied:** Correct the link and sentence for assessment category codes [FHIR-39954](https://jira.hl7.org/browse/FHIR-39954) [See Changes Here](http://hl7.org/fhir/us/core/STU6/screening-and-assessments.html#category-codes)
80. **Applied:** Describe the purpose and intent of “Grouping” and update the diagram [FHIR-39955](https://jira.hl7.org/browse/FHIR-39955) [See Changes Here](http://hl7.org/fhir/us/core/STU6/screening-and-assessments.html#codes-for-problemshealthconcerns-goals-service-requests-and-procedures)
81. **Applied:** Remove US Core Common SDOH Assessments ValueSet [FHIR-39956](https://jira.hl7.org/browse/FHIR-39956)
82. **Applied:** Fix link text [FHIR-39958](https://jira.hl7.org/browse/FHIR-39958) [See Changes Here](http://hl7.org/fhir/us/core/STU6/changes.html)
83. **Applied:** Remove MS from Observation Screening Assessment Observation.performer Practitioner Reference [FHIR-39964](https://jira.hl7.org/browse/FHIR-39964) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-screening-assessment.html#profile)
84. **Applied:** Revert references the US Core QuestionnaireResponse Profile  [FHIR-39965](https://jira.hl7.org/browse/FHIR-39965) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-screening-assessment.html)
85. **Applied:** Correct link issue in “Profile specific implementation guidance section” of the ServiceRequest Profile [FHIR-39966](https://jira.hl7.org/browse/FHIR-39966) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-servicerequest.html)
86. **Applied:** Coverage.type binding clarification [FHIR-39982](https://jira.hl7.org/browse/FHIR-39982) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-coverage.html#mandatory-and-must-support-data-elements)
87. **Applied:** Rename US Core Observation Category Value Set [FHIR-40034](https://jira.hl7.org/browse/FHIR-40034) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-screening-assessment.html)
88. **Applied:** Extra ) in Screening and Assessments [FHIR-40041](https://jira.hl7.org/browse/FHIR-40041) [See Changes Here](http://hl7.org/fhir/us/core/STU6/screening-and-assessments.html)
89. **Applied:** Fix the link. [FHIR-40043](https://jira.hl7.org/browse/FHIR-40043) [See Changes Here](http://hl7.org/fhir/us/core/STU6/screening-and-assessments.html#category-codes)
90. **Applied:** Fix Pregnancy status codes  [FHIR-40045](https://jira.hl7.org/browse/FHIR-40045) [See Changes Here](http://hl7.org/fhir/us/core/STU6/ValueSet-us-core-pregnancy-status.html)
91. **Applied:** RelatedPerson profile text contains Observation content [FHIR-40048](https://jira.hl7.org/browse/FHIR-40048) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-relatedperson.html)
92. **Applied:** 2 typos in history page [FHIR-40069](https://jira.hl7.org/browse/FHIR-40069) [See Changes Here](http://hl7.org/fhir/us/core/STU6/http://hl7.org/fhir/us/core/history.html)
93. **Applied:** Reword a Quick Start example [FHIR-40072](https://jira.hl7.org/browse/FHIR-40072) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-patient.html#mandatory-search-parameters)
94. **Applied:** Consider alternative answer choices for pregnancy intect codes [FHIR-40084](https://jira.hl7.org/browse/FHIR-40084) [See Changes Here](http://hl7.org/fhir/us/core/STU6/ValueSet-us-core-pregnancy-intent.html)
95.  **Applied:** Improve Screening Assessment Observation.hasMember short description [FHIR-40085](https://jira.hl7.org/browse/FHIR-40085) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-screening-assessment.html)
96.  **Applied** Update the “bindings when slicing by value sets” figure  [FHIR-40086](https://jira.hl7.org/browse/FHIR-40086) [See Changes Here](http://hl7.org/fhir/us/core/STU6/general-requirements.html#required-bindings-when-slicing-by-valuesets)
97.  **Applied:** Update Condition category slices to align with Observation/ServiceRequest[FHIR-40087](https://jira.hl7.org/browse/FHIR-40087) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-condition-problems-health-concerns.html)
98.  **Applied:** Add guidance to the Procedure profile to express sdoh category [FHIR-40088](https://jira.hl7.org/browse/FHIR-40088) [See Changes Here](http://hl7.org/fhir/us/core/STU6/screening-and-assessments.html) and 
99.  **Applied:** Improve language as to the expectations of clinicalStatus when category is problem list [FHIR-40089](https://jira.hl7.org/browse/FHIR-40089) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-condition-problems-health-concerns.html)
100. **Applied:** Align with FHIR DS4P IG [FHIR-40090](https://jira.hl7.org/browse/FHIR-40090) [See Changes Here](http://hl7.org/fhir/us/core/STU6/general-guidance.html#suppressed-data)
101. **Applied:** Remove AHC HRSN screening tool examples [FHIR-40091](https://jira.hl7.org/browse/FHIR-40091)
102. **Applied:** Add guidance show collection method and performer can be captured using Provenance [FHIR-40092](https://jira.hl7.org/browse/FHIR-40092) [See Changes Here](http://hl7.org/fhir/us/core/STU6/basic-provenance.html#element-level-provenance) and [Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-patient.html#mandatory-and-must-support-data-elements)
103. **Applied:** Remove MustSupport from DocumentReference.category requiring clinical-note [FHIR-40102](https://jira.hl7.org/browse/FHIR-40102) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-documentreference.html)
104. **Applied:** Add Goal.startDate as 0..1 MS with choice of supporting this or Goal.target.dueDate [FHIR-40103](https://jira.hl7.org/browse/FHIR-40103) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-goal.html)
105. **Applied:** Clarify that other category codes are permitted and Remove MS from Observation.performer Practitioner Reference [FHIR-40104](https://jira.hl7.org/browse/FHIR-40104) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-simple-observation.html)
106. **Applied:** Add to the code systems chart [FHIR-40124](https://jira.hl7.org/browse/FHIR-40124) [See Changes Here](http://hl7.org/fhir/us/core/STU6/terminology.html#code-system-uris-used-in-us-core)
107. **Applied:** Make Specimen.subject must support [FHIR-40136](https://jira.hl7.org/browse/FHIR-40136) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-specimen.html)
108. **Applied:** Clarify use of unknown for occupation. [FHIR-40137](https://jira.hl7.org/browse/FHIR-40137) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html), [Here](http://hl7.org/fhir/us/core/STU6/Observation-observation-occupation-industry-unknown.html) and [Here](http://hl7.org/fhir/us/core/STU6/Observation-observation-occupation-unknown.html)
109. **Applied:** Clarify applicability of DiagnosticReport in USCDI Mapping [FHIR-40138](https://jira.hl7.org/browse/FHIR-40138) [See Changes Here](http://hl7.org/fhir/us/core/STU6/clinical-notes.html)
110. **Applied:** Remove the word ""status"" from introductory text [FHIR-40149](https://jira.hl7.org/browse/FHIR-40149) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html)
111. **Applied:** Incorrect link for ""record or update"" and additional examples [FHIR-40151](https://jira.hl7.org/browse/FHIR-40151) [See Changes Here](http://hl7.org/fhir/us/core/STU6/future-of-US-core.html#future-candidate-requirements-under-consideration)
112. **Applied:** Incorrect Resource noted in the introductory paragraph [FHIR-40155](https://jira.hl7.org/browse/FHIR-40155) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-coverage.html)
113. **Applied:** Define Job[FHIR-40158](https://jira.hl7.org/browse/FHIR-40158) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html)
114. **Applied:** Member or subscriber id is must have but the element cardinality is 0..* [FHIR-40160](https://jira.hl7.org/browse/FHIR-40160) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-coverage.html)
115. **Applied:** Modify comment regarding Screening and Assessments [FHIR-40161](https://jira.hl7.org/browse/FHIR-40161) [See Changes Here](http://hl7.org/fhir/us/core/STU6/screening-and-assessments.html#us-core-observation-screening-assessment-profile)
116. **Applied:** Modify Examples/ValueSet for Language Codes [FHIR-40165](https://jira.hl7.org/browse/FHIR-40165) [See Changes Here](http://hl7.org/fhir/us/core/STU6/ValueSet-simple-language.html)
117. **Applied:** Add Guidance for more advanced Occupation detail.[FHIR-40166](https://jira.hl7.org/browse/FHIR-40166) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html#profile)
118. **Applied:** Add implementer guidance [FHIR-40170](https://jira.hl7.org/browse/FHIR-40170) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html)
119. **Applied:** Add guidance for current job [FHIR-40172](https://jira.hl7.org/browse/FHIR-40172) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html)
120. **Applied:** Add guidance to clarify multiple codings can be used [FHIR-40178](https://jira.hl7.org/browse/FHIR-40178) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html)
121. **Applied:** Add _include guidance for Specimen [FHIR-40180](https://jira.hl7.org/browse/FHIR-40180) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-specimen.html#notes)
122. **Applied:** Update Industry NAICS Detail (ODH) to extensible. [FHIR-40181](https://jira.hl7.org/browse/FHIR-40181) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html)
123. **Applied:** Remove duplicate of Notes: Quick Start intro bullets [FHIR-40182](https://jira.hl7.org/browse/FHIR-40182) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html#profile)
124. **Applied:** Add search guidance [FHIR-40183](https://jira.hl7.org/browse/FHIR-40183) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html#mandatory-and-must-support-data-elements)
125. **Applied:** Update profile description to state the profile represents a patient's  'Past or Present Job' [FHIR-40187](https://jira.hl7.org/browse/FHIR-40187) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html)
126. **Applied:** Give guidance on SMART v2 scopes [FHIR-40192](https://jira.hl7.org/browse/FHIR-40192) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-condition-encounter-diagnosis.html#notes) and [Here](http://hl7.org/fhir/us/core/STU6/future-of-US-core.html#us-core-smart-scopes)
127. **Applied:** Remove the SFCU extension, and retain the birth-sex extension to meet USCDI Patient Sex. [FHIR-40197](https://jira.hl7.org/browse/FHIR-40197) [See Changes Here](http://hl7.org/fhir/us/core/STU6/uscdi.html)
128. **Applied:** Clarify guidance [FHIR-40199](https://jira.hl7.org/browse/FHIR-40199) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-medicationrequest.html#mandatory-and-must-support-data-elements)
129. **Applied:** Document expectations for Additional USCDI Requirements [FHIR-40200](https://jira.hl7.org/browse/FHIR-40200) [See Changes Here](http://hl7.org/fhir/us/core/STU6/general-requirements.html#us-core-conformance-artifacts) and [Here](http://hl7.org/fhir/us/core/STU6/must-support.html)
130. **Applied:** ServiceRequest Profile Implementation Specific Guidance - incorrect reference to ServiceRequest.reasonCode [FHIR-40202](https://jira.hl7.org/browse/FHIR-40202) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-servicerequest.html)
131. **Applied:** Tribal Affiliation Extension - add guidance to that extension:isEnrolled is an optional extension [FHIR-40203](https://jira.hl7.org/browse/FHIR-40203) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-tribal-affiliation.html)
132. **Applied:** Change Observation Occupation binding strength extensible [FHIR-40204](https://jira.hl7.org/browse/FHIR-40204) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-observation-occupation.html)
133. **Applied:** Change whenHandedOver cardinality 0..1 [FHIR-40205](https://jira.hl7.org/browse/FHIR-40205) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-medicationdispense.html)
134. **Applied:** MedicationRequest.reasonCodeableConcept does not exist [FHIR-40235](https://jira.hl7.org/browse/FHIR-40235) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-medicationrequest.html)
135. **Applied:** Clarify patient previous name and previous address [FHIR-40299](https://jira.hl7.org/browse/FHIR-40299) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-patient.html)
136. **Applied:** Update PractitionerRole.role binding [FHIR-40372](https://jira.hl7.org/browse/FHIR-40372) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-practitionerrole.html)
137. **Applied:** Remove MS from Patient on CareTeam.participant.member [FHIR-40415](https://jira.hl7.org/browse/FHIR-40415) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-careteam.html)
138. **Applied:** Update laboratory results example  [FHIR-40427](https://jira.hl7.org/browse/FHIR-40427) [See Changes Here](http://hl7.org/fhir/us/core/STU6/Observation-serum-glucose.html)
139. **Applied:** Update laboratory results example [FHIR-40428](https://jira.hl7.org/browse/FHIR-40428) [See Changes Here](http://hl7.org/fhir/us/core/STU6/Observation-serum-glucose.html)
140. **Applied:** Add Specimen to BUN example [FHIR-40429](https://jira.hl7.org/browse/FHIR-40429) [See Changes Here](http://hl7.org/fhir/us/core/STU6/Observation-serum-bun.html)
141. **Applied:** Additional guidance for accessing imaging studies [FHIR-40514](https://jira.hl7.org/browse/FHIR-40514) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-diagnosticreport-note.html#mandatory-and-must-support-data-elements)
142. **Applied:** Update example to follow 58410-2 CBC panel [FHIR-40521](https://jira.hl7.org/browse/FHIR-40521) [See Changes Here](http://hl7.org/fhir/us/core/STU6/DiagnosticReport-cbc.html)
143. **Applied:** Flag additional USCDI requirements in a computable way [FHIR-40553](https://jira.hl7.org/browse/FHIR-40553) [See Changes Here](http://hl7.org/fhir/us/core/STU6/must-support.html#uscdi-requirements)
144. **Applied:** Corrected expression in Condition asserted-date search parameter [FHIR-40573](https://jira.hl7.org/browse/FHIR-40573) [See Changes Here](http://hl7.org/fhir/us/core/STU6/SearchParameter-us-core-condition-asserted-date.html)
145. **Applied:** List only base profiles for reasonReference. [FHIR-40656](https://jira.hl7.org/browse/FHIR-40656) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-servicerequest.html#profile) and [Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-medicationrequest.html#profile)
146. **Applied:** Remove US Core QuestionnaireResponse Tag Element [FHIR-40742](https://jira.hl7.org/browse/FHIR-40742) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-questionnaireresponse.html) and [Here](http://hl7.org/fhir/us/core/STU6/Questionnaire-prapare-example.html)
147. **Applied:** Clarify Direct address options [FHIR-40583](https://jira.hl7.org/browse/FHIR-40583) [See Changes Here](http://hl7.org/fhir/us/core/STU6/StructureDefinition-us-core-practitionerrole.html#mandatory-and-must-support-data-elements)


### Version = 6.0.0 - ballot
- url: <http://hl7.org/fhir/us/core/2023Jan/>
- Based on FHIR version : 4.0.1

#### The January 2023 Ballot

This ballot addresses the following:

- We have updated US Core to include the [U.S. Core Data for Interoperability (USCDI) v3] Data Elements and Classes that the Office of the National Coordinator (ONC) published in July of 2022:

  - **Applied**: [Health Insurance Information](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-coverage.html) Using US Core to represent and access data related to an individual's insurance coverage for health care.
  - **Applied**: The SDOH Assessments documentation has been rewritten and renamed to [Screening and Assessments](http://hl7.org/fhir/us/core/2023Jan/screening-and-assessments.html), reflecting its expanded coverage of Health Status/Assessments Data Elements. It documents how to use [US Core Observation Screening Assessment Profile] and the [US Core Simple Observation Profile] to represent and access health status and assessments, including: *Functional Status*, *Disability Status*, and *Mental/Cognitive Status* in addition to *SDOH Assessments*.
  - **Applied**: [US Core Observation Pregnancy Status Profile](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-observation-pregnancystatus.html) and [US Core Observation Pregnancy Intent Profile](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-observation-pregnancyintent.html) have been added to specifically address pregnancy status.
  - **Applied**: **Laboratory:** The [US Core Laboratory Observation Profile](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-observation-lab.html) already supports the result status and terminology requirements for coded and numeric results. The [US Core Specimen Profile](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-specimen.html) has been added to support Specimen Type.  
  - **Applied**: **Medications:** Updates to the [US Core MedicationRequest Profile](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-medicationrequest.html) to support Dose, Dose Unit of Measure, Indication and the [US Core MedicationDispense Profile](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-medicationdispense.html) has been added to support Fill Status.
  - **Applied**: **Patient Demographics/Information**
      - Date of Death [See Change Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-patient.html)
      - Tribal Affiliation [See Change Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-patient.html) 
      - Sex (for clinical use)[See Change Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-sex-for-clinical-use.html) 
        - Note that the [US Core BirthSex Extension](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-birthsex.html) will not be deprecated.
      - Related Person's Name and Related Person's Relationship [See](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-relatedperson.html)
      - Occupation and Occupation Industry [See Change Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-observation-occupation.html)
  - **Applied**: **Procedures:** Reason for Referral [See Change Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-servicerequest.html) and [See Change Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-procedure.html)

- Several profiles from version 5.0.1 have been *retired* or *renamed* and *rescoped* in this version to accommodate the USCDI Health Status/Assessments Data Classes and as a result of implementer feedback. The [Cross Version Comparisions Table](http://hl7.org/fhir/us/core/2023Jan/changes-between-versions.html#cross-version-comparisons) summarized these significant revisions.
- We continue our efforts to link terminology directly to the FHIR® Terminology Service for VSAC Resources ([Value Set Authority Center (VSAC) - NIH](https://vsac.nlm.nih.gov/)) where applicable and, as a result, align terminology between US Core and [HL7 C-CDA](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=492).
- Implementers submitted over 70 trackers since the publication of US Core ver 5.0.0 and 5.0.1. We have addressed them and applied over 50 changes listed below:

 **Tracker Status**: **Summary** **Jira Issue** **Link to Updated Content**
1. **Applied:** US Core: Require Provenance Resource for Create/Update/Delete Events, AuditEvent for Read [FHIR-14388](https://jira.hl7.org/browse/FHIR-14388) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/basic-provenance.html) and [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-provenance.html)
2. **Applied:** Add recommended search combination of patient + status [FHIR-19803](https://jira.hl7.org/browse/FHIR-19803) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-implantable-device.html#notes)
3. **Applied:** Consider adding years since quite smoking [FHIR-20131](https://jira.hl7.org/browse/FHIR-20131) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-smokingstatus.html)
4. **Applied:** Create a US Core extension to communicate the state jurisdiction for an element [FHIR-26943](https://jira.hl7.org/browse/FHIR-26943) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-jurisdiction.html)
5.  **Applied:** Update missing data for coded data examples [FHIR-31381](https://jira.hl7.org/browse/FHIR-31381) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/general-requirements.html#missing-data)
6.  **Applied:** Clarify the purpose of Clinical Test Observation Profile [FHIR-35114](https://jira.hl7.org/browse/FHIR-35114) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-observation-clinical-result.html)
7.  **Applied:** Clarify how to read Profile Page [FHIR-36083](https://jira.hl7.org/browse/FHIR-36083) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/index.html#how-to-read-this-guide)
8.  **Applied:** Clarify organization responsible for the DocumentReference [FHIR-36654](https://jira.hl7.org/browse/FHIR-36654) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-documentreference.html#mandatory-and-must-support-data-elements)
9.  **Applied:** Clarify Device UDI-PI requirements [FHIR-36657](https://jira.hl7.org/browse/FHIR-36657) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-implantable-device.html#mandatory-and-must-support-data-elements)
10. **Applied:** Add 'problem-list-item' condition example [FHIR-36759](https://jira.hl7.org/browse/FHIR-36759) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/Condition-condition-duodenal-ulcer.html)
11. **Applied:** Fix LOINC LP code links [FHIR-36763](https://jira.hl7.org/browse/FHIR-36763) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/ValueSet-us-core-diagnosticreport-category.html)
12. **Applied:** Fix Link to "Direct Secure Messaging" [FHIR-36764](https://jira.hl7.org/browse/FHIR-36764) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-direct.html)
13. **Applied:** Update US Core Practitioner to clarify work related contact information [FHIR-36765](https://jira.hl7.org/browse/FHIR-36765) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-practitioner.html)
14. **Applied:** CLD for US Core Non Laboratory Codes value set is not computable [FHIR-36789](https://jira.hl7.org/browse/FHIR-36789) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/ValueSet-us-core-diagnosticreport-report-and-note-codes.html)
15. **Applied:** US Core Organization slice for CLIA does not list an HTA/THO approved external identifier system [FHIR-36926](https://jira.hl7.org/browse/FHIR-36926) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-organization.html)
16. **Applied:** Remove effectiveDateTime invariant from Sexual Orientation and Simple Observation (aka Social History) Profiles [FHIR-36932](https://jira.hl7.org/browse/FHIR-36932) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-observation-sexual-orientation.html) and [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-simple-observation.html)
17. **Applied:** Correct code system URI for HCPCS [FHIR-37336](https://jira.hl7.org/browse/FHIR-37336) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/ValueSet-us-core-procedure-code.html)
18. **Applied** change 'resources' to 'profiles' [FHIR-37343](https://jira.hl7.org/browse/FHIR-37343) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-provenance.html#mandatory-and-must-support-data-elements)
19. **Applied:** Clarify Expectations for Observation.value[x] in blood pressure and pulse oximetry profiles [FHIR-37358](https://jira.hl7.org/browse/FHIR-37358) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-blood-pressure.html#mandatory-and-must-support-data-elements) and [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-pulse-oximetry.html#mandatory-and-must-support-data-elements)
20. **Applied:** Clarify vaccineCode code system URI [FHIR-37400](https://jira.hl7.org/browse/FHIR-37400) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-immunization.html#mandatory-and-must-support-data-elements)
21. **Applied:** Typos on SDOH Guidance Page [FHIR-37469](https://jira.hl7.org/browse/FHIR-37469) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/screening-and-assessments.html)
22. **Applied** Add Constraint to validate NPI [FHIR-37498](https://jira.hl7.org/browse/FHIR-37498) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-practitioner.html) and [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-organization.html)
23. **Applied:** Remove extra instance or the word "resource" in Lab observation narrative profile [FHIR-37507](https://jira.hl7.org/browse/FHIR-37507) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-observation-lab.html)
24. **Applied:** Allow multiple Gender Identities and associated dates. [FHIR-37509](https://jira.hl7.org/browse/FHIR-37509) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-genderIdentity.html)
25. **Applied:** Typos on Patient and Practitioner "Name" SearchParameter pages [FHIR-37541](https://jira.hl7.org/browse/FHIR-37541) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/SearchParameter-us-core-patient-name.html) and [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/SearchParameter-us-core-practitioner-name.html)
26. **Applied:** Add Guidance on DocumentReference.category [FHIR-37592](https://jira.hl7.org/browse/FHIR-37592) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-documentreference.html#mandatory-and-must-support-data-elements)
27. **Applied:** Correct us-core-6 invariant expression [FHIR-37704](https://jira.hl7.org/browse/FHIR-37704) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-patient.html#constraints)
28. **Applied:**  Change Immunization.primarySource to must support and update definition [FHIR-37723](https://jira.hl7.org/browse/FHIR-37723) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-immunization.html)
29. **Applied:** Added supportedProfiles to US Core CapabilityStatements[FHIR-37766](https://jira.hl7.org/browse/FHIR-37766) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/CapabilityStatement-us-core-server.html#encounter)
30. **Applied:** Clarify how to use categories vis a vis codes in US Core Diagnostic Report Category element [FHIR-37770](https://jira.hl7.org/browse/FHIR-37770) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-diagnosticreport-note.html)
31. **Applied:** Clarify that US Core requires any version of SMART? [FHIR-37813](https://jira.hl7.org/browse/FHIR-37813) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/security.html)
32. **Applied:** Typo of "DiagnostisReport" in Clinical Notes Guidance [FHIR-37819](https://jira.hl7.org/browse/FHIR-37819) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/clinical-notes.html)
33. **Applied:** Update $docref type input to multiple Codings [FHIR-37894](https://jira.hl7.org/browse/FHIR-37894) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/OperationDefinition-docref.html) and [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-documentreference.html#mandatory-operation)
34. **Applied:** Add Conformance expectation of SHOULD to resolve for server Capability [FHIR-37901](https://jira.hl7.org/browse/FHIR-37901) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/CapabilityStatement-us-core-server.html)
35. **Applied:** Change Condition patient + category search to SHALL support [FHIR-37918](https://jira.hl7.org/browse/FHIR-37918) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-condition-encounter-diagnosis.html#notes)
36. **Applied:** Typo in Observation SDOH p7764rofile [FHIR-37928](https://jira.hl7.org/browse/FHIR-37928) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-observation-screening-assessment.html)
37. **Applied:** Typo in Condition Problems and Health Concerns search example [FHIR-37929](https://jira.hl7.org/browse/FHIR-37929) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-condition-problems-health-concerns.html)
38. **Applied:** Update Laboratory Loinc Valueset description [FHIR-37933](https://jira.hl7.org/browse/FHIR-37933) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/ValueSet-us-core-laboratory-test-codes.html)
39. **Applied:** Clarify that guide uses US Edition of SNOMED and update links to it  [FHIR-38190](https://jira.hl7.org/browse/FHIR-38190) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/general-guidance.html#snomed-ct-united-states-edition)
40. **Applied:** Update QuickStart to include all the search requirements by type. [FHIR-38629](https://jira.hl7.org/browse/FHIR-38629) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-observation-sexual-orientation.html)
41. **Applied:** Specify $docref's operates on DocumentReference endpoint [FHIR-38658](https://jira.hl7.org/browse/FHIR-38658) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/OperationDefinition-docref.html)
42. **Applied:** Remove comment in $docref [FHIR-38686](https://jira.hl7.org/browse/FHIR-38686) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/OperationDefinition-docref.html)
43. **Applied:** Add USCDI V3 Requirements [FHIR-38702](https://jira.hl7.org/browse/FHIR-38702) See Changes Listed in introduction above.
44. **Applied:** Correct documentation on Procedure.performed attribute [FHIR-38737](https://jira.hl7.org/browse/FHIR-38737) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-procedure.html#mandatory-and-must-support-data-elements)
45. **Applied:** Improve docref documentation [FHIR-38746](https://jira.hl7.org/browse/FHIR-38746) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/OperationDefinition-docref.html)
46. **Applied:** Fix title for US Core Pediatric Head Occipital Frontal Circumference Observation Profile [FHIR-38794](https://jira.hl7.org/browse/FHIR-38794) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-head-occipital-frontal-circumference-percentile.html)
47. **Applied:** Add Refill and Quantity to MedRequest [FHIR-39343](https://jira.hl7.org/browse/FHIR-39343) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-medicationrequest.html)
48. **Applied:** Fix Quick Start Rendering [FHIR-39367](https://jira.hl7.org/browse/FHIR-39367) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-patient.html#notes)
49. **Applied:** Remove Bulk Dependency  [FHIR-39377](https://jira.hl7.org/browse/FHIR-39377) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/CapabilityStatement-us-core-server.html#should_igs)
50. **Applied:** Fix Cross Version Comparisons section [FHIR-39417](https://jira.hl7.org/browse/FHIR-39417) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/changes-between-versions.html#cross-version-comparisons)
51. **Applied:** Add Ballot Comment to CarePlan for community feedback [FHIR-32949](https://jira.hl7.org/browse/FHIR-32949) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-careplan.html)
52. **Applied:** Change ServiceRequest.category to min=0 [FHIR-39493](https://jira.hl7.org/browse/FHIR-39493) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-servicerequest.html)
53. **Applied:** Fix provenance-1 [FHIR-39518](https://jira.hl7.org/browse/FHIR-39518) [See Changes Here](http://hl7.org/fhir/us/core/2023Jan/StructureDefinition-us-core-provenance.html)

### Version = 5.0.1
- url: <http://hl7.org/fhir/us/core/STU5.0.1/>
- Based on FHIR version : 4.0.1

The changes in this errata to version 5.0.0 of US Core have been reviewed by the public through the HL7 errata process. The resolution of the community comments has been agreed to and voted on by the members of the HL7 International Cross-Group Projects work group.
#### Corrected Errata in Version 5.0.1 of US Core:

**Tracker Status**: **Summary** **Jira Issue** **Link to Updated Content**

1. **Applied**: Typos in Condition Profile URls  [FHIR-37585](https://jira.hl7.org/browse/FHIR-37585) See Changes:
   - [Here](http://hl7.org/fhir/us/core/STU5.0.1/StructureDefinition-us-core-condition-encounter-diagnosis.html)
   - [Here](http://hl7.org/fhir/us/core/STU5.0.1/StructureDefinition-us-core-condition-problems-health-concerns.html)
2. **Applied**: Update VSAC dependency package version and remove STU Notes where expansion now supported by publisher  [FHIR-37586](https://jira.hl7.org/browse/FHIR-37586)
3. **Applied**: Correct misapplied tracker - for `agent.who` remove MS from reference Practitioner and add to Organization [FHIR-28517](https://jira.hl7.org/browse/FHIR-28517) [See Change Here](http://hl7.org/fhir/us/core/STU5.0.1/StructureDefinition-us-core-provenance.html)


### Version = 5.0.0
- url: <http://hl7.org/fhir/us/core/STU5/>
- Based on FHIR version : 4.0.1

The changes in this annual update to US Core have been reviewed and commented upon by the public through the January 2022 HL7 balloting process. The resolution of the community comments has been agreed to and voted on by the members of the HL7 International Cross-Group Projects work group.
#### What's new in Version 5.0.0 of US Core:

- New and updated resources to meet the [U.S. Core Data for Interoperability (USCDI) v2] new Data Elements and Classes that the Office of the National Coordinator (ONC) published in July of 2021:
  -  A Social Determinants Of Health ([SDOH](http://hl7.org/fhir/us/core/STU5/sdoh.html)) guidance page on using US Core to represent and access SDOH Assessments, Goals, Interventions, and Problems/Health Concerns.
  - [US Core Observation Survey Profile](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-survey.html), [US Core Observation SDOH Assessment Profile](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-sdoh-assessment.html), and [US Core QuestionnaireResponse Profile](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-questionnaireresponse.html) to represent SDOH Assessments
  - [US Core ServiceRequest Profile](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-servicerequest.html) to represent SDOH Interventions
  - [US Core Observation Clinical Result Profile](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-clinical-test.html) to represent Clinical Test Results
  - [US Core Observation Clinical Result Profile](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-imaging.html) to represent Imaging Results
  - [US Core Gender Identity Extension](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-genderIdentity.html) for patient demographics
  - [US Core Observation Sexual Orientation Profile](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-sexual-orientation.html) for patient demographics
  - [US Core RelatedPerson Profile](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-relatedperson.html) to represent care member such as a caretaker.
  - Updates to [US Core CareTeam Profile](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-careteam.html)
  - Updates to [US Core Encounter Profile](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-encounter.html)
  - US Core Condition has been split into:
      - [US Core Condition Encounter Diagnosis Profile](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-condition-encounter-diagnosis.html) to represent encounter diagnosis
      - [US Core Condition Problems and Health Concerns Profile](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-condition-problems-health-concerns.html) to represent problems and health concerns included SDOH health concerns.
- New pages and headers:
   - [Change Log](http://hl7.org/fhir/us/core/STU5/changes.html) new header and page. content migrated from the [Directory of published versions] page to create this page
   - [Conformance](http://hl7.org/fhir/us/core/STU5/conformance.html) new Header that contains these pages:
       - [General Requirements] content migrated from version 4.0.0 *General Requirements* and *Conformance Expectation* pages
       - [Must Support] renamed and edited from version 4.0.0 *Conformance Expectation* pages
   - [USCDI](http://hl7.org/fhir/us/core/STU5/uscdi.html) content migrated from version 4.0.0 *General Requirements* Page
   - [Changes Between Versions] rewritten and renamed from version 4.0.0 *DSTU2 to R4 Conversion* page
- Link more terminology directly to the [FHIR Terminology Service for VSAC Resources] and align terminology between US Core and [HL7 C-CDA].

#### Changes:

These changes are a result of over 100 January 2022 Ballot related trackers which are listed below:

**Tracker Status**: **Summary** **Jira Issue** **Link to Updated Content**

1. **Applied**: Remove requirement for component SDOH Assessment's Observations [FHIR-34384](https://jira.hl7.org/browse/FHIR-34384) [See Change Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-survey.html)
1. **Applied**: Clarify clinicalStatus invariant [FHIR-34468](https://jira.hl7.org/browse/FHIR-34468) [See Change Here](http://hl7.org/fhir/us/core/STU5/general-requirements.html#missing-data)
1. **Applied**: Fix Ethnicity ValueSet description [FHIR-34488](https://jira.hl7.org/browse/FHIR-34488) [See Change Here](http://hl7.org/fhir/us/core/STU5/ValueSet-omb-ethnicity-category.html)
1. **Applied**: Remove MS from ServiceRequest.occurrenceDateTime add MS to ServiceRequest.occurrencePeriod [FHIR-34493](https://jira.hl7.org/browse/FHIR-34493) [See Change Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-servicerequest.html)
1. **Applied**: Change Goal.description search requirement from SHALL to SHOULD [FHIR-34546](https://jira.hl7.org/browse/FHIR-34546) [See Change Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-goal.html#notes)
1. **Applied**: Warn client that categorization is fuzzy for SDOH [FHIR-34550](https://jira.hl7.org/browse/FHIR-34550) [See Change Here](http://hl7.org/fhir/us/core/STU5/sdoh.html#category-codes)
1. **Applied**: Split US Core Condition into two profile: Encounter Diagnosis and Problems/Health Concerns [FHIR-34553](https://jira.hl7.org/browse/FHIR-34553) See Change:
    - [Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-condition-problems-health-concerns.html)
    - [Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-condition-encounter-diagnosis.html)
1. **Applied**: Update narrative on abatement date [FHIR-34554](https://jira.hl7.org/browse/FHIR-34554) [See Change Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-condition-problems-health-concerns.html)
1. **Applied**: Change Clinical Tests Observations category to "clinical-test" and add guidance [FHIR-34555](https://jira.hl7.org/browse/FHIR-34555) See Changes:
   - [Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-clinical-test.html)
   - [Here](http://hl7.org/fhir/us/core/STU5/ValueSet-us-core-observation-category.html)
   - [Here](http://hl7.org/fhir/us/core/STU5/CodeSystem-us-core-observation-category.html)
   - [Here](http://hl7.org/fhir/us/core/STU5/ValueSet-us-core-clinical-test-codes.html)
1. **Applied**: Update all occurrences of U.S. Core Data for Interoperability (USCDI) v1 to v2 or removed specific references to version. [FHIR-34613](https://jira.hl7.org/browse/FHIR-34613) [For Example, See Change Here](http://hl7.org/fhir/us/core/STU5/index.html)
1. **Applied**: Referencing US Core Profiles [FHIR-34623](https://jira.hl7.org/browse/FHIR-34623) [See Change Here](http://hl7.org/fhir/us/core/STU5/general-guidance.html#referencing-us-core-profiles)
1. **Applied**: Correct code system in example snippet[FHIR-34624](https://jira.hl7.org/browse/FHIR-34624) [See Change Here](http://hl7.org/fhir/us/core/STU5/general-requirements.html#missing-data)
1. **Applied**: Add further clarification between slicing a binding (4.1.0) vs using extensible binding (4.0.0) [FHIR-34626](https://jira.hl7.org/browse/FHIR-34626) [See Change Here](http://hl7.org/fhir/us/core/STU5/general-requirements.html#required-bindings-when-slicing-by-valuesets)
1. **Applied**: Fix typo [FHIR-34627](https://jira.hl7.org/browse/FHIR-34627)
1. **Applied**: Clarify reported guidance on how secondary sourced MedicationRequest information can be represented. [FHIR-34628](https://jira.hl7.org/browse/FHIR-34628) [See Change Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-medicationrequest.html#mandatory-and-must-support-data-elements)
1. **Applied**: Fix contextDirection in Example 1[FHIR-34629](https://jira.hl7.org/browse/FHIR-34629) [See Change Here](http://hl7.org/fhir/us/core/STU5/clinical-notes.html#discovering-note-and-report-types)
1. **Applied**: Fix Medication List Examples [FHIR-34630](https://jira.hl7.org/browse/FHIR-34630) [See Change Here](http://hl7.org/fhir/us/core/STU5/medication-list.html#fetching-all-medications-active-medications-and-all-medications-for-an-encounter)
1. **Applied**: Correct Careteam Narrative errors (remove reference to Organization) [FHIR-34637](https://jira.hl7.org/browse/FHIR-34637) [See Change Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-careteam.html#mandatory-and-must-support-data-elements)
1. **Applied**: Fix typo [FHIR-34638](https://jira.hl7.org/browse/FHIR-34638)
1. **Applied**: Added missing search query parameter values [FHIR-34642](https://jira.hl7.org/browse/FHIR-34642) [See Change Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-imaging.html#notes)
1. **Applied**: Inconsistent on conditional required element [FHIR-34643](https://jira.hl7.org/browse/FHIR-34643) See Change:
  - [Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-diagnosticreport-lab.html)
  - [Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-diagnosticreport-note.html)
1. **Applied**: ServiceRequest.category:us-core should be required? [FHIR-34645](https://jira.hl7.org/browse/FHIR-34645) [See Change Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-servicerequest.html#mandatory-and-must-support-data-elements)
1. **Applied**: Remove Condition.category "us-core-1"  (due to [FHIR-34553](https://jira.hl7.org/browse/FHIR-34553)) and change Immunization.vaccineCode "us-core-1" to "us-core-5", Patient.name.family "us-core-8" to "us-core-6 " to remove duplicate invariant id, is now ['us-core-1', 'us-core-2', 'us-core-3', 'us-core-4', 'us-core-5', 'us-core-6', 'us-core-7', 'us-core-8', 'us-core-9','us-core-10','us-core-13', 'us-core-14',] [FHIR-34646](https://jira.hl7.org/browse/FHIR-34646) [See Change:
   - [Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-immunization.html)
   - [Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-patient.html)
1. **Applied**: Clarify that SDOH data elements does not include work information (see ODH) [FHIR-34701](https://jira.hl7.org/browse/FHIR-34701) See Change:
  -  [Here](http://hl7.org/fhir/us/core/STU5/sdoh.html)
  -  [Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-sdoh-assessment.html)
1. **Applied**: Add 386053000 "Evaluation procedure" ,410606002 "Social service procedure" to the ServiceRequest Category Code [FHIR-34747](https://jira.hl7.org/browse/FHIR-34747) [See Change Here](http://hl7.org/fhir/us/core/STU5/ValueSet-us-core-servicerequest-category.html)
1. **Applied**: Broaden Common SDOH assessment concepts and clarify is a starter set [FHIR-34752](https://jira.hl7.org/browse/FHIR-34752) See Change:
   - [Here](http://hl7.org/fhir/us/core/STU5/sdoh.html#assessment-codes)
   - [Here](http://hl7.org/fhir/us/core/STU5/ValueSet-us-core-common-sdoh-assessments.html)
   - [Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-sdoh-assessment.html)
1. **Applied**: Clinical Test Result Observation Profile Must Have needs to address the 3 slices for procedure, exam, and activity in the explanatory text [FHIR-34753](https://jira.hl7.org/browse/FHIR-34753) [See Change Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-clinical-test.html)
1. **Applied**: Clarify guidance for use of Patient.genderIdentity, Patient.birthsex, and pre-existing Patient.gender [FHIR-34754](https://jira.hl7.org/browse/FHIR-34754) [See Change Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-patient.html)
1. **Resolved - change required**: List profiles by type and create table comparing Observation Profiles [FHIR-34890](https://jira.hl7.org/browse/FHIR-34890) See Changes:
 - [Here](http://hl7.org/fhir/us/core/STU5/profiles-and-extensions.html)
 - [Here](http://hl7.org/fhir/us/core/STU5/index.html#us-core-profiles)
 - [Here](http://hl7.org/fhir/us/core/STU5/downloads.html)
1. **Applied**: Lab Result and Specimen Information for RBC Observation is Missing [FHIR-34910](https://jira.hl7.org/browse/FHIR-34910) See Change
   - [Here](http://hl7.org/fhir/us/core/STU5/index.html#how-to-read-this-guide)
   - [Here](http://hl7.org/fhir/us/core/STU5/examples.html)
   - [Here](http://hl7.org/fhir/us/core/STU5/Observation-blood-glucose.html)
1. **Applied**: Added guidance on Observation.category limitations [FHIR-34949](https://jira.hl7.org/browse/FHIR-34949) [See Change Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-lab.html#mandatory-and-must-support-data-elements)
1. **Applied**: Add guidance on Imaging DiagnosticReport ontology [FHIR-34958](https://jira.hl7.org/browse/FHIR-34958) [See Change Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-imaging.html)
1. **Applied**: Clarify that the profile guidance is not limited to profiled elements [FHIR-34971](https://jira.hl7.org/browse/FHIR-34971) [See Change Here](http://hl7.org/fhir/us/core/STU5/index.html#how-to-read-this-guide)
1. **Applied**: Fix asterisk notation in profiles [FHIR-34972](https://jira.hl7.org/browse/FHIR-34972) [See Change Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-imaging.html)
1. **Applied**: Clarify "time" elements used in the DiagnosticReport profiles [FHIR-34973](https://jira.hl7.org/browse/FHIR-34973) See Change:
   - [Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-diagnosticreport-lab.html)
   - [Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-diagnosticreport-note.html)
1. **Applied**: Change the query parameter value to be consistent with previous statement [FHIR-35047](https://jira.hl7.org/browse/FHIR-35047) [See Change Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-clinical-test.html#notes)
1. **Applied**: Re-ordered sections in *Downloads* page and provide a zip file of schematrons [FHIR-35064](https://jira.hl7.org/browse/FHIR-35064) [See Change Here](http://hl7.org/fhir/us/core/STU5/downloads.html)
1. **Applied**:  Split General Guidance page into 1) USCDI  3)General Guidance. Split Conformance Expectations into General Requirements and Must Support. Move General Guidance to General Requirements [FHIR-35065](https://jira.hl7.org/browse/FHIR-35065) See Changes:
  - [Here](http://hl7.org/fhir/us/core/STU5/uscdi.html)
  - [Here](http://hl7.org/fhir/us/core/STU5/general-requirements.html)
  - [Here](http://hl7.org/fhir/us/core/STU5/general-guidance.html)
  - [Here](http://hl7.org/fhir/us/core/STU5/must-support.html)
1. **Applied**: Clarify expectations for supporting multiple versions of US Core.[FHIR-35067](https://jira.hl7.org/browse/FHIR-35067) [See Change Here](http://hl7.org/fhir/us/core/STU5/changes-between-versions.html)
1. **Applied**: Clarify that Changes Between Versions (né DSTU2 to R4 Conversion) page documents a set of best practices [FHIR-35068](https://jira.hl7.org/browse/FHIR-35068) [See Change Here](http://hl7.org/fhir/us/core/STU5/changes-between-versions.html)
1. **Applied**: Typo in Category Codes section [FHIR-35072](https://jira.hl7.org/browse/FHIR-35072) [See Change Here](http://hl7.org/fhir/us/core/STU5/sdoh.html)
1. **Applied:** Typo [FHIR-35115](https://jira.hl7.org/browse/FHIR-35115)
1. **Applied**: Provide guidance when specific code systems are to be used in ServiceRequest [FHIR-35122](https://jira.hl7.org/browse/FHIR-35122) [See Change Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-servicerequest.html)
1. **Applied**: Clarify description for effective time. [FHIR-35125](https://jira.hl7.org/browse/FHIR-35125) [See Change Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-diagnosticreport-lab.html)
1. **Applied**: Fix CareTeam example's participant.role value [FHIR-35152](https://jira.hl7.org/browse/FHIR-35152) [See Change Here](http://hl7.org/fhir/us/core/STU5/CareTeam-example.html)
1. **Applied**: US Core Condition profile "status" is ambiguous; clarify to be clinicalStatus [FHIR-35280](https://jira.hl7.org/browse/FHIR-35280) [See Change Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-condition-problems-health-concerns.html)
1. **Applied**: Align Observation category for SDOH assessments [FHIR-35282](https://jira.hl7.org/browse/FHIR-35282) [See Change Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-social-history.html)
1. **Applied**: Add effective[x] 0..1 MS to US Core Observation Social History Profile [FHIR-35283](https://jira.hl7.org/browse/FHIR-35283) [See Change Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-social-history.html)
1. **Applied**:  Clarify Condition.clinicalStatus requirements and searching using clinical-status [FHIR-35318](https://jira.hl7.org/browse/FHIR-35318) [See Change Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-condition-problems-health-concerns.html)
1. **Applied**: Fix link [FHIR-35362](https://jira.hl7.org/browse/FHIR-35362)
1. **Applied**: Modify example usage text in all profile pages  [FHIR-35363](https://jira.hl7.org/browse/FHIR-35363) [See Change Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-survey.html)
1. **Applied**: Clarify modeling of SDOH screening using Observations, Add QuestionnaireResponse profile as alternative screening instrument [FHIR-35364](https://jira.hl7.org/browse/FHIR-35364) See Changes:
  - [Here](http://hl7.org/fhir/us/core/STU5/sdoh.html)
  - [Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-survey.html)
  - [Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-sdoh-assessment.html)
  - [Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-questionnaireresponse.html)
1. **Applied**: Clarify $docref operation expectations [FHIR-35380](https://jira.hl7.org/browse/FHIR-35380) [See Change Here](http://hl7.org/fhir/us/core/STU5/CapabilityStatement-us-core-server.html#documentreference)
1. **Applied**: Typo [FHIR-35388](https://jira.hl7.org/browse/FHIR-35388)
1. **Applied**: Duplicate sections in US Core RelatedPerson Profile profile [FHIR-35452](https://jira.hl7.org/browse/FHIR-35452)
1. **Applied**: Updated guidance on changes between versions [FHIR-35576](https://jira.hl7.org/browse/FHIR-35576) [See Change Here](http://hl7.org/fhir/us/core/STU5/changes-between-versions.html)
1. **Applied**: Split section on "deleted" from "entered in error" [FHIR-35622](https://jira.hl7.org/browse/FHIR-35622) [See Change Here](http://hl7.org/fhir/us/core/STU5/general-guidance.html#representing-entered-in-error-information)
1. **Applied**: Use "sdoh" instead of "LG41762-2" for SDOH Categories and Tags [FHIR-35644](https://jira.hl7.org/browse/FHIR-35644) See Changes:
   - [Here](http://hl7.org/fhir/us/core/STU5/CodeSystem-us-core-tags.html)
   - [Here](http://hl7.org/fhir/us/core/STU5/ValueSet-us-core-tags.html)
   - [Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-sdoh-assessment.html)
1. **Applied**: Update Gender Identity Value set[FHIR-35677](https://jira.hl7.org/browse/FHIR-35677) [See Change Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-genderIdentity.html)
1. **Applied**: Remove "OTH" from OMB Race Category valueSet [FHIR-35694](https://jira.hl7.org/browse/FHIR-35694) [See Change Here](http://hl7.org/fhir/us/core/STU5/ValueSet-omb-race-category.html)
1. **Applied**:Add basic introduction to the FHIR RESTful Search interaction in the home page [FHIR-35755](https://jira.hl7.org/browse/FHIR-35755) [See Change Here](http://hl7.org/fhir/us/core/STU5/index.html#us-core-fhir-restful-interactions)
1. **Applied**: Remove MS from DiagnosticReport.imagingStudy [FHIR-35759](https://jira.hl7.org/browse/FHIR-35759) [See Change Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-diagnosticreport-note.html)
1. **Applied**: Media example data value fails regex [FHIR-35790](https://jira.hl7.org/browse/FHIR-35790) [See Change Here](http://hl7.org/fhir/us/core/STU5/Media-ekg-strip.json.html)
1. **Applied**: Typo [FHIR-35844](https://jira.hl7.org/browse/FHIR-35844)
1. **Applied**: Typo [FHIR-35851](https://jira.hl7.org/browse/FHIR-35851)
1. **Applied**: Change fixed category slice to max=1 [FHIR-35854](https://jira.hl7.org/browse/FHIR-35854) [See Change Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-imaging.html)
1. **Applied**: Clarify narrative of status "active" element.  [FHIR-35870](https://jira.hl7.org/browse/FHIR-35870) [See Change Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-organization.html)
1. **Applied**: allow ethnicity extension in FamilyMemberHistory [FHIR-35997](https://jira.hl7.org/browse/FHIR-35997) [See Change Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-ethnicity.html)
1. **Applied**: allow race extension in FamilyMemberHistory [FHIR-35998](https://jira.hl7.org/browse/FHIR-35998) [See Change Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-race.html)
1. **Applied**: Update Condition Implementation Guidance to reflect current USCDI terminology standards [FHIR-36056](https://jira.hl7.org/browse/FHIR-36056) [See Change Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-condition-encounter-diagnosis.html)
1. **Applied**: Clarify expectations for reader [FHIR-36057](https://jira.hl7.org/browse/FHIR-36057) See Changes:
   - [Here](http://hl7.org/fhir/us/core/STU5/index.html)
   - [Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-observation-lab.html)
1. **Applied**: Update US Core Yearly Updates [FHIR-36058](https://jira.hl7.org/browse/FHIR-36058) [See Change Here](http://hl7.org/fhir/us/core/STU5/future-of-US-core.html)
1. **Applied**: Remove "Cause of death" from Condition.category and remove US Core Condition Category Codes ValueSet [FHIR-36104](https://jira.hl7.org/browse/FHIR-36104)
1. **Applied**: Add OTH to sexual orientation ValueSet [FHIR-36166](https://jira.hl7.org/browse/FHIR-36166) [See Change Here](http://hl7.org/fhir/us/core/STU5/ValueSet-us-core-sexual-orientation.html)
1. **Applied**: Updated coding `system` in Missing Data documentation [FHIR-36177](https://jira.hl7.org/browse/FHIR-36177) [See Change Here](http://hl7.org/fhir/us/core/STU5/general-requirements.html#missing-data)
1. **Applied**: Add "Other Race" to OMB Race Categories [FHIR-36247](https://jira.hl7.org/browse/FHIR-36247) [See Change Here](http://hl7.org/fhir/us/core/STU5/ValueSet-omb-race-category.html)
1. **Applied**: Add MS to Device.distinctIdentifier to correct editorial error [FHIR-36303](https://jira.hl7.org/browse/FHIR-36303) [See Change Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-implantable-device.html)
1. **Applied**: Fix provenance-1 invariant [FHIR-36328](https://jira.hl7.org/browse/FHIR-36328) [See Change Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-provenance.html)
1. **Applied**: Correct _targetProfile element in Provenance StructureDefinition [FHIR-36344](https://jira.hl7.org/browse/FHIR-36344) [See Change Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-provenance.html)
1. **Applied**: Correct guidance on accessing VSAC Valuesets [FHIR-36639](https://jira.hl7.org/browse/FHIR-36639) [See Change Here](http://hl7.org/fhir/us/core/STU5/terminology.html#using-value-set-authority-center-vsac)
1. **Applied**: Move change log from version history to new change log  page in IG [FHIR-36703](https://jira.hl7.org/browse/FHIR-36703) [See Change Here](http://hl7.org/fhir/us/core/STU5/changes.html)
1. **Applied**: Remove redundant example sections [FHIR-36728](https://jira.hl7.org/browse/FHIR-36728)
1. **Applied**: Realign ids names and titles for all new profiles for consistency [FHIR-36766](https://jira.hl7.org/browse/FHIR-36766) [See Change Here](http://hl7.org/fhir/us/core/STU5/profiles-and-extensions.html)
1. **Applied**: Move profile page introduction into structuredefinition description [FHIR-36824](https://jira.hl7.org/browse/FHIR-36824) [See Change Here](http://hl7.org/fhir/us/core/STU5/profiles-and-extensions.html)
1. **Applied**: Fixed profile, Added STU Note, Updated FHIR Core Vitals Profile binding in FHIR R4B. [FHIR-27845](https://jira.hl7.org/browse/FHIR-27845) [See Change Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-pulse-oximetry.html)
1. **Applied**: Change Encounter.reasonReference from 0..1 to 0..* [FHIR-36862](https://jira.hl7.org/browse/FHIR-36862) [See Change Here](http://hl7.org/fhir/us/core/STU5/StructureDefinition-us-core-encounter.html)
1. **Applied**: Change URL for CDT from http://ada.org/cdt to http://www.ada.org/cdt. [FHIR-36861](https://jira.hl7.org/browse/FHIR-36861) [See Change Here](http://hl7.org/fhir/us/core/STU5/ValueSet-us-core-procedure-code.html)

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
- url: <http://hl7.org/fhir/us/core/2022Jan>
- Based on FHIR version : 4.0.1

#### Changes:
 **The January 2022 Ballot**

This Ballot addresses the following issues:
- Adds [United States Core Data for Interoperability (USCDI) V2](https://www.healthit.gov/sites/default/files/page/2021-07/Standards_Bulletin_2021-3.pdf) updates that the Office of the National Coordinator (ONC) published in July of 2021 with these new Data Elements and Classes:
  - **Applied**: [A Social Determinants Of Health (SDOH) Guidance page](http://hl7.org/fhir/us/core/2022Jan/sdoh.html) to document and provide guidance on using US Core to represent and access [SDOH Assessments](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-observation-screening-response.html) and [Here](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-observation-social-history-assessment.html), [Goals](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-goal.html), Interventions represented by [ServiceRequest](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-servicerequest.html) + [Procedure](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-procedure.html), and [Problems/Health Concerns](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-condition.html)
  - **Applied**: [Clinical Tests](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-observation-clinical-test.html) and [Diagnostic Imaging](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-observation-imaging.html) [also see Changes Here](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-diagnosticreport-note.html)
  - **Applied**: [Patient Gender Identity](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-patient.html) and [Sexual Identity](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-observation-sexual-orientation.html#)
  - **Applied**: **Care Team Member:** Name, Identifier, Location, Telecom and Role [See Change Here](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-careteam.html) and [Here](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-practitioner.html) and [Here](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-relatedperson.html)
  - **Applied**: **Encounter:** Diagnosis, Disposition, Location, Time, Type [See Change Here](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-encounter.html)
  - **Applied**: **Problems:** Date of Diagnosis and Date of Resolution [See Change Here](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-condition.html)
- Continued efforts to link terminology directly to the FHIR® Terminology Service for VSAC Resources ([Value Set Authority Center (VSAC) - NIH](https://vsac.nlm.nih.gov/)) where applicable and as a result align terminology between US Core and [HL7 C-CDA](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=492).
- [Updated uscdii table](http://hl7.org/fhir/us/core/2022Jan/general-guidance.html) for easier browsing.
- Addition of consolidated [CSV and Excel File representations](http://hl7.org/fhir/us/core/2022Jan/downloads.html) of Profiles to  enable testers and analysts to review elements properties across profiles in a single table
- Addressed and applied over 30 trackers submitted by implementers since the previous STU2 ballot for US Core ver 4.0.0:

 **Tracker Status**: **Summary** **Jira Issue** **Link to Updated Content**
  1. **Applied**: Make values in direct and birth sex extensions min=1 [FHIR-26459](https://jira.hl7.org/browse/FHIR-26459) See Change:
     - [Here](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-birthsex.html)
     - [Here](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-direct.html)
  1. **Applied**: FIX imm-1.json NDC/CVX codes QA Error [FHIR-30104](https://jira.hl7.org/browse/FHIR-30104) See Change:
     - [Here](http://hl7.org/fhir/us/core/2022Jan/Immunization-imm-1.html)
     - [Here](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-immunization.html)
  1. **Applied**: Fix patient search parameter definitions to only target Patient  [FHIR-32305](https://jira.hl7.org/browse/FHIR-32305) [See Change Here](http://hl7.org/fhir/us/core/2022Jan/SearchParameter-us-core-allergyintolerance-patient.json.html)
  1. **Applied**: Provide a caution to the user that a query of MedicationRequest does not provide complete information. [FHIR-32720](https://jira.hl7.org/browse/FHIR-32720) [See Change Here](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-medicationrequest.html#mandatory-and-must-support-data-elements)
  1. **Applied**: Make Condition.encounter 0..1 MS [FHIR-32844](https://jira.hl7.org/browse/FHIR-32844) [See Change Here](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-condition.html)
  1. **Applied**: Correction on USCoreCarePlanProfile Binding [FHIR-32846](https://jira.hl7.org/browse/FHIR-32846) [See Change Here](http://hl7.org/fhir/us/core/2022Jan/http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-careplan.html)
  1. **Applied**: Fix title for BMI Profile [FHIR-32847](https://jira.hl7.org/browse/FHIR-32847) [See Change Here](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-bmi.html)
  1. **Applied**: Remove unchanged elements from Differentials [FHIR-32848](https://jira.hl7.org/browse/FHIR-32848) [For example change see](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-diagnosticreport-lab.profile.json.html)
  1. **Applied**: Create US Core slices for category elements [FHIR-32857](https://jira.hl7.org/browse/FHIR-32857) See Change:
     -  [Here](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-documentreference.html)
     -  [Here](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-medicationrequest.html)
     -  [Here](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-servicerequest.html)
     -  [Here](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-condition.html)
  1. **Applied**: Change drug class value set for allergens to align with C-CDA [FHIR-32953](https://jira.hl7.org/browse/FHIR-32953) [See Change Here](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-allergyintolerance.html)
  1. **Applied**: Referencing incorrect figure [FHIR-32961](https://jira.hl7.org/browse/FHIR-32961) [See Change Here](http://hl7.org/fhir/us/core/2022Jan/basic-provenance.html#clinical-information-reconciliation-and-incorporation)
  1. **Applied**: Clarify Guidance for missing data for Coding data type element [FHIR-33048](https://jira.hl7.org/browse/FHIR-33048) [See Change Here](http://hl7.org/fhir/us/core/2022Jan/general-guidance.html#missing-data)
  1. **Applied**: Fix us-core-1 Invariant for Observation [FHIR-33052](https://jira.hl7.org/browse/FHIR-33052) [See Change Here](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-observation-lab.html#constraints)
  1. **Applied**: Remove requirement to use only 401 from capabiltystatement [FHIR-33069](https://jira.hl7.org/browse/FHIR-33069) [See Change Here](http://hl7.org/fhir/us/core/2022Jan/CapabilityStatement-us-core-server.html#behavior)
  1. **Applied**: US Core to USCDI guidance page -- add patient email [FHIR-33079](https://jira.hl7.org/browse/FHIR-33079) [See Change Here](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-patient.html)
  1. **Applied**: Utilize "use" field for patient previous name and previous address [FHIR-33080](https://jira.hl7.org/browse/FHIR-33080) [See Change Here](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-patient.html)
  1. **Applied**: Fix search parameter list [FHIR-33123](https://jira.hl7.org/browse/FHIR-33123) [See Change Here](http://hl7.org/fhir/us/core/2022Jan/search-parameters-and-operations.html)
  1. **Applied**: Clarify requirement on date searches without prefix [FHIR-33156](https://jira.hl7.org/browse/FHIR-33156) [See Change Here](http://hl7.org/fhir/us/core/2022Jan/general-guidance.html#search-syntax.html)
  1. **Applied**: Clarify distinction between repeated search params and "composite" params [FHIR-33159](https://jira.hl7.org/browse/FHIR-33159) [See Change Here](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-observation-lab.html#notes)
  1. **Applied**: Add content as mandatory element in narrative for documentreference [FHIR-33160](https://jira.hl7.org/browse/FHIR-33160) [See Change Here](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-documentreference.html)
  1. **Applied**: Fix invalid elements in extensions [FHIR-33233](https://jira.hl7.org/browse/FHIR-33233) See Change:
     - [Here](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-race.html)
     - [Here](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-birthsex.html)
     - [Here](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-direct.html)
  1. **Applied**: Make Procedure.performed conditionally mandatory [FHIR-33243](https://jira.hl7.org/browse/FHIR-33243) [See Change Here](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-procedure.html)
  1. **Applied**: add same Null options to Race and Ethnicity [FHIR-34036](https://jira.hl7.org/browse/FHIR-34036) See Change
     - [Here](http://hl7.org/fhir/us/core/2022Jan/ValueSet-omb-ethnicity-category.html)
     - [Here](http://hl7.org/fhir/us/core/2022Jan/ValueSet-omb--detailed-ethnicity.html)
     - [Here](http://hl7.org/fhir/us/core/2022Jan/ValueSet-omb-race-category.html)
     - [Here](http://hl7.org/fhir/us/core/2022Jan/ValueSet-omb-detailed-race.html)
  1. **Applied**: Clarify MustSupport for Observation.component.value[x] vs dataAbsentReason [FHIR-34061](https://jira.hl7.org/browse/FHIR-34061) See Change:
     - [Here](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-blood-pressure.html#mandatory-and-must-support-data-elements)
     - [Here](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-vital-signs.html#mandatory-and-must-support-data-elements)
  1. **Applied**: Add  Null options to US Core Birth Sex Extension [FHIR-34133](https://jira.hl7.org/browse/FHIR-34133) [See Change Here](http://hl7.org/fhir/us/core/2022Jan/ValueSet-birthsex.html)
  1. **Applied**: USCDI v2 update [FHIR-34231](https://jira.hl7.org/browse/FHIR-34231) SEE SECTION ABOVE
  1. **Applied**: Fix Observation Examples using `appliesTo` [FHIR-34286](https://jira.hl7.org/browse/FHIR-34286) [See Change Here](http://hl7.org/fhir/us/core/2022Jan/Observation-serum-calcium.html)
  1. **Applied**: Correct CapabilityStatement SMART IG reference [FHIR-34281](https://jira.hl7.org/browse/FHIR-34281) [See Change Here](http://hl7.org/fhir/us/core/2022Jan/CapabilityStatement-us-core-server.html#should_igs)
  1. **Applied**: Make DiagnosticReport.effective and DiagnosticReport.issued conditionally mandatory [FHIR-34330](https://jira.hl7.org/browse/FHIR-34330) See Change:
      - [Here](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-diagnosticreport-lab.html)
      - [Here](http://hl7.org/fhir/us/core/2022Jan/StructureDefinition-us-core-diagnosticreport-note.html)
  1. **Applied**: fix URL[See Change Here](http://hl7.org/fhir/us/core/2022Jan/search-parameters-and-operations.html#operations)
  1. **Applied**: US Core search page is not working [FHIR-34028](https://jira.hl7.org/browse/FHIR-34028) [See Change Here](http://hl7.org/fhir/us/core/2022Jan/#) - Coordination with HL7 IG publishing team to Correct

  **The Following Trackers Will be Applied Following this Ballot**

  Due external dependencies and publication tooling limitations, the application of these resolutions have been deferred.

  **Tracker Status**: **Summary** **Jira Issue** **Link to Updated Content**
  
  1. **Resolved - change required**: US Core Pulse Oximetry Profile noncomformant UCUM Unit for Oxygen Concentration [FHIR-27845](https://jira.hl7.org/browse/FHIR-27845) -  Awaiting FHIR-4b updates to update base FHIR Vitals Profile, STU Note Present
  2. **Resolved - change required**: Patient Examples QA Errors: CDCREC code system in VSAC [FHIR-30105](https://jira.hl7.org/browse/FHIR-30105) [See Change Here](http://hl7.org/fhir/us/core/2022Jan/#) - Coordination with VSAC and IG publishing team to Correct and align Code System OIDS between FHIR, CCDA, and VSAC, Note To Balloters Present
  3. **Resolved - change required**: valueset-simple-language.xml QA Error [FHIR-30107](https://jira.hl7.org/browse/FHIR-30107) [See Change Here](http://hl7.org/fhir/us/core/2022Jan/#) - Coordination with IG publishing team to Correct - Note To Balloters present
  4. **Resolved - change required**: Display only differential invariants and terminology tables in Differential View [FHIR-30780](https://jira.hl7.org/browse/FHIR-30780) [See Change Here](http://hl7.org/fhir/us/core/2022Jan/#) - Coordination with HL7 IG publishing team to Correct
  5. **Resolved - change required**: Confusing to reads invariants and terminology tables in Differential View [FHIR-30783](https://jira.hl7.org/browse/FHIR-30783) [See Change Here](http://hl7.org/fhir/us/core/2022Jan/#) - Coordination with HL7 IG publishing team to Correct
  6. **Resolved - change required**: Wrong link to IG homepage from package manifest [FHIR-33132](https://jira.hl7.org/browse/FHIR-33132) [See Change Here](http://hl7.org/fhir/us/core/2022Jan/#) - Coordination with HL7 IG publishing team to Correct


---

### Version = 4.0.0
- Publication Date: 2021-06-28
- url: <http://hl7.org/fhir/us/core/STU4>
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
1. **Applied**:Update PractitionerRole.practitioner to )..1 MS ([FHIR-29681](https://jira.hl7.org/browse/FHIR-29681)) [See Change Here](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-practitionerrole.html#profile)
1. **Applied**:Change CareTeam `status` search parameter compositeOR expectation to SHOULD ([FHIR-29768](https://jira.hl7.org/browse/FHIR-29768)) [See Change Here](http://hl7.org/fhir/us/core/STU4/SearchParameter-us-core-careteam-status.html)
1. **Applied**:Provide guidance on the population of narrative ([FHIR-29777](https://jira.hl7.org/browse/FHIR-29777)) [See Change Here](http://hl7.org/fhir/us/core/STU4/general-guidance.html#narrative)
1. **Applied**: Change $docref start and end input parameter types from `date` to `dateTime` ([FHIR-29825](https://jira.hl7.org/browse/FHIR-29825)) [See Change Here](http://hl7.org/fhir/us/core/STU4/OperationDefinition-docref.html)
1. **Applied**: The history file markdown rendering of the table ([FHIR-30100](https://jira.hl7.org/browse/FHIR-30100)) [See Change Here](http://hl7.org/fhir/us/core/history.html)
1. **Applied**:footnote rendering - pre-applied ([FHIR-30101](https://jira.hl7.org/browse/FHIR-30101)) [See Change Here](http://hl7.org/fhir/us/core/STU4/general-guidance.html#guidance-on-limiting-the-number-of-search-results)
1. **Applied**:Random Section Numbering (Reminder for tooling issue) ([FHIR-30102](https://jira.hl7.org/browse/FHIR-30102)) [See Change Here](http://hl7.org/fhir/us/core/STU4/toc.html)
1. **Applied**:Move section 1.5 US Core Conformance Requirements ([FHIR-30103](https://jira.hl7.org/browse/FHIR-30103)) [See Change Here](http://hl7.org/fhir/us/core/STU4/conformance-expectations.html)
1. **Applied**:Make custodian optional on document reference ([FHIR-30108](https://jira.hl7.org/browse/FHIR-30108)) [See Change Here](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-documentreference.html)
1. **Applied**:Remove required binding on procedure and condition ([FHIR-30109](https://jira.hl7.org/browse/FHIR-30109)) See Changes:
   - [Here](http://hl7.org/fhir/us/core/STU4/conformance-expectations.html#extensible-binding-for-codeableconcept-datatype)
   - [Here](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-condition.html#profile)
   - [Here](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-procedure.html#profile)

1. **Applied**:Update DocumentReference CCD operation ([FHIR-30110](https://jira.hl7.org/browse/FHIR-30110)) [See Change Here](http://hl7.org/fhir/us/core/STU4/OperationDefinition-docref.html)
1. **Applied**:Update DocumentReference MustSupport to choice of data or url ([FHIR-30111](https://jira.hl7.org/browse/FHIR-30111)) [See Change Here](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-documentreference.html#mandatory-and-must-support-data-elements)
1. **Applied**:Reference to 3 new document types - addressing corresponding metadat ([FHIR-30112](https://jira.hl7.org/browse/FHIR-30112)) [See Change Here](http://hl7.org/fhir/us/core/STU4/clinical-notes-guidance.html#clinical-notes) AND [See Change Here](http://hl7.org/fhir/us/core/STU4/clinical-notes-guidance.html#support-requirements)
1. **Applied**:Typo ([FHIR-30113](https://jira.hl7.org/browse/FHIR-30113))
1. **Applied**:Clarify Must Support of Complex elements ([FHIR-30321](https://jira.hl7.org/browse/FHIR-30321)) [See Change Here](http://hl7.org/fhir/us/core/STU4/conformance-expectations.html#must-support---complex-elements)
1. **Applied**:Clarify that VSAC FHIR API only retrieves a definition ([FHIR-30344](https://jira.hl7.org/browse/FHIR-30344)) [See Change Here](http://hl7.org/fhir/us/core/STU4/terminology.html#using-value-set-authority-center-vsac)
1. **Applied**:Allergy Intolerance example for UNKNOWN allergy status does not use unknown ([FHIR-30345](https://jira.hl7.org/browse/FHIR-30345)) [See Change Here](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-allergyintolerance.html#mandatory-and-must-support-data-elements)
1. **Applied**:Corrected allergy intolerance example SNOMED CT code ([FHIR-30346](https://jira.hl7.org/browse/FHIR-30346)) [See Change Here](http://hl7.org/fhir/us/core/STU4/AllergyIntolerance-example.html)
1. **Applied**:Allergy codes updated to snomed product hierarchy in VSAC([FHIR-30347](https://jira.hl7.org/browse/FHIR-30347)) [See Change Here](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1186.8/expansion)
1. **Applied**:Clarify plans to align with Gender Harmony([FHIR-30350](https://jira.hl7.org/browse/FHIR-30350)) [See Change Here](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-patient.html#mandatory-and-must-support-data-elements)
1. **Applied**:Typos on Conformance Expectations Page ([FHIR-30353](https://jira.hl7.org/browse/FHIR-30353)) [See Change Here](http://hl7.org/fhir/us/core/STU4/conformance-expectations.html)
1. **Applied**:clarify use of additional codings ([FHIR-30354](https://jira.hl7.org/browse/FHIR-30354)) [See Change Here](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-vital-signs.html#mandatory-and-must-support-data-elements)
1. **Applied**:Clarify server requirements for Choice of Profile Elements scenario ([FHIR-30355](https://jira.hl7.org/browse/FHIR-30355)) [See Change Here](http://hl7.org/fhir/us/core/STU4/conformance-expectations.html#must-support---choice-of-profile-elements)
1. **Applied**:Add all options to Procedure.performed[x] ([FHIR-30391](https://jira.hl7.org/browse/FHIR-30391)) [See Change Here](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-procedure.html#profile)
1. **Applied**:Updated MedicationRequest.authoredOn from mandatory to must support([FHIR-30430](https://jira.hl7.org/browse/FHIR-30430)) [See Change Here](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-medicationrequest.html#mandatory-and-must-support-data-elements)
1. **Applied**:Typo ([FHIR-30460](https://jira.hl7.org/browse/FHIR-30460)) [See Change Here](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-vital-signs.html#mandatory-and-must-support-data-elements)
1. **Applied**: Update Encounter Type CPT Description ([FHIR-30470](https://jira.hl7.org/browse/FHIR-30470)) [See Change Here](http://hl7.org/fhir/us/core/STU4/ValueSet-us-core-encounter-type.html)
1. **Applied**: Clarify Missing Data language for coded data elements with required binding strength ([FHIR-30630](https://jira.hl7.org/browse/FHIR-30630)) [See Change Here](http://hl7.org/fhir/us/core/STU4/general-guidance.html#missing-data)
1. **Applied**:Note re language codes([FHIR-30654](https://jira.hl7.org/browse/FHIR-30654)) [See Change Here](http://hl7.org/fhir/us/core/STU4/ValueSet-simple-language.html#notes)
1. **Applied**:Change URL for Healthcare Common Procedure Coding System (HCPCS) level II alphanumeric codes([FHIR-30655](https://jira.hl7.org/browse/FHIR-30655)) See Changes [Here](http://hl7.org/fhir/us/core/STU4/terminology.html#using-value-set-authority-center-vsac) and [Here](http://hl7.org/fhir/us/core/ValueSet/us-core-procedure-code)
1. **Applied**:Typo ([FHIR-30656](https://jira.hl7.org/browse/FHIR-30656))
1. **Applied**: Explain the relationship between US CORE and an evolving USCDI. ([FHIR-30657](https://jira.hl7.org/browse/FHIR-30657)) [See Change Here](http://hl7.org/fhir/us/core/STU4/index.html)
1. **Applied**:Correct 2 bullet points in section 1.2. ([FHIR-30658](https://jira.hl7.org/browse/FHIR-30658)) [See Change Here](http://hl7.org/fhir/us/core/STU4/index.html)
1. **Applied**:Clarify actors ([FHIR-30659](https://jira.hl7.org/browse/FHIR-30659)) [See Change Here](http://hl7.org/fhir/us/core/STU4/index.html#us-core-actors)
1. **Applied**:Edit basic provenance ([FHIR-30660](https://jira.hl7.org/browse/FHIR-30660)) [See Change Here](http://hl7.org/fhir/us/core/STU4/basic-provenance.html#clinical-information-reconciliation-and-incorporation)
1. **Applied**:Clarify the duplication requirement for scanned documents in DocumentReference and DiagnosticReport. ([FHIR-30662](https://jira.hl7.org/browse/FHIR-30662)) [See Change Here](http://hl7.org/fhir/us/core/STU4/clinical-notes-guidance.html#fhir-resources-to-exchange-clinical-notes)
1. **Applied**:Clarify that clients should retain data visualization between DSTU2 to R4 upgrades. ([FHIR-30665](https://jira.hl7.org/browse/FHIR-30665)) [See Change Here](http://hl7.org/fhir/us/core/STU4/DSTU2-to-R4-conversion.html#expectation-that-dstu2-data-is-preserved-in-r4)
1. **Applied**:Add provenance to writing/updating guidance? ([FHIR-30666](https://jira.hl7.org/browse/FHIR-30666)) [See Change Here](http://hl7.org/fhir/us/core/STU4/future-of-US-core.html)
1. **Applied**:Clarify Code System section and update codesystem table ([FHIR-30667](https://jira.hl7.org/browse/FHIR-30667)) [See Change Here](http://hl7.org/fhir/us/core/STU4/terminology.html#code-systems)
1. **Applied**: Clarify guidance on implantable medical devices. ([FHIR-30669](https://jira.hl7.org/browse/FHIR-30669)) [[See Change Here](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-implantable-device.html#mandatory-and-must-support-data-elements)
1. **Applied**: Make udi_HRF a *Must Support* element. ([FHIR-30670](https://jira.hl7.org/browse/FHIR-30670)) [See Change Here](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-implantable-device.html#mandatory-and-must-support-data-elements)
1. **Applied**: Clarify UDI information. ([FHIR-30672](https://jira.hl7.org/browse/FHIR-30672)) See Changes:
    - [Here](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-implantable-device.html#mandatory-and-must-support-data-elements)
    - [Here](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-implantable-device.html#profile)
1. **Applied**:Clarify text ([FHIR-30673](https://jira.hl7.org/browse/FHIR-30673)) [See Change Here](http://hl7.org/fhir/us/core/STU4/conformance-expectations.html#conformance-expectations)
1. **Applied**:Typos ([FHIR-30674](https://jira.hl7.org/browse/FHIR-30674))
1. **Applied**:Clarify prohibition on using contained resources. ([FHIR-30677](https://jira.hl7.org/browse/FHIR-30677)) [See Change Here](http://hl7.org/fhir/us/core/STU4/general-guidance.html#contained-resources)
1. **Applied**:Add guidance on suppressed data. ([FHIR-30678](https://jira.hl7.org/browse/FHIR-30678)) [See Change Here](http://hl7.org/fhir/us/core/STU4/general-guidance.html#suppressed-data)
1. **Applied**:Clarify what is meant by "support the other elements." ([FHIR-30680](https://jira.hl7.org/browse/FHIR-30680)) [See Change Here](http://hl7.org/fhir/us/core/STU4/conformance-expectations.html#must-support---choice-of-data-types)
1. **Applied**:Typo([FHIR-30681](https://jira.hl7.org/browse/FHIR-30681))
1. **Applied**:Fix typos ([FHIR-30683](https://jira.hl7.org/browse/FHIR-30683)) Various Changes
1. **Applied**:Update on Guidance on DataAbsentReason for Observations ([FHIR-30685](https://jira.hl7.org/browse/FHIR-30685)) [See Change Here](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-observation-lab.html#mandatory-and-must-support-data-elements)
1. **Applied**:Clarify use of qualifier LOINCs ([FHIR-30690](https://jira.hl7.org/browse/FHIR-30690)) [See Change Here](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-vital-signs.html#mandatory-and-must-support-data-elements)
1. **Applied**: Fix Typo ([FHIR-30695](https://jira.hl7.org/browse/FHIR-30695)) [See Change Here](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-immunization-definitions.html)
1. **Applied**: Update on Guidance on DataAbsentReason for Observations ([FHIR-30699](https://jira.hl7.org/browse/FHIR-30699)) [See Change Here](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-observation-lab.html#mandatory-and-must-support-data-elements)
1. **Applied**: Clarify what is intended with "additional observations"([FHIR-30772](https://jira.hl7.org/browse/FHIR-30772)) [See Change Here](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-vital-signs.html#mandatory-and-must-support-data-elements)
1. **Applied**: Add statement about clinical safety to the security page ([FHIR-30776](https://jira.hl7.org/browse/FHIR-30776)) [See Change Here](http://hl7.org/fhir/us/core/STU4/security.html)
1. **Applied**: Added clarification to vitals profile regarding use of additional codings and component observations. ([FHIR-30778](https://jira.hl7.org/browse/FHIR-30778)) [See Change Here](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-blood-pressure.html#mandatory-and-must-support-data-elements)
2. **Applied**: Typo ([FHIR-30782](https://jira.hl7.org/browse/FHIR-30782)) [See Change Here](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-vital-signs.html#mandatory-and-must-support-data-elements)
3. **Applied**: Clarify resource search requirements CapabilityStatements and provide guidance on search for multiple patients using Bulk data ([FHIR-30787](https://jira.hl7.org/browse/FHIR-30787)) See Changes:
   - [Here](http://hl7.org/fhir/us/core/STU4/general-guidance.html#searching-multiple-patients)
   - [Here](http://hl7.org/fhir/us/core/STU4/CapabilityStatement-us-core-server.html#condition)
4. **Applied**: Add MedicationAdministration to the Future Page. ([FHIR-30788](https://jira.hl7.org/browse/FHIR-30788)) [See Change Here](http://hl7.org/fhir/us/core/STU4/future-of-US-core.html#future-candidate-requirements-under-consideration)
5. **Applied**: Fix text in $docref description ([FHIR-30810](https://jira.hl7.org/browse/FHIR-30810)) [See Change Here](http://hl7.org/fhir/us/core/STU4/OperationDefinition-docref.html)
6. **Applied**: Mandate that CapabilityStatement.instantiates refer to US Core ([FHIR-30889](https://jira.hl7.org/browse/FHIR-30889)) [See Change Here](http://hl7.org/fhir/us/core/STU4/CapabilityStatement-us-core-server.html#shall_css)
7. **Applied**: Add binding so Vitals will render it in differential view ([FHIR-31391](https://jira.hl7.org/browse/FHIR-31391)) [See Change Here](http://hl7.org/fhir/us/core/2021JAN/StructureDefinition-us-core-vital-signs.html#profile)
8. **Applied**: Update to URI from OID for CDT in Procedure Code ValueSet ([FHIR-31556](https://jira.hl7.org/browse/FHIR-31556)) [See Change Here](http://hl7.org/fhir/us/core/STU4/ValueSet-us-core-procedure-code.html)
9. **Applied**: Add DocumentReference.content is under "must have" list ([FHIR-31364](https://jira.hl7.org/browse/FHIR-31364)) [See Change Here](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-documentreference.html#mandatory-and-must-support-data-elements)
10. **Applied**: Update Must Support Bullet regarding missing data ([FHIR-31507](https://jira.hl7.org/browse/FHIR-31507)) [See Change Here](http://hl7.org/fhir/us/core/STU4/conformance-expectations.html#must-support-elements)
11. **Applied**: Update use context for Race and Ethnicity extensions ([FHIR-31008](https://jira.hl7.org/browse/FHIR-31008)) [See Change Here](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-race.html)
12. **Applied**: Add guidance on "POST based search" ([FHIR-31585](https://jira.hl7.org/browse/FHIR-31585)) See Changes:
   - [Here](http://hl7.org/fhir/us/core/STU4/general-guidance.html#search-syntax)
   - [Here](http://hl7.org/fhir/us/core/STU4/CapabilityStatement-us-core-server.html#behavior)
13. **Applied**: Add reference to Mapping from LOINC scale type to FHIR data type ([FHIR-31084](https://jira.hl7.org/browse/FHIR-31084)) [See Change Here](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-observation-lab.html#mandatory-and-must-support-data-elements)
14. **Applied**: Update Observation.value[x] definition ([FHIR-31083](https://jira.hl7.org/browse/FHIR-31083)) [See Change Here](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-observation-lab-definitions.html#Observation.value[x])
15. **Applied**: Add LOINC to procedure codes ([FHIR-31514](https://jira.hl7.org/browse/FHIR-31514)) [See Change Here](http://hl7.org/fhir/us/core/STU4/ValueSet-us-core-procedure-code.html)
16. **Applied**: Make PractitionerRole.organization must support and add invariant ([FHIR-29680](https://jira.hl7.org/browse/FHIR-29680)) [See Change Here](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-practitionerrole.html)
17. **Applied**: Fix FHIRPath constraint for provenance-1([FHIR-31020](https://jira.hl7.org/browse/FHIR-31020)) [See Change Here](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-provenance.html)
18. **Applied**: Add guidance to BMI Profile([FHIR-32658](https://jira.hl7.org/browse/FHIR-32658)) [See Change Here](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-bmi.html)
19. **Applied**: Write usage note for non-vaccination CVX codes([FHIR-31899](https://jira.hl7.org/browse/FHIR-31899)) [See Change Here](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-immunization.html#mandatory-and-must-support-data-elements)
20. **Applied**: Clarify that Extensible binding can always provide a mapped code([FHIR-32010](https://jira.hl7.org/browse/FHIR-32010)) [See Change Here](http://hl7.org/fhir/us/core/STU4/conformance-expectations.html#extensible-binding-for-codeableconcept-datatype)
21. **Applied**: Clarify RESTFul requirements([FHIR-31490](https://jira.hl7.org/browse/FHIR-31490)) See Changes:
   - [Here](http://hl7.org/fhir/us/core/STU4/index.html#introduction)
   - [Here](http://hl7.org/fhir/us/core/STU4/index.html#how-to-read-this-guide)
   - [Here](http://hl7.org/fhir/us/core/STU4/conformance-expectations.html#conformance-expectations)
   - [Here](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-allergyintolerance.html#notes)
22. **Applied**: fix Procedure Example error ([FHIR-30106](https://jira.hl7.org/browse/FHIR-30106)) [See Change Here](http://hl7.org/fhir/us/core/STU4/Procedure-rehab.html)

**Known issues:**

We are working to fix these issues that may come up when using US CORE.  We will correct them in a future version of the guide

Publishing

- [ ] **Resolved - change required**:Confusing for commercial vendor. Reads very confusing. ([FHIR-30783](https://jira.hl7.org/browse/FHIR-30783)) proposal is to make the differential tab the default view, see publishing plans [here](https://github.com/HL7/ig-template-base/issues/161)  timeline unknown.
- [ ] **Resolved - change required**:In most of the data elements – “Binding is from base FHIR and US Core Vital Signs”  Need this to be one single combined listing ([FHIR-30780](https://jira.hl7.org/browse/FHIR-30780)) proposal is to limit the terminology and invariants to view shown. see [Zulip chat](https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/Different.20views.20for.20tables.20and.20invariants) timeline unknown.
- [ ] **Resolved - change required**:Why are there separate codes for USCoreVitalSigns and the Systolic.value and the diastolic value? ([FHIR-30779](https://jira.hl7.org/browse/FHIR-30779)) proposal is to work with publishing to "clean up" terminology and invariants to view shown. see: see [Zulip chat](https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/Different.20views.20for.20tables.20and.20invariants) timeline unknown.

Terminology

- [ ] **Resolved - change required**: valueset-simple-language.xml QA error "Error from server: Language valuesets cannot be expanded as they are based on a grammar" ([FHIR-30107](https://jira.hl7.org/browse/FHIR-30107)) this error is still extant from prior version of US Core and has yet to be resolved. Work with publishing to fix and created [STU note](http://hl7.org/fhir/us/core/STU4/ValueSet-simple-language.html#notes). see [Zulip chat](https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/language.20valueset.20expansion.20error)
- [ ] **Resolved - change required**: Patient Examples QA Errors: CDCREC code system in VSAC Patient ([FHIR-30105](https://jira.hl7.org/browse/FHIR-30105)) CDCREC codes and code system value not aligned with VSAC. Workaround is to publish the [CDCREC code system and valuesets in USCore](http://hl7.org/fhir/us/core/STU4/terminology.html) until this content is moved to [HL7 Terminology](https://terminology.hl7.org/) Add an STU Note. [Zulip chat1](https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/cdcrec.20code.20errors.20in.20US.20Core) and [Zulip chat2](https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/Race.20Code.20System) and [Zulip chat3](https://chat.fhir.org/#narrow/stream/179202-terminology/topic/US.20CDCREC.20codessystems.20in.20HTA)
- [ ] **Resolved - change required**:imm-1.json NDC/CVX codes QA Error ([FHIR-30104](https://jira.hl7.org/browse/FHIR-30104)) Work with terminology server team to correct. see [Zulip chat](https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/CVX.20and.20NDC.20warnings.20in.20US.20Core)
- [ ] **Resolved - change required**:Pulse Ox Example: observation-satO2-fiO2 ([FHIR-27845](https://jira.hl7.org/browse/FHIR-27845)) Proposed Jira ticket to resolve in base made an [STU note](http://hl7.org/fhir/us/core/STU4/StructureDefinition-us-core-pulse-oximetry.html#mandatory-and-must-support-data-elements) that is technically not conformant with the base FHIR vital profile. See [Zulip chat](https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/US.20Core.20QA.20Issue.20.233-.20nasty.20profiling.20error)

---

### Version = 3.2.0
- Publication Date: 2021-1-30
- url: <http://hl7.org/fhir/us/core/2021Jan>
- Based on FHIR version : 4.0.1


#### Changes:
 The changes in this version have been voted on by the members of the sponsoring work group [HL7 International Cross-Group Projects](http://www.hl7.org/Special/committees/cgp/index.cfm).  This version addresses the following key issues:

1. Clarification of the Must Support definitions as it relates to:
  - Polymorphic datatypes, which of the possible types must be supported
  - Reference datatype (Reference, canonical) which of the target types must be supported
  - The vital signs profile in the Core Specification which profiles must be supported
  - New [Conformance Expectations]](http://hl7.org/fhir/us/core/2021Jan/conformance-expectations.html) page
  (see individual trackers below for details)
1. Publishing a set US Core Vital Signs independent of the FHIR core profile upon which it is based (see individual trackers below for details)
  - [US Core Vital Signs Profile](http://hl7.org/fhir/us/core/2021Jan/structuredefinition-us-core-vital-signs.html)
    - [US Core Blood Pressure Profile](http://hl7.org/fhir/us/core/2021Jan/structuredefinition-us-core-blood-pressure.html)
    - [US Core BMI Profile](http://hl7.org/fhir/us/core/2021Jan/structuredefinition-us-core-bmi.html)
    - [US Core Head Circumference Profile](http://hl7.org/fhir/us/core/2021Jan/structuredefinition-us-core-head-circumference.html)
    - [US Core Body Height Profile](http://hl7.org/fhir/us/core/2021Jan/structuredefinition-us-core-body-height.html)
    - [US Core Body Weight Profile](http://hl7.org/fhir/us/core/2021Jan/structuredefinition-us-core-body-weight.html)
    - [US Core Body Temperature Profile](http://hl7.org/fhir/us/core/2021Jan/structuredefinition-us-core-body-temperature.html)
    - [US Core Heart Rate Profile](http://hl7.org/fhir/us/core/2021Jan/structuredefinition-us-core-heart-rate.html)
    - [US Core Respiratory Rate Profile](http://hl7.org/fhir/us/core/2021Jan/structuredefinition-us-core-respiratory-rate.html)
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
       - Full narrative text summaries of profiles  **NOTE: We are seeking feedback on whether to retain these full narrative text summaries for this guide (an example can be seen [here](http://hl7.org/fhir/us/core/StructureDefinition-us-core-allergyintolerance.html#formal-views-of-profile-content) by clicking on the "Text Summary" tab)***

5. Addressing over 95 outstanding trackers.


**Trackers items and links to the updated content**
listed below are the resolved trackers for this version:

1. Must Support Over Interpreted ([FHIR-28375](https://jira.hl7.org/browse/FHIR-28375)) Changes throughout the profiles -- added conformance page [See Change Here](http://hl7.org/fhir/us/core/2021Jan/conformance-expectations.html)

1. Replace the US Core Update Allergy substances value set with VSAC reference ([FHIR-29322](https://jira.hl7.org/browse/FHIR-29322)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-allergyintolerance.html)

1. Update Organization Quick Start Example Search. ([FHIR-29269](https://jira.hl7.org/browse/FHIR-29269)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-organization.html#quick-start)

1. birthsex binding applied to the wrong element in US Core Patient StructuredDefinition/differential ([FHIR-29262](https://jira.hl7.org/browse/FHIR-29262)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-patient.profile.json.html)

1. us-core-12 invariant interpretation ([FHIR-28942](https://jira.hl7.org/browse/FHIR-28942)) [See Changes Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-implantable-device.html#FHIR-28942)

1. Incorrect Description Observation.component (Pulse Ox) ([FHIR-28934](https://jira.hl7.org/browse/FHIR-28934)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-pulse-oximetry.html)

1. References should be constrained to use `reference` not `identifier` ([FHIR-28573](https://jira.hl7.org/browse/FHIR-28573)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/general-guidance.html#FHIR-28573)

1. Update USCorePatientName search description for consistency ([FHIR-28540](https://jira.hl7.org/browse/FHIR-28540)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-patient.html#quick-start)

1. Make Provenance.author optional ([FHIR-28517](https://jira.hl7.org/browse/FHIR-28517)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-provenance.html#FHIR-28516)

1. Add must support type choices for US Core Goal.target.due[x]. ([FHIR-28477](https://jira.hl7.org/browse/FHIR-28477)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-goal.html)

1. Immunization Profile Mandatory and Must Support Intro is missing attributes ([FHIR-28452](https://jira.hl7.org/browse/FHIR-28452)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-immunization.html#FHIR-28452)

1. DiagnosticReport-cardiology-report JSON and XML samples contain invalid hashes ([FHIR-28408](https://jira.hl7.org/browse/FHIR-28408)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/DiagnosticReport-cardiology-report.json.html)

1. MedicationRequest.medication[x] ([FHIR-28395](https://jira.hl7.org/browse/FHIR-28395)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-medicationrequest.html#FHIR-28395)

1. Fix MedicationRequest.encounter reference ([FHIR-28258](https://jira.hl7.org/browse/FHIR-28258)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-medicationrequest.html)

1. Fix typo: "an another" -> "another" ([FHIR-28227](https://jira.hl7.org/browse/FHIR-28227)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-practitioner.html)

1. Declare mustSupport on Organization telecom children ([FHIR-28216](https://jira.hl7.org/browse/FHIR-28216)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-organization.html)

1. Resolve remaining discrepancies with FHIR R4 Search Parameters ([FHIR-28181](https://jira.hl7.org/browse/FHIR-28181)) See Changes Here:
    - [1 SearchParameter-us-core-condition-onset-date](http://hl7.org/fhir/us/core/2021Jan/SearchParameter-us-core-condition-onset-date.html)
    - [2 SearchParameter-us-core-organization-name](http://hl7.org/fhir/us/core/2021Jan/SearchParameter-us-core-organization-name.html)
    - [3 SearchParameter-us-core-location-name](http://hl7.org/fhir/us/core/2021Jan/SearchParameter-us-core-location-name.html)

1. Provenance without activity is not very useful ([FHIR-28179](https://jira.hl7.org/browse/FHIR-28179)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-provenance.html#FHIR-28179)

1. Make Provenance.target.reference mandatory ([FHIR-28165](https://jira.hl7.org/browse/FHIR-28165)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-provenance.html)

1. Missing narrative Element ([FHIR-28159](https://jira.hl7.org/browse/FHIR-28159)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/Patient-example.html)

1. "Updated guidance regarding gender and sex." ([FHIR-28138](https://jira.hl7.org/browse/FHIR-28138)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-patient.html#FHIR-28138)

1. Replace the US Core Smoking Status with VSAC reference ([FHIR-28123](https://jira.hl7.org/browse/FHIR-28123),[FHIR-26059](https://jira.hl7.org/browse/FHIR-26059)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-smokingstatus.html)

1. Timing association for smoking status changed from `issued` to `effectiveDateTime` ([FHIR-28090](https://jira.hl7.org/browse/FHIR-28090)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-smokingstatus.html)

1. Remove Must Support from Patient.telecom ([FHIR-27731](https://jira.hl7.org/browse/FHIR-27731)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-patient.html#FHIR-27731)

1. Remove Must Support from Patient.communication.language ([FHIR-27730](https://jira.hl7.org/browse/FHIR-27730)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-patient.html#FHIR-27731)

1. Remove Must Support from us-core-birthsex extension ([FHIR-27729](https://jira.hl7.org/browse/FHIR-27729)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-patient.html#FHIR-27731)

1. Remove Must Support from  us-core-ethnicity extension ([FHIR-27728](https://jira.hl7.org/browse/FHIR-27728)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-patient.html#FHIR-27731)

1. Remove Must Support from  us-core-race extension ([FHIR-27727](https://jira.hl7.org/browse/FHIR-27727)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-patient.html#FHIR-27731)

1. Expand US Core state value set to include US Military codes ([FHIR-26833](https://jira.hl7.org/browse/FHIR-26833)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/ValueSet-us-core-usps-state.html)

1. Fixed Value Set Expansion Operation examples ([FHIR-26625](https://jira.hl7.org/browse/FHIR-26625)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/clinical-notes-guidance.html#FHIR-26625)

1. Add must support reference type choices for US Core laboratory DiagnosticReport.performer ([FHIR-25120](https://jira.hl7.org/browse/FHIR-25120)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-diagnosticreport-lab.html)

1. Fix US-Core-1 constraint on Observation.effectivePeriod ([FHIR-29658](https://jira.hl7.org/browse/FHIR-29658)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-observation-lab.html)

1. Change bindings from extensible to required for Condition.code value set: US Core Condition Category Codes Procedure.code value set: US Core Procedure Codes ([FHIR-29563](https://jira.hl7.org/browse/FHIR-29563)) See Changes Here:
      - [1 StructureDefinition-us-core-condition-definitions](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-condition.html)
      - [2 StructureDefinition-us-core-procedure-definitions](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-procedure.html)

1. Remove text "an author responsible for the update". Keep author organization ([FHIR-28516](https://jira.hl7.org/browse/FHIR-28516)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-provenance.html#FHIR-28516)

1. "Clarify expectations when accessing "other endpoint" for DocumentReference.content.attachment.url" ([FHIR-28472](https://jira.hl7.org/browse/FHIR-28472)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-documentreference.html#FHIR-28472)

1. Add a required category to smoking status ([FHIR-28436](https://jira.hl7.org/browse/FHIR-28436)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-smokingstatus.html#FHIR-28436)

1. Use of US Core Profile when not explicitly referenced when using Contained resources ([FHIR-28396](https://jira.hl7.org/browse/FHIR-28396)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/general-guidance.html#FHIR-28396)

1. DocumentReference.custodian to be Optional ([FHIR-28393](https://jira.hl7.org/browse/FHIR-28393)) [See *Proposed* Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-documentreference.html#FHIR-28393)

1. Encounter.serviceProvider Must Support and Encounter.location.location Optional ([FHIR-28392](https://jira.hl7.org/browse/FHIR-28392)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-encounter.html#FHIR-28392)

1. Observation.hasMember Vital Signs Panel Profile Reference Choice ([FHIR-28391](https://jira.hl7.org/browse/FHIR-28391)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/profiles-and-extensions.html#FHIR-28391)

1. Add must support type choices for Observation.value[x] for Lab Observation Profile ([FHIR-28390](https://jira.hl7.org/browse/FHIR-28390)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-observation-lab.html)

1. Add must support type choices for Observation.effective[x] for Lab Observation Profile ([FHIR-28389](https://jira.hl7.org/browse/FHIR-28389)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-observation-lab.html)

1. Add must support type choices for Immunization.occurrence[x] ([FHIR-28388](https://jira.hl7.org/browse/FHIR-28388)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-immunization.html)

1. Add must support type choices for DiagnosticReport.effective[x] for Note Data ([FHIR-28387](https://jira.hl7.org/browse/FHIR-28387)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-diagnosticreport-note.html)

1. Add must support type choices for DiagnosticReport.effective[x] for Lab Data Type ([FHIR-28385](https://jira.hl7.org/browse/FHIR-28385)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-diagnosticreport-lab.html)

1. Add must support reference type choices for Provenance.agent.who Reference ([FHIR-28383](https://jira.hl7.org/browse/FHIR-28383)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-provenance.html)

1. Add must support reference type choices for MedicationRequest.requester Reference ([FHIR-28382](https://jira.hl7.org/browse/FHIR-28382)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-medicationrequest.html)

1. Add must support reference type choices for MedicationRequest.reported Choice ([FHIR-28381](https://jira.hl7.org/browse/FHIR-28381)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-medicationrequest.html#FHIR-28381)

1. Add must support reference type choices for  DocumentReference.author Reference ([FHIR-28380](https://jira.hl7.org/browse/FHIR-28380)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-documentreference.html)

1. Add must support reference type choices for DiagnosticReport.performer for Note ([FHIR-28379](https://jira.hl7.org/browse/FHIR-28379)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-diagnosticreport-note.html)

1. Add must support reference type choices for DiagnosticReport.performer for Lab ([FHIR-28378](https://jira.hl7.org/browse/FHIR-28378)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-diagnosticreport-lab.html)

1. Add must support reference type choices for CareTeam.participant.member Reference ([FHIR-28376](https://jira.hl7.org/browse/FHIR-28376)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-careteam.html)

1. Add choice for and type choices for Encounter.reasonReference ([FHIR-27951](https://jira.hl7.org/browse/FHIR-27951)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-encounter.html#FHIR-27951)

1. Add choice for Procedure.performed[x] ([FHIR-29695](https://jira.hl7.org/browse/FHIR-29695)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-procedure.html)

1. Clarify deleted resources requirements and guidance ([FHIR-28091](https://jira.hl7.org/browse/FHIR-28091)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/general-guidance.html#FHIR-28091)

1. Clarify search by date precision conformance expectations ([FHIR-27906](https://jira.hl7.org/browse/FHIR-27906)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/general-guidance.html#FHIR-27906)
   - [General Guidance](http://hl7.org/fhir/us/core/2021Jan/general-guidance.html#FHIR-27906)
   - [Example in QuickStart](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-careplan.html#optional-search-parameters)
   - [Example in CapabilityStatement](http://hl7.org/fhir/us/core/2021Jan/CapabilityStatement-us-core-server.html#careplan)

1. Clarify search by reference conformance expectations ([FHIR-27905](https://jira.hl7.org/browse/FHIR-27905)) See Changes Here:
   - [General Guidance](http://hl7.org/fhir/us/core/2021Jan/general-guidance.html#FHIR-27905)
   - [Example in QuickStart](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-careplan.html#optional-search-parameters)
   - [Example in CapabilityStatement](http://hl7.org/fhir/us/core/2021Jan/CapabilityStatement-us-core-server.html#careplan)

1. Add "Cause of Death" to category codes to meet the Public Health Use Case for VRDR ([FHIR-27904](https://jira.hl7.org/browse/FHIR-27904)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/ValueSet-us-core-condition-category.html)

1. Address non-implantable device and how to document usage ([FHIR-27896](https://jira.hl7.org/browse/FHIR-27896), [FHIR-23715](https://jira.hl7.org/browse/FHIR-23715), [FHIR-23715](https://jira.hl7.org/browse/FHIR-23715)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/future-of-US-core.html#FHIR-27896)

1. Resource constraints based on Jurisdiction which are not well documented ([FHIR-27810](https://jira.hl7.org/browse/FHIR-27810)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-implantable-device.html#FHIR-27810)

1. Updated CPT copyright to current year ([FHIR-27770](https://jira.hl7.org/browse/FHIR-27770)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/ValueSet-us-core-encounter-type.html)

1. Change binding for CareTeam.participant.role from NUCC to Care Team Member Function, replace the US Core Careteam Provider Roles Value Set with VSAC reference ([FHIR-27769](https://jira.hl7.org/browse/FHIR-27769)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-careteam.html)

1. Remove US Core Server Capability Statement *requires* support for HTTP status 410-deleted ([FHIR-26597](https://jira.hl7.org/browse/FHIR-26597)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/CapabilityStatement-us-core-server.html#behavior)

1. Change US Core Condition Codes Value Set Logical Definition ([FHIR-26060](https://jira.hl7.org/browse/FHIR-26060)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/ValueSet-us-core-condition-code.html)

1. Recommend against using SSN for Patient.identifier ([FHIR-24903](https://jira.hl7.org/browse/FHIR-24903)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-patient.html#FHIR-24903)

1. Remove identifier (OID) from ValueSet: US Core Encounter Type ([FHIR-29691](https://jira.hl7.org/browse/FHIR-29691)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/ValueSet-us-core-encounter-type.html)

1. Review vocabulary to align with CCDA and use VSAC valueset where possible ([FHIR-22488](https://jira.hl7.org/browse/FHIR-22488)) [See Changes Here:
    - [Detailed ethnicity --> Detailed Ethnicity](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-ethnicity.html#profile)
    - [Detailed Race --> Race](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-race.html#profile)
    - [OMB Ethnicity --> Categories\|Ethnicity](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-ethnicity.html#profile)
    - [US Core Medication Codes (RxNorm) --> Medication Clinical Drug](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-medicationrequest.html) and [here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-medication.html#Medication.code)
    - [US Core Provider Specialty (NUCC) --> Healthcare Provider Taxonomy](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-practitionerrole.html)
    - [US Core Vaccine Administered Value Set (CVX) --> CVX Vaccines Administered Vaccine Set](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-immunization.html)

1. Remove CVX-NDC mapping table ([FHIR-29745](https://jira.hl7.org/browse/FHIR-29745)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-immunization.html#FHIR-29745)

1. Since CarePlan.text.div is min== 1 add must support == true element to be consistent with US Core design ([FHIR-29765](https://jira.hl7.org/browse/FHIR-29765)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/StructureDefinition-us-core-careplan.html)

1. Remove unused US Core ICD-10-PCS Procedure Codes valueset ([FHIR-29822](https://jira.hl7.org/browse/FHIR-29822))

1. Remove Clinical Notes Guidance References to ONC 2019 NPRM and move requirements to main body ([FHIR-29824](https://jira.hl7.org/browse/FHIR-29824)) [See Change Here](http://hl7.org/fhir/us/core/2021Jan/clinical-notes-guidance.html)

---

### Version = 3.1.1
- Publication Date: 2020-6-30
- url: <http://hl7.org/fhir/us/core/STU3.1.1>
- Based on FHIR version : 4.0.1


#### Changes:
 This update addresses several technical corrections and errata and clarifications. They have been reviewed and voted on by the members of the [HL7 International Cross-Group Projects WorkGroup](http://www.hl7.org/Special/committees/cgp/index.cfm) who is sponsoring this errata release and reconciliation of the comments.:
1. Add guidance for representing patient name suffix and previous patient name to the [US Core Patient Profile](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-patient.html#mandatory-and-must-support-data-elements) ([FHIR-28129](https://jira.hl7.org/browse/FHIR-28129))
1. Correct copy/paste error in [Goal Profile](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-goal-definitions.html#Goal.lifecycleStatus) ([FHIR-28109](https://jira.hl7.org/browse/FHIR-28109))
1. Correct [US Core Provider Specialty (NUCC) ValueSet ](http://hl7.org/fhir/us/core/STU3.1.1/ValueSet-us-core-provider-specialty.html) to hide abstract grouping codes ([FHIR-27975](https://jira.hl7.org/browse/FHIR-27975))
1. Added example of US Core Direct Extension to [Practitioner-2 Example](http://hl7.org/fhir/us/core/STU3.1.1/Practitioner-practitioner-2.html) ([FHIR-27947](https://jira.hl7.org/browse/FHIR-27947))
1. Corrected technical errors in [pediatric profiles StructureDefinitions](http://hl7.org/fhir/us/core/STU3.1.1/profiles.html#profiles) ([FHIR-27946](https://jira.hl7.org/browse/FHIR-27946))
1. Corrected errors in [DiagnosticReport Cardiology Example](http://hl7.org/fhir/us/core/STU3.1.1/DiagnosticReport-cardiology-report.html) ([FHIR-27913](https://jira.hl7.org/browse/FHIR-27913))
1. Update [Federal Register link](http://hl7.org/fhir/us/core/STU3.1.1/ValueSet-omb-race-category.html) for OMB race and ethnicity category classifications. ([FHIR-27907](https://jira.hl7.org/browse/FHIR-27907))
1. Clarified [token search syntax](http://hl7.org/fhir/us/core/STU3.1.1/general-guidance.html#search-syntax) ([FHIR-27897](https://jira.hl7.org/browse/FHIR-27897)).
1. Corrected [US Core DocumentReference Profile](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-documentreference-definitions.html#DocumentReference.content) to support multiple attachments ([FHIR-25778](https://jira.hl7.org/browse/FHIR-25778)).
1. Fix FHIRPath Expression in [USCoreGoalTargetDate](http://hl7.org/fhir/us/core/STU3.1.1/SearchParameter-us-core-goal-target-date.html) ([FHIR-27892](https://jira.hl7.org/browse/FHIR-27892)).
1. Fix FHIRPath Expression in [USCoreProcedureDate](http://hl7.org/fhir/us/core/STU3.1.1/SearchParameter-us-core-procedure-date.html)([FHIR-27887](https://jira.hl7.org/browse/FHIR-27887)).
1. Add omitted ["ge" comparators to SearchParameters](http://hl7.org/fhir/us/core/STU3.1.1/SearchParameter-us-core-goal-target-date.html) ([FHIR-27893](https://jira.hl7.org/browse/FHIR-27893)).
1. [Remove Must Support References](http://hl7.org/fhir/us/core/STU3.1.1/general-guidance.html#referencing-us-core-profiles) to non US Core Profiles ([FHIR-27876](https://jira.hl7.org/browse/FHIR-27876))
1. Add missing [reaction](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-allergyintolerance-definitions.html#AllergyIntolerance.reaction) to the US Core AllergyIntolerance Profile ([FHIR-27867](https://jira.hl7.org/browse/FHIR-27867)).
1. Clarify [reference to US Core Patient](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-pediatric-bmi-for-age.html#mandatory-and-must-support-data-elements) in Vitals Signs Profiles ([FHIR-27857](https://jira.hl7.org/browse/FHIR-27857)).
1. Corrected [US Core Pulse Oximetry Profile](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-pulse-oximetry.html#formal-views-of-profile-content) component.valueQuantity.code and component.valueQuantity.unit min from 0 to 1 to be consistent with the valueQuantity constraints within US Core ([FHIR-27846](https://jira.hl7.org/browse/FHIR-27846))
1. Correct UCUM Unit in [US Core Pulse Oximetry Profile Text Summary](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-pulse-oximetry.html#summary-of-the-must-support-requirements) ([FHIR-27845](https://jira.hl7.org/browse/FHIR-27845))
1. Update [Procedure Codes Value Set](http://hl7.org/fhir/us/core/STU3.1.1/ValueSet-us-core-procedure-code.html) to include ICD-10 PCS codes ([FHIR-27836](https://jira.hl7.org/browse/FHIR-27836))
1. Update [Procedure Codes Value Set](http://hl7.org/fhir/us/core/STU3.1.1/ValueSet-us-core-procedure-code.html) to include CDT codes ([FHIR-27737](https://jira.hl7.org/browse/FHIR-27737))
1. Clarify that pediatric vital sign percentile Observations should [reference growth chart](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-pediatric-bmi-for-age.html#mandatory-and-must-support-data-elements) ([FHIR-27549](https://jira.hl7.org/browse/FHIR-27549)),
1. Added Missing [US core Head Occipital-frontal Circumference Percentile Profile](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-head-occipital-frontal-circumference-percentile.html) ([FHIR-27542](https://jira.hl7.org/browse/FHIR-27542)).
1. Correct requirements for supporting [CLIA identifiers](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-organization.html#mandatory-and-must-support-data-elements) ([FHIR-27158](https://jira.hl7.org/browse/FHIR-27158))
1. Change Description of [ICD-10-PCS Value Set](http://hl7.org/fhir/us/core/STU3.1.1/ValueSet-us-core-procedure-icd10pcs.html) ([FHIR-27116](https://jira.hl7.org/browse/FHIR-27116))
1. Correct [AllergyIntolerance guidance](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-allergyintolerance.html#mandatory-and-must-support-data-elements) for verificationStatus ([FHIR-27096](https://jira.hl7.org/browse/FHIR-27096))
1. Fix example [US Core heart-rate example](http://hl7.org/fhir/us/core/STU3.1.1/Observation-heart-rate.html) ([FHIR-27086](https://jira.hl7.org/browse/FHIR-27086))
1. **review period comments** Update [smoking status codes](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-smokingstatus-definitions.html#Observation.value[x]:valueCodeableConcept) to align with USCDI ([FHIR-27082](https://jira.hl7.org/browse/FHIR-27082)).
1. Fix invariant [provenance-1](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-provenance-definitions.html#who) ([FHIR-27065](https://jira.hl7.org/browse/FHIR-27065))
1. Fix invalid [json snippet](http://hl7.org/fhir/us/core/STU3.1.1/general-guidance.html#missing-data) ([FHIR-27001](https://jira.hl7.org/browse/FHIR-27001))
1. **review period comments** Remove Provenance requirement from Medication, Location, Practitioner, PractitionerRole, and Organization and correct copy and paste error to Medication and Provenance searchType support in [CapabilityStatement](http://hl7.org/fhir/us/core/STU3.1.1/CapabilityStatement-us-core-server.html#resource--details) ([FHIR-26840](https://jira.hl7.org/browse/FHIR-26840), [FHIR-28161](https://jira.hl7.org/browse/FHIR-28161)).
1. Correction on [USCDI Table](http://hl7.org/fhir/us/core/STU3.1.1/general-guidance.html#us-core-data-for-interoperability-and-2015-edition-common-clinical-data-set) change "MedicationStatement" to "MedicationRequest" and remove references to MedicationStatement in the Medication Profile and CapabilityStatements ([FHIR-26840](https://jira.hl7.org/browse/FHIR-26840)).
1. Clarify that US Core Location/PractitionerRole are [not being referenced](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-encounter.html#mandatory-and-must-support-data-elements) by other resources ([FHIR-26840](https://jira.hl7.org/browse/FHIR-26840)).
1. Correct editing error restoring Write and Operation capability guidance into [DocumentReference QuickStart](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-documentreference.html#quick-start) ([FHIR-26840](https://jira.hl7.org/browse/FHIR-26840)).
1. Clarify [guidance](http://hl7.org/fhir/us/core/STU3.1.1/general-guidance.html#search-for-servers-requiring-status) that servers SHALL support search with status if status required ([FHIR-26840](https://jira.hl7.org/browse/FHIR-26840)).
1. Correct canonical url for ImplementationGuide ([FHIR-26686](https://jira.hl7.org/browse/FHIR-26686)).
1. Correct system URI for [ICD-10 procedure codes](http://hl7.org/fhir/us/core/STU3.1.1/ValueSet-us-core-procedure-icd10pcs.html) ([FHIR-26679](https://jira.hl7.org/browse/FHIR-26679)).
1. Fix invariant [us-core-1](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-condition-definitions.html#Condition) ([FHIR-26605](https://jira.hl7.org/browse/FHIR-26605)).
1. Change valueCode min from 0 to 1 for [US Core Birth Sex Extension](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-birthsex-definitions.html#Extension.valueCode) and valueBoolean min from 0 to 1 for[US Core Direct email Extension](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-direct-definitions.html#Extension.valueBoolean) ([FHIR-26459](https://jira.hl7.org/browse/FHIR-26459)).
1. Change valueQuantity min from 1 to 0 for [US Core Pediatric BMI for Age Observation Profile](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-pediatric-bmi-for-age-definitions.html#Observation.valueQuantity) and [US Core Pediatric Weight for Height Observation Profile](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-pediatric-weight-for-height-definitions.html#Observation.valueQuantity) ([FHIR-26363](https://jira.hl7.org/browse/FHIR-26363)).
1. Add page contents to [Clinical Notes Guidance](http://hl7.org/fhir/us/core/STU3.1.1/clinical-notes-guidance.html) and [Basic Provenance](http://hl7.org/fhir/us/core/STU3.1.1/basic-provenance.html) pages ([FHIR-25785](https://jira.hl7.org/browse/FHIR-25785)).
1. Fix duplicate URL causing validation failure. ([FHIR-25536](https://jira.hl7.org/browse/FHIR-25536)).
1. Fix Invariant [us-core-8](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-patient-definitions.html#Patient.name) ([FHIR-25459](https://jira.hl7.org/browse/FHIR-25459)).
1. Corrected the wording "should support" to "shall support" in [Clinical Notes Guidance](http://hl7.org/fhir/us/core/STU3.1.1/clinical-notes-guidance.html#clinical-notes) ([FHIR-25455](https://jira.hl7.org/browse/FHIR-25455)).
1. Fix Invariant [us-core-8](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-patient-definitions.html#Patient.name) to allow for Data Absent Reason Extension on Patient name.([FHIR-25249](https://jira.hl7.org/browse/FHIR-25249)).
1. Fix Link to LOINC LP29708-2 ([FHIR-25213](https://jira.hl7.org/browse/FHIR-25213)).
1. Corrected [guidance](http://hl7.org/fhir/us/core/STU3.1.1/all-meds.html#fetching-all-medications-active-medications-and-all-medications-for-an-encounter) for conveying "Patient-Reported medications" ([FHIR-25035](https://jira.hl7.org/browse/FHIR-25035))

---

### Version = 3.1.0
- Publication Date: 2019-10-31
- url: <http://hl7.org/fhir/us/core/STU3.1>
- Based on FHIR version : 4.0.1


#### Changes:
 In order meet the proposed *ONC U.S. Core Data for Interoperability** (USCDI) regulatory requirements for access to patient data, this STU Update of the US Core Implementation Guide has added new content. Structured Documents and the [Argonaut Project Team](https://argonautwiki.hl7.org/Argonaut_2019_Projects#Argonaut_R4) have spent the last several months reviewing, testing and providing invaluable feedback on these and other topics including most notably:
1) A US Core Provenance Profile and Basic Provenance guidance on fetching Provenance for patient data.
2) Medication List Guidance for fetching a patient medications
3) Recasting the US Core Device profile into a US Core Implantable Device Profile
4) A US Core spO2 by US Core Pulse Oximetry Profile
5) Updated search to support requiring search by multiple statuses
6) Guidance when the source has no data
7) General guidelines and considerations for DSTU2 to R4 Conversion
8) Guidance for language support
9) Considerations for fetching data for multiple patients]
10) Future considerations for times offset and timezone guidelines
11) Future Considerations for writing and updating data
12) Update security pageto reflect current testing.
13) Clarify definition of MustSupport to reflect the intent that the server must be able to populate a MustSupport element in order to claim conformance to the profile.
14) Expanding bindings for Procedure and Condition codes for quality measures and other purposes.
These sections as well as several other clarifications, corrections and technical changes that are listed in the sections below have been reviewed and voted on by the members of the [HL7 International Structured Documents WorkGroup](http://www.hl7.org/Special/committees/structure/index.cfm) who is sponsoring this STU Update comment period and reconciliation of the comments.


---

### Version = 3.0.1
- Publication Date: 2019-09-01
- url: <http://hl7.org/fhir/us/core/2019Sep>
- Based on FHIR version : 4.0.0


#### Changes:
 In order meet the proposed ONC U.S. Core Data for Interoperability (USCDI) regulatory requirements for access to patient data, this STU Update for Comment Version of the US Core Implementation Guide has added new content. The Argonaut Project Team has spent the last several months reviewing, testing and providing invaluable feedback on these and other topics including most notably:
1) A US Core Provenance Profile and guidance on fetching Provenance for patient data.
2) Guidance on fetching a patient's medications
3) A US Core spO2 by Pulse Oximetry profile
4) Recasting the US Core Device profile into a US Core Implantable Device profile
5) Making server search requirements less opaque and requiring search by multiple statuses.
6) Guidance when the source has no data
7) General guidelines and considerations for DSTU2 to R4 Conversion
8) Guidance for language support
9) Considerations for Fetching data for multiple patients
10) Future considerations for times offset and timezone guidelines
These sections as well as several other clarifications, corrections and technical changes that are listed in the sections below have been reviewed and voted on by the members of the HL7 International Structured Documents WorkGroup who is sponsoring this STU Update comment period and reconciliation of the comments.

---

### Version = 3.0.0
- Publication Date: 2019-06-15
- url: <http://hl7.org/fhir/us/core/STU3>
- Based on FHIR version : 4.0.0


#### Changes:
 FHIR R4 version of US Core which added profiles for exchanging Clinical Notes, expanded search expectations, and updated guidance as a results of comments from balloters.

---

### Version = 2.1.0
- Publication Date: 2018-12-04
- url: <http://hl7.org/fhir/us/core/2019Jan>
- Based on FHIR version : 4.0.0


#### Changes:
 STU 3 Ballot #1. First ballot on FHIR R4.

---

### Version = 2.0.0
- Publication Date: 2018-12-04
- url: <http://hl7.org/fhir/us/core/STU2>
- Based on FHIR version : 3.0.1


#### Changes:
 Publication added the following profiles:
1)US Core DocumentReference Profile
2)US Core Encounter Profile
3)US Core PractitionerRole Profile


---

### Version = 1.1.0
- Publication Date: 2017-12-20
- url: <http://hl7.org/fhir/us/core/2108Jan>
- Based on FHIR version : 3.0.1


#### Changes:
 STU2 Ballot

---

### Version = 1.0.1
- Publication Date: 2017-11-02
- url: <http://hl7.org/fhir/us/core/1.0.1>
- Based on FHIR version : 3.0.1


#### Changes:
 This version corrects technical errata from the original publication and for FHIR R3.

---

### Version = 1.0.0
- Publication Date: 2017-03-21
- url: <http://hl7.org/fhir/us/core/STU1>
- Based on FHIR version : 3.0.1


#### Changes:
 The first official published version of this IG published immediately following the release of FHIR STU3

---

### Version = 0.0.0
- Publication Date: 2017-12-06
- url: <http://hl7.org/fhir/us/core/2017Jan>
- Based on FHIR version : 1.8.0


#### Changes:
 STU1 Ballot

---

{% include link-list.md %}