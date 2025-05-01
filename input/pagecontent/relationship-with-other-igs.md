US Core is intended to provide an implementable standard for FHIR based interfaces for provider and patient facing systems​ providing:

- An exchange Standard for [U.S. Core Data for Interoperability (USCDI)] and comments and requests from the US Realm FHIR community. 
- A set of conformance requirements that enforce a set of 'minimum requirements' on FHIR resources to create the US Core Profiles specifying rules for the elements, extensions, vocabularies, and value sets, and the RESTful API interactions. 
- For use by US stakeholders when implementing FHIR to provide a common implementation and to be built upon when creating further US Realm specific profiles and implementation guides for specific use cases.
   

The context of US Core within the set of US Realm HL7 FHIR standards is shown in the figure below.

{% include img.html img="relationships.svg" caption="Figure 1: Figure 1: Context of US Core within the set of HL7 US FHIR standards" %}

### Relationship to US Core and Other IGs

Other international and national standards were reviewed and considered during the development process to assess the degree of alignment and to facilitate adoption of this standard. These implementation guides include:

Implementation Guide |Relationship
---|---
[International Patient Access (IPA)]|This IG describes how an application acting on behalf of a patient can access information about the patient from a clinical records system using a FHIR based API. The REST API and profiles in this IG were reviewed and considered during development of US Core. US Core was is compatible with IPA, e.g. US Core conformant data can be accessed by an IPA conformant client.
[International Patient Summary (IPS)]|This IG describes specify how to represent in HL7 FHIR the IPS. An IPS document is an electronic health record extract containing essential healthcare information about a subject of care. The formal review between this IG and US Core is not current.
{:.grid}

#### Comparison With International IGs

The table below summarizes profile only comparison between US Core and the International Patient Access Implementation Guides. This comparison evaluates US Core conformance requirements with the key implementation guides identifying where compliance with US Core satisfies the expectations established by the referenced implementation guide. Compliance in the reverse direction is not guaranteed, i.e. a resource that is compliant with an International Patient Access profile *may not* be compliant with US Core.

As part of profile comparison, the requirements, constraints, and standards specified in a particular FHIR profile are evaluated. These requirements can include mandatory elements, *Must Support* elements, cardinality constraints, data types, terminology bindings, usage rules, extensions, rules on missing or suppressed data. A detailed comparisons with the current version of IPA can be found [here](ipa-comparison-v1.1.0/index.html)

**Legend:**

![Compliant](green_checkmark.svg.png) **Compliant**: A US Core compliant resource meets all requirements of the compared profile.

![Additional requirements](orange_checkmark.svg.png) **Additional requirements**: A US Core compliant resource is compatible, but additional changes may be needed to meet all requirements of the compared profile. Where additional requirements are identified, more information is provided in the sections below.

![Incompatible](cross_red_circle.svg.png) **Incompatible**: A US Core compliant resource is incompatible with the compared profile. A resource cannot be compliant to both. Where incompatible requirements are identified, more information is provided in the sections below.

![No equivalent profile](minus_symbol.svg.png) **No equivalent profile**: No equivalent profile for comparison.

