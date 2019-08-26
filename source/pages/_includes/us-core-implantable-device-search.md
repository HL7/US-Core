
- See the [General Guidance] section for additional rules and expectations when a server requires status parameters.
- See the [General Guidance] section for additional guidance on searching for multiple patients.

#### Mandatory Search Parameters:

The following search parameters, search parameter combinations SHALL be supported.  Any listed search parameter [modifiers], [comparators], [chains] and [composites] SHALL also be supported UNLESS they are listed as "optional" in which case they SHOULD be supported.:

1. **SHALL** support searching for all devices for a patient, including implantable devices using the **[`patient`](SearchParameter-us-core-device-patient.html)** search parameter:

    `GET [base]/Device?patient=[reference]`

    Example:
    
      1. GET [base]/Device?patient=1137192

    *Implementation Notes:* Fetches a bundle of all Device resources for the specified patient ([how to search by reference])


#### Optional Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators], [chains] and [composites] SHOULD be supported.

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-device-patient.html)** and **[`type`](SearchParameter-us-core-device-type.html)** search parameters:

    `GET [base]/Device?patient=[reference]&type={[system]}|[code]`

    Example:
    
      1. GET [base]/Device?patient=1316024&amp;type=http://snomed.info/sct\|468063009

    *Implementation Notes:* Fetches a bundle of all Device resources for the specified patient and type.  ([how to search by reference] and [how to search by token])

{% include link-list.md %}