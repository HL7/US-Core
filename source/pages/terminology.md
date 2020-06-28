---
title: Terminology
layout: default
active: terminology
---

This page lists all the ValueSets, CodeSystems, and ConceptMaps defined as part of the US Core implementation Guide. For more information on using codes in resources, see the [guidance section](general-guidance.html#using-codes-in-us-core-profiles) as well as in the [FHIR specification]({{site.data.fhir.path}}terminologies.html).

### Value Sets

These value sets have been defined for this implementation guide.

<!-- {% raw %}{% include list-simple-valuesets.xhtml %}{% endraw %} -->

<li><a href="ValueSet-birthsex.html">Birth Sex</a></li>
<li><a href="ValueSet-detailed-ethnicity.html">Detailed ethnicity</a></li>
<li><a href="ValueSet-detailed-race.html">Detailed Race</a></li>
<li><a href="ValueSet-simple-language.html">Language codes with language and optionally a region modifier</a></li>
<li><a href="ValueSet-omb-ethnicity-category.html">OMB Ethnicity Categories</a></li>
<li><a href="ValueSet-omb-race-category.html">OMB Race Categories</a></li>
<li><a href="ValueSet-us-core-careteam-provider-roles.html">US Core CareTeam Provider Roles</a></li>
<li><a href="ValueSet-us-core-clinical-note-type.html">US Core Clinical Note Type</a></li>
<li><a href="ValueSet-us-core-allergy-substance.html">US Core Common substances for allergy and intolerance documentation including refutations</a></li>
<li><a href="ValueSet-us-core-condition-category.html">US Core Condition Category Codes</a></li>
<li><a href="ValueSet-us-core-condition-code.html">US Core Condition Code</a></li>
<li><a href="ValueSet-us-core-diagnosticreport-lab-codes.html">US Core Diagnostic Report Laboratory Codes</a></li>
<li><a href="ValueSet-us-core-diagnosticreport-category.html">US Core DiagnosticReport Category</a></li>
<li><a href="ValueSet-us-core-diagnosticreport-report-and-note-codes.html">US Core Diagnosticreport Report And Note Codes</a></li>
<li><a href="ValueSet-us-core-documentreference-category.html">US Core DocumentReference Category</a></li>
<li><a href="ValueSet-us-core-documentreference-type.html">US Core DocumentReference Type</a></li>
<li><a href="ValueSet-us-core-encounter-type.html">US Core Encounter Type</a></li>
<li><a href="ValueSet-us-core-procedure-icd10pcs.html">US Core ICD-10-PCS Procedure Codes</a></li>
<li><a href="ValueSet-us-core-medication-codes.html">US Core Medication Codes (RxNorm)</a></li>
<li><a href="ValueSet-us-core-narrative-status.html">US Core Narrative Status</a></li>
<li><a href="ValueSet-us-core-observation-value-codes.html">US Core Observation Value Codes (SNOMED-CT)</a></li>
<li><a href="ValueSet-us-core-procedure-code.html">US Core Procedure Codes</a></li>
<li><a href="ValueSet-us-core-provenance-participant-type.html">US Core Provenance Participant Type Codes</a></li>
<li><a href="ValueSet-us-core-provider-role.html">US Core Provider Role (NUCC)</a></li>
<li><a href="ValueSet-us-core-provider-specialty.html">US Core Provider Speciality (NUCC)</a></li>
<li><a href="ValueSet-us-core-observation-smokingstatus.html">US Core Smoking Status</a></li>
<li><a href="ValueSet-us-core-observation-smoking-status-status.html">US Core Status for Smoking Status Observation</a></li>
<li><a href="ValueSet-us-core-smoking-status-observation-codes.html">US Core Smoking Status Observation Codes</a></li>
<li><a href="ValueSet-us-core-vaccines-cvx.html">US Core Vaccine Administered Value Set (CVX)</a></li>
<li><a href="ValueSet-us-core-ndc-vaccine-codes.html">US Core Vaccine National Drug Codes (NDC)</a></li>
<li><a href="ValueSet-us-core-usps-state.html">USPS Two Letter Alphabetic Codes</a></li>

### Code Systems

See the [FHIR terminology section]({{site.data.fhir.path}}terminologies-systems.html) for a complete discussion on code systems and a list of codes system names used in FHIR. The following additional names (URIs) have been identified for this implementation guide,   If a URI is listed here, it **SHALL** be used in the US Core profiles in preference to any other code system name.

**Code systems published in this IG** - Includes US Core defined code systems and externally defined code systems

<!-- {% raw %}{% include list-simple-codesystems.xhtml %}{% endraw %} -->

<li><a href="CodeSystem-cdcrec.html">Race &amp; Ethnicity - CDC</a></li>
<li><a href="CodeSystem-careplan-category.html">US Core CarePlan Category Extension Codes</a></li>
<li><a href="CodeSystem-condition-category.html">US Core Condition Category Extension Codes</a></li>
<li><a href="CodeSystem-us-core-documentreference-category.html">US Core DocumentReferences Category Codes</a></li>
<li><a href="CodeSystem-us-core-provenance-participant-type.html">US Core Provenance Participant Type Extension Codes</a></li>

<p>
</p>

**Externally Published code systems**

|URI|Source|Comment|OID (for non-FHIR systems)|
|---|---|---|---|
|`urn:oid:2.16.840.1.113883.6.285`|[CMS](https://www.cms.gov/Medicare/Coding/MedHCPCSGenInfo/HCPCS_Coding_Questions.html)|*Healthcare Common Procedure Coding System (HCPCS) level II alphanumeric codes*|2.16.840.1.113883.6.285|
|`http://hl7.org/fhir/sid/icd-10-cm`|[CMS](http://www.cms.gov/Medicare/Coding/ICD10/)|*International Classification of Diseases, 10th Revision, Clinical Modification (ICD-10-CM)* -  See [Using ICD-[X] with FHIR]({{site.data.fhir.path}}icd.html#4.2.11).|2.16.840.1.113883.6.90|
|`http://www.cms.gov/Medicare/Coding/ICD10`|[CMS](http://www.cms.gov/Medicare/Coding/ICD10/)|*International Classification of Diseases, 10th Revision, Procedure Coding System (ICD-10-PCS)* -  See [ICD-10 PCS Codes](http://www.icd10data.com/icd10pcs) for online access to codes for general information purposes. |2.16.840.1.113883.6.4|
|`http://hl7.org/fhir/us/sid/cdt`|[ADA](http://www.ada.org/en/publications/cdt)|*Code on Dental Procedures and Nomenclature*|2.16.840.1.113883.6.13|
|`https://www.usps.com`|[USPS](http://pe.usps.com/text/pub28/28apb.html)|*United States Postal Service Two–Letter State and Possession Abbreviations*|2.16.840.1.113883.3.88.12.80.1|
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
