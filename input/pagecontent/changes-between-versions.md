
### Introduction

With each major version of FHIR, the core data models have changed.  The FHIR core specification provides a [base resource differential] to help implementers navigate version changes.  However, there are additional considerations for the user and developer experience when transitioning from [FHIR Version DSTU2] to FHIR R4.   Similarly, US Core undergoes annual updates, which are documented on the [Future of US Core] page. Each update to a new version of US Core changes the US Core Profiles and conformance expectations. The following guidance on this page is provided to ensure a smoother upgrade path. It reflects non-normative best practices established at the time of publication.

### Versioning of US Core

US Core undergoes annual updates with new guidance, requirements, profiles, and changes to existing content. The [Directory of published versions] lists the publication history with links to each version of US Core.  The [Change Log] documents the changes across the versions of US Core. The [Argonaut Data Query] guide was published separately and is not included in the directory or change log.

Work is underway to identify corrections in subsequent versions as "patches" to prior versions for ONC Certification.

### Cross Version Comparisons

The table below summarizes the different profiles and resource types between Argonaut Data Query and major releases of US Core :

{% include dstu2-r4-table2.md %}

Detailed comparisons between the FHIR artifacts in this current {{site.data.fhir.igVer}} version of US Core and each previous major release are provided in the links below:

...

{% include link-list.md %}
