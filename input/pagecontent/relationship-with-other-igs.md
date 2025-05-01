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
[International Patient Access]|This IG describes how an application acting on behalf of a patient can access information about the patient from a clinical records system using a FHIR based API. The REST API and profiles in this IG were reviewed and considered during development of US Core. US Core was is compatible with IPA, e.g. US Core conformant data can be accessed by an IPA conformant client.
[International Patient Summary Implementation Guide]|This IG describes specify how to represent in HL7 FHIR the International Patient Summary (IPS). An International Patient Summary (IPS) document is an electronic health record extract containing essential healthcare information about a subject of care. The formal review between this IG and US Core is not current.
{:.grid}

#### Comparison With International IGs

The table below provides a profile only comparison between US Core and the International Patient Summary Implementation Guides. This comparison evaluates US Core conformance requirements with the key implementation guides identifying where compliance with US Core satisfies the expectations established by the referenced implementation guide. Compliance in the reverse direction is not guaranteed, i.e. a resource that is compliant with an International Patient Access profile **MAY NOT** be compliant with US Core.

As part of profile comparison, the requirements, constraints, and standards specified in a particular FHIR profile are evaluated. These requirements can include mandatory elements, *Must Support* elements, cardinality constraints, data types, terminology bindings, usage rules, extensions, rules on missing or suppressed data. 

**Legend:**

![Compliant](green_checkmark.svg.png) **Compliant**: An US Core compliant resource meets all requirements of the compared profile.

![Additional requirements](orange_checkmark.svg.png) **Additional requirements**: An US Core compliant resource is compatible, but additional changes may be needed to meet all requirements of the compared profile. Where additional requirements are identified, more information is provided in the sections below.

![Incompatible](cross_red_circle.svg.png) **Incompatible**: An US Core compliant resource is incompatible with the compared profile. A resource cannot be compliant to both. Where incompatible requirements are identified, more information is provided in the sections below.

![No equivalent profile](minus_symbol.svg.png) **No equivalent profile**: No equivalent profile for comparison.

| US Core 8.0.0 | International Patient Access 1.1.0 |
| --- | --- |
| [US Core AllergyIntolerance Profile] | ![Compliant](green_checkmark.svg.png) |
| [US Core Blood Pressure] | ![Compliant](green_checkmark.svg.png) |
| [US Core Body Height] | ![Compliant](green_checkmark.svg.png) |
| [US Core Body Temperature] | ![Compliant](green_checkmark.svg.png) |
| [US Core Body Weight] | ![Compliant](green_checkmark.svg.png) |
| [US Core Condition] | ![Compliant](green_checkmark.svg.png) |
| [US Core Diagnostic Result Observation] | ![Compliant](green_checkmark.svg.png) |
| [US Core Encounter] | ![No equivalent profile](minus_symbol.svg.png) |
| [US Core HealthcareService] | ![No equivalent profile](minus_symbol.svg.png) |
| [US Core Heart Rate] | ![Compliant](green_checkmark.svg.png) |
| [US Core Immunization] | ![Compliant](green_checkmark.svg.png) |
| [US Core Location] | ![No equivalent profile](minus_symbol.svg.png) |
| [US Core Medication] | ![Compliant](green_checkmark.svg.png) |
| [US Core MedicationRequest] | ![Additional requirements](orange_checkmark.svg.png) |
| [US Core MedicationStatement] | ![Additional requirements](orange_checkmark.svg.png) |
| [US Core Organization] | ![No equivalent profile](minus_symbol.svg.png) |
| [US Core Pathology Result Observation] | ![Compliant](green_checkmark.svg.png) |
| [US Core Patient Profile] | ![Additional requirements](orange_checkmark.svg.png) |
| [US Core Practitioner] | ![Compliant](green_checkmark.svg.png) |
| [US Core PractitionerRole] | ![Compliant](green_checkmark.svg.png) |
| [US Core Procedure] | ![No equivalent profile](minus_symbol.svg.png) |
| [US Core RelatedPerson] | ![No equivalent profile](minus_symbol.svg.png) |
| [US Core Respiration Rate] | ![Compliant](green_checkmark.svg.png) |
| [US Core Smoking Status] | ![Compliant](green_checkmark.svg.png) |
| [US Core Waist Circumference] | ![Compliant](green_checkmark.svg.png) |
{:.grid}


##### Additional requirements
The following IPA profile(s) contain additional requirements. Implementers are advised to note that some code changes may be required to support these profiles.

| US Core | International Patient Access 1.1.0 | Element | Additional requirements |
| --- | --- | --- | --- |
| [US Core MedicationRequest Profile] | [IPA-MedicationRequest](https://hl7.org/fhir/uv/ipa/STU1.1//StructureDefinition-ipa-medicationrequest.html) | MedicationRequest.reported[x] | Element flagged as *Must Support* in IPA. |
| [US Core MedicationStatement Profile ] | [IPA-MedicationStatement](https://hl7.org/fhir/uv/ipa/STU1.1//StructureDefinition-ipa-medicationstatement.html) | MedicationStatement.statusReason | Element flagged as *Must Support* in IPA. |
| | | MedicationStatement.context | Element flagged as *Must Support* in IPA. |
| | | MedicationStatement.informationSource | Element flagged as *Must Support* in IPA. |
| [US Core Patient Profile] | [IPA-Patient](https://hl7.org/fhir/uv/ipa/STU1.1//StructureDefinition-ipa-patient.html) | Patient.identifier | IPA requires all identifiers to have system, type or assigner (ipa-pat-1). |
| | | Patient.name.text | Element SHOULD be present (ipa-pat-3). |
| | | Patient.gender | Element flagged as *Must Support* in IPA. |
| | | Patient.active | Element flagged as *Must Support* in IPA. |
| | | Patient.link | Element flagged as *Must Support* in IPA. |
{:.grid}

##### Missing Data
US Core compliant resources are compliant with IPA requirements for Missing Data.

##### Suppressed Data
IPA does not include requirements for Suppressed Data.

##### Additional profiles
This version of US Core has no equivalent profile for the following IPA profiles:
- IPA-DocumentReference
