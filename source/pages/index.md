---
title: Implementation Guide HomePage
layout: default
---

{:.no_toc}

<!-- TOC  the css styling for this is \pages\assets\css\project.css under 'markdown-toc'-->

* Do not remove this line (it will not be displayed)
{:toc}


<!-- end TOC -->

<div class="note-to-balloters" markdown="1">

**STU Update Comment Review**

Any and all comments for this STU Update comment review must be logged as new [GForge Tracker](http://hl7.org/fhir-issues) items under the *Specification* "US Core" and *Ballot* "STU3 Update" (?need to work these details out with Lloyd and Austin?).  **All content that is open to review are highlighted in pink and marked with the text "Open for STU Comment" as demonstrated here. Any comments outside of these boundaries will be dispositioned as "Not Related" for this STU Comment period.**

In order meet the proposed ONC [U.S. Core Data for Interoperability (USCDI)] regulatory requirements for access to patient data, this STU Update of the US Core Implementation Guide has added new content. [The Argonaut Project Team](https://argonautwiki.hl7.org/Argonaut_2019_Projects#Argonaut_R4) has spent the last several months reviewing, testing and providing invaluable feedback on these and other topics including most notably:

- A US Core Provenance Profile and guidance on fetching Provenance for patient data.
- Guidance on fetching a patient's medications
- A US Core spO2 by Pulse Oximetry profile
- Recasting the US Core Device profile into a US Core Implantable Device profile
- Making server search requirements less opaque and requiring search ny multiple statuses.
- Guidance when the source has no data
- General guidelines and considerations for DSTU2 to R4 Conversion
- Guidance for language support
- Considerations for Fetching data for multiple patients
- Future considerations for times offset and timezone guidelines

These sections as well as several other clarifications, corrections and technical changes that are listed in the sections below have been reviewed and voted on by the members of the [HL7 International Structured Documents WorkGroup](http://www.hl7.org/Special/committees/structure/index.cfm) who is sponsoring this STU Update comment period and reconciliation of the comments.

The following pages, page sections are open to review and comment for this US Core Implementation Guide (v3.0.1: STU3) STU Update:
- 2.1.1.5 [Missing Data](general-guidance.html#missing-data) (GF#22276 update guidance on when source has no data)
- 2.1.1.8 [Language Support](general-guidance.html#language-support) (GF#22753 Add language support guidance )
- 2.1.1.12 [Search for Servers Requiring Status](general-guidance.html#search-for-servers-requiring-status) (GF#22754 Provide guidance on Search filters and hidden default values by EHRs)
- 2.1.1.13 [Searching multiple patients](general-guidance.html#searching-multiple-patients)
-  2.3 - [Medication List Guidance](all-meds.html) (GF#22751 Add med list guidance and update MedRequest profile to support med list)
-  2.4 - [Basic Provenance](basic-provenance.html)
-  2.5 - [DSTU2 to R4 Conversion](r2-r4-guidance.html) (GF#22755 Add R2 to R4 conversion and guidance)
- 2.6.1.1.3 [Candidates under consideration](future-of-us-core.html#candidates-under-consideration) (GF#20571 Add a Coverage Profile to US Core to Support Interactions with Payers,)
- 3.8 - [StructureDefinition US Core Provenance](StructureDefinition-us-core-provenance.html)
- 3.12 - [StructureDefinition US Core Pulse Oximetry](StructureDefinition-us-core-pulse-oximetry.html)
- 3.23.1.1 - [StructureDefinition-us-core-organization](StructureDefinition-us-core-organization.html#mandatory-and-must-support-data-elements)  (GF#22771 Update Organization requirements to support more than just provider directory)
- 3.28.1.1 - [StructureDefinition-us-core-medicationrequest](StructureDefinition-us-core-medicationrequest.html#mandatory-and-must-support-data-elements) (GF#22751 Add med list guidance and update MedRequest profile to support med list)
- 3.28.1.4 - [MedicationRequest Quick Start](StructureDefinition-us-core-medicationrequest.html#quick-start) (GF#22751 Add med list guidance and update MedRequest profile to support med list)
- 3.29 - [StructureDefinition US Core Implantable Device](StructureDefinition-us-core-implantable-device.html)


The following pages and section have be removed (Links to US Core Implementation Guide (v3.0.0: STU3)):

- [US Core MedicationStatement Profile and SearchParameters](http://hl7.org/fhir/us/core/STU3/StructureDefinition-us-core-medicationstatement.html) (GF#22751 Add med list guidance and update MedRequest profile to support med list)
- [Extensible + Max-ValueSet binding for CodeableConcept Datatype](http://hl7.org/fhir/us/core/STU3/general-guidance.html#max-binding)
- [Syntax for searches limited by patient](http://hl7.org/fhir/us/core/STU3/general-guidance.html#syntax-for-searches-limited-by-patient) (GF#22750 Remove extra patient search syntax from US Core)

Other technical Corrections that cannot be highlighted since they are embeded in the JSON and XML Representations.
- Added conformance expectation of SHALL for the`multipleOR` SearchParameter element for all status parameters.  An example of this can be seen [here](SearchParameter-us-core-careplan-status.html). (GF#22756 Add SHALL support multipleOR on Statuses)
- Converted fixed values to patterns for US Core CarePlan Profile, US Core Pediatric Weight for Height Observation Profile, US Core Pediatric BMI for Age Observation Profile, US Core Practitioner Profile and US Core Organization Profile, and US Core Pulse Oximetry Profile (GF#22772 change careplan slice disciminator from pattern to slice for easier reading in diff)
-Update US Core DocumentReference.identifier from 0..1 to 0..* ()*
</div>

### Introduction

The US Core Implementation Guide is based on [FHIR Version R4] and defines the minimum conformance requirements for accessing patient data. The [Argonaut] pilot implementations, ONC [2015 Edition Common Clinical Data Set (CCDS)], and the latest proposed ONC [U.S. Core Data for Interoperability (USCDI)] provided the requirements for this guide.  The prior Argonaut search and vocabulary requirements, based on FHIR DSTU2, are updated in this guide to support FHIR Version R4. This guide was used as the basis for further testing and guidance by the Argonaut Project Team to provide additional content and guidance specific to Data Query Access for purpose of ONC Certification testing. These profiles are the foundation for future US Realm FHIR implementation guides. In addition to Argonaut, they are used by [DAF-Research], [QI-Core], and [CIMI].  Under the guidance of HL7 and the HL7 US Realm Steering Committee, the content will expand in future versions to meet the needs specific to the US Realm.

These requirements were originally developed, balloted, and published in FHIR DSTU2 as part of the [Office of the National Coordinator for Health Information Technology (ONC)] sponsored [Data Access Framework] (DAF) project. For more information on how DAF became US Core see the [US Core change notes](change-notes.html).

### How to read this Guide

This Guide is divided into several pages which are listed at the top of each page in the menu bar.

- [Home]\: The home page provides the introduction and background for {{site.title}}.
- [Guidance]\: These pages provides overall guidance in using the profiles and transactions defined in this guide.
  - [General Guidance] provides guidance, definitions and requirements common to all {{site.title}} actors used in this guide..
  - [Clinical Notes Guidance] gives guidance on the interactions between Consumers and Producers of clinical notes.
  - [Medication List Guidance] gives guidance on how a patient or provider can access a patients medications.
  - [Basic Provenance] provides implementers with important definitions to create and share the Provenance Resource.
  - [DSTU2 to R4 Conversion] considers the user and developer experience when transitioning from DSTU2 to R4.
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

The [Capability Statements Section](capstatements.html) outlines conformance requirements and expectations for the US Core Servers and Client applications, identifying the specific profiles and RESTful transactions that need to be supported. Note that the individual US Core profiles identify the structural constraints, terminology bindings and invariants.  Similarly, the individual US Core SearchParameter and Operation resources specify how they are understood by the server. However, implementers must refer to the CapabilityStatement for details on the RESTful transactions, specific profiles and the search parameters applicable to each of the US Core actors.

----


Primary Authors: Brett Marquard, Eric Haas

Secondary Authors: Grahame Grieve, Nagesh Bashyam

{% include link-list.md %}
