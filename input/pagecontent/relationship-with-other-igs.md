{::options toc_levels="1..5"/}

{% capture NO %}<span style="color:red; font-size:1.5em">&#10008;</span>{% endcapture %}
{% capture NA %}<span style="font-size:1.5em; font-weight: bold">&mdash;</span>{% endcapture %}
{% capture OK %}<span style="color:green; font-size:1.5em">&#10004;</span>{% endcapture %}
{% capture MAYBE %}<span style="color:orange; font-size:1.5em">&#10133;</span>{% endcapture %}

### Scope and Context of US Core
US Core is intended to provide an implementable standard for FHIR based interfaces for provider and patient facing systems​ providing:

- An exchange Standard for [U.S. Core Data for Interoperability (USCDI)] and comments and requests from the US Realm FHIR community.
- A set of conformance requirements that enforce a set of 'minimum requirements' on FHIR resources to create the US Core Profiles specifying rules for the elements, extensions, vocabularies, and value sets, and the RESTful API interactions.
- For use by US stakeholders when implementing FHIR to provide a common implementation and to be built upon when creating further US Realm specific profiles and implementation guides for specific use cases.

The context of US Core within the set of US Realm HL7 FHIR standards is shown in the figure below.

{% include img.html img="relationships.svg" caption="Figure 1: Figure 1: Context of US Core within the set of HL7 US FHIR standards" %}

<div class="bg-success" markdown="1">

### Relationship of US Core with Other IGs

#### IG Dependencies

US Core is based on the FHIR R4 specification and relies these implementation guides:

| Implementation Guide | Version | Reason |
|----------------------|-------------|--------|
| SMART App Launch | {{site.data.ig.dependsOn[0].version}} | To support reference in the [SMART on FHIR Obligations and Capabilities] page. |
| Structured Data Capture | {{site.data.ig.dependsOn[1].version}} | [US Core QuestionnaireResponse Profile] is derived from the [Structured Data Capture (SDC) Questionnaire Response Profile].|
{:.grid}

#### Alignment with Other IGs

</div><!-- new-content -->

Other international and national standards were reviewed and considered during the development process to assess the degree of alignment and to facilitate adoption of this standard. These implementation guides include:

Implementation Guide |Relationship
---|---
[International Patient Access (IPA)]|This IG describes how an application acting on behalf of a patient can access information about the patient from a clinical records system using a FHIR based API. The REST API and profiles in this IG were reviewed and considered during development of US Core. US Core is compatible with IPA, e.g. US Core conformant data can be accessed by an IPA conformant client.
[International Patient Summary (IPS)]|This IG describes specify how to represent in HL7 FHIR the IPS. An IPS document is an electronic health record extract containing essential healthcare information about a subject of care. <span class="bg-success" markdown="1">US Core is compatible with IPS, e.g. US Core conformant data can be used to generate a patient summary that is conformant to IPS.</span><!-- new-content -->
{:.grid}

#### Comparison With International IGs

The table below summarizes comparisons between the US Core profiles and the International Patient Access and International Patient Summary Implementation Guides profiles. This comparison evaluates US Core conformance requirements against the key implementation guides, identifying where compliance with US Core satisfies the expectations established by the referenced implementation guides. Compliance in the reverse direction is not guaranteed; for example, a resource that is compliant with an IPA profile may not be compliant with US Core.

As part of profile comparison, the requirements, constraints, and standards specified in a particular FHIR profile are evaluated. These requirements can include mandatory elements, *Must Support* elements, cardinality constraints, data types, terminology bindings, usage rules, extensions, and rules on missing or suppressed data. Detailed comparisons between the FHIR artifacts in this current 9.0.0-ballot version of US Core and IPA <span class="bg-success" markdown="1">and IPS</span><!-- new-content --> are provided in the links below:

- [IPA Comparison V1.1.0](ipa-comparison-v1.1.0/index.html)
- <span class="bg-success" markdown="1">[IPS Comparison V2.0.0](ips-comparison-v2.0.0/index.html)
</span><!-- new-content -->

