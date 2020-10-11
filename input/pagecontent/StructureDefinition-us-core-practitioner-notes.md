
- The syntax used to describe the interactions is described [here](general-guidance.html#search-syntax).
- See the [General Guidance] section for additional rules and expectations when a server requires status parameters.
- See the [General Guidance] section for additional guidance on searching for multiple patients.

#### Mandatory Search Parameters:

The following search parameters and search parameter combinations SHALL be supported.:

1. **SHALL** support searching for a practitioner by a string match of any part of name using the **[`name`](SearchParameter-us-core-practitioner-name.html)** search parameter:

    `GET [base]/Practitioner?name=[string]`

    Example:

      1. GET [base]/Practitioner?name=Smith

    *Implementation Notes:* Fetches a bundle of all Practitioner resources matching the name ([how to search by string])

1. **SHALL** support searching a practitioner by an identifier such as an NPI using the **[`identifier`](SearchParameter-us-core-practitioner-identifier.html)** search parameter:

    `GET [base]/Practitioner?identifier={system|}[code]`

    Example:

      1. GET [base]/Practitioner?identifier=http://hl7.org/fhir/sid/us-npi\|97860456

    *Implementation Notes:* Fetches a bundle containing any Practitioner resources matching the identifier ([how to search by token])





{% include link-list.md %}
