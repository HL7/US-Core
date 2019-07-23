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

- client should know what version they are dealing with without having inspect metadata on each endpoint.
- existing mechanisms confusing
- Server SHOULD make explicit which version of Argo/US Core on their FHIR endpoint
   - e.g., "DSTU2" or “R4" path component or separate files based on version
- In future coalesce on single method

### No Guarantee that Resource IDs are Preserved between DSTU-2 and R4

- stable ids = best practice
- Can not make assume ids will be the same
  - Clients need to deduplicate and map across versions

### Expectation that DSTU2 Data is Preserved in R4

- Resource types present in DSTU2 endpoint SHALL be present in the R4 endpoint.
  - Exceptions
    - MedicationStatement may be deprecated and the data mapped to MedicationRequest
    - care teams as represented by CarePlan in DSTU2 SHALL be replaced by and the data mapped to CareTeam in R4
- Additional Types in R4 May be present
      - CareTeam
      - Encounter
      - Provenance
      - ...
- Servers SHALL represent the *same* data in R4 as DSTU2.  ( e.g patient Rhonda Jones is available on both)
  - Exceptions
    - MedicationStatement data mapped to MedicationRequest
    - care teams as represented by CarePlan SHALL be mapped to CareTeam in R4
- Data SHALL not be degraded between versions.

### Authorization Across Versions

- Separate authorization is required
   - There is no expectation that DSTU2 authorizations will work on R4 endpoints and reauthorization is required when migrating between versions.
      - Maintaining the same auth server for both endpoints so that the refresh token is valid for both DSTU2 the R4 endpoint as well may be possible but not in scope.
- The new endpoint will bring additional/changed resource Types and added scopes
