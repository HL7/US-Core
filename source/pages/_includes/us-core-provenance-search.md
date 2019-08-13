

#### Mandatory Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators], [chains] and [composites] SHALL be supported.  The  modifiers, comparators, chains and composites that are listed as optional SHOULD be supported.:

1. **SHALL** support requesting all Provenance records for a Patient and resource type using search paramater `us-core_includeProvenance`:

    1.  `GET [base]/[Resource]?patient=[id]&us-core_includeProvenance`

    Example:

      1. GET [base]/AllergyIntolerance?patient=[id]&us-core_includeProvenance

    *Implementation Notes:* Fetches a bundle of all resources of a particular type for the specified patient ([how to search by reference]) and any corresponding Provenance resources.

1. **SHALL** support searching for Provenance records using a specific resource using search paramater `us-core_includeProvenance`:

    `GET [base]/[Resource]?_id=[id]&us-core_includeProvenance`

    Example:

      1. GET [base]/AllergyIntolerance?_id=[id]&us-core_includeProvenance

    *Implementation Notes:* Fetches a bundle of all resources of a particular type (within the clients authorization scope) and any corresponding Provenance resources. ([how to search by reference])


#### Optional Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators], [chains] and [composites] SHOULD be supported.

{% include link-list.md %}
