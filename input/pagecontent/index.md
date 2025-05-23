<!-- {% raw %} <div class="note-to-balloters" markdown="1">

**The January 2025 ballot addresses the following**

{% include whats-new/v8.md %}

</div> {% endraw %} -->

<!-- {% raw %} 
Where possible, new and updated pre-publishing content is highlighted with green text and background- **This highlighting will be removed prior to publication.**
{:.new-content}
 {% endraw %} -->


Key updates and detailed changes between this and prior versions are available on the US Core [Change Log] and [Changes Between Versions] pages.
{:.stu-note}

### Introduction

This guide and the US Core profiles have become the foundation for US Realm FHIR implementation guides. This annual release reflects changes to [U.S. Core Data for Interoperability (USCDI)] and comments and requests from the US Realm FHIR community. (The [US Core Roadmap] page outlines this approach to yearly updates.)  US Core has benefitted from testing and guidance by the Argonaut Project Team. Their feedback continues to lay the groundwork for documenting the US Core Profile design, interactions, requirements, and guidelines for patient data access and [Assistant Secretary for Technology Policy (ASTP)] Certification testing. Under the guidance of HL7 and the HL7 US Realm Steering Committee, the content will expand in future versions to meet the needs specific to the US Realm.

The US Core Implementation Guide is based on [FHIR Version R4]. It defines the minimum constraints on the FHIR resources to create the US Core Profiles. The elements, extensions, vocabularies, and value sets that SHALL be present are identified, and how they are used is defined.  It also documents the minimum FHIR RESTful interactions for each US Core Profiles to access patient data. Establishing the "floor" of standards to promote interoperability and adoption through common implementation allows for further standards development evolution for specific use cases. There are two different ways to implement US Core:
1. Profile Only Support: Systems may support *only* the US Core Profiles to represent clinical information.
2. Profile Support + Interaction Support: Systems may support *both* the US Core Profile content structure *and* the RESTful interactions defined for a resource.

For a detailed description of these different usages of US Core, see the [Conformance Requirements] page.

### Background

The US Core requirements were initially developed, balloted, and published in FHIR DSTU2 as part of the [Office of the National Coordinator for Health Information Technology (ONC)] sponsored Data Access Framework (DAF) project. The Argonaut Data Query Implementation Guide superseded DAF and documented security and authorization and the querying of the [2015 Edition Common Clinical Data Set (CCDS)] and static documents. US Core descended directly from the Argonaut guide to support FHIR Version STU3 and eventually FHIR R4 and the ASTP/ONC [U.S. Core Data for Interoperability (USCDI)].  Refer to the [USCDI] page which maps the US Core versions and profiles to the USCDI versions and Data Elements.

### How To Read This Guide

This Guide is divided into several pages, which are listed at the top of each page in the menu bar.

- [Home]\: The home page provides the introduction and background for US Core.
- [Conformance]\: These pages describe the set of rules to claim conformance to this guide
  - [General Requirements]\: This page defines requirements common to all actors and profiles used in this guide, including how CapabilityStatements are used to claim conformance.
  - [Must Support]\: This page defines the expectations for mandatory and Must Support elements in the US Core Profiles.
- [Guidance]\: The Guidance pages document best practices and how to use the profiles and transactions defined in this guide.
  - [USCDI]\: This page maps the US Core Profiles to the (USCDI) data classes and data elements.
  - [General Guidance]\: This page provides guidance, definitions, and requirements common to all actors and profiles used in this guide.
  - [Clinical Notes]\: This page provides guidance on the interactions between Consumers and Producers of clinical notes.
  - [Medication List]\: This page provides guidance on how a patient or provider can access a patient's medications.
  - [Basic Provenance]\: This page provides implementers with important definitions to create and share the Provenance Resource.
  - [Screening and Assessments]\: This page documents how US Core Profiles are used to represent screenings and assessments for patient health status
  - [Changes Between Versions]\: This page considers the user and developer experience when transitioning between versions of US Core and documents the changes between versions.