**Legend:**

{{OK}} **Compliant**: A US Core compliant resource meets all requirements of the compared profile.

{{MAYBE}} **Additional requirements**: A US Core compliant resource is compatible, but additional changes may be needed to meet all requirements of the compared profile. Where additional requirements are identified, more information is provided in the sections below.

{{NO}} **Incompatible**: A US Core compliant resource is incompatible with the compared profile. A resource cannot be compliant to both. Where incompatible requirements are identified, more information is provided in the sections below.

{{NA}} **No equivalent profile**: No equivalent profile in IPA or IPS for comparison. (Note that IPA and IPS profiles with no equivalent profile in US Core are listed in the sections below.)

<!-- ================================================================
 The following Comparison With International IGs table is generated by liquid script below.
The source table is input/data/profile_metadata.csv where edits to the table contents are made
 when new profile are added, depecrated, etc.

profile-metadata.csv columns:

- row: row id
- id: profile or extension's StructureDefinition id
- uri: profile or extension's canonical url
- title: profile or extension's human readable name
- rel_url: profile or extension's relative path to the narrative content page in the IG.
- is_new: Flag for new or updated content for the current version. Default is "FALSE" and set to "TRUE for new or updated content for the current version. It is used for QA review and published ballot versions of the guide. It set to "FALSE" before publishing new versions of the guide.
- current_fmm: FMM level in the current published version
- proposed_fmm: Proposed FMM level for next version
- added: Published version when the profile or extension was added to the guide.
- deprecated: Published version when the profile or extension was deprerated.
- retired: Published version when the profile or extension was retired.
- ig_only: Used for extensions only. Flag to indicate if the extension is used only for US Core StructureDefinitions. It is not a USCDI nor Realm specific requirement.
- realm_only:  Used for extensions only. Flag to indicate if the extension is defined for use in US Realm but is not a USCDI related requirement.
- version_notes: Notes on changes between versions. Used to inform readers in plain human readable text.
- dstu2_profile_title: Mapping of the profile or extensions to the Argonaut query DSTU2 profiles or extensions.
- ipa_compatibility: Compliance with the International Patient Access (IPA) values: "OK" = Compliant, "MAYBE" = Additional requirements needed to meet all requirements , "NO" = Incompatble ,"NA" = No equivalent profile:
- ips_compatibility: Compliance with the International Patient Summary (IPS) values: "OK" = Compliant, "MAYBE" = Additional requirements needed to meet all requirements , "NO" = Incompatble ,"NA" = No equivalent profile:
- resource_scope_conf: Resource Level SMART Scope requirements, Values: "SHALL"|"SHOULD"|"MAY"
- data_element: USCDI/HTI-1 defined scope contexts
- resource_type: profile or extension's base resource type. It is "Extension" for extensions.
- cat[n]_scope: (n =  1..6). Multiple granular scopes may be defined for a profile.
- cat[n]_scope_conf: (n =  1..6) Resource Level SMART Scope requirements, Values: "SHALL"|"SHOULD"|"MAY"  Multiple granular scopes may be defined for a profile.

The script filters out the active profiles and displays their compliance levels
 ====================================================================== -->

<table class="grid">
<thead>
<tr>
<th>US Core {{site.data.fhir.igVer}}</th>
<th>International Patient Access 1.1.0</th>
<th>International Patient Summary 2.0.0</th>
</tr>
</thead>
<tbody>
{% assign rows = site.data.profile_metadata | sort: "title" %}
{% for item in rows %}
{% unless item["resource_type"] == "Extension" or item["deprecated"] or item["retired"] %}
<tr{% if item["is_new"] == "TRUE" %} class="bg-success"{% endif %}>
<td markdown="span">[{{item["title" | trim ]}}]</td>
<td style="text-align: center;">{{item["ipa_compatibility"] | trim | replace: 'OK', OK | replace: 'MAYBE', MAYBE | replace: 'NA', NA | replace: 'NO', NO }}</td>
<td style="text-align: center;">{{item["ips_compatibility"] | trim | replace: 'OK', OK | replace: 'MAYBE', MAYBE | replace: 'NA', NA | replace: 'NO', NO }}</td>
</tr>
{% endunless %}
{% endfor %}
</tbody>
</table>
<!-- =================== end of liquid script ========================= -->

