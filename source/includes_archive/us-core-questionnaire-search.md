
#### Mandatory Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators] and [chained parameters] SHALL be supported.  the  modifiers, comparators and chained parameters that are listed as optional SHOULD be supported.:


1. **SHALL** support searching using the **`_id`** search parameter:

  `GET [base]/Questionnaire[id]`

  *Implementation Notes:* example for testing (how to search by the [logical id] of the resource)

1. **SHALL** support searching using the **`url`** search parameter:

  `GET [base]/Questionnaire?url=[uri]`

  *Implementation Notes:* example for testing (how to search by [uri])

1. **SHALL** support searching using the **`status`** search parameter:

  `GET [base]/Questionnaire?status={[system]}|[code]`

  *Implementation Notes:* example for testing (how to search by [token])

1. **SHALL** support searching using the **`title`** search parameter:
  - including optional support these modifiers: `foo, bar2`
  - including support for these comparators: `contains, foo, bar`
  - including support for these chained parameters: `contains, foo, bar`
    - and optional support these chained parameter: `foo, bar2`

  `GET [base]/Questionnaire?title{:foo|bar2|foo|bar2}={contains|foo|bar}[string]`

  *Implementation Notes:* example for testing (how to search by [string])

1. **SHALL** support searching using the **`publisher`** search parameter:
  - including support for these modifiers: `contains`

  `GET [base]/Questionnaire?publisher=[string]`

  *Implementation Notes:* example for testing (how to search by [string])

1. **SHALL**  using the combination of the  **`publisher and status`** search parameters:

  `GET [base]/Questionnaire?publisher=[string]&status=[token]`

  Example: 

  *Implementation Notes:*  (how to search by [token] and [string])



#### Optional Search Parameters:

The following search parameters, search parameter combinations and search parameter [modifiers], [comparators] and [chained parameters] SHOULD be supported.

1. **SHOULD** support searching using the **`version`** search parameter:

  `GET [base]/Questionnaire?version={[system]}|[code]`

  *Implementation Notes:* example for testing (how to search by [token])

1. **SHOULD** support searching using the **`context-type-value`** search parameter:

  `GET [base]/Questionnaire?context-type-value=`

  *Implementation Notes:* example for testing (how to search by [composite])

1. **SHOULD** support searching using the combination of the  **`context-type-value and publisher`** search parameters:

  `GET [base]/Questionnaire?context-type-value=[composite]&publisher=[string]`

  Example: 

  *Implementation Notes:* . (how to search by [composite] and [string])

1. **SHOULD** support searching using the combination of the  **`context-type-value and publisher and status`** search parameters:

  `GET [base]/Questionnaire?context-type-value=[composite]&publisher=[string]&status=[token]`

  Example: 

  *Implementation Notes:* . (how to search by [token] and [composite] and [string])

1. **SHOULD** support searching using the combination of the  **`context-type-value and status`** search parameters:

  `GET [base]/Questionnaire?context-type-value=[composite]&status=[token]`

  Example: 

  *Implementation Notes:* . (how to search by [token] and [composite])

1. **SHOULD** support searching using the combination of the  **`publisher and status and version`** search parameters:

  `GET [base]/Questionnaire?publisher=[string]&status=[token]&version=[token]`

  Example: 

  *Implementation Notes:* . (how to search by [token] and [string])

1. **SHOULD** support searching using the combination of the  **`publisher and version`** search parameters:

  `GET [base]/Questionnaire?publisher=[string]&version=[token]`

  Example: 

  *Implementation Notes:* . (how to search by [token] and [string])

1. **SHOULD** support searching using the combination of the  **`status and title and version`** search parameters:

  `GET [base]/Questionnaire?status=[token]&title{:foo|bar2|foo|bar2}={contains|foo|bar}[string]&version=[token]`

  Example: 

  *Implementation Notes:* . (how to search by [token] and [string])

1. **SHOULD** support searching using the combination of the  **`status and version`** search parameters:

  `GET [base]/Questionnaire?status=[token]&version=[token]`

  Example: 

  *Implementation Notes:* . (how to search by [token])

1. **SHOULD** support searching using the combination of the  **`title and version`** search parameters:

  `GET [base]/Questionnaire?title{:foo|bar2|foo|bar2}={contains|foo|bar}[string]&version=[token]`

  Example: 

  *Implementation Notes:* . (how to search by [token] and [string])


{% include link-list.md %}