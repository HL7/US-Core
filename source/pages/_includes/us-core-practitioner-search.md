


#### Mandatory Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators] and [chained parameters] SHALL be supported.  the  modifiers, comparators and chained parameters that are listed as optional SHOULD be supported.:


1. **SHALL** support searching for a practitioner by a string match of any part of name using the **[`name`](SearchParameter-us-core-practitioner-name.html)** search parameter:

    `GET [base]/Practitioner?name=[string]`

  Example: GET [base]/Practitioner?name=Smith

  *Implementation Notes:* Fetches a bundle of all Practitioner resources matching the name ([how to search by string])

1. **SHALL** support searching a practiitioner by an identifier such as an NPI using the **[`identifier`](SearchParameter-us-core-practitioner-identifier.html)** search parameter:

    `GET [base]/Practitioner?identifier={[system]}|[code]`

  Example: GET [base]/Practitioner?identifier=http://hl7.org/fhir/sid/us-npi%7C1497860456

  *Implementation Notes:* Fetches a bundle containing any Practitioner resources matching the identifier ([how to search by token])





{% include link-list.md %}