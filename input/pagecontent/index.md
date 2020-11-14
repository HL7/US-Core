1. 1. <div markdown="1" class="bg-info">

**punch list**:

- [ ] Finish [Resolving Trackers](https://confluence.hl7.org/display/CGP/US+Core+January+2021+Ballot)
- [ ] Finish Applying Resolved Trackers
     - [ ] Document Search requirements in CapabilityStatements
     - [ ] Add Vitals profile
     - [ ] Various vocab issues
       - [ ] FHIR-29322 still open
- [ ] Review survey and complete updates to choices of types and References
    - need new Tracker or apply to existing?
    1. CareTeam.participant.member
    1. DiagnosticReport.performer
    1. DiagnosticReport.effective[x]
    1. DocumentReference.author
    1. Goal.target.due
    1. Immunization.occurrence[x]
    1. Laboratory Observation.effective[x]
    1. Laboratory Value[x]
    1. MedicationRequest.reported[x]
    1. MedicationRequest.requester
    1. MedicationRequest.medication[x]
    1. **Procedure.performed[x]**
    1. Provenance.agent.who
- [X] Replace value sets with links to VSAC where possible
      -  see [this spreadsheet](https://docs.google.com/spreadsheets/d/1BtRNsmrez2D8cm_81qhBaiU0aMmXGAIVDNwXCVAu2tE/edit#gid=0)
- [ ] Rewrite Must Support section
    - own page?
    - examples?
    - screen shots of SD tree?
- [X] Add note to balloters whether want custom summaries
- [ ] QA
     - [ ] review applied trackers
     - [ ] warnings on name and description waiting for Sushi to implement see [Zulip](https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/Adding.20Description.20for.20Examples.20to.20ImplementationGuide.20-.20how)
     - [ ] bad links as a result of template migration
     - [ ] errors
     - [ ] read through for typos and grammar

</div>

<div markdown="1" class="note-to-balloters">

Where possible, new and updated content will be highlighted with green text and background
{:.new-content}

{{ site.data.package-list.list[1].desc }}

</div>

### Introduction

The US Core Implementation Guide is based on [FHIR Version R4] and defines the minimum conformance requirements for accessing patient data. The [Argonaut] pilot implementations, ONC [2015 Edition Common Clinical Data Set (CCDS)], and ONC [U.S. Core Data for Interoperability (USCDI) v1] provided the requirements for this guide.  The prior Argonaut search and vocabulary requirements, based on FHIR DSTU2, are updated in this guide to support FHIR Version R4. This guide was used as the basis for further testing and guidance by the Argonaut Project Team to provide additional content and guidance specific to Data Query Access for purpose of ONC Certification testing. These profiles are the foundation for future US Realm FHIR implementation guides. In addition to Argonaut, they are used by [DAF-Research], [QI-Core], and [CIMI].  Under the guidance of HL7 and the HL7 US Realm Steering Committee, the content will expand in future versions to meet the needs specific to the US Realm.

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
  - [Search Parameters and Operations]\: This page lists the {{site.title}} defined Operations and Search Parameters that are used in US Core transactions.
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

See the General Guidance page for a [mapping] to the U.S. Core Data for Interoperability (USCDI).

### US Core Conformance Requirements

The [Capability Statements] page outlines conformance requirements and expectations for the US Core Servers and Client applications, identifying the specific profiles and RESTful transactions that need to be supported. Note that the individual US Core profiles identify the structural constraints, terminology bindings and invariants.  Similarly, the individual US Core SearchParameter and Operation resources specify how they are understood by the server. However, implementers must refer to the CapabilityStatement for details on the RESTful transactions, specific profiles and the search parameters applicable to each of the US Core actors.

----


Primary Authors: Brett Marquard, Eric Haas

Secondary Authors: Grahame Grieve, Nagesh Bashyam

{% include link-list.md %}
