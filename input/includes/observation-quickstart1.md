{% include quickstart-intro.md %}

- The syntax used to describe the interactions is described [here](general-guidance.html#search-syntax).
- See the [General Guidance] section for additional rules and expectations when a server requires status parameters.
- See the [General Guidance] section for additional guidance on searching for multiple patients.

#### Mandatory Search Parameters:

The following search parameters and search parameter combinations SHALL be supported:

1. **SHALL** support searching using the combination of the **[`patient`](SearchParameter-us-core-observation-patient.html)** and **[`category`](SearchParameter-us-core-observation-category.html)** search parameters:

    `GET [base]/Observation?patient={Type/}[id]&category={% raw %}{{% endraw %}{{include.system | default: 'system'}}|}{{include.category | default: '[category]'}}`

    Example:

      1. GET [base]/Observation?patient=1134281&amp;category={% if include.system %}{{include.system }}\|{% endif %}{{include.category | default: '[category]'}}

    *Implementation Notes:* Fetches a bundle of all Observation resources for the specified patient and a category code = `{{include.category | default: '[category]'}}` ([how to search by reference] and [how to search by token])

1. **SHALL** support searching using the combination of the **[`patient`](SearchParameter-us-core-observation-patient.html)** and **[`code`](SearchParameter-us-core-observation-code.html)** search parameters:
    - including optional support for *OR* search on `code` (e.g.`code={system|}[code],{system|}[code],...`)

    `GET [base]/Observation?patient={Type/}[id]&code={system|}[code]{,{system|}[code],...}`

    Example:

      1. GET [base]/Observation?patient=1134281&amp;code=http://loinc.org\|{{include.code1 | default: '[code]'}}
      {% if include.code2 %}2. GET [base]/Observation?patient=1134281&amp;code=http://loinc.org\|{{include.code1 | default: '[code]'}},http://loinc.org\|{{include.code2 | default: '[code]'}},http://loinc.org\|{{include.code3 | default: '[code]'}}{% endif %}

    *Implementation Notes:* Fetches a bundle of all Observation resources for the specified patient and observation code(s).  SHOULD support search by multiple report codes. The Observation `code` parameter searches `Observation.code only. ([how to search by reference] and [how to search by token])

2. **SHALL** support searching using the combination of the **[`patient`](SearchParameter-us-core-observation-patient.html)** and **[`category`](SearchParameter-us-core-observation-category.html)** and **[`date`](SearchParameter-us-core-observation-date.html)** search parameters:
    - including support for these `date` comparators: `gt,lt,ge,le`
    - including optional support for *AND* search on `date` (e.g.`date=[date]&date=[date]]&...`)

    `GET [base]/Observation?patient={Type/}[id]&category={% raw %}{{% endraw %}{{include.system | default: 'system'}}|}{{include.category | default: '[category]'}}&date={gt|lt|ge|le}[date]{&date={gt|lt|ge|le}[date]&...}`

    Example:

      1. GET [base]Observation?patient=555580&amp;category={% if include.system %}{{include.system }}\|{% endif %}{{include.category | default: '[category]'}}&amp;date=ge2018-03-14T00:00:00Z

    *Implementation Notes:* Fetches a bundle of all Observation resources for the specified patient and date and a category code = `{{include.category | default: '[category]'}}` ([how to search by reference] and [how to search by token] and [how to search by date])


#### Optional Search Parameters:

The following search parameter combinations SHOULD be supported:

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-observation-patient.html)** and **[`category`](SearchParameter-us-core-observation-category.html)** and **[`status`](SearchParameter-us-core-observation-status.html)** search parameters:
    - including support for *OR* search on `status` (e.g.`status={system|}[code],{system|}[code],...`)

    `GET [base]/Observation?patient={Type/}[id]&category={% raw %}{{% endraw %}{{include.system | default: 'system'}}|}{{include.category | default: '[category]'}}&status={system|}[code]{,{system|}[code],...}`

    Example:

      1. GET [base]/Observation?patient=1134281&amp;category={% if include.system %}{{include.system }}\|{% endif %}{{include.category | default: '[category]'}}&amp;status=final

    *Implementation Notes:* Fetches a bundle of all Observation resources for the specified patient and category = `{{include.category | default: '[category]'}}` and status ([how to search by reference] and [how to search by token])

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-observation-patient.html)** and **[`code`](SearchParameter-us-core-observation-code.html)** and **[`date`](SearchParameter-us-core-observation-date.html)** search parameters:
    - including optional support for *OR* search on `code` (e.g.`code={system|}[code],{system|}[code],...`)
    - including support for these `date` comparators: `gt,lt,ge,le`
    - including optional support for *AND* search on `date` (e.g.`date=[date]&date=[date]]&...`)

    `GET [base]/Observation?patient={Type/}[id]&code={system|}[code]{,{system|}[code],...}&date={gt|lt|ge|le}[date]{&date={gt|lt|ge|le}[date]&...}`

    Example:

      1. GET [base]Observation?patient=555580&amp;code=http://loinc.org\|{{include.code1 | default: '[code]'}}&amp;date=ge2019-01-01T00:00:00Z

    *Implementation Notes:* Fetches a bundle of all Observation resources for the specified patient and date and report code(s).  SHOULD support search by multiple report codes. ([how to search by reference] and [how to search by token] and [how to search by date])



{% include link-list.md %}
