---
title: DSTU2 to R4 Conversion
layout: default
---

{:.no_toc}

<!-- TOC  the css styling for this is \pages\assets\css\project.css under 'markdown-toc'-->

* Do not remove this line (it will not be displayed)
{:toc}


<!-- end TOC -->



### Introduction

There are several consideration for the user and developer experience when transitioning from DSTU2 to R4.  To ensure a smoother upgrade path the following the guidance is provided.

### Endpoint Discoverability

FHIR Version - a client should know which version they are dealing with without having inspect metadata on each endpoint?

* A server **SHOULD** make explicit which version of Argo/US Core on their FHIR endpoint 
   - e.g., "DSTU2" or “R4" path component or separate files based on version

Discuss with Argonauts/HL7 on single approach. 

### No Guarantee that Resource IDs are Preserved between DSTU2 and R4

In some FHIR servers the identifier of the underlying clinical data is not maintained across FHIR versions. Client applications must plan on deduplication methods that don't rely on a common identifier across FHIR versions.publication. 

* Servers **SHOULD** maintain a stable commmon identifier for a resource across versions. 

### Expectation that DSTU2 Data is Preserved in R4

In an upgraded R4 endpoint, at a minium the resources support available in the DSTU2 implementation must be available in R4. 
* Resource types present in DSTU2 endpoint **SHALL** be present in the R4 endpoint.
  - Exceptions
    - MedicationStatement may be deprecated and the data mapped to MedicationRequest
    - care teams as represented by CarePlan in DSTU2 SHALL be replaced by and the data mapped to CareTeam in R4  
  - Additional Resource Types in R4 will be present:
    - CareTeam
    - Encounter
    - Provenance
    - Others?

In an upgraded R4 endpoint, at a minium the resources instances available in the DSTU2 implementation must be available in R4. 

* Servers **SHALL** make avialable the *same* data in DSTU2 and R4.  ( e.g patient Rhonda Jones is available on both)
  - Exceptions
    - MedicationStatement data mapped to MedicationRequest
    - care teams as represented by CarePlan SHALL be mapped to CareTeam in R4
* Data **SHALL** not be degraded between versions.

### Authorization Across Versions

- Separate authorization is required
   - There is no expectation that DSTU2 authorizations will work on R4 endpoints and reauthorization is required when migrating between versions.
      - Maintaining the same auth server for both endpoints so that the refresh token is valid for both DSTU2 the R4 endpoint as well may be possible but not in scope.
- The new endpoint will bring additional/changed resource Types and added scopes
