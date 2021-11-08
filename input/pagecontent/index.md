<div markdown="1" class="bg-info">

**punch list**:

- [ ] [Resolve Trackers](https://jira.hl7.org/secure/Dashboard.jspa?selectPageId=12001)
- [ ] Apply Trackers

for profile/element updates:
- [ ] update profile/create artifact
- [ ] optionally create ValueSet/Search parameter artifact (update and highlight new content in terminology page)
- [ ] update uscdi table here: input/includes/uscdi_table.md
- [ ] update intro here: input/intro-notes (highlight new content with new-content class)
- [ ] update notes/search - using python script (excel soure here:input/resources_spreadsheets) and upload here: input/intro-notes) (mark as new content in spreadsheet to highlight new content)
- [ ] optionally update SPs and SP page
- [ ] update Conformance - using python script (excel soure here:input/resources_spreadsheets) and upload here: input/resources * NOTE remember to update Cient spreadsheet from Server spreadsheet*
- [ ] update/create Examples - (highlight new content with new-content class)
- [ ] update change log

for narrative updates

- [ ] update Narrative
- [ ] optionally Update Narrative
- [ ] update change log

  - [ ] list open issues in package-list
- [ ] QA
     - [ ] review applied trackers
     - [ ] errors and warnings  (see above)
     - [ ] update ignoreWarnings.txt
     - [ ] update to latest ig publisher and review address any new validation checks
     - [ ] final read through
- [ ] remove all new content and green highlighted formatting
- [ ] update title and version to 5.0.0
- [ ] update package-list.json

     - in pl.yml
        - update current to ver .0.0
        - change base path of changes from build to version 4.0.0
        - update package-list.json from pl.yml
- [ ] remove this blue info box/change log from home page
- [ ] update Jira tracker file

Where possible, new and updated content will be highlighted with green text and background
{: .new-content}

{{ site.data.package-list.list[0].descmd }}

</div>


Key updates and detailed changes between this and prior versions are available in the [US Core change notes]
{:.stu-note}

### Introduction


The US Core Implementation Guide is based on [FHIR Version R4] and defines the minimum set of constraints on the FHIR resources to create the US Core Profiles. It also defines the minimum set of FHIR RESTful interactions for each of the US Core Profiles to access patient data. There are two different ways to implement US Core:
1. Profile Only Support: Systems may support *only* the US Core Profiles to represent clinical information.
1. Profile Support + Interaction Support: Systems may support *both* the US Core Profile content structure *and* the RESTful interactions defined for a resource.

For a detailed description between these different usages of US Core, see the [Conformance Expectations] page.

US Core has benefitted from testing and guidance by the Argonaut Project Team to provide additional content and guidance specific to Data Query Access for purpose of ONC Certification testing.  This guide and the US Core profiles have become the foundation for US Realm FHIR implementation guides.  This release is the first of yearly US Core updates to reflect changes to [U.S. Core Data for Interoperability (USCDI) v1] and requests from the US Realm FHIR community.  This Approach is outlined in the [Future of US Core] page.  Under the guidance of HL7 and the HL7 US Realm Steering Committee, the content will expand in future versions to meet the needs specific to the US Realm.

### Background

The US Core requirements were originally developed, balloted, and published in FHIR DSTU2 as part of the [Office of the National Coordinator for Health Information Technology (ONC)] sponsored [Data Access Framework] (DAF) project. The Argonaut Data Query Implementation Guide superseded DAF and documented security and authorization and the querying of the [2015 Edition Common Clinical Data Set (CCDS)] and static documents.  US Core descended directly from the Argonaut guide to support FHIR Version STU3 and eventually FHIR R4 and The ONC [U.S. Core Data for Interoperability (USCDI) v1].


### How to read this Guide

This Guide is divided into several pages which are listed at the top of each page in the menu bar.

- [Home]\: The home page provides the introduction and background for US Core.
- [Guidance]\: These pages provides overall guidance in using the profiles and transactions defined in this guide.
  - [General Guidance] provides guidance, definitions and requirements common to all actors used in this guide.
  - [Conformance Expectations] defines how CapabilityStatements are used and the expectations for mandatory and must support elements in the US Core Profiles. It provides guidance on how a system may support *only* the resources as profiled by US Core to represent clinical information (Profile Support) versus a system claiming conformance to *both* the US Core Profile content structure *and* the RESTful interactions defined for it (Profile Support + Interaction Support).
  - [Clinical Notes Guidance] gives guidance on the interactions between Consumers and Producers of clinical notes.
  - [Medication List Guidance] gives guidance on how a patient or provider can access a patient's medications.
  - [Basic Provenance] provides implementers with important definitions to create and share the Provenance Resource.
  - [DSTU2 to R4 Conversion] considers the user and developer experience when transitioning from FHIR DSTU2 to FHIR R4.
  - [Future of US Core] outlines the approach to adding new content to US Core.
- [FHIR Artifacts]\: These pages provides detailed descriptions and formal definitions for all the FHIR objects defined in this guide.
  - [Profiles and Extensions]\: This page lists the set of Profile and Extension that are defined in this guide to exchange quality data. Each Profile page includes a narrative introduction, formal definition and a "Quick Start" guide to the supported search transaction for each  Profile.
  - [Search Parameters and Operations]\: This page lists the  defined Operations and Search Parameters that are used in US Core transactions.
  - [Terminology]\: This page lists the value sets and code system defined for  profiles.
  - [Capability Statements]\: This set of pages describes the expected FHIR capabilities of the various  actors.
- [Security]\: General security requirements and recommendations for  actors.
- [Examples]\: List of links to all the examples used in this guide.
- [Downloads]\: This page provides links to downloadable artifacts.

### US Core Actors

The following actors are part of the US Core IG:

#### US Core Requestor
An application that initiates a data access request to retrieve patient data. This can be thought of as the client in a client-server interaction. The terms "US Core Requestor" and "Client" are used interchangeably throughout this guide and are not meant to limit this actor to only patient and provider apps, the same technology can be used by payers and other users. Consider these terms as a short-hand notation for something like “user application”

#### US Core Responder
A product that responds to the data access request providing patient data. This can be thought of as the server in a client-server interaction. The terms "US Core Responder" and "Server" and "EHR" are used interchangeably throughout this guide and are not meant to limit this actor to electronic health record systems.  The same technology can be used in HIEs, care coordination platforms, population health systems, etc. Consider these terms as a short-hand notation for something like “interoperable healthcare platform".


### US Core Profiles

The list of US Core Profiles is shown below.  Each profile defines the minimum mandatory elements, extensions and terminology requirements that **MUST** be present. For each profile, requirements and guidance are given in a simple narrative summary. A formal hierarchical table that presents a [logical view] of the content in both a differential and snapshot view is also provided along with references to appropriate terminologies and examples.  For each US Core Profile, an overview of the required set of RESTful FHIR interactions - for example, search and read operations - is provided in the *Quick Start* Section of the profile page when conforming to the US Core [Capability Statements] for this profile.

{% include list-simple-profiles.xhtml %}

See the General Guidance page for a [mapping] to the U.S. Core Data for Interoperability (USCDI).

----

Primary Authors: Brett Marquard, Eric Haas, Gay Dolin

Secondary Authors: Grahame Grieve, Nagesh Bashyam

{% include link-list.md %}
