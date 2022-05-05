
### Introduction

With each major version in FHIR the core data models have undergone changes.  The FHIR core specification provides a [base resource differential] to help implementers navigate version changes.  However, there are additional considerations for the user and developer experience when transitioning from [FHIR Version DSTU2] to FHIR R4.   Similarly US Core undergoes annual updates which is discussed in the [Future of US Core] page. With each update to a new versions of US Core, the US Core Profiles and conformance expectation change. The following the guidance in this page is provided to ensure a smoother upgrade path. It reflects non-normative best practices established at the time of publication.

### Versioning of US Core

US Core undergoes annual updates with new guidance, requirements, and profiles and changes to existing content. The [Directory of published versions] lists the publication history with links to each version of US Core.  The [Change Log] documents the changes across the versions of US Core. The [Argonaut Data Query] guide was published separately and is not included in the directory or change log.

Work is underway to identify corrections in subsequent versions as "patches" to prior versions for the purpose of ONC Certification.

### Cross Version Comparisons

The table below summarizes the different profiles and resource types between Argonaut Data Query and major releases of US Core :

{% include dstu2-r4-table.md %}

Detailed comparisons between the FHIR artifacts in this current {{site.data.fhir.igVer}} version of US Core and each previous major release are provided in the links below:

- [Comparison with version 4.0.0](comparison-v4.0.0/index.html)
- [Comparison with version 3.1.1](comparison-v3.1.1/index.html)

A detailed comparisons between this version of US Core and Argonaut Data Query is available as a downloadable CSV Excel file:

- [{{site.data.fhir.igVer}}-argo data query CSV](comparison-argo.csv)
- [{{site.data.fhir.igVer}}-argo data query Excel](comparison-argo.xlsx)

### Endpoint Discoverability

A server may support Version DSTU2 and Argonaut Data Query or FHIR R4 and US Core ver 3.1.1+ or both. A server may make explicit which version of Argo/US Core on their FHIR endpoint (e.g., "DSTU2" or “R4" path component or separate files based on version). However best practice is to inspect the [endpoint metadata](http://hl7.org/fhir/R4/http.html) on each endpoint to discover the information about a server's capabilities including the FHIR version and the US Core Profile version that is supported:

`GET [base]/metadata{?mode=[mode]} {&_format=[mime-type]}`

### No Guarantee that Resource IDs are Preserved

In some FHIR servers the identifier of the underlying clinical data is not maintained across FHIR versions. Client applications must plan on deduplication methods that don't rely on a common identifier across FHIR versions.

* Servers should maintain a stable common identifier for a resource across versions.

### Expectation that DSTU2 Data is Preserved in R4

In an upgraded R4 endpoint any data in DSTU2 should be in R4. However, not all data in R4 may be available in DSTU2 because some profiles and data classes like Clinical Notes and pediatric observations are not part of DSTU2.

* The FHIR RESTful resource types supported in a DSTU2 implementation should be supported in a R4 implementation
  - Exceptions
    - MedicationStatement may be deprecated and the data should be mapped to MedicationRequest.  
       - See the guidance in the [Medication List] page for how to access a patient's medications
    - Care teams as represented by CarePlan in DSTU2 should be replaced by and the data mapped to CareTeam in R4

* Servers should make available the same information in DSTU2 and R4 where the more recent standard allows.  (e.g., patient Rhonda Jones is available on both)
  - Exceptions
    - MedicationStatement data mapped to MedicationRequest
    - care teams as represented by CarePlan should be mapped to CareTeam in R4
* Data should not be degraded between versions.
* When updating between versions, clients should consider the impact of any changes to data visualization on the usability for the end user and the maintenance of data integrity.


### Authorization Across Versions

- Separate authorization is required
   - There is no expectation that DSTU2 authorizations will work on R4 endpoints and reauthorization is required when migrating between versions.
      - Maintaining the same auth server for both endpoints so that the refresh token is valid for both DSTU2 the R4 endpoint as well may be possible but not in scope.
- The new endpoint will bring additional/changed resource types and added scopes

{% include link-list.md %}
