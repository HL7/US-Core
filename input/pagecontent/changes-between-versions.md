
### Introduction

With each major version of FHIR, the core data models have changed.  The FHIR core specification provides a [base resource differential] to help implementers navigate version changes.  However, there are additional considerations for the user and developer experience when transitioning from [FHIR Version DSTU2] to FHIR R4.   Similarly, US Core undergoes annual updates, which are documented on the [US Core Roadmap] page. Each update to a new version of US Core changes the US Core Profiles and conformance expectations. The following guidance on this page is provided to ensure a smoother upgrade path. It reflects non-normative best practices established at the time of publication.

### Versioning of US Core

US Core undergoes annual updates with new guidance, requirements, profiles, and changes to existing content. The [Directory of published versions] lists the publication history with links to each version of US Core.  The [Change Log] documents the changes across the versions of US Core. The [Argonaut Data Query] guide was published separately and is not included in the directory or change log.

<div class="bg-success" markdown="1">

When a change is identified that impacts ASTP Certification, a tracker will be designated as "patch", which allows the certification tools to implement the change immediately. A new release of US Core will be considered if a large number of "patches" are required. Patches for prior US Core versions are managed by the [Cross Group Project patch process] with approved patches on this [HL7 Confluence page].

### US Core Maturity Levels

All US Core conformance and terminology artifacts are assigned a US Core Maturity Level. Implementers can use these levels to assess the level of advancement and stability of an artifact.

#### Profiles, Extensions, and Operations
The US Core Maturity Levels are assigned to US Core profiles, extensions, and operations based on the following criteria:

- **US Core Maturity Level 5**: Level 5 is assigned to US Core profiles and extensions that have been present before the publication of US Core 3.1.1 in 2020, and have been thoroughly reviewed through the HL7 ballot and other processes, and widely implemented in production systems. Many of these artifacts are also identified in regulation and subject to ASTP certification testing. These artifacts are sufficiently stable, and forward compatibility is enforced.
- **US Core Maturity Level 4**: Level 4 is assigned to US Core artifacts meeting all the US Core Maturity Level 5 Criteria, but were published after or significantly changed since US Core 3.1.1. These artifacts are sufficiently stable, and forward compatibility is enforced.
- **US Core Maturity Level 3**: Level 3 is assigned to US Core artifacts meeting all the US Core Maturity Level 4 or US Core Maturity Level 5 Criteria, but not yet widely used in production systems. Forward compatibility is not enforced.
- **US Core Maturity Level 2**: Level 2 is assigned to US Core artifacts that have not been identified in regulation or subject to ASTP certification, and not widely implemented in production systems. Forward compatibility is not enforced
- **US Core Maturity Level 1**: There are no Level 1 artifacts in US Core

#### SearchParameters

**US Core Maturity Level 5** is assigned to US Core SearchParameters. They are sufficiently stable, and forward compatibility is enforced. See the [Search Parameters and Operations] page for how SearchParameters defined in US Core are used.

#### ValueSets, CodeSystems, and CapabilityStatements

**US Core Maturity Level 3** is assigned ValueSets, CodeSystems, and CapabilityStatements. These artifacts are dynamic with each version of US Core. Therefore, forward compatibility is not enforced. For more information on ValueSet and CodeSystem versions, see the [Terminology] page.

</div><!-- new-content -->

### Cross Version Comparisons

The table below summarizes the different profiles and resource types between Argonaut Data Query and major releases of US Core :

{% include dstu2-r4-table2.md %}

Detailed comparisons between the US Core artifacts in this current {{site.data.fhir.igVer}} version of US Core and each previous major release are provided in the links below:

- [Comparison with version 8.0.1](comparison-v8.0.1/index.html)
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

A Server may support Version DSTU2 and Argonaut Data Query or FHIR R4 and US Core ver 3.1.1+ or both. A Server may make explicit which version of Argo/US Core is on their FHIR endpoint (e.g., "DSTU2" or "R4" path component or separate files based on version). However, the best practice is to inspect the [endpoint metadata](http://hl7.org/fhir/R4/http.html) on each endpoint to discover the information about a Server's capabilities, including the FHIR version and the US Core Profile version that is supported:

`GET [base]/metadata{?mode=[mode]} {&_format=[mime-type]}`

### No Guarantee that Resource IDs are Preserved

<span class="bg-success" markdown="1">Servers **SHOULD** maintain a stable common identifier for a resource across versions. When the FHIR resource ID or business identifier of the underlying clinical data is not maintained across FHIR versions, the Client **SHALL** use an alternative method to avoid duplication, such as the guidance provided in the [Interoperable Digital Identity and Patient Matching](https://hl7.org/fhir/us/identity-matching/) Implementation Guide.</span><!-- new-content -->

### Expectation that <span class="bg-success" markdown="1">Data is Preserved Between Versions</span><!-- new-content -->

In an upgraded R4 endpoint, any data in FHIR DSTU2 **SHOULD** be in FHIR R4. However, not all data in R4 may be available in DSTU2 because some profiles and data classes, like Clinical Notes and pediatric observations, are not part of DSTU2.

* The FHIR RESTful resource types supported in a DSTU2 implementation **SHOULD** be supported in a R4 implementation
  - Exceptions
    - MedicationStatement may be deprecated, and the data **SHOULD** be mapped to MedicationRequest.
       - See the guidance on the [Medication List] page for how to access a patient's medications
    - Care teams as represented by CarePlan in DSTU2 **SHOULD** be replaced by and the data mapped to CareTeam in R4

* Servers **SHOULD** make available the same information in DSTU2 and R4 where the more recent standard allows.  (e.g., patient Rhonda Jones is available on both)
  - Exceptions
    - MedicationStatement data mapped to MedicationRequest
    - care teams, as represented by CarePlan, **SHOULD** be mapped to CareTeam in R4
* Data **SHOULD** be maintained between versions (i.e., not be degraded).
* When updating between versions, Clients **SHOULD** consider the impact of any changes to data visualization on the usability for the end user and the maintenance of data integrity.


### Authorization Across Versions

<div class="bg-success" markdown="1">

- To allow clients to use a single authorization token when accessing resources from multiple version-specific endpoints, production systems **SHOULD** use the same base authorization endpoint across versions.
- The more recent version endpoints will have additional/changed resource types and thus added scopes. For example, US Core may add a DeviceAssociation Profile when updating from FHIR R4 to FHIR R6.
</div><!-- new-content -->

{% include link-list.md %}