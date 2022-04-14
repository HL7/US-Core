{% include quickstart-intro.md %}

- The syntax used to describe the interactions is described [here](general-guidance.html#search-syntax).
- See the [General Guidance] section for additional rules and expectations when a server requires status parameters.
- See the [General Guidance] section for additional guidance on searching for multiple patients.

#### Mandatory Search Parameters:

The following search parameters and search parameter combinations SHALL be supported:

1. **SHALL** support fetching a QuestionnaireResponse using the **[`_id`](SearchParameter-us-core-questionnaireresponse-id.html)** search parameter:

    `GET [base]/QuestionnaireResponse[id]`

    Example:
    
      1. GET [base]/QuestionnaireResponse/AHC-HRSN-screening-example
      1. GET [base]/QuestionnaireResponse/?_id=AHC-HRSN-screening-example

    *Implementation Notes:*  ([how to search by the logical id] of the resource)

1. **SHALL** support searching for all questionnaireresponses for a patient ...combo description field ...DOES THIS DO ANYTHING? using the **[`patient`](SearchParameter-us-core-questionnaireresponse-patient.html)** search parameter:

    `GET [base]/QuestionnaireResponse?patient={Type/}[id]`

    Example:
    
      1. GET [base]/QuestionnaireResponse?patient=1032702

    *Implementation Notes:* Fetches a bundle of all QuestionnaireResponse resources for the specified patient ([how to search by reference])


#### Optional Search Parameters:

The following search parameter combinations SHOULD be supported:

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-questionnaireresponse-patient.html)** and **[`status`](SearchParameter-us-core-questionnaireresponse-status.html)** search parameters:
    - including support for *OR* search on `status` (e.g.`status={system|}[code],{system|}[code],...`)

    `GET [base]/QuestionnaireResponse?patient={Type/}[id]&status={system|}[code]{,{system|}[code],...}`

    Example:
    
      1. GET [base]/QuestionnaireResponse?patient=1137192&amp;status=completed

    *Implementation Notes:* Fetches a bundle of all QuestionnaireResponse resources for the specified patient and status ([how to search by reference] and [how to search by token])

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-questionnaireresponse-patient.html)** and **[`_tag`](SearchParameter-us-core-questionnaireresponse-tag.html)** search parameters:

    `GET [base]/QuestionnaireResponse?patient={Type/}[id]&_tag=sdoh`

    Example:
    
      1. GET [base]/QuestionnaireResponse?patient=1137192&amp;_tag=sdoh

    *Implementation Notes:* Fetches a bundle of all QuestionnaireResponse resources for the specified patient and  _tag= &#39;sdoh&#39; ([how to search by reference] and [how to search by token])

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-questionnaireresponse-patient.html)** and **[`authored`](SearchParameter-us-core-questionnaireresponse-authored.html)** search parameters:
    - including support for these `authored` comparators: `gt,lt,ge,le`
    - including optional support for *AND* search on `authored` (e.g.`authored=[date]&authored=[date]]&...`)

    `GET [base]/QuestionnaireResponse?patient={Type/}[id]&authored={gt|lt|ge|le}[date]{&authored={gt|lt|ge|le}[date]&...}`

    Example:
    
      1. GET [base]/QuestionnaireResponse?patient=113192&amp;date=ge2021

    *Implementation Notes:* Fetches a bundle of all QuestionnaireResponse resources for the specified patient and date ([how to search by reference] and [how to search by date])

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-questionnaireresponse-patient.html)** and **[`_tag`](SearchParameter-us-core-questionnaireresponse-tag.html)** and **[`authored`](SearchParameter-us-core-questionnaireresponse-authored.html)** search parameters:
    - including support for these `authored` comparators: `gt,lt,ge,le`
    - including optional support for *AND* search on `authored` (e.g.`authored=[date]&authored=[date]]&...`)

    `GET [base]/QuestionnaireResponse?patient={Type/}[id]&_tag=sdoh&authored={gt|lt|ge|le}[date]{&authored={gt|lt|ge|le}[date]&...}`

    Example:
    
      1. GET [base]/QuestionnaireResponse?patient=113192&amp;date=ge2021&amp;_tag=sdoh

    *Implementation Notes:* Fetches a bundle of all QuestionnaireResponse resources tagged as &#39;sdoh&#39; for the specified patient and date ([how to search by reference] and [how to search by token] and [how to search by date])

1. **SHOULD** support searching using the combination of the **[`patient`](SearchParameter-us-core-questionnaireresponse-patient.html)** and **[`questionnaire`](SearchParameter-us-core-questionnaireresponse-questionnaire.html)** search parameters:

    `GET [base]/QuestionnaireResponse?patient={Type/}[id]&questionnaire={Type/}[id]`

    Example:
    
      1. GET [base]/QuestionnaireResponse?patient=113192&amp;questionnaire=http://hl7.org/fhir/us/sdoh-clinicalcare/Questionnaire/SDOHCC-QuestionnaireHungerVitalSign

    *Implementation Notes:* Fetches a bundle of all QuestionnaireResponse resources for the specified patient that have been completed against a specified form. ([how to search by reference])



{% include link-list.md %}