
#### Searching QuestionnaireResponse by Context

Searching a patient's QuestionnaireResponses by specific context such as those defined in [US Core Category] can be achieved by querying the metadata on the associated Questionnaire. Specifically, [`Questionnaire.useContext`] with a code="focus" and value of "sdoh"/"functionalStatus"/etc. could be accomplished using a chained search:

`GET [base]/QuestionnaireResponse?subject=Patient/123&questionnaire.context-type-value=focus$sdoh`
