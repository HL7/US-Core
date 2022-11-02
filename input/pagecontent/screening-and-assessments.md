This page is new content for US Core Version 6.0.0
{:.new-content}

This US Core Screenings and Assessments Guidance page outlines how to implement the Office of the National Coordinator (ONC) United States Core Data for Interoperability (USCDI) v3 data class Health Status and Assessments. In US Core 5.0.1, this guidance page focused exclusively on Social Determinant of Health (SDOH) and the data elements: SDOH Assessments, SDOH Goals, SDOH Interventions, and SDOH Problems/Health Concerns. The new USCDI v3 elements include:
- Functional Status
- Disability Status
- Mental/Cognitive Status


This page documents how US Core Profiles can be used to represent these elements and the SDOH elements.{:.new-content}

### Purpose and Intent

Screenings and Assessments aren’t unique to social needs, and this page reflects the variety of instruments clinical systems may support. US Core Profiles along with a defined set of FHIR RESTful interactions are defined here, and formally in the profiles, to represent and access functional status, disability status, mental/cognitive Status, SDOH patient data.
This is in contrast to the [SDOH Clinical Care](http://hl7.org/fhir/us/sdoh-clinicalcare/) HL7 Implementation Guide. The SDOH Clinical Care guide was developed by the [Gravity Project](https://hl7.org/gravity) and documents the orchestration of SDOH data capture and related interventions and how it is represented using FHIR. US Core Profiles span across use cases and thus are less constrained, but they form the backbone for the Clinical Care Profiles. Many of the additions to US Core Profiles to meet the SDOH data element requirements are based on the efforts by the Gravity led project. In the following sections the interrelation between the SDOH elements and how US Core represents them is summarized.


### Activities

The figure below shows how screenings, assessments, and referrals (requests) relate to provide the services required by a patient.

- **Screening and Assessments**: Prior to delivering appropriate clinical care an accurate [Screening and Assessment](#screening-and-assessments) is necessary. US Core defines three observations to support this process:
	- US Core Screening and Assessment Component Observation - individual question and answer.
	- US Core Screening and Assessment Panel Observation - panel of screening and assessment components that were collected together.
	- US Core Clinical Judgment Observation - clinician decision to document a specific item - “patient has problems with housing". Note, this observation is only appropriate when the judgment isn’t appropriate on the list of Problems or Health Concerns.
- **Problems/Health Concerns**: Identifying a Health-related condition (for example, homelessness), Disability concern, or Functional concern, is represented by the [US Core Condition Problems and Health Concerns Profile]. A category code of `sdoh` can be assigned by the server to support discovery of Social Determinants of Health  Problems/Health Concerns.
- **Interventions**:  Services offered to a patient to address problems/health concerns are represented by the [US Core ServiceRequest Profile].  When the ServiceRequest is for an identified Social Determinants of Health (for example, referral to transportation support programs) the ServiceRequest.category is set to `sdoh`. In addition, the [US Core Procedure Profile] can be used to record a completed service or intervention.
- **Goals**: Identifying and defining a future desired condition or change in condition related to an SDOH risk (for example, Has adequate quality meals and snacks) is represented by [US Core Goal Profile]

{% include img.html img="screening_and_assessments.svg" caption="Screening and Assessment Activities" %}

### Screening and Assessments

Screening and Assessments can represent a simple observation or a structured evaluation to identify a specific problem or health concern. The guidance here was developed after reviewing several functional status, disability status, mental/cognitive status, and SDOH screening and assessment tools.

US Core defines two profiles to support Assessment Screening tools:

1. Component Observation*: <-- insert link to updated US Core Screening and Assessment Component Observation
1. Panel Observation : <-- insert link to updated US Core Screening and Assessment Panel Observation

US Core Servers **SHALL** support:
- ADD NEW US Core Screening and Assessment Component Observation
- ADD NEW US Core Screening and Assessment Panel Observation

When an Assessment Screening tool includes a total score it **SHALL** be included as a separate Component Observation.

Additionally US Core defines a ADD NEW US Core Clinical Judgment Observation to support a simple assertion. This observation is optional since some systems always record Judgment as a Problem or Health Concern. When a Problem or Health Concern is recorded based on an Assessment Screening tool Systems **SHOULD** associated it with the Panel Observation (Condition.evidence)

 This Observation can contribute to the identification of future Problems or Health Concerns and can support Service Requests or Procedures.

Note that use of the QuestionnaireResponse resource is no longer recommended for Assessment Screening tools.

\*Not all questions and answers in an assessment tool may or should be represented as FHIR Observations. For example, patient demographic information is best represented in the FHIR patient resource.
{:.bg-info}


#### Assessment Screenings Using Observations

**NEEDS TO BE REWRITTEN ONCE WE FINALIZE PROFilE NAMES** To meets the USCDI v2+ requirements for SDOH Assessments, US Core defines the [US Core Observation Survey Profile] and the [US Core Observation SDOH Assessment Profile].  The [US Core Observation Survey Profile] is defined to record responses from a survey or a questionnaire for *any* context including SDOH.  The [US Core Observation SDOH Assessment Profile] is derived from the [US Core Observation Survey Profile] and constrains the category and terminology to SDOH. To keep related data together and preserve the survey structure, these profiles can be used to represent multi-question "panels" of responses, individual responses (including multi-select or "check all that apply" responses).  The figure below illustrates the relationship between the Observation survey "panel" and the individual Observations survey responses. Each box represents an Observation using either profile:

{% include img-med.html img="uscore-survey-structure.svg" caption="Relationship Between Survey Response Observations" %}

Note that the panels can be nested to create additional groupings of responses.  See the [US Core Observation Survey Profile] profile page for detailed documentation on how the observations are linked, examples, and search requirements.

The Observations may be extracted from QuestionnaireResponse. The [SDOH Clinical Care] guide define how SDOH data captured in a QuestionnaireResponse can be extracted and used to create or update Observations or other FHIR resources.
{:.bg-info}

#### Assessment Screenings Using QuestionnaireResponse

For recording and exchanging Assessment Screening tools, US Core 5.0.1 required support for Observation, and recommended support for QuestionnaireResponse. 

Promoting two different ways to exchange a common set of data forces Clients to support both, and complicates future FHIR Write efforts.

Additional compliexities when both are allowed:
- Who is responsible for transforming from QuestionnaireResponse to Observations if a server only supports Observations?
- How does a Client query for individual questions if a server only stores in QuestionnaireResponse? (FHIR Core design doesn't support individual question query into QuestionnaireResponse)
- How do we avoid clinical safety issues with clinical information spread across two resources?

US Core 6.0.0 avoids these compliexities by only requiring Observation support.
 


Remove below...
Survey instruments may be represented by a Questionnaire including a FHIR Questionnaire. A FHIR QuestionnaireResponse captures the responses to the survey and may be stand-alone or may point to the definition of the questions in a questionnaire (typically a FHIR Questionnaire). The US Core QuestionnaireResponse Profile which is based on the [Structured Data Capture (SDC) Questionnaire Response Profile] is  used to capture, exchange and persist the response data. It represents the response data to the individual questions on the form and is ordered and grouped corresponding to the structure and grouping of the Questionnaire being responded to.  Although QuestionnaireResponse can be searched using the standard FHIR RESTful API search parameters, individual responses are not directly searchable in QuestionnaireResponse. In order to search directly for and individual responses, they must be “parsed” into a searchable form - i.e. to a local FHIR or non-FHIR data store such as a database or FHIR Observations.

The basic workflow for the creation, discovery and retrieval and data-extraction of FHIR Questionnaire and QuestionnaireResponse is thoroughly documented in the [Structured Data Capture (SDC)] specification.
{:.bg-info}

See the [US Core QuestionnaireResponse Profile] profile page for detailed documentation, examples and search requirements.

#### Searching for SDOH Patient Data

Below is a simple example of FHIR RESTful search transaction on Observation to access a patient's SDOH assessment data

{% include examplebutton.html example="SDOH_search_transaction" b_title = "Click on Here To See Search Example" %}

### Terminology

#### Category Codes

The US Core code "sdoh" is used to categorize SDOH for Assessments, Problems, Service Requests and QuestionnaireResponse. This concept enables API consumers to be able to separate out SDOH data when accessing patient information. Example searches are shown in each of the profile *Quick Start* sections.

 <span class="bg-warning" markdown="1">Clients need to understand that data categorization is somewhat subjective. The categorization applied by the source may not align with the client's expectations. Clients may find it more useful to use queries based on a specific code or set of codes or to perform additional client side filtering of query results.</span><!-- bg-warning -->

#### Codes for Problems/HealthConcerns, Goals, Service Requests, and Procedures

For the SDOH Clinical Care HL7 Implementation Guide, the Gravity project has defined the following value sets across specific social risk factor domains for problems/health concerns, goals, procedures, and service requests:

* [Social Determinants of Health Conditions Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.788/expansion)
* [Social Determinants of Health Procedures Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.789/expansion)
* [Social Determinants of Health Goals Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.71/expansion)
* [Social Determinants of Health Service Requests Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.790/expansion)

US Core uses broadly defined value sets that contain concepts that are used across many use cases including SDOH. The Figure below illustrates how the Gravity value sets are grouped for use in the US Core Condition Problems and Health Concerns Profile and how the grouped valueset is compatible with the US Core Problem code valueset.   When recording SDOH data US Core Profiles, servers **SHOULD** use the SDOH value sets listed above.

{% include img-med.html img="sdoh_condition.svg" caption="Example of SDOH Grouping Value set in US Core Condition Codes Value Set" %}

#### Assessment Codes
US Core has created the [US Core Common SDOH Assessments] ValueSet - commonly asked social questions as identified by [FindHelp.org], a social service assistance tool, and  the PRAPARE, Hunger Vital Sign, AHC-HRSN screening tools referenced in USCDI v2+. This is not intended to replicate the complexities and robustness of the FHIR Questionnaire and QuestionnaireResponse resources developed for SDOH assessment screening tools and other questionnaires.  The Gravity Project is working on a more comprehensive set of codes to meet these challenges and this guide may leverage that work in the future.

---

[^1]: As documented in [Future of US Core], US Core may add more detailed work information such as Occupational Data for Health (ODH) in future versions.

{% include link-list.md %}
