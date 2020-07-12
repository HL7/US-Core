---
title: Implementation Guide HomePage
layout: default
---

{:.no_toc}

<!-- TOC  the css styling for this is \pages\assets\css\project.css under 'markdown-toc'-->

* Do not remove this line (it will not be displayed)
{:toc}


<!-- end TOC -->

<div markdown='1' class="highlight-note">
### Temporary Change Notes For Review of Applied Trackers

This update addresses several technical corrections and errata and clarifications are listed in the sections below. They have been reviewed
and voted on by the members of the [HL7 International Cross-Group Projects WorkGroup](http://www.hl7.org/Special/committees/cgp/index.cfm) who is sponsoring this errata release and reconciliation of the comments.:

1. Added example of US Core Direct Extension to [Practitioner Example](Practitioner-practitioner-2.html) (FHIR-27947)

1. Corrected technical errors in [pediatric profiles StructureDefinitions](profiles.html#profiles) (FHIR-27946)

1. Corrected errors in [DiagnosticReport Cardiology Example](DiagnosticReport-cardiology-report.html) (FHIR-27913)

1. Update [Federal Register link](ValueSet-omb-race-category.html) for OMB race and ethnicity category classifications. (FHIR-27907)

1. Clarified [token search syntax](general-guidance.html#search-syntax) (FHIR-27897).

1. Corrected [US Core DocumentReference Profile](StructureDefinition-us-core-documentreference-definitions.html#DocumentReference.content) to support multiple attachments (FHIR-25778).

1. Fix FHIRPath Expression in [USCoreGoalTargetDate](SearchParameter-us-core-goal-target-date.html) (FHIR-27892).

1. Fix FHIRPath Expression in [USCoreProcedureDate](SearchParameter-us-core-procedure-date.html)(FHIR-27887).

1. Add omitted ["ge" comparators to SearchParameters](SearchParameter-us-core-goal-target-date.html) (FHIR-27893).

1. [Remove Must Support References](general-guidance.html#referencing-us-core-profiles) to non US Core Profiles (FHIR-27876)

1. Add missing [reaction](StructureDefinition-us-core-allergyintolerance-definitions.html#AllergyIntolerance.reaction) to the US Core AllergyIntolerance Profile (FHIR-27867).

1. Clarify [reference to US Core Patient](StructureDefinition-pediatric-bmi-for-age.html#mandatory-and-must-support-data-elements) in Vitals Signs Profiles (FHIR-27857).

1. Corrected [US Core Pulse Oximetry Profile](StructureDefinition-us-core-pulse-oximetry.html#formal-views-of-profile-content) component.valueQuantity.code and component.valueQuantity.unit
min from 0 to 1 to be consistent with the valueQuantity constraints within US Core (FHIR-27846)

1. Correct UCUM Unit in [US Core Pulse Oximetry Profile Text Summary](StructureDefinition-us-core-pulse-oximetry.html#summary-of-the-must-support-requirements) (FHIR-27845)

1. Update [Procedure Codes Value Set](ValueSet-us-core-procedure-code.html) to include ICD-10 PCS codes (FHIR-27836)

1. Update [Procedure Codes Value Set](ValueSet-us-core-procedure-code.html) to include CDT codes (FHIR-27737)

1. Clarify that pediatric vital sign percentile Observations should [reference growth chart](/StructureDefinition-pediatric-bmi-for-age.html#mandatory-and-must-support-data-elements) (FHIR-27549),

1. Added Missing [US core Head Occipital-frontal Circumference Percentile Profile](StructureDefinition-head-occipital-frontal-circumference-percentile.html) (FHIR-27542).

1. Correct requirements for supporting [CLIA identifiers](StructureDefinition-us-core-organization.html#mandatory-and-must-support-data-elements) (FHIR-27158)

1. Change Description of [ICD-10-PCS Value Set](ValueSet-us-core-procedure-icd10pcs.html) (FHIR-27116)

1. Correct [AllergyIntolerance guidance](StructureDefinition-us-core-allergyintolerance.html#mandatory-and-must-support-data-elements) for verificationStatus (FHIR-27096)

1. REMOVE aleady fixed example [US Core heart-rate example](Observation-heart-rate.html) (FHIR-27086)

1. Update [smoking status ValueSet](ValueSet-us-core-observation-smokingstatus.html) (FHIR-27082).

1. Fix invariant [provenance-1](StructureDefinition-us-core-provenance-definitions.html#who) (FHIR-27065)

1. Fix invalid [json snippet](general-guidance.html#missing-data) (FHIR-27001)

1. Remove Provenance requirement from Medication, Location, Practitioner, PractitionerRole, and Organization in [CapabilityStatement](CapabilityStatement-us-core-server.html#resource--details) (FHIR-26840).

1. Correction on [USCDI Table](general-guidance.html#us-core-data-for-interoperability-and-2015-edition-common-clinical-data-set) change 'MedicationStatement' to 'MedicationRequest' (FHIR-26840).

1. Clarify that US Core Location/PractitionerRole are [not being referenced](StructureDefinition-us-core-encounter.html#mandatory-and-must-support-data-elements) by other resources (FHIR-26840).

1. Correct editing error restoring Write and Operation capability guidance into [DocumentReference QuickStart](StructureDefinition-us-core-documentreference.html#quick-start) (FHIR-26840).

1. Clarify [guidance](general-guidance.html#search-for-servers-requiring-status) that servers SHALL support search with status if status required (FHIR-26840).

1. Correct canonical url for ImplementationGuide (FHIR-26686).

1. Correct system URI for [ICD-10 procedure codes](ValueSet-us-core-procedure-icd10pcs.html) (FHIR-26679).

1. Fix invariant [us-core-1](StructureDefinition-us-core-condition-definitions.html#Condition) (FHIR-26605).

1. Change valueCode min from 0 to 1 for [US Core Birth Sex Extension](StructureDefinition-us-core-birthsex-definitions.html#Extension.valueCode) and valueBoolean min from 0 to 1 for[US Core Direct email Extension](StructureDefinition-us-core-direct-definitions.html#Extension.valueBoolean) (FHIR-26459).

1. Change valueQuantity min from 1 to 0 for [US Core Pediatric BMI for Age Observation Profile](StructureDefinition-pediatric-bmi-for-age-definitions.html#Observation.valueQuantity) and [US Core Pediatric Weight for Height Observation Profile](StructureDefinition-pediatric-weight-for-height-definitions.html#Observation.valueQuantity) (FHIR-26363).

1. Add page contents to [Clinical Notes](clinical-notes-guidance.html) and [Basic Provenance](basic-provenance.html) pages (FHIR-25785).

1. Fix duplicate URL causing validation failure. (FHIR-25536).

1. Fix Invariant [us-core-8](StructureDefinition-us-core-patient-definitions.html#Patient.name) (FHIR-25459).

1. Corrected the wording "should support" to "shall support" in [Clinical Notes Guidance](clinical-notes-guidance.html#clinical-notes) (FHIR-25455).

1. Fix Invariant [us-core-8](StructureDefinition-us-core-patient-definitions.html#Patient.name) to allow for Data Absent Reason Extension on Patient name.(FHIR-25249).

1. Fix Link to LOINC LP29708-2 (FHIR-25213).

1. Corrected [guidance](all-meds.html#fetching-all-medications-active-medications-and-all-medications-for-an-encounter) for conveying "Patient-Reported medications" (FHIR-25035).
</div>

### Introduction

The US Core Implementation Guide is based on [FHIR Version R4] and defines the minimum conformance requirements for accessing patient data. The [Argonaut] pilot implementations, ONC [2015 Edition Common Clinical Data Set (CCDS)], and the latest proposed ONC [U.S. Core Data for Interoperability (USCDI)] provided the requirements for this guide.  The prior Argonaut search and vocabulary requirements, based on FHIR DSTU2, are updated in this guide to support FHIR Version R4. This guide was used as the basis for further testing and guidance by the Argonaut Project Team to provide additional content and guidance specific to Data Query Access for purpose of ONC Certification testing. These profiles are the foundation for future US Realm FHIR implementation guides. In addition to Argonaut, they are used by [DAF-Research], [QI-Core], and [CIMI].  Under the guidance of HL7 and the HL7 US Realm Steering Committee, the content will expand in future versions to meet the needs specific to the US Realm.

These requirements were originally developed, balloted, and published in FHIR DSTU2 as part of the [Office of the National Coordinator for Health Information Technology (ONC)] sponsored [Data Access Framework] (DAF) project. For more information on how DAF became US Core see the [US Core change notes](change-notes.html).

### How to read this Guide

This Guide is divided into several pages which are listed at the top of each page in the menu bar.

- [Home]\: The home page provides the introduction and background for {{site.title}}.
- [Guidance]\: These pages provides overall guidance in using the profiles and transactions defined in this guide.
  - [General Guidance] provides guidance, definitions and requirements common to all {{site.title}} actors used in this guide.
  - [Clinical Notes Guidance] gives guidance on the interactions between Consumers and Producers of clinical notes.
  - [Medication List Guidance] gives guidance on how a patient or provider can access a patient's medications.
  - [Basic Provenance] provides implementers with important definitions to create and share the Provenance Resource.
  - [DSTU2 to R4 Conversion] considers the user and developer experience when transitioning from FHIR DSTU2 to FHIR R4.
  - [Future of US Core] outlines the approach to adding new content to {{site.title}}.
- [FHIR Artifacts]\: These pages provides detailed descriptions and formal definitions for all the FHIR objects defined in this guide.
  - [Profiles and Extensions]\: This page lists the set of Profile and Extension that are defined in this guide to exchange quality data. Each Profile page includes a narrative introduction, formal definition and a "Quick Start" guide to the supported search transaction for each {{site.title}} Profile.
  - [Search Parameters and Operations]\: This page lists the{{site.title}} defined Operations and Search Parameters that are used in US Core transactions.
  - [Terminology]\: This page lists the value sets and code system defined for {{site.title}} profiles.
  - [Capability Statements]\: This set of pages describes the expected FHIR capabilities of the various {{site.title}} actors.
- [Security]\: General security requirements and recommendations for {{site.title}} actors.
- [Examples]\: List of links to all the examples used in this guide.
- [Downloads]\: This page provides links to downloadable artifacts.



### US Core Actors

The following actors are part of the US Core IG:

* US Core Requestor: An application that initiates a data access request to retrieve patient data. This can be thought of as the client in a client-server interaction.
* US Core Responder: A product that responds to the data access request providing patient data. This can be thought of as the server in a client-server interaction.


### US Core Profiles

The list of US Core Profiles is shown below.  Each profile defines the minimum mandatory elements, extensions and terminology requirements that **MUST** be present. For each profile, requirements and guidance are given in a simple narrative summary. A formal hierarchical table that presents a [logical view] of the content in both a differential and snapshot view is also provided along with references to appropriate terminologies and examples.  For each US Core Profile, an overview of the required set of RESTful FHIR interactions - for example, search and read operations - is provided in the *Quick Start* Section of the profile page.

{% include list-simple-profiles.xhtml %}

- In addition US Core uses the [Vital Signs Profile] from the FHIR Specification.

See the General Guidance page for a [mapping] to the USCDI.

### US Core Conformance Requirements

The [Capability Statements] page outlines conformance requirements and expectations for the US Core Servers and Client applications, identifying the specific profiles and RESTful transactions that need to be supported. Note that the individual US Core profiles identify the structural constraints, terminology bindings and invariants.  Similarly, the individual US Core SearchParameter and Operation resources specify how they are understood by the server. However, implementers must refer to the CapabilityStatement for details on the RESTful transactions, specific profiles and the search parameters applicable to each of the US Core actors.

----


Primary Authors: Brett Marquard, Eric Haas

Secondary Authors: Grahame Grieve, Nagesh Bashyam

{% include link-list.md %}
