<!--
---
title: My SDOH Page Edits
tags: USCDI v2
---

# My SDOH Page Edits

:::info
1. introduction:  
    - [X] uscdi introduce SDOH
    - [X] purpose and intent of US Core in re to SDOH  - data access
    - [X] contract to SDOH guide - orchestration and population
    - [X] we map to these existing and new profiles
    - [X] assist and guidance from gravity
1. Overview of how they intertwine using Gay;s Image
    - [X] SDOH guidance on population image
1. Vocabulary vs gravity using Gays
     -  [X] common category - group all the Gravity domains
1. Assessments common set of concepts
      - [X] starter Set
      - acknowledge Aunt Bertha
      - [X] see Gravity for ongoing more complete vocablet to extend
1. Example searches
    2. [X] How access with examples
:::
-->
<div markdown="1" class="new-content">

This US Core Social Determinant of Health (SDOH) Guidance Page has been added in response to  United States Core Data for Interoperability (USCDI) V2 updates that the Office of the National Coordinator (ONC) published by the Office of the National Coordinator (ONC) in July of 2021. The new data elements include:
- SDOH Assessments
- SDOH Goals
- SDOH Interventions
- SDOH Problems/Health Concerns

This page documents how the US Core Profile can be use to represent these elements.

</div>

### Purpose and Intent

The intent of adding these SDOH data elements to US Core is to be able to use US Core Profiles along with a defined set of FHIR RESTful interactions to represent and access SDOH patient data.  This is in contrast to the [SDOH Clinical Care](http://hl7.org/fhir/us/sdoh-clinicalcare/) HL7 Implementation Guide. This guide was developed by the [Gravity Project](https://hl7.org/gravity) and documents the orchestration of SDOH data capture and related interventions and how it is represented using FHIR.  US Core Profile span across use cases and thus less constrained, but they form backbone for the SDOH Clinical Care Profiles.  Many of the additions to US Core Profiles to meet the SDOH data element requirements are based on the efforts by the Gravity led project.  In the following sections the interrelation between the SDOH elements is summarized and how each element is represented in US Core documented.

### SDOH Activities

The figure below shows how the SDOH elements are inter-related:

- **SDOH Assessment**: SDOH Assessments represent the recording of SDOH assessment screening tools and other questionnaires as well as individual clinical observations.  These assessments are represented by the [US Core Social History Assessment Observation Profile] and [US Core Screening Response Observation Profile]
- **SDOH Problems/Health Concerns**: Identifying a Social Determinants of Health-related condition (for example, homelessness) is represented by the [US Core Condition Profile].
- **SDOH Interventions**:  Services offered to a patient to address identified Social Determinants of Health problems/health concerns,(for example, referral to transportation support programs) are represented by the [US Core ServiceRequest Profile].  IN addition, the [US Core Procedure Profile] can be used to record a completed service or intervention.
- **SDOH Goals**: Identifies a future desired condition or change in condition related to an SDOH risk (for example, Has adequate quality meals and snacks) and is represented by [US Core Goal Profile]

{% include img.html img="sdoh_assessment.svg" caption="SDOH Activities" %}

### SDOH Terminology in US Core

#### Category Codes

The LOINC "grouping" code: [LG41762-2](http://details.loinc.org/LOINC/LG41762-2.html) "Social Determinants Of Health" is used to categorize SDOH for Assessments, Problem, and Service Requests. This concept enables API consumers to be able to separate out SDOH data when accessing patient information. Alternatively, clients may find it more efficient to query based on a specific codeor set of codes (for example, `Condition.code`) or request all of a patient's resources for a particular type and filter by code(s) to access items of interest.

#### Codes for Problems/HealthConcerns, Goals, Service Requests, and Procedures

For the SDOH Clinical Care HL7 Implementation Guide, the Gravity project has defined the following value sets across specific social risk factor domains for problems/health concerns, goals, procedures, and service requests:

* [Social Determinants of Health Conditions Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.788/expansion)
* [Social Determinants of Health Procedures Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.789/expansion)
* [Social Determinants of Health Goals Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1247.71/expansion)
* [Social Determinants of Health Service Requests Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1196.790/expansion)

US Core uses broadly defined value sets that contain concepts that are used across many use cases including SDOH. The Figure below illustrates how the US Core Problem code valueset is compatible with the Gravity value sets.   When recording SDOH data US Core Profiles, servers **SHOULD** use the SDOH value sets listed above.

{% include img-med.html img="sdoh_condition.svg" caption="Example of SDOH Grouping Value set in US Core Condition Code Value Set" %}

#### Assessment Codes

Assessment Screenings can represent a structured evaluation of risk (e.g., PRAPARE, Hunger Vital Sign, AHC-HRSN screening tool) for any Social Determinants of Health domain such as food, housing, or transportation security. The assessment scale responses are represented in US Core with [US Core Screening Response Observation Profile]. The [US Core Simple Social History Assessment Observation Profile] is for simple observations made by an individual during the course of care about a patient's social history status. Both can contribute to the identification of SDOH Problems (Conditions) or Observations or can be the reason for Service Requests or Procedures.

US Core has developed [US Core Common SDOH Assessments ValueSet] - commonly asked social questions as identified by [FindHelp.org](https://company.findhelp.com/), a social service assistance tool. This is not intend to replicate the complexities and robustness of the FHIR Questionnaire and QuestionnaireResponse resources developed for SDOH assessment screening tools and other questionnaires.  The Gravity Project is working on a more comprehensive set of codes to meet these challenges. A future version of this guide may leverage that work to supplement this valueset.

### Searching for SDOH Patient Data

Below is an examples of FHIR RESTful search transaction to access a patient's SDOH assessment data.

- Observation type = Observation
- Patient's FHIR_id = "example"
- Observation category = "LG41762-2"

{% include SDOH_search_transaction.md %}

{% include link-list.md %}