##### <span class="bg-success" markdown="1">Additional requirements in IPA</span><!-- new-content -->

The following US Core resource are compatible to the IPA profiles, but the IPA profile(s) contain additional requirements which are listed below. Changes may be needed to meet all the IPA profile requirements. Implementers are advised to note that some code changes may be required to support these profiles.


1. [US Core ADI DocumentReference Profile]

   Additional requirements in [IPA DocumentReference](http://hl7.org/fhir/uv/IPA/StructureDefinition/IPA-documentreference):

    - `DocumentReference.content.attachment.contentType`	Element minimum cardinalities differ: '1' vs '0'
    -	`DocumentReference.context`	Elements differ in definition for mustSupport: 'true' vs 'false'
    -	`DocumentReference.context.encounter`	Elements differ in definition for mustSupport: 'true' vs 'false'
    -	`DocumentReference.context.encounter`	Element maximum cardinalities differ: '1' vs '*'
    -	`DocumentReference.context.period`	Elements differ in definition for mustSupport: 'true' vs 'false'

1. [US Core DocumentReference Profile]

   Additional requirements in [IPA DocumentReference](http://hl7.org/fhir/uv/IPA/StructureDefinition/IPA-documentreference):

   - `DocumentReference.content.attachment.contentType`	Element minimum cardinalities differ: '1' vs '0'

1. [US Core Average Blood Pressure Profile]

   Additional requirements in [IPA Observation](http://hl7.org/fhir/uv/IPA/StructureDefinition/IPA-observation)

   - `Observation.value[x]` Elements differ in definition for mustSupport: 'true' vs 'false'
   - `Observation.value[x]` Element maximum cardinalities differ: '1' vs '0'
   - `Observation.dataAbsentReason` Elements differ in definition for mustSupport: 'true' vs 'false'

1. [US Core Care Experience Preference Profile], [US Core Simple Observation Profile], [US Core Smoking Status Observation Profile], [US Core Treatment Intervention Preference Profile]

   Additional requirements in [IPA Observation](http://hl7.org/fhir/uv/IPA/StructureDefinition/IPA-observation):

   - `Observation.dataAbsentReason` Elements differ in definition for mustSupport: 'true' vs 'false'

1. [US Core Observation ADI Documentation Profile], [US Core Observation Occupation Profile]

   Additional requirements in [IPA Observation](http://hl7.org/fhir/uv/IPA/StructureDefinition/IPA-observation):

   - `Observation.value[x]` Elements differ in definition for mustSupport: 'true' vs 'false'
   - `Observation.dataAbsentReason` Elements differ in definition for mustSupport: 'true' vs 'false'

1. [US Core Patient Profile]

    Additional requirements in [IPA Patient](http://hl7.org/fhir/uv/IPA/StructureDefinition/IPA-patient):

   - `Patient.active`	Element minimum cardinalities differ: '1' vs '0'
   - `Patient.active`	Elements differ in definition for mustSupport: 'true' vs 'false'
   - `Patient.gender`	Elements differ in definition for mustSupport: 'true' vs 'false'
   - `Patient.link`	Element maximum cardinalities differ: '1' vs '*' (:thinking_face: a technical error in IPA profile)
   - `Patient.link`	Elements differ in definition for mustSupport: 'true' vs 'false'

###### Missing Data
US Core compliant resources are compliant with IPA requirements for Missing Data.

###### Suppressed Data
IPA does not include requirements for Suppressed Data.

###### Additional profiles in IPA
This version of US Core has no equivalent profile for the following IPA profiles:
- [IPA-MedicationStatement](https://hl7.org/fhir/uv/ipa/STU1.1//StructureDefinition-ipa-medicationstatement.html)

<div class="bg-success" markdown="1">

##### <span class="bg-success" markdown="1">Additional requirements in IPS</span><!-- new-content -->

The following US Core resource are compatible to the IPS profiles, but the IPS profile(s) contain additional requirements which are listed below. Changes may be needed to meet all the IPA profile requirements. Implementers are advised to note that some code changes may be required to support these profiles.

1. [US Core AllergyIntolerance Profile]

    Additional requirements in [IPS AllergyIntolerance](http://hl7.org/fhir/uv/ips/StructureDefinition/AllergyIntolerance-uv-ips):

   - `AllergyIntolerance.patient.reference` Element minimum cardinalities differ: '1' vs '0'
   - `AllergyIntolerance.type` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `AllergyIntolerance.onset[x]` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `AllergyIntolerance.reaction.severity` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `AllergyIntolerance.code.coding` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `AllergyIntolerance.code.coding.system` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `AllergyIntolerance.code.coding.code` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `AllergyIntolerance.code.text` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'

1. [US Core Condition Problems and Health Concerns Profile]

    Additional requirements in [IPS Condition](http://hl7.org/fhir/uv/ips/StructureDefinition/Condition-uv-ips):

   - `Condition.subject.reference` Element minimum cardinalities differ: '1' vs '0'
   - `Condition.clinicalStatus.coding` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Condition.clinicalStatus.coding.system` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Condition.clinicalStatus.coding.code` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Condition.clinicalStatus.text` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Condition.category.coding` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Condition.category.coding.system` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Condition.category.coding.code` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Condition.category.text` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Condition.severity` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Condition.severity.coding` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Condition.severity.coding.system` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Condition.severity.coding.code` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Condition.severity.text` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Condition.code.coding` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Condition.code.coding.system` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Condition.code.coding.code` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Condition.code.text` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'

1. [US Core Device Profile]

    Additional requirements in [IPS Device](http://hl7.org/fhir/uv/ips/StructureDefinition/Device-uv-ips):

   - `Device.type.coding` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Device.type.coding.system` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Device.type.coding.code` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Device.type.text` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'

1. [US Core DiagnosticReport Profile for Report and Note Exchange] and  [US Core DiagnosticReport Profile for Laboratory Results Reporting]

    Additional requirements in [IPS DiagnosticReport](http://hl7.org/fhir/uv/ips/StructureDefinition/DiagnosticReport-uv-ips):

   - `DiagnosticReport.subject.reference` Element minimum cardinalities differ: '1' vs '0'
   - `DiagnosticReport.effective[x]` Element minimum cardinalities differ: '1' vs '0'
   - `DiagnosticReport.code.coding` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `DiagnosticReport.code.coding.system` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `DiagnosticReport.code.coding.code` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `DiagnosticReport.code.text` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'

1. [US Core Immunization Profile]

    Additional requirements in [IPS Immunization](http://hl7.org/fhir/uv/ips/StructureDefinition/Immunization-uv-ips):

   - `Immunization.patient.reference` Element minimum cardinalities differ: '1' vs '0'
   - `Immunization.vaccineCode.coding` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Immunization.vaccineCode.coding.system` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Immunization.vaccineCode.coding.code` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Immunization.vaccineCode.text` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'

1. [US Core Medication Profile]

    Additional requirements in [IPS Medication](http://hl7.org/fhir/uv/ips/StructureDefinition/Medication-uv-ips):

   - `Medication.code.coding` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Medication.code.coding.system` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Medication.code.coding.code` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Medication.code.text` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Medication.form` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Medication.form.coding` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Medication.form.coding.system` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Medication.form.coding.code` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Medication.form.text` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Medication.ingredient` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Medication.ingredient.item[x]` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Medication.ingredient.item[x].coding` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Medication.ingredient.item[x].coding.system` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Medication.ingredient.item[x].coding.code` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Medication.ingredient.item[x].text` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Medication.ingredient.strength` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'

1. [US Core MedicationRequest Profile]

   Additional requirements in [IPS MedicationRequest](http://hl7.org/fhir/uv/ips/StructureDefinition/MedicationRequest-uv-ips):

   - `MedicationRequest.medication[x].coding` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `MedicationRequest.medication[x].coding.system` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `MedicationRequest.medication[x].coding.code` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `MedicationRequest.medication[x].text` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `MedicationRequest.subject.reference` Element minimum cardinalities differ: '1' vs '0'

1. [US Core Observation Pregnancy Status Profile]

    Additional requirements in [IPS Observation Pregnancy Status](http://hl7.org/fhir/uv/ips/StructureDefinition/Observation-pregnancy-status-uv-ips):

   - `Observation.code.coding` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Observation.code.coding.system` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Observation.code.coding.code` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Observation.code.text` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Observation.subject.reference` Element minimum cardinalities differ: '1' vs '0'
   - `Observation.bodySite` Element maximum cardinalities differ: '0' vs '*'
   - `Observation.specimen` Element maximum cardinalities differ: '0' vs '*'
   - `Observation.device` Element maximum cardinalities differ: '0' vs '*'
   - `Observation.referenceRange` Element maximum cardinalities differ: '0' vs '*'
   - `Observation.hasMember` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Observation.hasMember.reference` Element minimum cardinalities differ: '1' vs '0'
   - `Observation.hasMember.reference` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Observation.component` Element maximum cardinalities differ: '0' vs '*'

1. [US Core Observation Clinical Result Profile] and [US Core Laboratory Result Observation Profile]

    Additional requirements in [IPS Observation Results - Laboratory/Pathology](http://hl7.org/fhir/uv/ips/StructureDefinition/Observation-results-laboratory-pathology-uv-ips):

   - `Observation.status` Element differ in valueset: 'http://hl7.org/fhir/uv/ips/ValueSet/results-status-uv-ips (required)' vs 'http://hl7.org/fhir/ValueSet/observation-status (required)'
   - `Observation.category.coding` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Observation.category.coding.system` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Observation.category.coding.code` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Observation.category.text` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Observation.code.coding` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Observation.code.coding.system` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Observation.code.coding.code` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Observation.code.text` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Observation.subject.reference` Element minimum cardinalities differ: '1' vs '0'
   - `Observation.effective[x]` Element minimum cardinalities differ: '1' vs '0'
   - `Observation.performer` Element minimum cardinalities differ: '1' vs '0'
   - `Observation.valueCodeableConcept.coding` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Observation.valueCodeableConcept.coding.system` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Observation.valueCodeableConcept.coding.code` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Observation.valueCodeableConcept.text` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Observation.component` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'

1. [US Core Observation Clinical Result Profile]

    Additional requirements in [IPS Observation Results - Radiology](http://hl7.org/fhir/uv/ips/StructureDefinition/Observation-results-radiology-uv-ips):

   - `Observation.category:radiology` Element minimum cardinalities differ: '1' vs '0'
   - `Observation.category:radiology` Element maximum cardinalities differ: '1' vs '*'
   - `Observation.code.coding` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Observation.code.coding.system` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Observation.code.coding.code` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Observation.code.text` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Observation.subject.reference` Element minimum cardinalities differ: '1' vs '0'
   - `Observation.effective[x]` Element minimum cardinalities differ: '1' vs '0'
   - `Observation.performer` Element minimum cardinalities differ: '1' vs '0'
   - `Observation.component` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'

1. [US Core Simple Observation Profile]

    Additional requirements in [IPS Observation Alcohol Use](http://hl7.org/fhir/uv/ips/StructureDefinition/Observation-alcoholuse-uv-ips):

   - `Observation.code` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Observation.code.coding` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Observation.code.coding.system` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Observation.code.coding.code` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Observation.code.text` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Observation.subject.reference` Element minimum cardinalities differ: '1' vs '0'
   - `Observation.effective[x]` Element minimum cardinalities differ: '1' vs '0'
   - `Observation.component` Element maximum cardinalities differ: '0' vs '*'

1. [US Core Smoking Status Observation Profile]

    Additional requirements in [IPS Observation Tobacco Use](http://hl7.org/fhir/uv/ips/StructureDefinition/Observation-tobaccouse-uv-ips):

   - `Observation.code` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Observation.code.coding` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Observation.code.coding.system` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Observation.code.coding.code` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Observation.code.text` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Observation.subject.reference` Element minimum cardinalities differ: '1' vs '0'
   - `Observation.component` Element maximum cardinalities differ: '0' vs '*'

1. [US Core Patient Profile]

    Additional requirements in [IPS Patient](http://hl7.org/fhir/uv/ips/StructureDefinition/Patient-uv-ips):

   - `Patient.name.use` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Patient.name.text` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Patient.telecom` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Patient.gender` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Patient.birthDate` Element minimum cardinalities differ: '1' vs '0'
   - `Patient.generalPractitioner` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'

1. [US Core Practitioner Profile]

    Additional requirements in [IPS Practitioner](http://hl7.org/fhir/uv/ips/StructureDefinition/Practitioner-uv-ips):

   - `Practitioner.name.given` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'

1. [US Core Procedure Profile]

    Additional requirements in [IPS Procedure](http://hl7.org/fhir/uv/ips/StructureDefinition/Procedure-uv-ips):

   - `Procedure.code.coding` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Procedure.code.coding.system` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Procedure.code.coding.code` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Procedure.code.text` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Procedure.subject.reference` Element minimum cardinalities differ: '1' vs '0'
   - `Procedure.performed[x]` Element minimum cardinalities differ: '1' vs '0'

1. [US Core Specimen Profile]

    Additional requirements in [IPS Specimen](http://hl7.org/fhir/uv/ips/StructureDefinition/Specimen-uv-ips):

   - `Specimen.type.coding` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Specimen.type.coding.system` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Specimen.type.coding.code` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Specimen.type.text` Element differ in definition for mustSupport/Obligations: 'true' vs 'false'
   - `Specimen.subject.reference` Element minimum cardinalities differ: '1' vs '0'

###### Missing Data
US Core compliant resources are compliant with IPA requirements for Missing Data.

###### Suppressed Data
IPA does not include requirements for Suppressed Data.

###### Additional profiles in IPS
This version of US Core has no equivalent profile for the following IPS profiles:

- [Bundle (IPS)](https://hl7.org/fhir/uv/ips/StructureDefinition-Bundle-uv-ips.html)
- [Composition (IPS)](https://hl7.org/fhir/uv/ips/StructureDefinition-Composition-uv-ips.html)
- [DeviceUseStatement (IPS)](https://hl7.org/fhir/uv/ips/StructureDefinition-DeviceUseStatement-uv-ips.html)
- [Flag - Alert (IPS)](https://hl7.org/fhir/uv/ips/StructureDefinition-Flag-alert-uv-ips.html)
- [ImagingStudy (IPS)](https://hl7.org/fhir/uv/ips/StructureDefinition-ImagingStudy-uv-ips.html)
- [MedicationStatement (IPS)](https://hl7.org/fhir/uv/ips/StructureDefinition-MedicationStatement-uv-ips.html)
- [Observation Pregnancy - Expected Delivery Date (IPS)](https://hl7.org/fhir/uv/ips/StructureDefinition-Observation-pregnancy-edd-uv-ips.html)
- [Observation Pregnancy - Outcome (IPS)](https://hl7.org/fhir/uv/ips/StructureDefinition-Observation-pregnancy-outcome-uv-ips.html)
</div><!-- new-content -->

{% include link-list.md %}
