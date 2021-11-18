

### US Core Social Determinant of Health Vocabulary Design Notes (Problem, Goal, Procedure, and Service Request)


The ONC US Core Data for Interoperability (USCDI) v2 update in July 2021 includes several social determinants of health concepts, including problems, goals, procedures, and service requests. The pre-existing[ HL7 Accelerator Gravity Project](https://www.hl7.org/gravity/) was developed to identify and harmonize social risk factor data.

The Gravity Implementation Guides use very fine grained value sets across specific social risk factor domains. Within problems, goals, procedures, and service requests, US Core uses grouping value sets that contain the same concept codes that are in the Gravity value sets.



* [Social Determinants of Health Conditions Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.788/expansion)
* [Social Determinants of Health Procedures Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.789/expansion)
* [Social Determinants of Health Goals Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.71/expansion)
* [Social Determinants of Health Service Requests Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.790/expansion)_._

{% include img.html img="sdoh_condition.svg" caption="Graphic of Example of SDOH Grouping Value set in VSAC (Conditions)" %}



### Social Determinants of Health Assessment (US Core)

Assessment Screenings can represent a structured evaluation of risk (e.g., PRAPARE, Hunger Vital Sign, AHC-HRSN screening tool) for any Social Determinants of Health domain such as food, housing, or transportation security. The assessment scale responses are represented in US Core with [US Core Screening Response Observation Profile](http://hl7.org/fhir/us/core/StructureDefinition/us-chttp://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-observation-screening-response.html). The [US Core Simple Social History Assessment Observation Profile](http://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-observation-social-history-assessment.html) is for simple observations made by an individual during the course of care about a patient's social history status. Both can contribute to the identification of SDOH Problems (Conditions) or Observations or can be the reason for Service Requests or Procedures.

US Core does not intend to replicate the complexities and robustness of the FHIR Questionnaire and QuestionnaireResponse resources developed for SDOH assessment screening tools and other questionnaires, but US Core has developed a basic starter set of LOINC SDOH Questions codes extracted from [LOINC Panel](https://loinc.org/panels/) code sets that align with commonly asked social questions in systems as identified by [FindHelp.org](https://www.findhelp.org/), a social service assistance tool.

SDOH Observations and Survey Screenings and the resultant plans and interventions are foundational towards improving a person's overall health and wellness when confronted with health problems.

{% include img.html img="sdoh_assessment.svg" caption="SDOH Assessment and Planning Process" %}
