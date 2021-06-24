
#### Mandatory Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators] and [chained parameters] SHALL be supported.  the  modifiers, comparators and chained parameters that are listed as optional SHOULD be supported:


1. **SHALL** support searching for all allergies for a patient using the **`_id`** search parameter:

  `GET [base]/AllergyIntolerance[id]`

  Example: GET [base]/AllergyIntolerance?patient=1137192

  *Implementation Notes:* Fetches a bundle of all AllergyIntolerance resources for the specified patient (how to search by the [logical id] of the resource)





{% include link-list.md %}