- [FHIR Artifacts]\: These pages provide detailed descriptions and formal definitions for all the FHIR objects defined in this guide.
  - [Profiles and Extensions]\: This page lists the US Core Profiles and Extensions defined in this guide to exchange quality data.
    - Each US Core Profile page includes a narrative description that lists all the [Mandatory] and [Must Support] data elements, profile-specific implementation guidance, and formal definitions. A "Quick Start" guide summarizes the supported search transactions for each profile. Although the guidance typically focuses on the profiled elements, it also may cover un-profiled elements to aid with implementation and certification.
  - [Search Parameters and Operations]\: This page lists the defined US Core Operations and Search Parameters used in US Core transactions.
  - [Terminology]\: This page lists the US Core ValueSets, and CodeSystems defined for the profiles.
  - [Capability Statements]\: These pages define the expected FHIR capabilities of the US Core Servers and Clients.
- [Security]\: This page documents the general security requirements and recommendations for actors.
- [Examples]\: This page lists all the examples used in this guide. {% include nonnormative-example-boilerplate.md -%}
- [Downloads]\: This page provides links to downloadable artifacts.
- [Change Log]\: This page documents the changes across the versions of US Core. It is a vital resource for implementers, developers, and stakeholders to understand the guide’s progression.
- [Looking Ahead]\: These pages provide a preview of the future direction of US Core
   - [US Core Roadmap]\: This page outlines the approach to adding new content to US Core.
   - [Writing Vital Signs]\: This page documents how to write vital sign Observation using patient- and provider-facing apps.
   - [Patient Data Feed]\: This page documents how to use FHIR Subscriptions to be notified when events related to US Core content occur.

### US Core Actors

The following actors are part of the US Core IG:

#### US Core Requestor
A US Core Requester is an application that initiates a data access request to retrieve patient data. The US Core Requestor is the Client in a Client-Server interaction. The terms "US Core Requestor" and "Client" are used interchangeably throughout this guide and are not meant to limit this actor to only patient and provider apps. For example, payers and other users can use the same technology. These terms are a short-hand notation for "user application".

#### US Core Responder
A US Core Responder is a system that responds to the data access request providing patient data. The US Core responder is the Server in a Client-Server interaction. The terms "US Core Responder", "Server", and "EHR" are used interchangeably throughout this guide and are not meant to limit this actor to electronic health record systems. For example, HIEs, care coordination platforms, population health systems, etc., can use the same technology. These terms are a short-hand notation for "interoperable healthcare platform".

### US Core Profiles

Below is the list of US Core Profiles. Each profile identifies which core elements, extensions, vocabularies, and ValueSets **SHALL** be present in the resource when using this profile. Together, they promote interoperability and adoption through common implementation and provide the floor for standards development for specific use cases. See the [USCDI] page, for a mapping to the U.S. Core Data for Interoperability (USCDI).

A simple narrative summary gives each profile's requirements and guidance. A formal hierarchical table presents a [logical view] of the content in both a differential and snapshot view, and provides references to appropriate terminologies and examples.


#### US Core Profile Maturity

All US Core FHIR conformance and terminology artifacts are assigned a [FHIR Maturity Level]. The content in this release has been thoroughly reviewed through the HL7 ballot and other processes, implemented, and subject to ASTP certification testing. A FHIR Maturity Level of *FMM 3* is assigned to US Core artifacts associated with a USCDI Data Class or Element and subject to regulation and ASTP certification. A FHIR Maturity Level of  *FMM 2* is assigned to US Core artifacts related to a USCDI Data Class or Element but have not yet been identified in regulation or subject to ASTP certification. All other US Core artifacts have been assigned a FHIR Maturity Level of *FMM 3* based upon community review. Refer to the FHIR specification for more information about maturity levels.


<!-- ================================================ -->
<!--  use this line to include an autogenerated list of all profiles
 remove it if you would like to hand generate it -->

{% include sd-list-generator.md %}

<!-- ================================================ -->



### US Core FHIR RESTful interactions

For systems that support the US Core Profile content structure and the RESTful interactions defined for a resource, the requirements are formally defined in the US Core CapabilityStatements. In addition, each profile page has a *Quick Start* Section that documents the required FHIR RESTful search and read operations. These sections demonstrate how to access a patient's clinical and administrative data:

{% include img-med.html img="basic_fhir_restful_interaction.svg" caption="Example of a simple FHIR RESTful Search Transaction" %}

See the FHIR specification for details on [FHIR RESTful Search API] and the [SMART App Launch] for how an application gets access to a patient record.

---

Primary Authors: Brett Marquard, Eric Haas, Gay Dolin

{% include link-list.md %}