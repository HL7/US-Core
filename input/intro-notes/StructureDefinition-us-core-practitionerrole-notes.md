{% include quickstart-intro.md %}

#### Mandatory Search Parameters:

The following search parameters and search parameter combinations SHALL be supported:

1. **SHALL** support searching practitioner role by specialty using the **[`specialty`](SearchParameter-us-core-practitionerrole-specialty.html)** search parameter:

    - including optional support for these `_include` parameters: `PractitionerRole:endpoint,PractitionerRole:practitioner`

    `GET [base]/PractitionerRole?specialty={system|}[code]`

    Example:
    
      1. GET [base]/PractitionerRole?specialty=http://nucc.org/provider-taxonomy\|208D0000X

    *Implementation Notes:* Fetches a bundle containing  PractitionerRole resources matching the specialty ([how to search by token])

1. **SHALL** support searching practitioner role by practitioner name and identifier using chained parameters using the **[`practitioner`](SearchParameter-us-core-practitionerrole-practitioner.html)** search parameter:

    - including support for these chained parameters: `practitioner.identifier,practitioner.name`
    - including optional support for these `_include` parameters: `PractitionerRole:endpoint,PractitionerRole:practitioner`

    `GET [base]/PractitionerRole?practitioner={Type/}[id]`

    Example:
    
      1. GET [base]/PractitionerRole?practitioner.identifier=http://hl7.org/fhir/sid/us-npi\|97860456&amp;_include=PractitionerRole:practitioner&amp;_include=PractitionerRole?endpoint
      1. GET [base]/PractitionerRole?practitioner.name=Henry&amp;_include=PractitionerRole:practitioner&amp;_include=PractitionerRole?endpoint

    *Implementation Notes:* Fetches a bundle containing  PractitionerRole resources matching the chained parameter practitioner.name or practitioner.identifier.**SHOULD** support the _include for PractitionerRole.practitioner and PractitionerRole.endpoint. ([how to search by reference])





{% include link-list.md %}