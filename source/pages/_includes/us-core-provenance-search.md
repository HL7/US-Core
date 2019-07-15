

#### Mandatory Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators], [chains] and [composites] SHALL be supported.  The  modifiers, comparators, chains and composites that are listed as optional SHOULD be supported.:

1. **SHALL** support requesting all Provenance records for a Patient annd resource type using `_revinclude`:

    1.  `GET [base]/[Resource]?patient=[id]&_revInclude=Provenance:target`

    Example:
    
      1. GET [base]/AllergyIntolerance?patient=[id]&_revInclude=Provenance:target

    *Implementation Notes:* Fetches a bundle of all AllergyIntolerance resources for the specified patient ([how to search by reference]) and any corresponding Provenance resources.

1. **SHALL** support searching for Provenance records using a specific resource and `_revinclude`:

    `GET [base]/[Resource]?_id=[id]&_revinclude=Provenance:target`

    Example:
    
      1. GET [base]/AllergyIntolerance?_id=[id]&_revinclude=Provenance:target

    *Implementation Notes:* Fetches a bundle of all AllergyIntolerance resources for the specified patient ([how to search by reference])


#### Optional Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators], [chains] and [composites] SHOULD be supported.

{% include link-list.md %}