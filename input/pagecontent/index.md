<div markdown="1" class="bg-info">



**punch list**:

- [X] Finish [Resolving Trackers]https://jira.hl7.org/secure/Dashboard.jspa?selectPageId=12001)
- [ ] Finish Applying Resolved Trackers
- [ ] QA
     - [] review applied trackers
     - [ ] errors and warnings

<!--

        - [X] example name and definition error [Zulip](https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/Adding.20Description.20for.20Examples.20to.20ImplementationGuide.20-.20how/near/217444410)

            The extension http://hl7.org/fhir/StructureDefinition/instance-name is unknown, and not allowed here
            error	URL value 'http://hl7.org/fhir/StructureDefinition/instance-name' does not resolve
            error	The extension http://hl7.org/fhir/StructureDefinition/instance-description is unknown, and not allowed here
            error	URL value 'http://hl7.org/fhir/StructureDefinition/instance-description' does not resolve

        - [ ] VSAC link errors


           - [ ] See this [Zulip](https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/VSAC.2FPhinVads.20Warnings)


          - [ ] Immunization Example: imm-1.json NDC/CVX codes [Zulip](https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/CVX.20and.20NDC.20warnings.20in.20US.20Core) WIP per GG should be fixed.
          - [ ] Patient Examples: patient-child-example.json,patient-infant-example.json, patient-example.json and ValueSet-omb-race-category.json CDCREC codes and code system value ( OID vs ? defined in package or by VSAC ????) [Zulip](https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/cdcrec.20code.20errors.20in.20US.20Core) per 12/2 FMG won't be able to sort out by ballot.
             - [X] Note to balloters that CDCREC code system using VSAC is an open issue
          - [ ] Pulse Ox Example: observation-satO2-fiO2 [Zulip](https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/US.20Core.20QA.20Issue.20.233-.20nasty.20profiling.20error) per 12/2 FMG won't be able to sort out by ballot.
             - [X] make an STU note that is technically not conformant with the base FHIR vital profile.
        - [ ] Procedure Example:  rehab.json. [Zulip](https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/US.20core.20procedure.20example.20error) per GG will get fixed.
        - [X] CareTeam Example: careteam-example.json: US Ed Snomed Errors [Zulip](https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/US.20ed.20Snomed.20for.20US.20Core)
        - [X] valueset-simple-language.xml "Error from server: Language valuesets cannot be expanded as they are based on a grammar" this error is still extant from prior version of US Core and has yet to be resolved. per 12/2 FMG per GG won't ok to get variance on this one.
        - [X] update JIRA (update jira file for us czsore #119)
        - [ ] update `input/ignoreWarnings.txt`
          - [X] [Zulip](https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/US.20Core.20Warnings.20we.20want.20to.20suppress)
          - [ ] add all the informative message too
     - [X] read through for typos and grammar
-->

Where possible, new and updated content will be highlighted with green text and background
{:.new-content}

{{ site.data.package-list.list[0].desc }}

</div>

### Introduction

The US Core Implementation Guide is based on [FHIR Version R4] and defines the minimum conformance requirements for accessing patient data. The [Argonaut] pilot implementations, ONC [2015 Edition Common Clinical Data Set (CCDS)], and ONC [U.S. Core Data for Interoperability (USCDI) v1] provided the requirements for this guide.  The prior Argonaut search and vocabulary requirements, based on FHIR DSTU2, are updated in this guide to support FHIR Version R4. This guide was used as the basis for further testing and guidance by the Argonaut Project Team to provide additional content and guidance specific to Data Query Access for purpose of ONC Certification testing. These profiles are the foundation for future US Realm FHIR implementation guides. In addition to Argonaut, they are used by [DAF-Research], [QI-Core], and [CIMI].  Under the guidance of HL7 and the HL7 US Realm Steering Committee, the content will expand in future versions to meet the needs specific to the US Realm.

These requirements were originally developed, balloted, and published in FHIR DSTU2 as part of the [Office of the National Coordinator for Health Information Technology (ONC)] sponsored [Data Access Framework] (DAF) project. For more information on how DAF became US Core see the [US Core change notes].

### How to read this Guide

This Guide is divided into several pages which are listed at the top of each page in the menu bar.

- [Home]\: The home page provides the introduction and background for US Core.
- [Guidance]\: These pages provides overall guidance in using the profiles and transactions defined in this guide.
  - [General Guidance] provides guidance, definitions and requirements common to all  actors used in this guide.
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

* US Core Requestor: An application that initiates a data access request to retrieve patient data. This can be thought of as the client in a client-server interaction.
* US Core Responder: A product that responds to the data access request providing patient data. This can be thought of as the server in a client-server interaction.


### US Core Profiles

The list of US Core Profiles is shown below.  Each profile defines the minimum mandatory elements, extensions and terminology requirements that **MUST** be present. For each profile, requirements and guidance are given in a simple narrative summary. A formal hierarchical table that presents a [logical view] of the content in both a differential and snapshot view is also provided along with references to appropriate terminologies and examples.  For each US Core Profile, an overview of the required set of RESTful FHIR interactions - for example, search and read operations - is provided in the *Quick Start* Section of the profile page.

{% include list-simple-profiles.xhtml %}

See the General Guidance page for a [mapping] to the U.S. Core Data for Interoperability (USCDI).

----


Primary Authors: Brett Marquard, Eric Haas, Gay Dolin

Secondary Authors: Grahame Grieve, Nagesh Bashyam

{% include link-list.md %}
