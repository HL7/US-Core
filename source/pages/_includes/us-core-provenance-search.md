- See the [General Guidance] section for additional rules and expectations when a server requires status parameters.
- See the [General Guidance] section for additional guidance on searching for multiple patients.

#### Mandatory Search Parameters:

The following search parameters, search parameter combinations SHALL be supported.  Any listed search parameter [modifiers], [comparators], [chains] and [composites] SHALL also be supported UNLESS they are listed as "optional" in which case they SHOULD be supported.:

1. **SHALL** support searching for all resources of a particular type for a patient and all the Provenance records for those resources using a combination of the `patient` parameter for that resource and the **[`us-core-includeprovenance`](SearchParameter-us-core-includeprovenance.html)** search parameter:

    1.  `GET [base]/[Resource]?patient=[id]&us-core-includeprovenance`

    Example:

      1. GET [base]/AllergyIntolerance?patient=1233541&us-core-includeprovenance

    *Implementation Notes:* Fetches a bundle of all resources of a particular type for the specified patient ([how to search by reference]) and any corresponding Provenance resources.

1. **SHALL** support searching for a particular resource and all its Provenance resources using combination of the `_id` parameter and the **[`us-core-includeprovenance`](SearchParameter-us-core-includeprovenance.html)** search parameter:

    `GET [base]/[Resource]?_id=[id]&us-core-includeprovenance`

    Example:

      1. GET [base]/AllergyIntolerance?_id=[id]&us-core-includeprovenance

    *Implementation Notes:* Fetches a bundle of a resource of a particular type (within the clients authorization scope) and any corresponding Provenance resources. ([how to search by token])

{% include link-list.md %}
