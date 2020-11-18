
### Introduction

There are several consideration for the user and developer experience when transitioning from FHIR DSTU2 to FHIR R4.  To ensure a smoother upgrade path the following the guidance is provided.

### Endpoint Discoverability

A server may make explicit which version of Argo/US Core on their FHIR endpoint (e.g., "DSTU2" or “R4" path component or separate files based on version). However best practice is to inspect the [endpoint metadata](http://hl7.org/fhir/R4/http.html) on each endpoint to discover the information about a server's capabilities including the FHIR version and the US Core Profile version that is supported:

`GET [base]/metadata{?mode=[mode]} {&_format=[mime-type]}`

### No Guarantee that Resource IDs are Preserved

In some FHIR servers the identifier of the underlying clinical data is not maintained across FHIR versions. Client applications must plan on deduplication methods that don't rely on a common identifier across FHIR versions.

* Servers **SHOULD** maintain a stable common identifier for a resource across versions.

### Expectation that DSTU2 Data is Preserved in R4

In an upgraded R4 endpoint any data in DSTU2 should be in R4. However, not all data in R4 may be available in DSTU2 because some profiles and data classes like Clinical Notes and pediatric observations are not part of DSTU2.

* The FHIR RESTful resource types supported in a DSTU2 implementation **SHALL** be supported in a R4 implementation
  - Exceptions
    - MedicationStatement *MAY* be deprecated and the data **SHALL** be mapped to MedicationRequest.  
       - See the [Medication List Guidance] section for guidance on accessing a patient's medications
    - care teams as represented by CarePlan in DSTU2 SHALL be replaced by and the data mapped to CareTeam in R4

* Servers **SHALL** make available the same information in DSTU2 and R4 where the more recent standard allows.  (e.g., patient Rhonda Jones is available on both)
  - Exceptions
    - MedicationStatement data mapped to MedicationRequest
    - care teams as represented by CarePlan SHALL be mapped to CareTeam in R4
* Data **SHALL** not be degraded between versions.

### Authorization Across Versions

- Separate authorization is required
   - There is no expectation that DSTU2 authorizations will work on R4 endpoints and reauthorization is required when migrating between versions.
      - Maintaining the same auth server for both endpoints so that the refresh token is valid for both DSTU2 the R4 endpoint as well may be possible but not in scope.
- The new endpoint will bring additional/changed resource types and added scopes

    The table below summarizes the different profiles and resource types between DSTU2 and R4:

{% include dstu2-r4-table.md %}

{% include link-list.md %}
