{% include quickstart-intro.md %}

#### Mandatory Search Parameters:

The following search parameters, search parameter combinations SHALL be supported.  Any listed search parameter [modifiers], [comparators], [chains] and [composites] SHALL also be supported UNLESS they are listed as "optional" in which case they SHOULD be supported:

1. **SHALL** support searching for all US Core Profile resource types  [listed above](#prov-white-list) for a patient and all the Provenance records for those resources using a combination of the `patient` and **[`_revinclude`]** search parameters:

    `GET [base]/[Resource]?patient=[id]&_revinclude=Provenance:target`

    Example:

      1. GET [base]/AllergyIntolerance?patient=[id]5&_revinclude=Provenance:target

    *Implementation Notes:* Fetches a bundle of all resources of a particular type for the specified patient ([how to search by reference]) and any corresponding Provenance resources.

1. **SHALL** support searching for a particular instance of a US Core Profile resource type [listed above](#prov-white-list) and all its Provenance resources using combination of the `_id` and the **[`_revinclude`]** search parameters:

    `GET [base]/[Resource]?_id=[id]&_revinclude=Provenance:target`

    Example:

      1. GET [base]/AllergyIntolerance?_id=[id]&_revinclude=Provenance:target

      *Implementation Notes:* Fetches a bundle of a resource of a particular type (within the clients authorization scope) and any corresponding Provenance resources. ([how to search by token])

{% include link-list.md %}
