
### Introduction

With each major version of FHIR, the core data models have changed.  The FHIR core specification provides a [base resource differential] to help implementers navigate version changes.  However, there are additional considerations for the user and developer experience when transitioning from [FHIR Version DSTU2] to FHIR R4.   Similarly, US Core undergoes annual updates, which are documented on the [US Core Roadmap] page. Each update to a new version of US Core changes the US Core Profiles and conformance expectations. The following guidance on this page is provided to ensure a smoother upgrade path. It reflects non-normative best practices established at the time of publication.

### Versioning of US Core

US Core undergoes annual updates with new guidance, requirements, profiles, and changes to existing content. The [Directory of published versions] lists the publication history with links to each version of US Core.  The [Change Log] documents the changes across the versions of US Core. The [Argonaut Data Query] guide was published separately and is not included in the directory or change log.

Work is underway to identify corrections in subsequent versions as "patches" to prior versions for ASTP Certification.

### Cross Version Comparisons

The table below summarizes the different profiles and resource types between Argonaut Data Query and major releases of US Core :

{% include dstu2-r4-table2.md %}

Detailed comparisons between the FHIR artifacts in this current {{site.data.fhir.igVer}} version of US Core and each previous major release are provided in the links below:

- [Comparison with version 7.0.0](comparison-v7.0.0/index.html)
- [Comparison with version 6.1.0](comparison-v6.1.0/index.html)
- [Comparison with version 5.0.1](comparison-v5.0.1/index.html)
- [Comparison with version 4.0.0](comparison-v4.0.0/index.html)
- [Comparison with version 3.1.1](comparison-v3.1.1/index.html)
- [(Partial) Comparison with Argonaut Data Query IG](comparison-argo/index.html)

<!--  Instructions for creating the Comparison with Argonaut Data Query IG folder
1. Use the FHIR validator to compare and the script /Users/ehaas/Documents/Python/Jupyter/MyNotebooks/Validator_Tools/IG-Profile_Comparer.ipynb with the source file input/images-source/ArgoDQ-USCore-ProfileMap.csv. 
2. See the script file for instructions
3. Note that only the comparison files are used the union and intersection files are discarded.
4. Need to clean up the generated html files to remove the QA errors
   1. look for "null" and remove  ( e.g. in /Users/ehaas/Documents/Python/Jupyter/MyNotebooks/utils/out/profile_compare/temp_out/sd-argo-goal-us-core-goal.html)
      1. find ` null"` and replace with `"`
   2. fix bad links for publisher using regex
      1. find '<a href="\?\?.*?>(.*?)</a>'
      2. replace '$1'
-->

### Endpoint Discoverability

A Server may support multiple versions of FHIR and US Core/Argonaut Data Query. A Server may indicate which version in their endpoint URL (for example, "DSTU2", "R4", or "R6" path component or separate files based on version). However, the best practice is to inspect the [endpoint metadata](http://hl7.org/fhir/R4/http.html) on each endpoint to discover the information about a Server's capabilities, including the FHIR version and the US Core/Argonaut Data Query Profile version that is supported.

Example server capabilities discovery interaction: This Server supports FHIR R4 and US Core 6.1.0 :

`GET [base]/metadata{?mode=[mode]} {&_format=[mime-type]}`
```
{
  "resourceType": "CapabilityStatement",
  "status": "active",
  "date": "2025-08-12",
  "publisher": "Example FHIR Server",
  "kind": "instance",
  "fhirVersion": "4.0.1",
  "implementationGuide": [
    "http://hl7.org/fhir/us/core/ImplementationGuide/hl7.fhir.us.core|6.1.0"
  ],
  "format": ["json"],
  "rest": [
    {
      "mode": "server",
      "resource": [
        ...
      ],
      ...
    },
    ...
  ],
  ...
}
```

### No Guarantee that Resource IDs are Preserved

In some FHIR Servers, the identifier of the underlying clinical data is not maintained across FHIR versions. Therefore, Client applications must plan on deduplication methods that rely on something other than a common identifier across FHIR versions.

* Servers **SHOULD** maintain a stable common identifier for a resource across versions.

### Expectation that FHIR Data is Preserved 

In an upgraded R6 endpoint, any data in prior FHIR versions **SHOULD** be available in a subsequent FHIR version (for example, FHIR R4 data in FHIR R6). Conversely, however, not all data in the current FHIR version may be available in a prior version because some profiles and data classes are not present in the previous version, especially for FHIR DSTU2.
* The FHIR RESTful resource types supported in a prior DSTU2 or R4 implementation **SHOULD** be supported in a R6 implementation:
  - Exceptions
    - MedicationStatement may be deprecated, and the data **SHOULD** be mapped to MedicationRequest.
       - See the guidance on the [Medication List] page for how to access a patient's medications
    - Care teams as represented by CarePlan in DSTU2 **SHOULD** be replaced by and the data mapped to CareTeam in R6
* Servers **SHOULD** make available the same information in DSTU2, R4, and R6 where possible (for example, Patient/123 is available in all versions).
  - see above Exceptions
* Data **SHOULD** be maintained between versions (i.e., not be degraded).
* When updating between versions, Clients **SHOULD** consider the impact of any changes to data visualization on the usability for the end user and the maintenance of data integrity.

### Authorization Across Versions

- Separate authorization is required
   - There is no expectation that authorization will work across different version-specific endpoints. For example, a DSTU2 authorization may not work on an R4 or R6 endpoint. Therefore, reauthorization may be required when migrating between versions.
      - Maintaining the same auth Server for multiple endpoints so that the refresh token is valid for different FHIR Version endpoints may be possible, but not in scope.
- The more recent version endpoints will have additional/changed resource types and thus added scopes. For example US Core DeviceAssociation Profile has been added support the changes from FHIR R4 to FHIR R6.















{% include link-list.md %}