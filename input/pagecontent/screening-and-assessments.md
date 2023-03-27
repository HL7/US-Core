
This page documents how US Core Profiles can represent screenings and assessments. The  [Gravity Project]) published the [SDOH Clinical Care] HL7 Implementation Guide, which documents the orchestration of SDOH data capture and related interventions and how to represent it using FHIR. These efforts led to many additions to US Core 5.0.1 updates to meet the [USCDI v2] Social Determinant of Health (SDOH) data elements: SDOH Assessments, SDOH Goals, SDOH Interventions, and SDOH Problems/Health Concerns. Since screenings and assessments are not unique to social needs,  US Core  6.0.0+  Profiles and the FHIR RESTful interactions documented below span across use cases and thus are less constrained and form the backbone for the Clinical Care Profiles. They provide a general framework for all domains which use screenings are assessments, including the [USCDI v2]  and [USCDI v3] data classes:
- SDOH
- Functional Status
- Disability Status
- Mental/Cognitive Status.

### Related Activities in Clinical Care

The figure below shows how <span class="bg-success" markdown="1">screening and assessments lead to providing services for a patient.</span><!-- new-content -->

- **Screening and Assessments**: [Screening and Assessment](#screening-and-assessments) <span class="bg-success" markdown="1">are used to identify problems before delivering appropriate clinical care.</span><!-- new-content -->:
    - <span class="bg-success" markdown="1">[US Core Simple Observation Profile]</span><!-- new-content -->
    - <span class="bg-success" markdown="1">The [US Core Observation Screening Assessment Profile]</span><!-- new-content -->
    - <span class="bg-success" markdown="1">The [SDC Base Questionnaire]/[US Core QuestionnaireResponse Profile]</span><!-- new-content -->
- **Problems/Health Concerns**: Identifying a Health-related condition (for example, homelessness), Disability concern, or Functional concern is represented by:
  - The [US Core Condition Problems and Health Concerns Profile].
- **Interventions**:  The [US Core ServiceRequest Profile] communicates services offered to patients to address problems/health concerns. The [US Core Procedure Profile] can also record a completed service or intervention.
- **Goals**: Identifying and defining a future desired condition or change in condition (for example, Has adequate quality meals and snacks) is represented by [US Core Goal Profile].

<div class="bg-success" markdown="1">
{% include img.html img="argo_proposed_screening_and_assessments.png" caption="Screening and Assessment Activities" %}
</div><!-- new-content -->

### Screening and Assessments

Screening and Assessments are used to identify various problems or health concerns. Their complexity ranges from simple observations to complex structured evaluations: 

- Clinician makes a 'clinical judgment' - I found patient has this problem
- Clinician completes and shares detailed assessments. <span class="bg-success" markdown="1">(see, for example, [PRAPARE]) </span><!-- new-content -->
- Clinician makes a 'clinical judgment' based on detailed assessment.

The following guidance was developed after reviewing several functional status, disability status, mental/cognitive status, and SDOH screening and assessment tools.


#### <span class="bg-success" markdown="1">Clinical Judgments</span><!-- new-content -->

Systems record clinical judgments <span class="bg-success" markdown="1">(for example, "patient X has this problem")</span><!-- new-content --> as:
- a problem or health concerns
- as observation

<span class="bg-success" markdown="1">Every server that supports the USDCI Data Class "Health Status/Assessments" **SHALL** support representing clinical judgments.  Systems that support clinical judgments as as a problem or health concerns **SHALL** support the [US Core Condition Problems and Health Concerns Profile].  Systems that support clinical judgments as observations **SHALL** support the [US Core Simple Observation Profile] to represent these findings. </span><!-- new-content --> These observation can contribute to the identification of future problems or health concerns and support service requests and procedures. When a Simple Observation or Problem or Health Concern is recorded based on an Assessment or Screening tool, systems **SHOULD** associate it with the US Core Observation Screening and Assessments observation or <span class="bg-success" markdown="1">US Core QuestionnaireResponse Profile.</span><!-- new-content -->

<div class="bg-success" markdown="1">
#### Structured Screening an Assessments

Screening and Assessments can be structured survey instruments consisting of questions with a variety of response including true/false, coded, textual, and  multiple choice.  Examples include [PRAPARE], [APGAR] and [PHQ-9]. To meet the USCDI Assessments data class requirements, US Core defines two ways to represent the questions and responses to these screening and assessment instruments:

- Observation: [The US Core Observation Screening Assessment Profile]
- Questionnaire/QuestionnaireResponse: [SDC Base Questionnaire]/[US Core QuestionnaireResponse Profile]

Systems *SHOULD* support all three profiles for USDCI Data Class Health Status/Assessments.  The table below summarizes the differences in conformance requirements for these profiles between version 5.0.1 and 6.0.0 of US Core

US Core Profile|5.0.1|6.0.0
---|---|---
The US Core Observation Screening Assessment Profile|SHALL(US Core Observation SDOH Assessment Profile)|SHOULD
SDC Base Questionnaire|MAY|SHOULD
US Core QuestionnaireResponse Profile|undefined|SHOULD
{:.grid}

The sections below provide additional guidance on when Observations and Questionnaire/QuestionnaireResponse can be used to represent the structured screenings and assessments.

</div><!-- new-content -->

##### <span class="bg-success" markdown="1">US Core Observation Screening Assessment Profile</span><!-- new-content -->

<span class="bg-success" markdown="1">
[US Core Observation Screening Assessment Profile] is defined to record responses from screening or assessments for *any* context.  A web of related observations preserves the structure of a screening or assessment instrument. Note that not all questions and answers in an assessment tool may or should be represented as FHIR Observations. For example, the FHIR patient resource best represents patient demographic information. The figure below illustrates the relationship between the Observation screening and assessments "panel" and the individual screening and assessment "item" Observations. Each box represents an Observation:</span><!-- new-content -->

{% include img-med.html img="uscore-observation-assessment-structure.svg" caption="Relationship Between Screening and Assessment Observations" %}

Note that the panels can be nested to create additional groupings of responses. See the [US Core Observation Screening Assessment Profile] profile page for detailed documentation on how the observations are linked, examples, and search requirements.

###### Searching for Screening and Assessment Data

Below is a simple example of a FHIR RESTful search transaction on Observation to access a patient's SDOH assessment data

{% include examplebutton.html example="SDOH_search_transaction" b_title = "Click on Here To See Search Example" %}

##### <span class="bg-success" markdown="1">SDC Base Questionnaire/US Core QuestionnaireResponse Profile</span><!-- new-content -->

<div class="bg-success" markdown="1">
Screening and assessment instruments may be represented as questionnaires including FHIR Questionnaires. The [US Core QuestionnaireResponse Profile] (based on the [Structured Data Capture (SDC) Questionnaire Response Profile]) is used to capture, exchange and persist the response data. It represents the answers to the screening and assessment questions represented in the [SDC Base Questionnaire] and is ordered and grouped corresponding to the Questionnaire. 
 Although QuestionnaireResponse can be searched using the standard FHIR RESTful API search parameters, individual responses are not directly searchable in QuestionnaireResponse. In order to search directly for and individual responses, they must be “parsed” into a searchable form - i.e. to a local FHIR or non-FHIR data store such as a database or FHIR Observations.
 US Core Observation Screening Assessment can be extracted from US Core QuestionnaireResponse. The basic workflow for the creation, discovery and retrieval and data-extraction of FHIR Questionnaire and QuestionnaireResponse is thoroughly documented in the Structured Data Capture (SDC) specification. In addition, the SDOH Clinical Care guides define how SDOH data captured in a QuestionnaireResponse can be extracted and used to create or update Observations or other FHIR resources.

See the US Core QuestionnaireResponse Profile profile page for detailed documentation, examples and search requirements.
</div><!-- new-content -->

### Terminology

#### Category Codes

The [US Core Assessment Category Value Set] categorizes contexts for Assessments, Problems, and Service Requests. These concepts enable API consumers to select contexts (for example, SDOH) when accessing patient information. Example searches are shown in each profile's *Quick Start* sections.

 <span class= "bg-warning" markdown= "1">Clients need to understand that data categorization is somewhat subjective. The categorization applied by the source may not align with the client's expectations. Clients may find it more beneficial to use queries based on a specific code or set of codes or to perform additional client-side filtering of query results.</span><!-- bg-warning -->

#### Codes for Problems/HealthConcerns, Goals, Service Requests, and Procedures

For the SDOH Clinical Care HL7 Implementation Guide, the Gravity project has defined the following value sets across specific social risk factor domains for problems/health concerns, goals, procedures, and service requests:

* [Social Determinants of Health Conditions Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.788/expansion)
* [Social Determinants of Health Procedures Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.789/expansion)
* [Social Determinants of Health Goals Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.71/expansion)
* [Social Determinants of Health Service Requests Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.790/expansion)

US Core uses broadly defined value sets that contain concepts used across many use cases, including SDOH. The figure below illustrates how the Gravity value sets are grouped for use in the US Core Condition Problems and Health Concerns Profile and how the grouped valueset is compatible with the US Core Problem code valueset.   When recording SDOH data US Core Profiles, servers **SHOULD** use the SDOH value sets listed above.

{% include img-med.html img="sdoh_condition.svg" caption=" Example of SDOH Grouping Value set in US Core Condition Codes Value Set" %}

---

{% include link-list.md %}