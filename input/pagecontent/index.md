<div markdown="1" class="bg-info">



**punch list**:

- [X] [Resolve Trackers](https://jira.hl7.org/secure/Dashboard.jspa?selectPageId=12001)
- [ ] Apply Trackers

    **Publishing Issues**
    - [ ] **Resolved - change required**:Confusing for commercial vendor.  Reads very confusing. ([FHIR-30783](https://jira.hl7.org/browse/FHIR-30783)) proposal is to make the differential tab the default view, see publishing plans here:  https://github.com/HL7/ig-template-base/issues/161  timeline unknown.
    - [ ] **Resolved - change required**:In most of the data elements – “Binding is from base FHIR and US Core Vital Signs”  Need this to be one single combined listing ([FHIR-30780](https://jira.hl7.org/browse/FHIR-30780)) proposal is to limit the terminology and invariants to view shown. see: https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/Different.20views.20for.20tables.20and.20invariants timeline unknown.
    - [ ] **Resolved - change required**:Why are there separate codes for USCoreVitalSigns and the Systolic.value and the diastolic value? ([FHIR-30779](https://jira.hl7.org/browse/FHIR-30779)) proposal is to work with publishing to "clean up" terminology and invariants to view shown. see: https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/Different.20views.20for.20tables.20and.20invariants timeline unknown.

    **Terminology Issues**

    - [ ] **Resolved - change required**: valueset-simple-language.xml QA error "Error from server: Language valuesets cannot be expanded as they are based on a grammar" ([FHIR-30107](https://jira.hl7.org/browse/FHIR-30107)) this error is still extant from prior version of US Core and has yet to be resolved. per 12/2 FMG per GG ok to get variance on this one. Proposal is to work with publishing to fix and create stu note and suppress the error in the meantime.   see:  https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/language.20valueset.20expansion.20error
    - [ ] **Resolved - change required**: Procedure Example:rehab.json. QA Issue - code system not found([FHIR-30107](https://jira.hl7.org/browse/FHIR-30107)) Proposal is to work with publishing to fix  suppress the warnings in the meantime. see[Zulip](https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/US.20core.20procedure.20example.20error)
    - [ ] **Resolved - change required**: Patient Examples QA Errors: CDCREC code system in VSAC Patient ([FHIR-30105](https://jira.hl7.org/browse/FHIR-30105)) CDCREC codes and code system value not aligned with VSAC. Proposal is to work with publishing to fix and suppress the warnings in the meantime. [Zulip1](https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/cdcrec.20code.20errors.20in.20US.20Core) and [Zulip2](https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/Race.20Code.20System)
    - [ ] **Resolved - change required**:imm-1.json NDC/CVX codes QA Error ([FHIR-30104](https://jira.hl7.org/browse/FHIR-30104)) should be fixed if not suppress warning. [Zulip](https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/CVX.20and.20NDC.20warnings.20in.20US.20Core)
    - [ ] **Resolved - change required**:Pulse Ox Example: observation-satO2-fiO2 ([FHIR-27845](https://jira.hl7.org/browse/FHIR-27845)) Proposed Jira ticket to resolve in base made an STU note that is technically not conformant with the base FHIR vital profile and suppress the error in the meantime. [Zulip](https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/US.20Core.20QA.20Issue.20.233-.20nasty.20profiling.20error)
- [ ] QA
     - [ ] review applied trackers
     - [ ] errors and warnings  (see above)
     - [ ] update **gnoreWarnings.txt
- [ ] remove all new content and green highlighted formatting
- [ ] update title and version to 2.0.0
- [ ] update package-list.json
     - in pl.yml
        - update current to ver 2.0.0
        - change base path of changes from build to version 2.0.0
    - remove this blue info box/change log from home page
    - update package-list.json from pl.yml

Where possible, new and updated content will be highlighted with green text and background
{:.new-content}

{{ site.data.package-list.list[0].desc }}

</div>

### Introduction
<div class='new-content' markdown='1'>

The US Core Implementation Guide is based on [FHIR Version R4] and defines the minimum set of constraints on the FHIR resources and FHIR RESTful interactions for accessing patient data. There are two different ways to implement US Core: 1) system may support only the resources as profiled by US Core to represent clinical information, 2) systems can claim conformance to *both* the  US Core Profile content structure *and* the RESTful interactions defined for it.  For more information how these two ways to implement US Core differ, see the [Conformance Expectations] page.

US Core has benefitted from testing and guidance by the Argonaut Project Team to provide additional content and guidance specific to Data Query Access for purpose of ONC Certification testing.  This guide and the US Core profiles have become the foundation for US Realm FHIR implementation guides.  This release is the first of yearly US Core updates to reflect changes to [U.S. Core Data for Interoperability (USCDI) v1] and requests from the US Realm FHIR community.  This Approach is outlined in the figure below:

{% include img.html img="yearly-updates.png" caption="Figure 1: US Core Yearly Updates" %}

Under the guidance of HL7 and the HL7 US Realm Steering Committee, the content will expand in future versions to meet the needs specific to the US Realm.

### Background

The US Core requirements were originally developed, balloted, and published in FHIR DSTU2 as part of the [Office of the National Coordinator for Health Information Technology (ONC)] sponsored [Data Access Framework] (DAF) project. The Argonaut Data Query Implementation Guide superseded DAF and documented security and authorization and the querying of the [2015 Edition Common Clinical Data Set (CCDS)] and static documents.  US Core descended directly from the Argonaut guide to support FHIR Version STU3 and eventually FHIR R4 and The ONC [U.S. Core Data for Interoperability (USCDI) v1].
</div>

### How to read this Guide

This Guide is divided into several pages which are listed at the top of each page in the menu bar.

- [Home]\: The home page provides the introduction and background for US Core.
- [Guidance]\: These pages provides overall guidance in using the profiles and transactions defined in this guide.
  - [General Guidance] provides guidance, definitions and requirements common to all actors used in this guide.
  - {:.new-content}[Conformance Expectations] defines what 'conformance to US Core' means, how the CapabilityStatements are used, and the expectations for mandatory and must supports elements in the US Core Profiles.
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

<div class="bg-success" markdown="1">
US Core Requestor
: An application that initiates a data access request to retrieve patient data. This can be thought of as the client in a client-server interaction. The terms "US Core Requestor" and "Client" are used interchangeably throughout this guide and are not meant to limit this actor to only patient and provider apps, the same technology can be used by payers and other users. Consider these terms as a short-hand notation for something like “user application”

US Core Responder
: A product that responds to the data access request providing patient data. This can be thought of as the server in a client-server interaction. The terms "US Core Responder" and "Server" and "EHR" are used interchangeably throughout this guide and are not meant to limit this actor to electronic health record systems.  The same technology can be used in HIEs, care coordination platforms, population health systems, etc. Consider these terms as a short-hand notation for something like “interoperable healthcare platform".
</div>

### US Core Profiles

The list of US Core Profiles is shown below.  Each profile defines the minimum mandatory elements, extensions and terminology requirements that **MUST** be present. For each profile, requirements and guidance are given in a simple narrative summary. A formal hierarchical table that presents a [logical view] of the content in both a differential and snapshot view is also provided along with references to appropriate terminologies and examples.  For each US Core Profile, an overview of the required set of RESTful FHIR interactions - for example, search and read operations - is provided in the *Quick Start* Section of the profile page <span class="bg-success">when conforming to the US Core [Capability Statements]</span> for this profile.

{% include list-simple-profiles.xhtml %}

See the General Guidance page for a [mapping] to the U.S. Core Data for Interoperability (USCDI).

----


Primary Authors: Brett Marquard, Eric Haas, Gay Dolin

Secondary Authors: Grahame Grieve, Nagesh Bashyam

{% include link-list.md %}
