---
title: Terminology
layout: default
active: terminology
---

This page lists all the ValueSets, CodeSystems, and ConceptMaps defined as part of the US Core implementation Guide. For more information on using codes in resources, see the [guidance section](general-guidance.html#using-codes-in-us-core-profiles) as well as in the [FHIR specification]({{site.data.fhir.path}}terminologies.html).

### Value Sets

These value sets have been defined for this implementation guide.

- [US Core Medication Codes(RxNorm)](ValueSet-us-core-medication-codes.html)
- [US Core SmokingStatus](ValueSet-us-core-observation-smokingstatus.html)
- [OMB Race Categories](ValueSet-omb-race-category.html)
- [US Core Common substances for allergy and intolerance documentationincluding refutations](ValueSet-us-core-allergy-substance.html)
- [US Core Narrative Status](ValueSet-us-core-narrative-status.html)
- [US Core DocumentReferenceType](ValueSet-us-core-documentreference-type.html)
- [US Core Provenance Participant TypeCodes](ValueSet-us-core-provenance-participant-type.html)
- [OMB Ethnicity Categories](ValueSet-omb-ethnicity-category.html)
- [US Core Condition CategoryCodes](ValueSet-us-core-condition-category.html)
- [Detailed ethnicity](ValueSet-detailed-ethnicity.html)
- [US Core Vaccine National Drug Codes(NDC)](ValueSet-us-core-ndc-vaccine-codes.html)
- [US Core ICD-10-PCS ProcedureCodes](ValueSet-us-core-procedure-icd10pcs.html)
- [US Core Provider Speciality(NUCC)](ValueSet-us-core-provider-specialty.html)
- [US Core Vaccine Administered Value Set(CVX)](ValueSet-us-core-vaccines-cvx.html)
- [US Core Status for Smoking StatusObservation](ValueSet-us-core-observation-smoking-status-status.html)
- [USPS Two Letter Alphabetic Codes](ValueSet-us-core-usps-state.html)
- {: .note-to-balloters}[US Core Encounter Type](ValueSet-us-core-encounter-type.html)
- [US Core Problem](ValueSet-us-core-problem.html)
- [Birth Sex](ValueSet-birthsex.html)
- [US Core Diagnosticreport Report And NoteCodes](ValueSet-us-core-diagnosticreport-report-and-note-codes.html)
- [US Core Provider Role (NUCC)](ValueSet-us-core-provider-role.html)
- [US Core Smoking Status ObservationCodes](ValueSet-us-core-smoking-status-observation-codes.html)
- [US Core CareTeam ProviderRoles](ValueSet-us-core-careteam-provider-roles.html)
- [US Core DiagnosticReportCategory](ValueSet-us-core-diagnosticreport-category.html)
- [US Core Clinical Note Type](ValueSet-us-core-clinical-note-type.html)
- [US Core DocumentReferenceCategory](ValueSet-us-core-documentreference-category.html)
- [US Core Procedure Codes](ValueSet-us-core-procedure-code.html)
- [Language codes with language and optionally a regionmodifier](ValueSet-simple-language.html)
- [US Core Observation Value Codes(SNOMED-CT)](ValueSet-us-core-observation-value-codes.html)
- [US Core Diagnostic Report LaboratoryCodes](ValueSet-us-core-diagnosticreport-lab-codes.html)
- [US Core Problem](ValueSet-us-core-problem.html)
- [Birth Sex](ValueSet-birthsex.html)
- [US Core Diagnosticreport Report And NoteCodes](ValueSet-us-core-diagnosticreport-report-and-note-codes.html)
- [US Core Provider Role (NUCC)](ValueSet-us-core-provider-role.html)
- [US Core Smoking Status ObservationCodes](ValueSet-us-core-smoking-status-observation-codes.html)
- [US Core CareTeam ProviderRoles](ValueSet-us-core-careteam-provider-roles.html)
- [US Core DiagnosticReportCategory](ValueSet-us-core-diagnosticreport-category.html)
- [US Core Clinical Note Type](ValueSet-us-core-clinical-note-type.html)
- [US Core DocumentReferenceCategory](ValueSet-us-core-documentreference-category.html)
- {: .note-to-balloters}[US Core Procedure Codes](ValueSet-us-core-procedure-code.html)
- [Language codes with language and optionally a regionmodifier](ValueSet-simple-language.html)
- [US Core Observation Value Codes(SNOMED-CT)](ValueSet-us-core-observation-value-codes.html)
- [US Core Diagnostic Report LaboratoryCodes](ValueSet-us-core-diagnosticreport-lab-codes.html)
- [Detailed Race](ValueSet-detailed-race.html)


<!-- {% raw %}
{% include list-simple-valuesets.xhtml %}
{% endraw %} -->

### Code Systems

See the [FHIR terminology section]({{site.data.fhir.path}}terminologies-systems.html) for a complete discussion on code systems and a list of codes system names used in FHIR. The following additional names (URIs) have been identified for this implementation guide,   If a URI is listed here, it **SHALL** be used in the US Core profiles in preference to any other code system name.

**Code systems published in this IG** - Includes US Core defined code systems and externally defined code systems

{% include list-simple-codesystems.xhtml %}

<p>
</p>

**Externally Published code systems**

|URI|Source|Comment|OID (for non-FHIR systems)|
|---|---|---|---|           
|`http://hl7.org/fhir/sid/icd-10-cm`|[CMS](http://www.cms.gov/Medicare/Coding/ICD10/)|*International Classification of Diseases, 10th Revision, Clinical Modification (ICD-10-CM)* -  See [Using ICD-[X] with FHIR]({{site.data.fhir.path}}icd.html#4.2.11).|2.16.840.1.113883.6.90|
|`http://www.icd10data.com/icd10pcs`|[CMS](http://www.cms.gov/Medicare/Coding/ICD10/)|*International Classification of Diseases, 10th Revision, Procedure Coding System (ICD-10-PCS)* -  See [ICD-10 PCS Codes](http://www.icd10data.com/icd10pcs) for online access to codes for general information purposes. |2.16.840.1.113883.6.4|
|`http://hl7.org/fhir/us/sid/cdt`|[ADA](http://www.ada.org/en/publications/cdt)|*Code on Dental Procedures and Nomenclature*|2.16.840.1.113883.6.13|
|`https://www.usps.com`|[USPS](http://pe.usps.com/text/pub28/28apb.htm)|*United States Postal Service Two–Letter State and Possession Abbreviations*|2.16.840.1.113883.3.88.12.80.1|
{:.grid}

<!--
|[urn:oid:2.16.840.1.113883.6.238](CodeSystem-cdcrec.html)|[CDC](https://www.cdc.gov/phin/resources/vocabulary/index.html)|*Race & Ethnicity - CDC* - See [CDC Race and Ethnicity Code Set Version 1.0](https://www.cdc.gov/phin/resources/vocabulary/documents/cdc-race--ethnicity-background-and-purpose.pdf).|2.16.840.1.113883.6.238
-->

<p>
</p>

### ConceptMaps

The following concept mappings have been defined as part of the this guide.

  {% include list-simple-conceptmaps.xhtml %}
<p>
</p>
