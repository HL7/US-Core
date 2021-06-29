
#  Welcome to the US Core Implementation Guide Repository

**US Core Implementation Guide (FHIR IG) [Publication (Version) History](http://hl7.org/fhir/us/core/history.html)**

Authors:  Eric Haas, Brett Marquard

### Version 4.0.0 STU4 Changes:

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

  <table class='grid'>
  <thead>
  <tr class='header'>
  <th>US Core Value Set</th>
  <th>VSAC Value Set</th>
  <th>VSAC OID</th>
  <th>extensional?</th>
  </tr>
  </thead>
  <tbody>
  <tr class='odd'>
  <td>Detailed ethnicity</td>
  <td>Detailed Ethnicity</td>
  <td>2.16.840.1.114222.4.11.877</td>
  <td>No</td>
  </tr>
  <tr class='odd'>
  <td>OMB Ethnicity Categories</td>
  <td>Ethnicity</td>
  <td>2.16.840.1.114222.4.11.837</td>
  <td>Yes</td>
  </tr>
  <tr class='even'>
  <td>US Core CareTeam Provider Roles</td>
  <td>Care Team Member Function</td>
  <td>2.16.840.1.113762.1.4.1099.30</td>
  <td>Yes</td>
  </tr>
  <tr class='odd'>
  <td>US Core Medication Codes (RxNorm)</td>
  <td>Medication Clinical Drug</td>
  <td>2.16.840.1.113762.1.4.1010.4</td>
  <td>Yes</td>
  </tr>
  <tr class='even'>
  <td>US Core Provider Specialty (NUCC)</td>
  <td>Healthcare Provider Taxonomy</td>
  <td>2.16.840.1.114222.4.11.1066</td>
  <td>No</td>
  </tr>
  <tr class='odd'>
  <td>US Core Smoking Status</td>
  <td>Smoking Status</td>
  <td>2.16.840.1.113883.11.20.9.38</td>
  <td>Yes</td>
  </tr>
  <tr class='even'>
  <td>US Core Vaccine Administered Value Set (CVX)</td>
  <td>CVX Vaccines Administered Vaccine Set</td>
  <td>2.16.840.1.113762.1.4.1010.6</td>
  <td>Yes</td>
  </tr>
  <tr class='odd'>
  <td>US Core Common substances for allergy and intolerance documentation including refutations</td>
  <td>Common substances for allergy and intolerance documentation including refutations</td>
  <td>2.16.840.1.113762.1.4.1186.8</td>
  <td>No</td>
  </tr>
  </tbody>
  </table>

4. Migrating to the standard set of HL7 FHIR IG templates for publishing.  Although we strove to minimize the differences between this version and the previous versions of US Core, these changes are notable:
   - Additional Features include:
        - Addition of vocabulary and constraint tables to the profile pages
        - Addition of a summary table and to the profile page introduction
        - Addition of \"Snapshot Table (Must Support)\" Tab to profile views
   - Due to restrictions on customizable content, the full narrative text summaries of profiles is no longer available.

5. Addressing over 90 January 2021 Ballot related trackers resulting in the followed detailed changes.

Listed below are the resolved trackers for this version:

**Status**: **Summary**:(**Jira Issue**) **Link to Change**
1. **Applied**:Update PractitionerRole.practitioner to )..1 MS ([FHIR-29681](https://jira.hl7.org/browse/FHIR-29681)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/StructureDefinition-us-core-practitionerrole.html#profile)
1. **Applied**:Change CareTeam `status` search parameter compositeOR expectation to SHOULD ([FHIR-29768](https://jira.hl7.org/browse/FHIR-29768)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/SearchParameter-us-core-careteam-status.html)
1. **Applied**:Provide guidance on the population of narrative ([FHIR-29777](https://jira.hl7.org/browse/FHIR-29777)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/general-guidance.html#narrative)
1. **Applied**: Change $docref start and end input parameter types from `date` to `dateTime` ([FHIR-29825](https://jira.hl7.org/browse/FHIR-29825)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/OperationDefinition-docref.html)
1. **Applied**: The history file markdown rendering of the table ([FHIR-30100](https://jira.hl7.org/browse/FHIR-30100)) [See Change Here](http://hl7.org/fhir/us/core/history.html)
1. **Applied**:footnote rendering - pre-applied ([FHIR-30101](https://jira.hl7.org/browse/FHIR-30101)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/general-guidance.html#guidance-on-limiting-the-number-of-search-results)
1. **Applied**:Random Section Numbering (Reminder for tooling issue) ([FHIR-30102](https://jira.hl7.org/browse/FHIR-30102)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/toc.html)
1. **Applied**:Move section 1.5 US Core Conformance Requirements ([FHIR-30103](https://jira.hl7.org/browse/FHIR-30103)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/conformance-expectations.html)
1. **Applied**:Make custodian optional on document reference ([FHIR-30108](https://jira.hl7.org/browse/FHIR-30108)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/StructureDefinition-us-core-documentreference.html)
1. **Applied**:Remove required binding on procedure and condition ([FHIR-30109](https://jira.hl7.org/browse/FHIR-30109)) See Changes:
   - [Here](https://build.fhir.org/ig/HL7/US-Core/conformance-expectations.html#extensible-binding-for-codeableconcept-datatype)
   - [Here](https://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-condition.html#profile)
   - [Here](https://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-procedure.html#profile)
1. **Applied**:Update DocumentReference CCD operation ([FHIR-30110](https://jira.hl7.org/browse/FHIR-30110)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/OperationDefinition-docref.html)
1. **Applied**:Update DocumentReference MustSupport to choice of data or url ([FHIR-30111](https://jira.hl7.org/browse/FHIR-30111)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/StructureDefinition-us-core-documentreference.html#mandatory-and-must-support-data-elements)
1. **Applied**:Reference to 3 new document types - addressing corresponding metadat ([FHIR-30112](https://jira.hl7.org/browse/FHIR-30112)) [See Change Here](https://build.fhir.org/ig/HL7/US-Core/clinical-notes-guidance.html#clinical-notes) AND [See Change Here](https://build.fhir.org/ig/HL7/US-Core/clinical-notes-guidance.html#support-requirements)
1. **Applied**:Typo ([FHIR-30113](https://jira.hl7.org/browse/FHIR-30113))
1. **Applied**:Clarify Must Support of Complex elements ([FHIR-30321](https://jira.hl7.org/browse/FHIR-30321)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/conformance-expectations.html#must-support---complex-elements)
1. **Applied**:Clarify that VSAC FHIR API only retrieves a definition ([FHIR-30344](https://jira.hl7.org/browse/FHIR-30344)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/terminology.html#using-value-set-authority-center-vsac)
1. **Applied**:Allergy Intolerance example for UNKNOWN allergy status does not use unknown ([FHIR-30345](https://jira.hl7.org/browse/FHIR-30345)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/StructureDefinition-us-core-allergyintolerance.html#mandatory-and-must-support-data-elements)
1. **Applied**:Corrected allergy intolerance example SNOMED CT code ([FHIR-30346](https://jira.hl7.org/browse/FHIR-30346)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/AllergyIntolerance-example.html)
1. **Applied**:Allergy codes updated to snomed product hierarchy in VSAC([FHIR-30347](https://jira.hl7.org/browse/FHIR-30347)) [See Change Here](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1186.8/expansion)
1. **Applied**:Clarify plans to align with Gender Harmony([FHIR-30350](https://jira.hl7.org/browse/FHIR-30350)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/StructureDefinition-us-core-patient.html#mandatory-and-must-support-data-elements)
1. **Applied**:Typos on Conformance Expectations Page ([FHIR-30353](https://jira.hl7.org/browse/FHIR-30353)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/conformance-expectations.html)
1. **Applied**:clarify use of additional codings ([FHIR-30354](https://jira.hl7.org/browse/FHIR-30354)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/StructureDefinition-us-core-vital-signs.html#mandatory-and-must-support-data-elements)
1. **Applied**:Clarify server requirements for Choice of Profile Elements scenario ([FHIR-30355](https://jira.hl7.org/browse/FHIR-30355)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/conformance-expectations.html#must-support---choice-of-profile-elements)
1. **Applied**:Add all options to Procedure.performed[x] ([FHIR-30391](https://jira.hl7.org/browse/FHIR-30391)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/StructureDefinition-us-core-procedure.html#profile)
1. **Applied**:Updated MedicationRequest.authoredOn from mandatory to must support([FHIR-30430](https://jira.hl7.org/browse/FHIR-30430)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/StructureDefinition-us-core-medicationrequest.html#mandatory-and-must-support-data-elements)
1. **Applied**:Typo ([FHIR-30460](https://jira.hl7.org/browse/FHIR-30460)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/StructureDefinition-us-core-vital-signs.html#mandatory-and-must-support-data-elements)
1. **Applied**: Update Encounter Type CPT Description ([FHIR-30470](https://jira.hl7.org/browse/FHIR-30470)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/ValueSet-us-core-encounter-type.html)
1. **Applied**: Clarify Missing Data language for coded data elements with required binding strength ([FHIR-30630](https://jira.hl7.org/browse/FHIR-30630)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/general-guidance.html#missing-data)
1. **Applied**:Note re language codes([FHIR-30654](https://jira.hl7.org/browse/FHIR-30654)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/ValueSet-simple-language.html#notes)
1. **Applied**:Change URL for Healthcare Common Procedure Coding System (HCPCS) level II alphanumeric codes([FHIR-30655](https://jira.hl7.org/browse/FHIR-30655)) See Changes [Here](http://hl7.org/fhir/us/core/STU4.0.0/terminology.html#using-value-set-authority-center-vsac) and [Here](http://hl7.org/fhir/us/core/ValueSet/us-core-procedure-code)
1. **Applied**:Typo ([FHIR-30656](https://jira.hl7.org/browse/FHIR-30656))
1. **Applied**: Explain the relationship between US CORE and an evolving USCDI. ([FHIR-30657](https://jira.hl7.org/browse/FHIR-30657)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/index.html)
1. **Applied**:Correct 2 bullet points in section 1.2. ([FHIR-30658](https://jira.hl7.org/browse/FHIR-30658)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/index.html)
1. **Applied**:Clarify actors ([FHIR-30659](https://jira.hl7.org/browse/FHIR-30659)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/index.html#us-core-actors)
1. **Applied**:Edit basic provenance ([FHIR-30660](https://jira.hl7.org/browse/FHIR-30660)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/basic-provenance.html#clinical-information-reconciliation-and-incorporation)
1. **Applied**:Clarify the duplication requirement for scanned documents in DocumentReference and DiagnosticReport. ([FHIR-30662](https://jira.hl7.org/browse/FHIR-30662)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/clinical-notes-guidance.html#fhir-resources-to-exchange-clinical-notes)
1. **Applied**:Clarify that clients should retain data visualization between DSTU2 to R4 upgrades. ([FHIR-30665](https://jira.hl7.org/browse/FHIR-30665)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/DSTU2-to-R4-conversion.html#expectation-that-dstu2-data-is-preserved-in-r4)
1. **Applied**:Add provenance to writing/updating guidance? ([FHIR-30666](https://jira.hl7.org/browse/FHIR-30666)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/future-of-US-core.html)
1. **Applied**:Clarify Code System section and update codesystem table ([FHIR-30667](https://jira.hl7.org/browse/FHIR-30667)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/terminology.html#code-systems)
1. **Applied**: Clarify guidance on implantable medical devices. ([FHIR-30669](https://jira.hl7.org/browse/FHIR-30669)) [[See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/StructureDefinition-us-core-implantable-device.html#mandatory-and-must-support-data-elements)
1. **Applied**: Make udi_HRF a *Must Support* element. ([FHIR-30670](https://jira.hl7.org/browse/FHIR-30670)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/StructureDefinition-us-core-implantable-device.html#mandatory-and-must-support-data-elements)
1. **Applied**: Clarify UDI information. ([FHIR-30672](https://jira.hl7.org/browse/FHIR-30672)) See Changes:
    - [Here](http://hl7.org/fhir/us/core/STU4.0.0/StructureDefinition-us-core-implantable-device.html#mandatory-and-must-support-data-elements)
    - [Here](http://hl7.org/fhir/us/core/STU4.0.0/StructureDefinition-us-core-implantable-device.html#profile)
1. **Applied**:Clarify text ([FHIR-30673](https://jira.hl7.org/browse/FHIR-30673)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/conformance-expectations.html#conformance-expectations)
1. **Applied**:Typos ([FHIR-30674](https://jira.hl7.org/browse/FHIR-30674))
1. **Applied**:Clarify prohibition on using contained resources. ([FHIR-30677](https://jira.hl7.org/browse/FHIR-30677)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/general-guidance.html#contained-resources)
1. **Applied**:Add guidance on suppressed data. ([FHIR-30678](https://jira.hl7.org/browse/FHIR-30678)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/general-guidance.html#suppressed-data)
1. **Applied**:Clarify what is meant by \"support the other elements.\" ([FHIR-30680](https://jira.hl7.org/browse/FHIR-30680)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/conformance-expectations.html#must-support---choice-of-data-types)
1. **Applied**:Typo([FHIR-30681](https://jira.hl7.org/browse/FHIR-30681))
1. **Applied**:Fix typos ([FHIR-30683](https://jira.hl7.org/browse/FHIR-30683)) Various Changes
1. **Applied**:Update on Guidance on DataAbsentReason for Observations ([FHIR-30685](https://jira.hl7.org/browse/FHIR-30685)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/StructureDefinition-us-core-observation-lab.html#mandatory-and-must-support-data-elements)
1. **Applied**:Clarify use of qualifier LOINCs ([FHIR-30690](https://jira.hl7.org/browse/FHIR-30690)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/StructureDefinition-us-core-vital-signs.html#mandatory-and-must-support-data-elements)
1. **Applied**: Fix Typo ([FHIR-30695](https://jira.hl7.org/browse/FHIR-30695)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/StructureDefinition-us-core-immunization-definitions.html)
1. **Applied**: Update on Guidance on DataAbsentReason for Observations ([FHIR-30699](https://jira.hl7.org/browse/FHIR-30699)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/StructureDefinition-us-core-observation-lab.html#mandatory-and-must-support-data-elements)
1. **Applied**: Clarify what is intended with \"additional  observations\"([FHIR-30772](https://jira.hl7.org/browse/FHIR-30772)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/StructureDefinition-us-core-vital-signs.html#mandatory-and-must-support-data-elements)
1. **Applied**: Add statement about clinical safety to the security page ([FHIR-30776](https://jira.hl7.org/browse/FHIR-30776)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/security.html)
1. **Applied**: Added clarification to vitals profile regarding use of additional codings and component observations. ([FHIR-30778](https://jira.hl7.org/browse/FHIR-30778)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/StructureDefinition-us-core-blood-pressure.html#mandatory-and-must-support-data-elements)
1. **Applied**: Typo grammar. All codes SHALL have an system value.  Correction “a value system”. ([FHIR-30782](https://jira.hl7.org/browse/FHIR-30782)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/StructureDefinition-us-core-vital-signs.html#mandatory-and-must-support-data-elements)
1. **Applied**: Clarify resource search requirements CapabilityStatements and provide guidance on search for multiple patients using Bulk data ([FHIR-30787](https://jira.hl7.org/browse/FHIR-30787)) See Changes:
   - [Here](http://hl7.org/fhir/us/core/STU4.0.0/general-guidance.html#searching-multiple-patients)
   - [Here](http://hl7.org/fhir/us/core/STU4.0.0/CapabilityStatement-us-core-server.html#condition)
1. **Applied**: Add MedicationAdministration to the Future Page. ([FHIR-30788](https://jira.hl7.org/browse/FHIR-30788)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/future-of-US-core.html#future-candidate-requirements-under-consideration)
1. **Applied**: Fix text in $docref description ([FHIR-30810](https://jira.hl7.org/browse/FHIR-30810)) [See Change Here](https://build.fhir.org/ig/HL7/US-Core/OperationDefinition-docref.html)
1. **Applied**: Mandate that CapabilityStatement.instantiates refer to US Core ([FHIR-30889](https://jira.hl7.org/browse/FHIR-30889)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/CapabilityStatement-us-core-server.html#shall_css)
1. **Applied**: Add binding so Vitals will render it in differential view ([FHIR-31391](https://jira.hl7.org/browse/FHIR-31391)) [See Change Here](http://hl7.org/fhir/us/core/2021JAN/StructureDefinition-us-core-vital-signs.html#profile)
1. **Applied**: Update to URI from OID for CDT in Procedure Code ValueSet ([FHIR-31556](https://jira.hl7.org/browse/FHIR-31556)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/ValueSet-us-core-procedure-code.html)
1. **Applied**: Add DocumentReference.content is under \"must have\" list ([FHIR-31364](https://jira.hl7.org/browse/FHIR-31364)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/StructureDefinition-us-core-documentreference.html#mandatory-and-must-support-data-elements)
1. **Applied**: Update Must Support Bullet regarding missing data ([FHIR-31507](https://jira.hl7.org/browse/FHIR-31507)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/conformance-expectations.html#must-support-elements)
1. **Applied**: Update use context for Race and Ethnicity extensions ([FHIR-31008](https://jira.hl7.org/browse/FHIR-31008)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/StructureDefinition-us-core-race.html)
1. **Applied**: Add guidance on \"POST based search\"  ([FHIR-31585](https://jira.hl7.org/browse/FHIR-31585)) See Changes:
   - [Here](http://hl7.org/fhir/us/core/STU4.0.0/general-guidance.html#search-syntax)
   - [Here](http://hl7.org/fhir/us/core/STU4.0.0/CapabilityStatement-us-core-server.html#behavior)
1. **Applied**: Add reference to Mapping from LOINC scale type to FHIR data type ([FHIR-31084](https://jira.hl7.org/browse/FHIR-31084)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/StructureDefinition-us-core-observation-lab.html#mandatory-and-must-support-data-elements)
1. **Applied**: Update Observation.value[x] definition ([FHIR-31083](https://jira.hl7.org/browse/FHIR-31083)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/StructureDefinition-us-core-observation-lab-definitions.html#Observation.value[x])
1. **Applied**: Add LOINC to procedure codes ([FHIR-31514](https://jira.hl7.org/browse/FHIR-31514)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/ValueSet-us-core-procedure-code.html)
1. **Applied**: Make PractitionerRole.organization must support and add invariant ([FHIR-29680](https://jira.hl7.org/browse/FHIR-29680)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/StructureDefinition-us-core-practitionerrole.html)
1. **Applied**: Fix FHIRPath constraint for provenance-1([FHIR-31020](https://jira.hl7.org/browse/FHIR-31020)) [See Change Here](https://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-provenance.html)
1. **Applied**: Add guidance to BMI Profile([FHIR-32658](https://jira.hl7.org/browse/FHIR-32658)) [See Change Here](https://build.fhir.org/ig/HL7/StructureDefinition-us-core-bmi.html)
1. **Applied**: Write usage note for non-vaccination CVX codes([FHIR-31899](https://jira.hl7.org/browse/FHIR-31899)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/StructureDefinition-us-core-immunization.html#mandatory-and-must-support-data-elements)
1. **Applied**: Clarify that Extensible binding can always provide a mapped code([FHIR-32010](https://jira.hl7.org/browse/FHIR-32010)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/conformance-expectations.html#extensible-binding-for-codeableconcept-datatype)
1. **Applied**: Clarify RESTFul requirements([FHIR-31490](https://jira.hl7.org/browse/FHIR-31490)) See Changes:
   - [Here](http://hl7.org/fhir/us/core/STU4.0.0/index.html#introduction)
   - [Here](http://hl7.org/fhir/us/core/STU4.0.0/index.html#how-to-read-this-guide)
   - [Here](http://hl7.org/fhir/us/core/STU4.0.0/conformance-expectations.html#conformance-expectations)
   - [Here](http://hl7.org/fhir/us/core/STU4.0.0/StructureDefinition-us-core-allergyintolerance.html#notes)
1. **Applied**: fix Procedure Example error ([FHIR-30106](https://jira.hl7.org/browse/FHIR-30106)) [See Change Here](http://hl7.org/fhir/us/core/STU4.0.0/Procedure-rehab.html)

**Known issues:**

We're working to fix these issues that may come up when using US CORE.  We will correct them in a future version of the guide

Publishing

- [ ] **Resolved - change required**:Confusing for commercial vendor.  Reads very confusing. ([FHIR-30783](https://jira.hl7.org/browse/FHIR-30783)) proposal is to make the differential tab the default view, see publishing plans [here](https://github.com/HL7/ig-template-base/issues/161)  timeline unknown.
- [ ] **Resolved - change required**:In most of the data elements – “Binding is from base FHIR and US Core Vital Signs”  Need this to be one single combined listing ([FHIR-30780](https://jira.hl7.org/browse/FHIR-30780)) proposal is to limit the terminology and invariants to view shown. see [Zulip chat](https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/Different.20views.20for.20tables.20and.20invariants) timeline unknown.
- [ ] **Resolved - change required**:Why are there separate codes for USCoreVitalSigns and the Systolic.value and the diastolic value? ([FHIR-30779](https://jira.hl7.org/browse/FHIR-30779)) proposal is to work with publishing to \"clean up\" terminology and invariants to view shown. see: see [Zulip chat](https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/Different.20views.20for.20tables.20and.20invariants) timeline unknown.

Terminology

- [ ] **Resolved - change required**: valueset-simple-language.xml QA error \"Error from server: Language valuesets cannot be expanded as they are based on a grammar\" ([FHIR-30107](https://jira.hl7.org/browse/FHIR-30107)) this error is still extant from prior version of US Core and has yet to be resolved. Work with publishing to fix and created [STU note](http://hl7.org/fhir/us/core/STU4.0.0/ValueSet-simple-language.html#notes). see [Zulip chat](https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/language.20valueset.20expansion.20error)
- [ ] **Resolved - change required**: Patient Examples QA Errors: CDCREC code system in VSAC Patient ([FHIR-30105](https://jira.hl7.org/browse/FHIR-30105)) CDCREC codes and code system value not aligned with VSAC. Workaround is to publish the [CDCREC code system and valuesets in USCore](http://hl7.org/fhir/us/core/STU4.0.0/terminology.html) until this content is moved to [HL7 Terminology](https://terminology.hl7.org/) Add an STU Note. [Zulip chat1](https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/cdcrec.20code.20errors.20in.20US.20Core) and [Zulip chat2](https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/Race.20Code.20System) and [Zulip chat3](https://chat.fhir.org/#narrow/stream/179202-terminology/topic/US.20CDCREC.20codessystems.20in.20HTA)
- [ ] **Resolved - change required**:imm-1.json NDC/CVX codes QA Error ([FHIR-30104](https://jira.hl7.org/browse/FHIR-30104)) Work with terminology server team to correct. see [Zulip chat](https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/CVX.20and.20NDC.20warnings.20in.20US.20Core)
- [ ] **Resolved - change required**:Pulse Ox Example: observation-satO2-fiO2 ([FHIR-27845](https://jira.hl7.org/browse/FHIR-27845)) Proposed Jira ticket to resolve in base made an [STU note](http://hl7.org/fhir/us/core/STU4.0.0/StructureDefinition-us-core-pulse-oximetry.html#mandatory-and-must-support-data-elements) that is technically not conformant with the base FHIR vital profile. See [Zulip chat](https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/US.20Core.20QA.20Issue.20.233-.20nasty.20profiling.20error)

GitHub will automatically trigger a new build whenever you commit changes.

*Note: a build takes 2-3 minutes to complete. You should see a notification at https://chat.fhir.org/#narrow/stream/179297-committers.2Fnotification.
*

### Find your rendered IG automatically available at

https://build.fhir.org/ig/HL7/US-Core/

### For a build log see

http://build.fhir.org/ig/HL7/US-Core/branches/master/qa.html

---
