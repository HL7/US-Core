{% capture cross-version-analysis %}{% include cross-version-analysis.xhtml %}{% endcapture %}
{% capture ip-statement %}{% include ip-statements.xhtml %}{% endcapture %}

Where possible, new and updated content are highlighted with green text and background
{:.new-content}

Key updates and detailed changes between this and prior versions are available in the US Core [Change Log]
{:.stu-note}

### Introduction

The US Core Implementation Guide is based on [FHIR Version R4]. {{ cross-version-analysis | remove: '<p>' | remove: '</p>'}} It defines the minimum set of constraints on the FHIR resources to create the US Core Profiles. It also defines the minimum set of FHIR RESTful interactions for each of the US Core Profiles to access patient data. By establishing the “floor” of standards to promote interoperability and adoption through common implementation, it allows for further standards development evolution for specific uses cases. There are two different ways to implement US Core:
1. Profile Only Support: Systems may support *only* the US Core Profiles to represent clinical information.
2. Profile Support + Interaction Support: Systems may support *both* the US Core Profile content structure *and* the RESTful interactions defined for a resource.

For a detailed description between these different usages of US Core, see the [Conformance Requirements] page.

US Core has benefitted from testing and guidance by the Argonaut Project Team to provide additional content and guidance specific to Data Query Access for purpose of ONC Certification testing.  This guide and the US Core profiles have become the foundation for US Realm FHIR implementation guides.  This release is the first of yearly US Core updates to reflect changes to [U.S. Core Data for Interoperability (USCDI) v3] and requests from the US Realm FHIR community.  This Approach is outlined in the [Future of US Core] page.  Under the guidance of HL7 and the HL7 US Realm Steering Committee, the content will expand in future versions to meet the needs specific to the US Realm.

### Background

The US Core requirements were originally developed, balloted, and published in FHIR DSTU2 as part of the [Office of the National Coordinator for Health Information Technology (ONC)] sponsored Data Access Framework (DAF) project. The Argonaut Data Query Implementation Guide superseded DAF and documented security and authorization and the querying of the [2015 Edition Common Clinical Data Set (CCDS)] and static documents.  US Core descended directly from the Argonaut guide to support FHIR Version STU3 and eventually FHIR R4 and The ONC [U.S. Core Data for Interoperability (USCDI)].

### How to read this Guide

This Guide is divided into several pages which are listed at the top of each page in the menu bar.

- [Home]\: The home page provides the introduction and background for US Core.
- [Conformance]\: These pages describe the set of rules to claim conformance to this guide
  - [General Requirements]\: This page defines requirements common to all actors and profiles used in this guide including  how CapabilityStatements are used to claim conformance.
  - [Must Support]\: This page defines the expectations for mandatory and must support elements in the US Core Profiles.
- [Guidance]\: The Guidance pages provides guidance in using the profiles and transactions defined in this guide.
  - [USCDI]\: This page maps the US Core profiles to the (USCDI) data classes and data elements.
  - [General Guidance]\: This page provides guidance and definitions and requirements common to all actors adn profiles used in this guide.
  - [Clinical Notes]\: This page gives guidance on the interactions between Consumers and Producers of clinical notes.
  - [Medication List]\: This page gives guidance on how a patient or provider can access a patient's medications.
  - [Basic Provenance]\: This page provides implementers with important definitions to create and share the Provenance Resource.
  - [Social Determinants of Health (SDOH)]\: This page gives background on the exchange of Social Determinants of Health (SDOH) data elements.
  - [Changes Between Versions]\: This page considers the user and developer experience when transitioning between versions of US Core.
  - [Future of US Core]\: This page outlines the approach to adding new content to US Core.
- [FHIR Artifacts]\: Thes pages provides detailed descriptions and formal definitions for all the FHIR objects defined in this guide.
  - [Profiles and Extensions]\: This page page lists the set of Profile and Extension that are defined in this guide to exchange quality data. Each Profile page includes a narrative description and guidance, formal definition and a "Quick Start" guide which summarizes the supported search transactions for each Profile. Although the guidance typically focuses on the profiled elements, it may also may focus on un-profiled elements to aid with implementation and certification.
  - [Search Parameters and Operations]\: This page page lists the  defined Operations and Search Parameters that are used in US Core transactions.
  - [Terminology]\: This page page lists the value sets and code system defined for  profiles.
  - [Capability Statements]\: This set of pages describes the expected FHIR capabilities of the various  actors.
- [Security]\: This page enumerates the general security requirements and recommendations for  actors.
- [Examples]\: This page lists all the examples used in this guide. {% include nonnormative-example-boilerplate.md -%}
- [Downloads]\: This page provides links to downloadable artifacts.
- [Change Log]\: This page documents the changes across the versions of US Core

### US Core Actors

The following actors are part of the US Core IG:

#### US Core Requestor
An application that initiates a data access request to retrieve patient data. This can be thought of as the client in a client-server interaction. The terms "US Core Requestor" and "Client" are used interchangeably throughout this guide and are not meant to limit this actor to only patient and provider apps, the same technology can be used by payers and other users. Consider these terms as a short-hand notation for something like “user application”

#### US Core Responder
A product that responds to the data access request providing patient data. This can be thought of as the server in a client-server interaction. The terms "US Core Responder" and "Server" and "EHR" are used interchangeably throughout this guide and are not meant to limit this actor to electronic health record systems.  The same technology can be used in HIEs, care coordination platforms, population health systems, etc. Consider these terms as a short-hand notation for something like “interoperable healthcare platform".

### US Core Profiles

The list of US Core Profiles is shown below.  To promote interoperability and adoption through common implementation, each profile identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.  Together they provide the floor for standards development for specific uses cases. See the [USCDI] page, for a mapping to the U.S. Core Data for Interoperability (USCDI).

For each profile, requirements and guidance are given in a simple narrative summary. A formal hierarchical table that presents a [logical view] of the content in both a differential and snapshot view is also provided along with references to appropriate terminologies and examples.

<!-- ================================================ -->
<!--  use this line to include an autogenerated list of all profiles
 remove it if you would like to hand generate it -->

{% include sd-list-generator.md %}

<!-- ================================================ -->

### US Core FHIR RESTful interactions

For systems that support both the US Core Profile content structure and the RESTful interactions defined for a resource, the requirements are formally defined in the US Core CapabilityStatements. Additionally, each profile page has a *Quick Start* Section that provides an overview of the required set of FHIR RESTful search and read operations. These sections document how to access a patient's clinical and administrative data using the FHIR RESTful syntax:

{% include img-med.html img="basic_fhir_restful_interaction.svg" caption="Example of a simple FHIR RESTful Search Transaction" %}

See the FHIR specification for details on [FHIR RESTful Search API] and the [SMART App Launch Framework] for how an application gets access to a patient record.

----

### Acknowledgements

Primary Authors: Brett Marquard, Eric Haas, Gay Dolin

### Copyrights

{{ ip-statement | remove: '<p>' | remove: '</p>'}}

{% include link-list.md %}
