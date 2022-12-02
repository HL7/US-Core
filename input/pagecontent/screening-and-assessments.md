This page is new content for US Core Version 6.0.0
{:.new-content}

This page documents how US Core Profiles can represent screenings and assessments. The  [Gravity Project]) published the [SDOH Clinical Care] HL7 Implementation Guide, which documents the orchestration of SDOH data capture and related interventions and how to represent it using FHIR. These efforts led to many additions to US Core 5.0.1 updates to meet the [USCDI v2] Social Determinant of Health (SDOH) data elements: SDOH Assessments, SDOH Goals, SDOH Interventions, and SDOH Problems/Health Concerns. Since screenings and assessments are not unique to social needs,  US Core  6.0.0+  Profiles and the FHIR RESTful interactions documented below span across use cases and thus are less constrained and form the backbone for the Clinical Care Profiles. They provide a general framework for all domains which use screenings are assessments, including the [USCDI v2]  and [USCDI v3] data classes:
- SDOH
- Functional Status
- Disability Status
- Mental/Cognitive Status.

### Related Activities in Clinical Care

The figure below shows how screenings, assessments, and referrals (requests) relate to providing the services required by a patient.

- **Screening and Assessments**: An accurate [Screening and Assessment](#screening-and-assessments) is necessary before delivering appropriate clinical care. US Core defines two observations to support this process:
    - [US Core Observation Screening Assessment Profile] - represents the questions and responses to screening and assessment tools. It can represent a single response, multiple responses, and multi-select "check all that apply" type questions. 
    - [US Core Simple Observation Profile] - a clinician's decision to document a specific item - "patient has problems with housing". Note this observation is only appropriate when the judgment isn't appropriate on the list of Problems or Health Concerns.
- **Problems/Health Concerns**: Identifying a Health-related condition (for example, homelessness), Disability concern, or Functional concern is represented by the [US Core Condition Problems and Health Concerns Profile]. 
- **Interventions**:  The [US Core ServiceRequest Profile] communicates services offered to patients to address problems/health concerns. The [US Core Procedure Profile] can also record a completed service or intervention.
- **Goals**: Identifying and defining a future desired condition or change in condition (for example, Has adequate quality meals and snacks) is represented by [US Core Goal Profile].

{% include img.html img="screening_and_assessments.svg" caption="Screening and Assessment Activities" %}

### Screening and Assessments

Screening and Assessments are used to identify various problems or health concerns. Their complexity ranges from simple observations to complex structured evaluations: 

- Clinician makes a 'clinical judgment' - I found patient has this problem
- Clinician completes and shares detailed assessments 
- Clinician makes a 'clinical judgment' based on detailed assessment.

The following guidance was developed after reviewing several functional status, disability status, mental/cognitive status, and SDOH screening and assessment tools.

#### US Core Observation Screening an Assessments Profile

To meet the requirements for USCDI v3 data class Health Status and Assessments and SDOH Assessments, US Core defines the [US Core Observation Screening Assessment Profile] to support questions and responses to screening and assessment tools when an assessment is done. It can represent a single response, multiple responses, and multi-select "check all that apply" type questions. It also records a total score when a screening or assessment tool includes one. US Core Servers **SHALL** support the [US Core Observation Screening Assessment Profile] for recording screening and assessments.

The [US Core Observation Screening Assessment Profile] is defined to record responses from screening or assessments for *any* context. In addition, the profile defines references to other screening and assessment observations. A web of related observations is grouped using these references, and the structure is preserved. The figure below illustrates the relationship between the Observation screening and assessments "panel" and the individual screening and assessment Observations. Each box represents an Observation:

{% include img-med.html img="uscore-observation-assessment-structure.svg" caption="Relationship Between Screening and Assessment Observations" %}

Note that the panels can be nested to create additional groupings of responses. See the [US Core Observation Screening Assessment Profile] profile page for detailed documentation on how the observations are linked, examples, and search requirements.

Not all questions and answers in an assessment tool may or should be represented as FHIR Observations. For example, the FHIR patient resource best represents patient demographic information.
{:.bg-info}

#### US Core Observation Simple Observation Profile

Systems record clinical judgments as a problem or health concerns or as observations. For systems that support clinical judgments as observations, US Core defines a [US Core Simple Observation Profile] to represent these findings (for example, "I found patient X has this problem"). US Core Servers **MAY** support this profile. This observation can contribute to the identification of future problems or health concerns and support service requests and procedures. When a Simple Observation or Problem or Health Concern is recorded based on an Assessment or Screening tool, systems **SHOULD** associate it with the US Core Observation Screening and Assessments observation.

#### What About QuestionnaireResponse?

In US Core 5.0.1, systems could optionally support the US Core QuestionnaireResponse Profile for SDOH Assessments. In US Core 6.0.0+, the US Core QuestionnaireResponse Profile has been removed.

The rationale for this decision is summarized below:

- Promoting two different ways to exchange the same data forces Clients to support both structures and complicates future FHIR Write efforts.
- Transforming QuestionnaireResponse to Observations is necessary if a system only supports Observations.
- Clients can not query individual responses in QuestionnaireResponse.
- Potential clinical safety issues with information spread across two resources.
 
#### Searching for Screening and Assessment Data

Below is a simple example of a FHIR RESTful search transaction on Observation to access a patient's SDOH assessment data

{% include examplebutton.html example="SDOH_search_transaction" b_title = "Click on Here To See Search Example" %}

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