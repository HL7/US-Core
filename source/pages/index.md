---
title: Implementation Guide HomePage
layout: default
---

{:.no_toc}

<!-- TOC  the css styling for this is \pages\assets\css\project.css under 'markdown-toc'-->

* Do not remove this line (it will not be displayed)
{:toc}


<!-- end TOC -->

### Introduction

The US Core Implementation Guide is based on [FHIR Version R4] and defines the minimum conformance requirements for accessing patient data as defined by the [Argonaut] pilot implementations and the ONC [2015 Edition Common Clinical Data Set (CCDS)].  The Argonaut search and vocabulary requirements, based on [FHIR DSTU2](http://hl7.org/fhir/DSTU2/index.html), are updated in this guide to support [FHIR Version R4]. These profiles are intended to be the foundation for future US Realm FHIR implementation guides. In addition to Argonaut, they are used by [DAF-Research], [QI-Core], and [CIMI].  Under the guidance of HL7 and the HL7 US Realm Steering Committee, the content will expand in future versions to meet the needs specific to the US Realm.

These requirements were originally developed, balloted, and published in FHIR DSTU2 as part of the [Office of the National Coordinator for Health Information Technology (ONC)] sponsored [Data Access Framework] (DAF) project. For more information on how DAF became US Core see the [US Core change notes](change-notes.html).  

### US Core Actors

The following actors are part of the US Core IG:

* US Core Requestor: An application that initiates a data access request to retrieve patient data. This can be thought of as the client in a client-server interaction.
* US Core Responder: A product that responds to the data access request providing patient data. This can be thought of as the server in a client-server interaction.


### US Core Profiles

The list of US Core Profiles is shown below.  Each profile defines the minimum mandatory elements, extensions and terminology requirements that **MUST** be present. For each profile requirements and guidance are given in a simple narrative summary. A formal hierarchical table that presents a [logical view] of the content in both a differential and snapshot view is also provided along with references to appropriate terminologies and examples.  In addition each profile has a "Quick Start" section which is intended as an implementer friendly overview of the required search and read operations.

New DocumentReference and DiagnosticReport Profiles are being introduced for exchanging Clinical Notes. These are *in addition to* the existing US Core DocumentReference and US Core DiagnosticReport Profiles.  Comments are requested on the question of whether these profiles and their use cases should be merged into a single DocumentReference and DiagnosticReport Profile.
{: .note-to-balloters}

{% include list-simple-profiles.xhtml %}

- In addition US Core uses the [Vital Signs Profile] from the FHIR Specification.


*Note on Searches based on a date or date range:*

- Allergies, Immunizations, Medications, Problems and Health Concerns, UDI, Smoking Status do not require a date range search since a system should return all relevant resources.
- Vital Signs, Laboratory Results, Goals, Encounters, Procedures, and Assessment and Plan of Treatment (CarePlan) include date range search requirements in the Quick Start section on the profile page.

See the *General Guidance* page for a [mapping] to the CCDS.

### US Core Conformance Requirements

The [Capability Statements Section](capstatements.html) outlines conformance requirements for the US Core Servers and Client applications, identifying the specific profiles that need to be supported, the specific RESTful operations that need to be supported, and the search parameters that need to be supported. Note: The individual US Core profiles identify the structural constraints, terminology bindings and invariants, however, implementers must refer to the conformance requirements for details on the RESTful operations, specific profiles and the search parameters applicable to each of the US Core actors.

----


Primary Authors: Brett Marquard, Nagesh Bashyam, Eric Haas

Secondary Authors: Grahame Grieve, Lloyd McKenzie

{% include link-list.md %}
