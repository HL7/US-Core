
The following operations and search parameters have been defined for the US Core Implementation Guide.  For more information on the [FHIR RESTful operations], [FHIR RESTful search api] and the standard [Search Param Registry] see the FHIR specification.

### Operations

  {% include list-simple-operationdefinitions.xhtml %}

<br />

### Search Parameters

NOTE: The following search parameters **SHALL NOT** be interpreted on their own as requirements for server.  The CapabilityStatement defines the search capabilities expectations for the US Core Server. This section lists the search parameters definitions that are used within the CapabilityStatement.  This is not a list of search requirements for the client or server.
{:.bg-warning}

#### New Search Parameters defined by this Implementation Guide

**CareTeam**
- {:.new-content}[`role`]

**Condition**
- {:.new-content}[`asserted-date`]

**Encounter**
- {:.new-content}[`discharge-disposition`]

**Goal**
- {:.new-content}[`description`]

**Patient**
- [`race`]
- [`ethnicity`]
- {:.new-content}[`gender-identity`]


#### Search Parameters derived from the Base FHIR Specification

These US Core SearchParameters are derived from the Base FHIR Specification to define the expectations for the following SearchParameter elements:

- [`multipleAnd`]
- [`multipleOr`]
- [`comparator`]
- [`modifier`]
- [`chain`]

{% include uscore_sp_list.md %}

{% include link-list.md %}
