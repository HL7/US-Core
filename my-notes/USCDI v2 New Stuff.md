---
tags: USCDI v2
title: USCDI v2 New Stuff Slides
---

# USCDI v2 New Stuff

[![hackmd-github-sync-badge](https://hackmd.io/DF6JwJ72Q7e-1Zw40L9FLA/badge)](https://hackmd.io/DF6JwJ72Q7e-1Zw40L9FLA)


---

![](https://i.imgur.com/84xKUeG.png)

---

References:
- ONC [USCDI website](https://www.healthit.gov/isa/united-states-core-data-interoperability-uscdi#uscdi-v2)
- ONC U[SCDI v2 PDF](https://www.healthit.gov/isa/sites/isa/files/2021-07/USCDI-Version-2-July-2021-Final.pdf) and [ONC Standards Bulletin](https://www.healthit.gov/sites/default/files/page/2021-07/Standards_Bulletin_2021-3.pdf) (includes clear indicators of ‘what’s new)
- [Gravity SDOH IG Continous Build](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/). Target publication August. 
- [US Core v4.0.0](http://hl7.org/fhir/us/core/)
- [Gender Harmony Project](https://confluence.hl7.org/display/VOC/The+Gender+Harmony+Project)

---

<!-- .slide: style="font-size: 20px;" -->

### Open questions to ONC:

1. Date of Diagnosis vs ~~Onset date~~.
    1. Michelle (Cerner) requesting ONC to clarify 
        1. Onset Date
        2. AssertedDate
        3. Recorded Date (original)
        4. Record Date (localsystem)

   >ONC Response – ONC maintains the current definition of Date of Diagnosis and have communicated that with the working groups responsible for updating appropriate exchange standards FHIR US Core and C-CDA to insure accurate representation of this data element in future versions of these standards.

    1. :heavy_check_mark: physical location of *where* the encounter occurred or
    2. :x: location of organization *which* provided the service?</br>
    
    ** Michelle (Cerner) requesting ONC to further clarify IF PLACE were encounter took place vs PLACE of organization **
    
1. Clinical Tests - Request ONC Clarification if "performed" includes pending tests after registered with service or ordered tests as well ( in other words before the service even know about them)?

1. CareTeam.location
    1. Relevant to encounter?
    2. Relevant to organizatoin?
    3. Relevant to provider?

1. What does SDOH Assessment mean (see the conflicted an confused wording surrounding this  in the USCDI v2 below):
 :thinking_face: ”_is this meant to be:_

    * _only the A&P sections of a (SOAP) clinical note?_
    *  _diagnoses/conditions/functional impairments because the definition refers to "conclusions"?_ (More likely SDOH Problems/Health Concerns- see below)
    * (We are leaning towards this one) _a formal "assessment instrument" such as those required by CMS in post acute care ( e.g the results of a PRAPARE, Hunger Vital Sign, AHC-HRSN screening tool)?_
   *   _an activity performed (e.g. assessing readiness for return to work or sport)?_ (More likely SDOH Interventions, Procedures - see below)
    *  _the whole Care Plan/Plan of Care?_
    *  _or something altogether different?_”

---

## SDOH

----

### SDOH Assessment


>Represents a health professional’s conclusions and working assumptions that will guide treatment of the patient

----


<!-- .slide: style="font-size: 20px;" -->

<table size=50%>
  <tr>
   <td><strong>DATA ELEMENT </strong>
   </td>
   <td><strong>APPLICABLE VOCABULARY STANDARD(S)</strong>
   </td>
  </tr>
  <tr>
   <td><strong>SDOH Assessment </strong>
<p>
Structured evaluation of risk (e.g., PRAPARE, Hunger Vital Sign, AHC-HRSN screening tool) for any Social Determinants of Health domain such as food, housing, or transportation security. SDOH data relate to conditions in which people live, learn, work, and play and their effects on health risks and outcomes.  
   </td>
   <td>• Logical Observation Identifiers Names and Codes (LOINC®) version 2.70 
<p>
• SNOMED International, Systematized Nomenclature of Medicine Clinical Terms (SNOMED CT®) U.S. Edition, March 2021 Release 
   </td>
  </tr>
</table>

----


<!-- .slide: style="font-size: 30px;" -->



#### US Core Proposal (assuming is *the results of a PRAPARE, Hunger Vital Sign, AHC-HRSN screening tool*)

We have discussed several different options for this (see open questions above) including Observations for summaries and/or the answers to assessment tools and/or Q/QR.  

Based on:
- Most SDOH assessment tools today don't use FHIR Q/QR for data capture 
- Difficulty in representing stored assessment tool data as QR vs Observations for most ehrs using FHIR facades
- And ability to convert QR to Observations ( with GRAVITY supported tools ).  I don't think EHRs (representing their customers)
- QR not designed for sharing data. 

There would be an undue on burden EHR's that are not supporting QR to support exchange of QR.

The proposal is to use both the:

- SDOHCC Observation Screening Response: http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-ObservationScreeningResponse.html profile.
- SDOHCC Observation Assessment:
http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-ObservationAssessment.html 

with existing US Core search criteria for Observations.

##### Next Steps

- Require a detailed review of SDOH ObservationScreeningResponse MS elements


----



### SDOH Goals


>An expressed desired health state to be achieved by a subject of care (or family/group).

----

<!-- .slide: style="font-size: 20px;" -->

<table>
  <tr>
   <td><strong>DATA ELEMENT </strong>
   </td>
   <td><strong>APPLICABLE VOCABULARY STANDARD(S)</strong>
   </td>
  </tr>
  <tr>
   <td><strong>SDOH Goals</strong>
<p>
Identifies a future desired condition or change in condition related to an SDOH risk in any domain and is established by the patient or provider. (e.g., Has adequate quality meals and snacks, Transportation security-able to access health and social needs). SDOH data relate to conditions in which people live, learn, work, and play and their effects on health risks and outcomes.
   </td>
   <td>• SNOMED International, Systematized Nomenclature of Medicine Clinical Terms (SNOMED CT®) U.S. Edition, March 2021 Release 
<p>
• Logical Observation Identifiers Names and Codes (LOINC®) version 2.70 
   </td>
  </tr>
</table>

----

#### US Core Proposal

Our original proposal added category. In subsequent discussions servers questioned whether category is helpful - 'Who will determine which goals are SDOH?', 'Will a client app only want SDOH goals?'. Rather than add a fragile `category` we propose requiring servers support search by specific goal type (`Goal.description`).

- Proposed updates to [US Core Goal Profile](http://hl7.org/fhir/us/core/StructureDefinition-us-core-goal.html)
    *  **CREATE** `Goal.description` value set with LOINC and SNOMED (extensible). Make it clear free text goals are still allowed.
    *  **Add** SHALL search criteria for `Goal.Description`    
    *  **ADD** Gravity provided SDOH goals Value Set to Implementation guidance section.
    *  *Proposal* Consider Adding `Goal.achievementStatus`
    * ~~**Add** `category` 0..1 MS~~
    *  ~~Create Value set with an **extensible binding** containing a single Code: [LG41762-2 ]~~
 



----

### SDOH Interventions

>An activity performed for or on a patient as part of the provision of care.

----

<!-- .slide: style="font-size: 20px;" -->

<table>
  <tr>
   <td><strong>DATA ELEMENT </strong>
   </td>
   <td><strong>APPLICABLE VOCABULARY STANDARD(S)</strong>
   </td>
  </tr>
  <tr>
   <td><strong>SDOH Interventions</strong>
A service offered to a patient to address identified Social Determinants of Health concerns, problems, or diagnoses (e.g.,Education about Meals on Wheels Program, Referral to transportation support programs). SDOH data relate to
conditions in which people live, learn, work, and play and their effects on health risks and outcomes.
   </td>
   <td>• SNOMED International, Systematized Nomenclature of Medicine Clinical Terms (SNOMED CT®) U.S. Edition, March 2021 Release 
<p>
• Current Procedural Terminology (CPT®) 2021, as maintained and distributed by the American Medical Association, for physician services and other health care services.
<p>
• Healthcare Common Procedure Coding System (HCPCS) Level II, as maintained and distributed by HHS.
   </td>
  </tr>
</table>

----

<!-- .slide: style="font-size: 30px;" -->


#### US Core Proposal 

**ADD** US Core ServiceRequest Profile to represent the intervention request. 

**ADD** Guidance that existing [US Core Procedure Profile](http://hl7.org/fhir/us/core/StructureDefinition-us-core-procedure.html) can be used to record a completed service or intervention. (`ServiceRequest.status=completed` only when a Procedure associated with is completed)


##### Formal Definition

Rendered output [US Core ServiceRequest Profile](https://healthedata1.github.io/Sushi-Sandbox/StructureDefinition-us-core-servicerequest.html)


<iframe src="https://healthedata1.github.io/Sushi-Sandbox/StructureDefinition-us-core-servicerequest.html" width="100%" height="500">
</iframe>

----

##### Vocabulary

###### Category

Make the existing **example** [ServiceRequest.category valueset](http://hl7.org/fhir/R4/valueset-servicerequest-category.html) for `ServicRequest.category` **extensible**.
    
|Code(SNOMED)|Display|Definition|
|---|---|---|
108252007 |	Laboratory procedure	
363679005 | Imaging	
409063005 |	Counselling	
409073007 |	Education	
387713003 |	Surgical procedure	

 plus SDOH category LG41762-2 SocialDeterminantsOfHealth (see above)
 
 (other options considered)
   - or SNOMED 410606002|Social service procedure
   - or adopt the [SDOHCC ValueSet SDOH Category](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/ValueSet-SDOHCC-ValueSetSDOHCategory.html)
    
----

###### Code

for `ServicRequest.code`, use existing the **extensible** [US Core Procedure Codes](http://hl7.org/fhir/us/core/STU4/ValueSet-us-core-procedure-code.html) 

This value set includes content from:

1. CPT 
1. SNOMED CT,
1. HCPCS Level II
1. ICD-10-PCS
1. CDT
1. LOINC

----

##### Fetch and Search Criteria:

- A Server SHALL be capable of returning a DiagnosticReport resource using: `GET [base]/ServiceRequest/[id]`

- A Server SHALL be capable of supporting the following _revincludes: Provenance:target `GET [base]/ServiceRequest?[parameter=value]&_revinclude=Provenance:target`

Search Parameter Summary:

|Conformance	Parameter|	Type|
|---|---|
SHALL|	patient	reference

Search Parameter Combination Summary:

Conformance|	Parameter Combination	|Types
---|---|---
SHOULD	|patient+ code+ occurrance|	reference+token+date
SHALL	|patient+ category	|reference+token
SHOULD	|patient+ status	|reference+token
SHALL	|patient+ category+ occurrance|	reference+token+date
SHALL	|patient+ code	|reference+token

---

### SDOH Problems/Health Concerns

>Information about a condition, diagnosis, or other event, situation, issue, or clinical concept that is documented.

----

<!-- .slide: style="font-size: 20px;" -->

<table>
  <tr>
   <td><strong>DATA ELEMENT </strong>
   </td>
   <td><strong>APPLICABLE VOCABULARY STANDARD(S)</strong>
   </td>
  </tr>
  <tr>
   <td><strong>SDOH Problems/Health Concerns</strong>
<p>
An identified Social Determinants of Health-related condition (e.g., Homelessness (finding), Lack of adequate food Z59.41, Transport too expensive (finding)). SDOH data relate to conditions in which people live, learn, work, and play and their effects on health risks and outcomes.
   </td>
   <td>• SNOMED International, Systematized Nomenclature of Medicine Clinical Terms (SNOMED CT®) U.S. Edition, March 2021 Release 
<p>
• International Classification of Diseases ICD-10-CM 2021
   </td>
  </tr>
  <tr>
</table>

----

<!-- .slide: style="font-size: 30px;" -->

#### US Core Proposal

- Requirement met with existing [US Core Condition Profile](http://hl7.org/fhir/us/core/StructureDefinition-us-core-condition.html)
    - [Condition.code](http://hl7.org/fhir/us/core/StructureDefinition-us-core-procedure-definitions.html#condition.code) 1..1 MS
    - [Condition.category](http://hl7.org/fhir/us/core/StructureDefinition-us-core-procedure-definitions.html#condition.category) 1..* MS
         - **ADD** a SDOH category code (see above)
         - **ADD** EXAMPLE search on SDOH concept (Maybe LG41762-2 SocialDeterminantsOfHealth).
         - **ADD** text to introduction explaining the imperfect use of  Condition.category -- don't want to add undue burdeen "forcing systems, or users (worse!), to stamp data with extra categories which may not be accurate". Clients may find it more efficient to request specific Conditions (`Condition.code`) or request all and then filter what they want.

{%figma https://www.figma.com/file/k4GAUMkk6fOiXnl54f4GKW/sdoh-condition %}

----

<!-- .slide: style="font-size: 20px;" -->

- existing **extensible** [US Core Condition Category Codes](http://hl7.org/fhir/us/core/ValueSet-us-core-condition-category.html) from Snomed  **extensible**. 

|Code|Display|Definition|
|---|---|---|
problem-list-item	|Problem List Item|	An item on a problem list that can be managed over time and can be expressed by a practitioner (e.g. physician, nurse), patient, or related person.
encounter-diagnosis	|Encounter Diagnosis|	A point in time diagnosis (e.g. from a physician or nurse) in context of an encounter.
health-concern	|Health Concern	|Additional health concerns from other stakeholders which are outside the provider’s problem list.
16100001|	http://snomed.info/sct|	Death diagnosis	|


----

- Existing search criteria for category 

    **SHOULD** support searching using the combination of the `patient` and `category` search parameters: 
        
    `GET [base]/Condition?patient=1032702&category=health-concern `


- **ADD** guidance on using ICD-10 codes for SDOH in implementation notes

---

## Clinical Testing and Imaging

----

### Clinical Tests

>Includes non-imaging and non-laboratory tests performed on a patient that results in structured or unstructured (narrative) findings specific to the patient, such as electrocardiogram (ECG), visual acuity exam, macular exam, or graded exercise testing (GXT), to facilitate the diagnosis and management of conditions. 

----

<!-- .slide: style="font-size: 20px;" -->

<table>
  <tr>
   <td><strong>DATA ELEMENT </strong>
   </td>
   <td><strong>APPLICABLE VOCABULARY STANDARD(S)</strong>
   </td>
  </tr>
  <tr>
   <td><strong>Clinical Test </strong>
<p>
The name of the non-imaging or non-laboratory test performed on a patient.  
   </td>
   <td>• Logical Observation Identifiers Names and Codes (LOINC®) version 2.70 
   </td>
  </tr>
  <tr>
   <td><strong>Clinical Test Result/Report</strong>
<p>
Interpreted results of clinical tests that may include study performed, reason performed, findings, and impressions. Includes both structured and unstructured (narrative) components
   </td>
   <td>
   </td>
  </tr>
</table>

----

The intent here is to be able to access everything from "pending" to "completed" results (Follow up up to ONC to clarify)

:thinking_face: How do systems support pending test statuses in FHIR? Can we just use DiagnosticReport/Observation or do we need to add orders via ServiceRequest?

1. DiagnosticReport/Observation statuses(`registered|partial|preliminary|...`)?
vs
1. ServiceRequest statuses (`active|completed|...`)?

----

<!-- .slide: style="font-size: 30px;" -->

#### US CORE Proposal

- [US Core DiagnosticReport Profile for Report and Note exchange](http://hl7.org/fhir/us/core/StructureDefinition-us-core-diagnosticreport-note.html)
- add **2 new** elements:
  1. `DiagnosticReport.result` for discrete results and
  1. the [FHIR R5 media](http://hl7.org/fhir/2021May/diagnosticreport-definitions.html#DiagnosticReport.media) extension `http://hl7.org/fhir/4.5/StructureDefinition/extension-DiagnosticReport.media` for images
- category = [US Core DiagnosticReport Category](http://hl7.org/fhir/us/core/ValueSet-us-core-diagnosticreport-category.html) (extensible)
- code = from LOINC not in Lab  (CLASSTYPE <> 1)

----

* A **new** Observation Profile based [US Core Laboratory Result Observation Profile](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab.html)
    - category = [`procedure`](http://hl7.org/fhir/codesystem-observation-category.html#observation-category-procedure)
    - code = from LOINC not in Lab  (CLASSTYPE <> 1)
    - value[x] = anything

----

<!-- .slide: style="zoom: 50%;" -->

DiagnosticReport - EKG Example

{%gist /Healthedata1/c698b31f63c2266310bdecf765af4acf %}

[Observation - EKG Example](ht}tp://hl7.org/fhir/observation-example-sample-data.json.html) (from base spec not validated)

----

### Diagnostic Imaging

>Tests that result in visual images requiring interpretation by a credentialed professional.

----

<!-- .slide: style="font-size: 20px;" -->

<table>
  <tr>
   <td><strong>DATA ELEMENT </strong>
   </td>
   <td><strong>APPLICABLE VOCABULARY STANDARD(S)</strong>
   </td>
  </tr>
  <tr>
   <td><strong>Diagnostic Imaging Test</strong>
<p>
The name of the test performed which generates visual images (radiographic, photographic, video, etc.) of anatomic structures; and requires interpretation by qualified professionals.
   </td>
   <td>• Logical Observation Identifiers Names and Codes (LOINC®) version 2.70 
   </td>
  </tr>
  <tr>
   <td><strong>Diagnostic Imaging Report</strong>
<p>
Interpreted results of imaging test that includes the study performed, reason, findings, and impressions. Includes both structured and unstructured (narrative) components.
   </td>
   <td>
   </td>
  </tr>
</table>

----

#### US CORE Proposal

* [US Core DiagnosticReport Profile for Report and Note exchange](http://hl7.org/fhir/us/core/StructureDefinition-us-core-diagnosticreport-note.html)
    - (see above)

----

* A **new** Observation Profile based [US Core Laboratory Result Observation Profile](http://hl7.org/fhir/us/core/StructureDefinition-us-core-observation-lab.html)
    - category = [`imaging`](http://hl7.org/fhir/codesystem-observation-category.html#observation-category-procedure)
    - code = from LOINC not in Lab  (CLASSTYPE <> 1)
    - value[x] = anything

----

<!-- .slide: style="zoom: 50%;" -->

Example

{%gist /Healthedata1/41349e0141d9bc512af4dbeddd695afd %}

---

## Sexual Orientation and Gender Identity

----

<!-- .slide: style="font-size: 20px;" -->

<table>
  <tr>
   <td><strong>DATA ELEMENT </strong>
   </td>
   <td><strong>APPLICABLE VOCABULARY STANDARD(S)</strong>
   </td>
  </tr>
  <tr>
   <td><strong>Sexual Orientation</strong>
<p>
A person’s identification of their emotional, romantic, sexual, or
<p>
affectional attraction to another person.
   </td>
   <td>• Sexual orientation must be coded in accordance with SNOMED CT® and HL7 Version 3 Standard, Value Sets for AdministrativeGender and NullFlavor, attributed as follows: 
<p>
• Lesbian, gay or homosexual. 38628009 
<p>
• Straight or heterosexual. 20430005 
<p>
• Bisexual. 42035005
<p>
 • Something else, please describe. nullFlavor OTH 
<p>
• Don't know. nullFlavor UNK 
<p>
• Choose not to disclose. nullFlavor ASKU Adopted at 45 CFR 170.207(o)(1)
   </td>
  </tr>
  <tr>
   <td><strong>Gender Identity</strong>
<p>
A person’s internal sense of being a man, woman, both, or neither.
   </td>
   <td>Gender Identify must be coded in accordance with SNOMED CT® and HL7 Version 3 Standard, Value Sets for AdministrativeGender and NullFlavor, attributed as follows: • Male. 446151000124109 
<p>
• Female. 446141000124107 
<p>
• Female-to-Male (FTM)/Transgender Male/Trans Man. 407377005 
<p>
• Male-to-Female (MTF)/Transgender Female/Trans Woman. 407376001 
<p>
• Genderqueer, neither exclusively male nor female. 446131000124102 
<p>
• Additional gender category or other, please specify. nullFlavor OTH 
<p>
• Choose not to disclose. nullFlavor ASKU Adopted at 45 CFR 170.207(o)(2)
   </td>
  </tr>
</table>

----

### US Core Proposal

Based on HL7 Vocabulary Gender Harmony work:

- **ADD** existing [Gender Identity Extension](http://hl7.org/fhir/R4/extension-patient-genderidentity.html) in the Patient Profile to capture record *current* gender (This simplifies client applications locating the current gender)
    - Use above valueset + "UNK"
    - **ADD** Custom Patient SearchParameter
    - **ADD** Guidance - Historically systems only had a single field to capture Patient Gender and Sex. FHIR Core is making strides to disambiguate  different [Patient Gender and Sex representations](http://hl7.org/fhir/R4/patient.html#gender). Implementations of US Core on legacy systems may return *Clinical Sex*, *Gender Identity*, or *Legal Sex* in `Patient.gender`.

- **ADD** Sexual Orientation Observation
    - Use above valueset
    - Use existing Observation search parameters

<!-- * An extension on the Patient resource for Gender Identity vs

*  A proposed approach to representing (HL7 FHIR Release 4, 2020) Clinical Gender: as “an observation about the patient

-->

----

#### Gender Identity

- see USCDI Vocabulary above with *required* binding
- Assuming "Choose not to disclose. nullFlavor ASKU" means:
     1. Patient leaves the question blank or 
     1. Patient tics the 'choose not to disclose'  
     
    and missing data uses code `UNK`

----

Example:

{%gist /Healthedata1/1e8173b9e0f6ff80015d9fc995eb7429 %}

----

<!-- .slide: style="font-size: 30px;" -->
#### Sexual orientation
- category = `social-history`
- code = [76690-7 Sexual orientation](https://loinc.org/76690-7/)
- valueCodeableConcept = see USCDI Vocabulary above with *required* binding
- Assuming "Choose not to disclose. nullFlavor ASKU" means:
     1. Patient leaves the question blank or 
     1. Patient tics the 'choose not to disclose'  
     
    and missing data  code `UNK`

----

Example:

{%gist Healthedata1/d152108a26f3226df7d92a268efff926 %}

---

## Encounter

- Encounter Type 
- Encounter Diagnosis 
- Encounter Time 
- Encounter Location 
- Encounter Disposition

----

### US Core Proposal

Requirement met with [US Core Encounter Profile](http://hl7.org/fhir/us/core/StructureDefinition-us-core-encounter.html) and [US Core Condition Profile](http://hl7.org/fhir/us/core/StructureDefinition-us-core-condition.html) and existing and **3 new** search requirements

1. `encounter`
1. `location`
1. `discharge-disposition`  (custom US Core Search Parameter!)


----

<!-- .slide: style="font-size: 30px;" -->

**DECISION** Will ADD a preferred binding to NUBC FL17 - Patient Discharge Status Code

:thinking_face: Discharge Disposition Code System?  A survey across EHR vendors did not yield a clear consensus!

*  [SE0801 Discharge Status Codes (aka, NUBC FL17)](https://www.hhs.gov/guidance/sites/default/files/hhs-guidance-documents/JA0801.pdf) (IP restrictions: AMA license to use) *preferred* binding
*   [HL7 code system for discharge disposition](http://terminology.hl7.org/CodeSystem/discharge-disposition)
*  NCQA/Quality Measures codes
*  Others

----

<!-- .slide: style="font-size: 12px;" -->

<table>
  <tr>
   <td><strong>DATA ELEMENT </strong>
   </td>
   <td><strong>US Core Profile Element</strong>
   </td>
   <td><strong>US Core Search</strong>
   </td>
  </tr>
  <tr>
   <td><strong>Encounter Type </strong>
   </td>
   <td><strong><a href="http://hl7.org/fhir/us/core/StructureDefinition-us-core-encounter-definitions.html#Encounter.type">Encounter.type</a> 1..1 MS</strong>
   </td>
   <td> <p>Combination of the <code>patient</code> and <code>type</code> search parameters.
   <p>
   <code>GET [base]/Encounter?patient=1137192&type=http://www.ama-assn.org/go/cpt code|99201</code>

   </td>
  </tr>
  <tr>
   <td><strong>Encounter Diagnosis </strong>
   <p>
   • SNOMED International, Systematized Nomenclature of Medicine Clinical Terms (SNOMED CT®) U.S. Edition, March 2021 Release 
   <p> 
• International Classification of Diseases ICD10-CM 2021
   </td>
   <td>
   <strong><a href="http://hl7.org/fhir/us/core/StructureDefinition-us-core-condition-definitions.html#Condition.code">Condition.code</a> 1..* MS</strong>
   </td>
   <td>
<p>
Query for Conditions that reference the Encounter of interest and have a category of encounter-diagnosis using the combination of the <code>patient</code>,<code>category</code>, and *<strong>new</strong>* <code>encounter</code> search parameters.
<p>
<code>GET [base]/Condition?patient=1032702&category=encounter-diagnosis&encounter=123</code>
   </td>
  </tr>
  <tr>
   <td><strong>Encounter Time </strong>
<p>
Represents a date/time related to an encounter
<p>
(e.g., scheduled appointment time, check in time,
<p>
start and stop times).
   </td>
   <td><strong><a href="http://hl7.org/fhir/us/core/StructureDefinition-us-core-encounter-definitions.html#Encounter.period">Encounter.period</a> 0..1 MS</strong>
   </td>
   <td>
   <p>Combination of the <code>patient</code> and <code>date</code> search parameters.
   <p>
   <code>GET [base]/Encounter?patient=example1&date=ge2019-01-01T00:00:00Z</code>
   </td>
  </tr>
  <tr>
   <td><strong>Encounter Location </strong>
<p>
Physical location of facility which delivered a person’s health care or related services.<strong> </strong>
   </td>
   <td><strong><a href="http://hl7.org/fhir/us/core/StructureDefinition-us-core-encounter-definitions.html#Encounter.location.location">Encounter.location.location</a> 0..1 MS</strong>
   </td>
   <td>
      <p>Combination of the <code>patient</code> and *<strong>new</strong>* <code>location</code> search parameters.
   <p>
   <code>GET [base]/Encounter?patient=example1&location=Location/123</code> 
   <p>*<strong>IF</strong>* Organization address is required then will consider  <code>Encounter.serviceProvider</code>. The Encounter location and 'organization' location are often different.
   <p>
   </td>
  </tr>
  <tr>
   <td><strong>Encounter Disposition</strong>
<p>
Identifies the location or type of facility to where the patient left following a hospital or encounter episode.
   </td>
     <td><strong><a href="http://hl7.org/fhir/us/core/StructureDefinition-us-core-encounter-definitions.html#Encounter..hospitalization.
   dischargeDisposition">Encounter..hospitalization.
   dischargeDisposition</a> 0..1 MS</strong>
   </td>
   <td>
      <p>Combination of the <code>patient</code> and *<strong>new custom</strong>* <code>discharge-disposition</code> search parameters.
   <p>
   <code>GET [base]/Encounter?patient=example1&discharge-disposition=home</code>  
   </td>
  </tr>
</table>

---

## Problems

- Problems: Date of Resolution
- Problems: Date of Diagnosis
- Encounter Diagnosis (see above)

----

### US Core Proposal
    
- Requirement met with [US Core Condition Profile](http://hl7.org/fhir/us/core/StructureDefinition-us-core-condition.html) and **3 new elements and search requirements**.

#### There is no consensus on Date of Diagnosis: :confounded: 

Three Candidates none of which captures the semantics correctly:

1. Extension: assertedDate
2. Condition.onsetDate
3. Condition.recordedDate

Last Suggestion was to make all three Must Support:
- Condition.recordedDate Must Support
- Extension: assertedDate and/or Condition.onsetDate *conditionally* Must Support
(Must support at least one)

Then instruction for determining the date of diagnosis ( or closest thing to it )
```flow
st=>start: Start
e=>end: 'Date of Diagnosis ~ assertedDate
e2=>end: Date of Diagnosis ~ onsetDate
e3=>end: Date of Diagnosis ~ recordedDate
e4=>end: Date of Diagnosis ~ either assertedDate or onsetDate
cond=>condition: assertedDate ?
cond2=>condition: onsetDate ?
cond3=>condition: onsetDate ?
st->cond
cond(yes)->cond2
cond2(yes)->e4
cond2(no)->e

```
```flow
st=>start: Start
e=>end: 'Date of Diagnosis ~ assertedDate
e2=>end: Date of Diagnosis ~ onsetDate
e3=>end: Date of Diagnosis ~ recordedDate
e4=>end: Date of Diagnosis ~ either assertedDate or onsetDate
cond=>condition: assertedDate ?
cond2=>condition: onsetDate ?
cond3=>condition: onsetDate ?
st->cond
cond(no)->cond2
cond2(yes)->e2
cond2(no)->e3

```


----

<!-- .slide: style="font-size: 20px;" -->

<table>
  <tr>
   <td><strong>DATA ELEMENT </strong>
   </td>
   <td><strong>US Core Profile Element </strong>
   </td>
   <td><strong>US Core Search</strong>
   </td>
  </tr>
  <tr>

   <td><strong>Date of Diagnosis </strong>
<p>
Date of first determination by a qualified professional of the presence of a problem or condition affecting a patient
   </td>
   <td>*<strong>new</strong>*
       <ul>
           <li>
      <a href="http://build.fhir.org/extension-condition-asserteddate.html">Extension: assertedDate</a> 0..1 (Conditional MS)
               </li>
                      <li>
      <a href="http://build.fhir.org/extension-condition-asserteddate.html">Conditon: onsetDate</a> 0..1 (Conditional MS)
               </li>
                      <li>
      <a href="http://build.fhir.org/extension-condition-asserteddate.html">Conditon: recordedDate</a> 0..1 MS
               </li>
       </ul>
       Conditional MS: At least one of is Must Support
   </td>
   <td><ul>
       <li>  *<strong>new Custom SearchParameter</strong>*<code>asserted-date</code> </li>
       <li>  *<strong>new</strong>*<code>onset-date</code></li>
       <li>  *<strong>new </strong>*<code>recorded-date</code> </li>
       </ul>
       (see below)
   </td>
  </tr>
  <tr>
   <td><strong>Date of Resolution </strong>
<p>
Date of subsiding or termination of a symptom, problem, or condition.
   </td>
   <td>*<strong>new</strong>*<a href="http://hl7.org/fhir/us/core/StructureDefinition-us-core-condition-definitions.html#Condition.abatementDateTime">Condition.abatementDateTime</a>  0..1 MS
   </td>
   <td>
   *<strong>new</strong>*<code>abatement-date</code> (see below)
   </td>
  </tr>
    <tr>

   <td><strong>Encounter Diagnosis </strong>(see above)

   </td>
   <td>*<strong>new</strong>*<a href="http://hl7.org/fhir/us/core/StructureDefinition-us-core-condition-definitions.html#Condition.encounter">Condition.encounter</a> 0..1 MS
   </td>
   <td>
  <p>
Combination of the <code>patient</code>,<code>category</code>, and *<strong>new</strong>* <code>encounter</code> search parameters.
<p>(see Encounter Diagnosis above)
   </td>
  </tr>
</table>

----

<!-- .slide: style="font-size: 30px;" -->

- SHOULD support searching using the combination of the patient and `asserted-date` search parameters:

    - including support for these `asserted-date` comparators: `gt,lt,ge,le`
    - including optional support for composite `AND` search on asserted-date (e.g.`asserted-date=[date]&asserted-date=[date]]&...`)
    
    `GET [base]Condition?patient=555580&asserted-date=ge2018-01-14`

----

- SHOULD support searching using the combination of the patient and `onset-date` search parameters:

    - including support for these `onset-date` comparators: `gt,lt,ge,le`
    - including optional support for composite `AND` search on onset-date (e.g.`onset-date=[date]&onset-date=[date]]&...`)
    
    `GET [base]Condition?patient=555580&onset-date=ge2018-01-14`

----

- SHOULD support searching using the combination of the patient and `recorded-date` search parameters:

    - including support for these `recorded-date` comparators: `gt,lt,ge,le`
    - including optional support for composite `AND` search on recorded-date (e.g.`recorded-date=[date]&recorded-date=[date]]&...`)
    
    `GET [base]Condition?patient=555580&recorded-date=ge2018-01-14`

----
<!-- .slide: style="font-size: 30px;" -->

- SHOULD support searching using the combination of the patient and `abatement-date` search parameters:

    - including support for these `abatement-date` comparators: `gt,lt,ge,le`
    - including optional support for composite AND search on `onset-date` (e.g.`abatement-date=[date]&abatement-date=[date]]&...`)

    `GET [base]Condition?patient=555580abatment-date=ge2018-01-14`

----

- SHOULD support searching using the combination of the `patient` and `category` and `encounter` search parameters:


    
    `GET [base]/Condition?patient=1032702&category=encounter-diagnosis&encounter=123
    
----    

<!-- .slide: style="zoom: 50%;" -->

Example

{%gist /Healthedata1/69937366601e2710b1d0ee4120a036da %}

---

## Care Team

- Care Team Member Name 
- Care Team Member Identifier
- Care Team Member Role
- Care Team Member Location
- Care Team Member Telecom

----

### US Core Proposal

CareTeam Member Name (`CareTeam.participant.member`)
- `Practitioner.name`
- `Patient.name`
- `RelatedPerson.name`

CareTeam Member Identifier (`CareTeam.participant.member`)
- `Practitioner.identifier`
- `Patient.identifier`<br>
~~- `RelatedPerson.identifier`~~ (not always assigned)

CareTeam Member Role (`CareTeam.participant.role`)


CareTeam Member Location and Telecom  (`CareTeam.participant.member`)
- `Practitioner.telecom`* , `Practitioner.address`*
- `Patient.telecom`, `patient.address`
- `RelatedPerson.telecom`,`RelatedPerson.address`

\* CareTeam Member Location and Telecom is complicated and several options were discussed at length which is summarized below:

- HL7 FHIR Connectathon 28: Argonaut US Core & ONC Standardized API Criterion Track
- Sept 2021 WGM: Patient Administration (PA) Hosting: PC Wed. Sep 22, 2021 10:30 AM - 12:00 PM

| Option | Pros | Cons |
| -------- | -------- | -------- |
| :X:**A)** Use telecom and address detail within each `CareTeam.participant.member`    | Uses existing FHIR structures     | - PractitionerRole is not supported across the industry<br>- Complex - will have to teach Client applications where in each resource to locate information (e.g. PractionerRole address is `PractitionerRole.location.address` ) <br> - *Risk* - `PractionerRole` contact may not match contact information for this CareTeam. Example provided: A Midwife has office number and  personal number but is covering shifts in hospital. In order to contact that MidWife you call a ‘Pool’ (shift) number rather than the number associated with their PractitionerRole (unless hospital creates PractitionerRole for each shift). <br>- Certification issues surrounding *Must Support* through web of resources and elements.    |
| :X:**B)** Add address and telecom requirements at the resource level `CareTeam.telecom` and new `extension` for `CareTeam.address`  | Simple     | **Nice try** - There is not one phone number and address generic  to all members on a CareTeam.    |
| :question:**C)** For Practitioners, use `Practitioner.address` and `Practitioner.telecom` | Single location to locate Practitioner information     | - Not aligned with the intent and purpose of these elements in base FHIR  like supporting ***role based*** contact information.  One solution is to support multiple Practitioners for each role. <br> - Possibly out of step with international implementations  |
| :X:**D)** Add extension within `CareTeam.participant.member`for role based address and contact info for each participant. | Single location to locate information or **all** roles     | Nonstandard extension  (although could submit for considerations in future FHIR release)     |

#### **ADD** US Core RelatedPerson Profile

Supports caretakers as part of CareTeam technically not required by USCDi v2, but we feel it is needed and anticipates future requirements). 

##### Formal Definition RelatedPerson

Prior Art:
- [IPA](http://build.fhir.org/ig/HL7/fhir-ipa/branches/main/StructureDefinition-ipa-relatedperson.html)
- [Dutch national profile](https://simplifier.net/nictizstu3-zib2017/nl-core-relatedperson)

Rendered output [US Core RelatedPerson Profile](https://healthedata1.github.io/Sushi-Sandbox/StructureDefinition-us-core-relatedperson.html)


<iframe src="https://healthedata1.github.io/Sushi-Sandbox/StructureDefinition-us-core-relatedperson.html" width="100%" height="500">
</iframe>

----

Example RelatedPerson

{%gist Healthedata1/7c22bd39ab716f7d65499141ffbab0e3 %}

<!-- .slide: style="font-size: 12px;" -->

#### ADD New *Must Support* Elements to Practitioner

1. `Practitioner.telecom` 0..* MS
1. `Practitioner.address` 0..* MS

#### ADD New Search Requirements

1. Careteam
   - **SHALL** support searching using the `_include CareTeam:participant`  for Patient, RelatedPerson and Practitioner
   - **SHALL** support searching using the **custom** `role` search parameter

1. RelatedPerson
   -  **SHALL** support searching using the `patient` search parameter
   -  **SHOULD** support searching using the `name` search parameter
        

<table>
  <tr>
   <td><strong>Data Element</strong>
   </td>
   <td><strong>US Core Profile Element</strong>
   </td>
   <td><strong>US Core Search</strong>
   </td>
  </tr>
  <tr>
   <td><strong>Care Team Member Name</strong>  
   </td>
<td>

- Practitioner.name
- Patient.name
- RelatedPerson.name

   </td>
   <td> <p>*<strong>new</strong>*  <code>_include</code> parameter for <code>CareTeam:participant</code>
   <p><code>GET [base]/CareTeam?_id=123&include=CareTeam:participant:Practitioner</code>
   </td>
  </tr>
  <tr>
   <td><strong>Care Team Member Identifier</strong>
   </td>
<td>

- Practitioner.identifier
- Patient.identifier

   </td>
   <td> <p>*<strong>new</strong>*  <code>_include</code> parameter for <code>CareTeam:participant</code> (see above)
   </td>
  </tr>
  <tr>
   <td><strong>Care Team Member Role</strong>
   </td>
   <td><strong><a href="http://hl7.org/fhir/us/core/StructureDefinition-us-core-careteam-definitions.html#CareTeam.participant.role">CareTeam.participant.role</a> 1..1 MS</strong>
   
   <td>
      <p>Combination of the <code>_id</code> and *<strong>new custom</strong>* <code>role</code> search parameters.
   <p>
   <p>
   <code>GET [base]/CareTeam?_id=123&role=224571005</code>
   </p>
   </td>
  </tr>
  <tr>
  
   <td><strong>Care Team Member Location</strong>
   </td>
   <td>
   
- Practitioner.address
- patient.address
- RelatedPerson.address
   
   </td>
   <td>
<p>*<strong>new</strong>*  <code>_include</code> parameter for <code>CareTeam:participant</code> (see above)
   </td>
  </tr>
  <tr>
  
  
   <td><strong>Care Team Member Telecom</strong>
   <p>
   ITU-T E.123, Series E: Overall Network Operation, Telephone Service, Service Operation and Human Factors, International
operation - General provisions concerning users: Notation for national and international telephone numbers, email addresses and web addresses (incorporated by reference in § 170.299); and ITU-T E.164, Series E: Overall Network Operation, Telephone Service, Service Operation and Human Factors, International operation - Numbering plan of the international telephone service: The international public telecommunication
numbering plan As adopted at 45 CFR 170.207(q)(1)</p>
   <td>
   
- Practitioner.telecom
- Patient.telecom
- RelatedPerson.telecom
   
   </td>
   <td>
<p>*<strong>new</strong>*  <code>_include</code> parameter for <code>CareTeam:participant</code> (see above)
   </td>
  </tr>
</table>

---

## FIN

