| US Core 8.0.0 | International Patient Access 1.1.0 |
| --- | --- |
| [US Core ADI DocumentReference Profile]| ![Additional requirements](orange_checkmark.svg.png) |
| [US Core AllergyIntolerance Profile]| ![Compliant](green_checkmark.svg.png) |
| [US Core Average Blood Pressure Profile]|![Additional requirements](orange_checkmark.svg.png)  |
| [US Core BMI Profile]| ![Compliant](green_checkmark.svg.png) |
| [US Core Blood Pressure Profile]| ![Compliant](green_checkmark.svg.png) |
| [US Core Body Height Profile]| ![Compliant](green_checkmark.svg.png) |
| [US Core Body Temperature Profile]| ![Compliant](green_checkmark.svg.png) |
| [US Core Body Weight Profile]| ![Compliant](green_checkmark.svg.png) |
| [US Core Care Experience Preference Profile]|![Additional requirements](orange_checkmark.svg.png)  |
| [US Core CarePlan Profile]| ![No equivalent profile](minus_symbol.svg.png) |
| [US Core CareTeam Profile]| ![No equivalent profile](minus_symbol.svg.png) |
| [US Core Condition Encounter Diagnosis Profile]| ![Compliant](green_checkmark.svg.png) |
| [US Core Condition Problems and Health Concerns Profile]| ![Compliant](green_checkmark.svg.png) |
| [US Core Coverage Profile]| ![No equivalent profile](minus_symbol.svg.png) |
| [US Core DiagnosticReport Profile for Laboratory Results Reporting]| ![No equivalent profile](minus_symbol.svg.png) |
| [US Core DiagnosticReport Profile for Report and Note Exchange]| ![No equivalent profile](minus_symbol.svg.png) |
| [US Core DocumentReference Profile]| ![Additional requirements](orange_checkmark.svg.png)  |
| [US Core Encounter Profile]| ![No equivalent profile](minus_symbol.svg.png) |
| [US Core Goal Profile]| ![No equivalent profile](minus_symbol.svg.png) |
| [US Core Head Circumference Profile]| ![Compliant](green_checkmark.svg.png) |
| [US Core Heart Rate Profile]| ![Compliant](green_checkmark.svg.png) |
| [US Core Immunization Profile]| ![Compliant](green_checkmark.svg.png) |
| [US Core Implantable Device Profile]| ![No equivalent profile](minus_symbol.svg.png) |
| [US Core Laboratory Result Observation Profile]| ![Compliant](green_checkmark.svg.png) |
| [US Core Location Profile]| ![No equivalent profile](minus_symbol.svg.png) |
| [US Core Medication Profile]| ![Compliant](green_checkmark.svg.png) |
| [US Core MedicationDispense Profile]| ![No equivalent profile](minus_symbol.svg.png) |
| [US Core MedicationRequest Profile]| ![Compliant](green_checkmark.svg.png) |
| [US Core Observation ADI Documentation Profile]| ![Additional requirements](orange_checkmark.svg.png)  |
| [US Core Observation Clinical Result Profile]| ![Compliant](green_checkmark.svg.png) |
| [US Core Observation Occupation Profile]| ![Additional requirements](orange_checkmark.svg.png) |
| [US Core Observation Pregnancy Intent Profile]| ![Compliant](green_checkmark.svg.png) |
| [US Core Observation Pregnancy Status Profile]| ![Compliant](green_checkmark.svg.png) |
| [US Core Observation Screening Assessment Profile]| ![Compliant](green_checkmark.svg.png) |
| [US Core Observation Sexual Orientation Profile]| ![Compliant](green_checkmark.svg.png) |
| [US Core Organization Profile]| ![No equivalent profile](minus_symbol.svg.png) |
| [US Core Patient Profile]| ![Additional requirements](orange_checkmark.svg.png)  |
| [US Core Pediatric BMI for Age Observation Profile]| ![Compliant](green_checkmark.svg.png) |
| [US Core Pediatric Head Occipital Frontal Circumference Percentile Profile]| ![Compliant](green_checkmark.svg.png) |
| [US Core Pediatric Weight for Height Observation Profile]| ![Compliant](green_checkmark.svg.png) |
| [US Core Practitioner Profile]| ![Compliant](green_checkmark.svg.png) |
| [US Core PractitionerRole Profile]| ![Compliant](green_checkmark.svg.png) |
| [US Core Procedure Profile]| ![No equivalent profile](minus_symbol.svg.png) |
| [US Core Provenance Profile]| ![No equivalent profile](minus_symbol.svg.png) |
| [US Core Pulse Oximetry Profile]| ![Compliant](green_checkmark.svg.png) |
| [US Core QuestionnaireResponse Profile]| ![No equivalent profile](minus_symbol.svg.png) |
| [US Core RelatedPerson Profile]| ![No equivalent profile](minus_symbol.svg.png) |
| [US Core Respiratory Rate Profile]| ![Compliant](green_checkmark.svg.png) |
| [US Core ServiceRequest Profile]| ![No equivalent profile](minus_symbol.svg.png) |
| [US Core Simple Observation Profile]|![Additional requirements](orange_checkmark.svg.png) |
| [US Core Smoking Status Observation Profile]|![Additional requirements](orange_checkmark.svg.png)  |
| [US Core Specimen Profile]| ![No equivalent profile](minus_symbol.svg.png) |
| [US Core Treatment Intervention Preference Profile]| ![Additional requirements](orange_checkmark.svg.png) |
| [US Core Vital Signs Profile]| ![Compliant](green_checkmark.svg.png) |
{:.grid}


