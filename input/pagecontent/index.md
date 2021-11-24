<div markdown="1" class="bg-info">

**punch list**:

- [X] [Resolve Trackers](https://jira.hl7.org/secure/Dashboard.jspa?selectPageId=12001)
- [X] Apply Trackers

  for profile/element updates:
  - [X] update profile/create artifact
  - [X] optionally create ValueSet/Search parameter artifact (update and highlight new content in terminology page)
  - [X] update uscdi table here: input/includes/uscdi_table.md
  - [X] update intro here: input/intro-notes (highlight new content with new-content class)
  - [X] update notes/search - using python script (excel soure here:input/resources_spreadsheets) and upload here: input/intro-notes) (mark as new content in spreadsheet to highlight new content)
  - [X] optionally update SPs and SP page
  - [X] update/create Examples - (highlight new content with new-content class)
  - [X] update change log
  <!--- [ ] updated Provenance to include all the new resources created a liquid script as include file to update this dynamically. -->
  - [ ] !!!!!update Conformance - using python script (excel soure here:input/resources_spreadsheets) and upload here: input/resources  *NOTE do this at end and remember to update Client spreadsheet from Server spreadsheet*

  for narrative updates
  - [X] update Narratives
  - [X] update change log
  - [X] list open issues in package-list
- [ ] QA
     - [X] review applied trackers
     - [ ] errors and warnings
       FMG list:
         - [ ]fix nucc code or suppress with comment that not intending it to come from NUCC - may not be a valid code - reason for suppression does not make sense - fix
         - [ ] CPT issue - suppress
         - [ ] LG41752-2. loinc issue - okay
         - [ ] goal.description - nlm value set - VSAC
         - [ ] NDC display names - still outstanding issue with Grahame
         - [ ] procedure.code - ICD10-pc - not ICD10 - server doesn't know codes - confirm URL and suppress
         - [ ] Fix slicing issues
         - [ ] observation profiles - suppress with approval from CGP
         - [ ] US Core Vital signs - illegal attempt to change the binding - from required to extensible - related to vital signs - either a code bug or have a problem that needs to be fixed - should point to Git issue or Zulip if this is a tooling issue - ADD WARNING TO SPECIFICATION TO SAY NOT CONFORMANT TO R4 - NEEDS TO STAY AS REQUIRED.
         - [ ] CapabilityStatement - smart-app-launch - does not resolve - needs to be fixed.  If can't fix - raise a Zulip issue
         - [ ] Suppress capabilitystatement info messages with reason
         - [ ] SearchParameter - Grahame to look into this
         - [ ] VSAC issues
         - [ ] ValueSet - simple-language - can not be expanded - okay- can't be suppressed - tooling
         - [ ] ICD9cm will be fixed next release
         - [ ] resuppress warnings - syntax has changed
         - [ ] LOCAL CODE SYTEM - URL NEEDS TO HAVE EXAMPLE IN IT OR USE A REAL ONE
         - [ ] Should not suppress JIra Spec File warning - Can not be suppressed

    Summary and Categorization of Errors (42)

      **Unable to find value set in VSAC for race, ethnicity, birthsex, genderIdentity (21)**

     1. ERROR: Patient/child-example: Patient.extension[2].value.ofType(code): The value provided ('M') is not in the value set 'Birth Sex' (http://hl7.org/fhir/us/core/ValueSet/birthsex), and a code is required from this value set) (error message = Error from server: Unable to find value set http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1021.103)
     1. ERROR: Patient/example: Patient.extension[2].value.ofType(code): The value provided ('F') is not in the value set 'Birth Sex' (http://hl7.org/fhir/us/core/ValueSet/birthsex), and a code is required from this value set) (error message = Error from server: Unable to find value set http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1021.103)
     1. ERROR: Patient/infant-example: Patient.extension[2].value.ofType(code): The value provided ('M') is not in the value set 'Birth Sex' (http://hl7.org/fhir/us/core/ValueSet/birthsex), and a code is required from this value set) (error message = Error from server: Unable to find value set http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1021.103)
     1. ERROR: ValueSet.where(id = 'detailed-ethnicity'): Error from server: Unable to find value set "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1021.103"
     1. ERROR: ValueSet.where(id = 'detailed-race'): Error from server: Unable to find value set "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1021.103"
     1. ERROR: ValueSet.where(id = 'omb-ethnicity-category'): Error from server: Unable to find value set "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1021.102"
     1. ERROR: ValueSet.where(id = 'omb-race-category'): Error from server: Unable to find value set "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1021.103"
     1. ERROR: ValueSet.where(id = 'birthsex'): Error from server: Unable to find value set "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1021.103"
     1. ERROR: Patient/child-example: Patient.extension[0].extension[0].value.ofType(Coding): The Coding provided (urn:oid:2.16.840.1.113883.6.238#2028-9) is not in the value set http://hl7.org/fhir/us/core/ValueSet/omb-race-category, and a code is required from this value set.  (error message = Not in value set http://hl7.org/fhir/us/core/ValueSet/omb-race-category)
     1. ERROR: Patient/child-example: Patient.extension[1].extension[0].value.ofType(Coding): The Coding provided (urn:oid:2.16.840.1.113883.6.238#2186-5) is not in the value set http://hl7.org/fhir/us/core/ValueSet/omb-ethnicity-category, and a code is required from this value set.  (error message = Not in value set http://hl7.org/fhir/us/core/ValueSet/omb-ethnicity-category)
     1. ERROR: Patient/example: Patient.extension[0].extension[0].value.ofType(Coding): The Coding provided (urn:oid:2.16.840.1.113883.6.238#2106-3) is not in the value set http://hl7.org/fhir/us/core/ValueSet/omb-race-category, and a code is required from this value set.  (error message = Not in value set http://hl7.org/fhir/us/core/ValueSet/omb-race-category)
     1. ERROR: Patient/example: Patient.extension[0].extension[1].value.ofType(Coding): The Coding provided (urn:oid:2.16.840.1.113883.6.238#1002-5) is not in the value set http://hl7.org/fhir/us/core/ValueSet/omb-race-category, and a code is required from this value set.  (error message = Not in value set http://hl7.org/fhir/us/core/ValueSet/omb-race-category)
     1. ERROR: Patient/example: Patient.extension[0].extension[2].value.ofType(Coding): The Coding provided (urn:oid:2.16.840.1.113883.6.238#2028-9) is not in the value set http://hl7.org/fhir/us/core/ValueSet/omb-race-category, and a code is required from this value set.  (error message = Not in value set http://hl7.org/fhir/us/core/ValueSet/omb-race-category)
     1. ERROR: Patient/example: Patient.extension[0].extension[3].value.ofType(Coding): The Coding provided (urn:oid:2.16.840.1.113883.6.238#1586-7) is not in the value set http://hl7.org/fhir/us/core/ValueSet/detailed-race, and a code is required from this value set.  (error message = Not in value set http://hl7.org/fhir/us/core/ValueSet/detailed-race)
     1. ERROR: Patient/example: Patient.extension[0].extension[4].value.ofType(Coding): The Coding provided (urn:oid:2.16.840.1.113883.6.238#2036-2) is not in the value set http://hl7.org/fhir/us/core/ValueSet/detailed-race, and a code is required from this value set.  (error message = Not in value set http://hl7.org/fhir/us/core/ValueSet/detailed-race)
     1. ERROR: Patient/example: Patient.extension[1].extension[0].value.ofType(Coding): The Coding provided (urn:oid:2.16.840.1.113883.6.238#2135-2) is not in the value set http://hl7.org/fhir/us/core/ValueSet/omb-ethnicity-category, and a code is required from this value set.  (error message = Not in value set http://hl7.org/fhir/us/core/ValueSet/omb-ethnicity-category)
     1. ERROR: Patient/example: Patient.extension[1].extension[1].value.ofType(Coding): The Coding provided (urn:oid:2.16.840.1.113883.6.238#2184-0) is not in the value set http://hl7.org/fhir/us/core/ValueSet/detailed-ethnicity, and a code is required from this value set.  (error message = Not in value set http://hl7.org/fhir/us/core/ValueSet/detailed-ethnicity)
     1. ERROR: Patient/example: Patient.extension[1].extension[2].value.ofType(Coding): The Coding provided (urn:oid:2.16.840.1.113883.6.238#2148-5) is not in the value set http://hl7.org/fhir/us/core/ValueSet/detailed-ethnicity, and a code is required from this value set.  (error message = Not in value set http://hl7.org/fhir/us/core/ValueSet/detailed-ethnicity)
     1. ERROR: Patient/example: Patient.extension[3].value.ofType(CodeableConcept): None of the codings provided are in the value set 'Gender Identity' (http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1021.32), and a coding from this value set is required) (codes = http://terminology.hl7.org/CodeSystem/v3-NullFlavor#ASKU)
     1. ERROR: Patient/infant-example: Patient.extension[0].extension[0].value.ofType(Coding): The Coding provided (urn:oid:2.16.840.1.113883.6.238#2028-9) is not in the value set http://hl7.org/fhir/us/core/ValueSet/omb-race-category, and a code is required from this value set.  (error message = Not in value set http://hl7.org/fhir/us/core/ValueSet/omb-race-category)
     1. ERROR: Patient/infant-example: Patient.extension[1].extension[0].value.ofType(Coding): The Coding provided (urn:oid:2.16.840.1.113883.6.238#2186-5) is not in the value set http://hl7.org/fhir/us/core/ValueSet/omb-ethnicity-category, and a code is required from this value set.  (error message = Not in value set http://hl7.org/fhir/us/core/ValueSet/omb-ethnicity-category)

    **LOINC Group code  LG41762-2 “Social Determinants Of Health” not supported by terminology server. (17)**

     1. ERROR: DiagnosticReport/bone-density-report: DiagnosticReport.category[0]: Slicing cannot be evaluated: Could not match discriminator ([$this]) for slice DiagnosticReport.category:us-core in profile http://hl7.org/fhir/us/core/StructureDefinition/us-core-diagnosticreport-note - the discriminator [$this] does not have fixed value, binding or existence assertions
     1. ERROR: DiagnosticReport/cardiology-report: DiagnosticReport.category[0]: Slicing cannot be evaluated: Could not match discriminator ([$this]) for slice DiagnosticReport.category:us-core in profile http://hl7.org/fhir/us/core/StructureDefinition/us-core-diagnosticreport-note - the discriminator [$this] does not have fixed value, binding or existence assertions
     1. ERROR: DiagnosticReport/chest-xray-report: DiagnosticReport.category[0]: Slicing cannot be evaluated: Could not match discriminator ([$this]) for slice DiagnosticReport.category:us-core in profile http://hl7.org/fhir/us/core/StructureDefinition/us-core-diagnosticreport-note - the discriminator [$this] does not have fixed value, binding or existence assertions
     1. ERROR: Condition/condition-SDOH-example: Condition.category[0]: Slicing cannot be evaluated: Could not match discriminator ([$this]) for slice Condition.category:us-core in profile http://hl7.org/fhir/us/core/StructureDefinition/us-core-condition - the discriminator [$this] does not have fixed value, binding or existence assertions
     1. ERROR: Condition/example: Condition.category[0]: Slicing cannot be evaluated: Could not match discriminator ([$this]) for slice Condition.category:us-core in profile http://hl7.org/fhir/us/core/StructureDefinition/us-core-condition - the discriminator [$this] does not have fixed value, binding or existence assertions
     1. ERROR: DocumentReference/episode-summary: DocumentReference.category[0]: Slicing cannot be evaluated: Could not match discriminator ([$this]) for slice DocumentReference.category:us-core in profile http://hl7.org/fhir/us/core/StructureDefinition/us-core-documentreference - the discriminator [$this] does not have fixed value, binding or existence assertions
     1. ERROR: ServiceRequest/foodpantry-referral: ServiceRequest.category[0]: Slicing cannot be evaluated: Could not match discriminator ([$this]) for slice ServiceRequest.category:us-core in profile http://hl7.org/fhir/us/core/StructureDefinition/us-core-servicerequest - the discriminator [$this] does not have fixed value, binding or existence assertions
     1. ERROR: Condition/hc1: Condition.category[0]: Slicing cannot be evaluated: Could not match discriminator ([$this]) for slice Condition.category:us-core in profile http://hl7.org/fhir/us/core/StructureDefinition/us-core-condition - the discriminator [$this] does not have fixed value, binding or existence assertions
     1. ERROR: Observation/hunger-question-example: Observation.category[0]: Slicing cannot be evaluated: Could not match discriminator ([$this]) for slice Observation.category:us-core in profile http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-screening-response - the discriminator [$this] does not have fixed value, binding or existence assertions
     1. ERROR: Observation/hunger-question-example: Observation.category[1]: Slicing cannot be evaluated: Could not match discriminator ([$this]) for slice Observation.category:us-core in profile http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-screening-response - the discriminator [$this] does not have fixed value, binding or existence assertions
     1. ERROR: Observation/prapare-multiselect-example: Observation.category[0]: Slicing cannot be evaluated: Could not match discriminator ([$this]) for slice Observation.category:us-core in profile http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-screening-response - the discriminator [$this] does not have fixed value, binding or existence assertions
     1. ERROR: Observation/prapare-multiselect-example: Observation.category[1]: Slicing cannot be evaluated: Could not match discriminator ([$this]) for slice Observation.category:us-core in profile http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-screening-response - the discriminator [$this] does not have fixed value, binding or existence assertions
     1. ERROR: Observation/socialhistory-assessment-example: Observation.category[0]: Slicing cannot be evaluated: Could not match discriminator ([$this]) for slice Observation.category:us-core in profile http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-social-history-assessment - the discriminator [$this] does not have fixed value, binding or existence assertions
     1. ERROR: Condition/condition-SDOH-example: Condition.category[0].coding[0]: The code "LG41762-2" is not valid in the system http://loinc.org; The code provided (http://loinc.org#LG41762-2) is not valid in the value set 'All codes known to the system' (from http://tx.fhir.org/r4) for 'http://loinc.org#LG41762-2'
     1. ERROR: ServiceRequest/foodpantry-referral: ServiceRequest.category[0].coding[0]: The code "LG41762-2" is not valid in the system http://loinc.org; The code provided (http://loinc.org#LG41762-2) is not valid in the value set 'All codes known to the system' (from http://tx.fhir.org/r4) for 'http://loinc.org#LG41762-2'
     1. ERROR: Observation/hunger-question-example: Observation.category[0].coding[0]: The code "LG41762-2" is not valid in the system http://loinc.org; The code provided (http://loinc.org#LG41762-2) is not valid in the value set 'All codes known to the system' (from http://tx.fhir.org/r4) for 'http://loinc.org#LG41762-2'
     1. ERROR: Observation/prapare-multiselect-example: Observation.category[0].coding[0]: The code "LG41762-2" is not valid in the system http://loinc.org; The code provided (http://loinc.org#LG41762-2) is not valid in the value set 'All codes known to the system' (from http://tx.fhir.org/r4) for 'http://loinc.org#LG41762-2'

     **valueset-simple-language.xml QA Error FHIR-30107 See Change Here - Coordination with IG publishing team to Correct - Note To Balloters present (1)**

     1. ERROR: ValueSet.where(id = 'simple-language'): Error from server: Language valuesets cannot be expanded as they are based on a grammar

     **US Core Pulse Oximetry Profile noncomformant UCUM Unit for Oxygen Concentration FHIR-27845 - Awaiting FHIR-4b updates to update base FHIR Vitals Profile, STU Note Present (2)**

     1. ERROR: US Core Vital Signs Profile.Observation.component.value[x]: illegal attempt to change the binding on Observation.component.value[x] from required to extensible
     1. ERROR: StructureDefinition/us-core-vital-signs: StructureDefinition: illegal attempt to change the binding on Observation.component.value[x] from required to extensible

     **SMART URL based on yet to be published version 2.0! (1)**

     1. ERROR: CapabilityStatement/us-core-server: CapabilityStatement.implementationGuide[0]: Canonical URL 'http://hl7.org/fhir/smart-app-launch/ImplementationGuide/hl7.fhir.uv.smart-app-launch' does not resolve

 - [ ] update ignoreWarnings.txt
 - [ ] update to latest ig publisher and review address any new validation checks
 - [ ] final read through
- [ ] remove all new content and green highlighted formatting
- [ ] update title and version to 5.0.0
- [ ] update package-list.yml (convert to json !)
- [ ] remove this blue info box from home page
- [ ] update Jira tracker file
</div>

<div markdown="1" class="note-to-balloters">

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
  - [SDOH Guidance] gives background on the exchange of Social Determinants of Health (SDOH) data elements.
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