##### Additional requirements

The following US Core resource are compatible to the IPA profiles, but the IPA profile(s) contain additional requirements which are listed below. Changes may be needed to meet all the IPA profile requirements. Implementers are advised to note that some code changes may be required to support these profiles.


1. [US Core ADI DocumentReference Profile]
     
   Additional requirements for [IPA DocumentReference](http://hl7.org/fhir/uv/IPA/StructureDefinition/IPA-documentreference):

    - `DocumentReference.content.attachment.contentType`	Element minimum cardinalities differ: '1' vs '0'
    -	`DocumentReference.context`	Elements differ in definition for mustSupport: 'true' vs 'false'
    -	`DocumentReference.context.encounter`	Elements differ in definition for mustSupport: 'true' vs 'false'
    -	`DocumentReference.context.encounter`	Element maximum cardinalities differ: '1' vs '*'
    -	`DocumentReference.context.period`	Elements differ in definition for mustSupport: 'true' vs 'false'

1. [US Core DocumentReference Profile]

   Additional requirements for [IPA DocumentReference](http://hl7.org/fhir/uv/IPA/StructureDefinition/IPA-documentreference):

   - `DocumentReference.content.attachment.contentType`	Element minimum cardinalities differ: '1' vs '0'

1. [US Core Average Blood Pressure Profile]

   Additional requirements for [IPA Observation](http://hl7.org/fhir/uv/IPA/StructureDefinition/IPA-observation) 

   - `Observation.value[x]` Elements differ in definition for mustSupport: 'true' vs 'false'
   - `Observation.value[x]` Element maximum cardinalities differ: '1' vs '0'
   - `Observation.dataAbsentReason` Elements differ in definition for mustSupport: 'true' vs 'false'

1. [US Core Care Experience Preference Profile], [US Core Simple Observation Profile], [US Core Smoking Status Observation Profile], [US Core Treatment Intervention Preference Profile]

   Additional requirements for [IPA Observation](http://hl7.org/fhir/uv/IPA/StructureDefinition/IPA-observation):

   - `Observation.dataAbsentReason` Elements differ in definition for mustSupport: 'true' vs 'false'

1. [US Core Observation ADI Documentation Profile], [US Core Observation Occupation Profile]

   Additional requirements for [IPA Observation](http://hl7.org/fhir/uv/IPA/StructureDefinition/IPA-observation):

   - `Observation.value[x]` Elements differ in definition for mustSupport: 'true' vs 'false'
   - `Observation.dataAbsentReason` Elements differ in definition for mustSupport: 'true' vs 'false'

1. [US Core Patient Profile]

    Additional requirements for [IPA Patient](http://hl7.org/fhir/uv/IPA/StructureDefinition/IPA-patient):

   - `Patient.active`	Element minimum cardinalities differ: '1' vs '0'
   - `Patient.active`	Elements differ in definition for mustSupport: 'true' vs 'false'
   - `Patient.gender`	Elements differ in definition for mustSupport: 'true' vs 'false'
   - `Patient.link`	Element maximum cardinalities differ: '1' vs '*' (:thinking_face: a technical error in IPA profile)
   - `Patient.link`	Elements differ in definition for mustSupport: 'true' vs 'false'

##### Missing Data
US Core compliant resources are compliant with IPA requirements for Missing Data.

##### Suppressed Data
IPA does not include requirements for Suppressed Data.

##### Additional profiles
This version of US Core has no equivalent profile for the following IPA profiles:
- [IPA-MedicationStatement](https://hl7.org/fhir/uv/ipa/STU1.1//StructureDefinition-ipa-medicationstatement.html) 

{% include link-list.md %}
