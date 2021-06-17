
This page lists all the ValueSets, CodeSystems, and ConceptMaps defined as part of the US Core implementation Guide. For more information on using codes in Us Core, see the [FHIR Terminology] section in the FHIR specification and [Must Support - Coded Elements] in this guide.

### Value Sets

These value sets have been defined for this implementation guide.

<!-- {% raw %}{% include list-simple-valuesets.xhtml %}{% endraw %} -->

*   [Birth Sex](ValueSet-birthsex.html)
*   [Language codes with language and optionally a region modifier](ValueSet-simple-language.html)
*   [OMB Ethnicity Categories](ValueSet-omb-ethnicity-category.html)*
*   [Detailed ethnicity](ValueSet-detailed-ethnicity.html)*
*   [OMB Race Categories](ValueSet-omb-race-category.html)*
*   [Detailed Race](ValueSet-detailed-race.html)*
*   [US Core Clinical Note Type](ValueSet-us-core-clinical-note-type.html)
*   [US Core Condition Category Codes](ValueSet-us-core-condition-category.html)
*   [US Core Condition Code](ValueSet-us-core-condition-code.html)
*   [US Core Diagnostic Report Laboratory Codes](ValueSet-us-core-diagnosticreport-lab-codes.html)
*   [US Core DiagnosticReport Category](ValueSet-us-core-diagnosticreport-category.html)
*   [US Core Diagnosticreport Report And Note Codes](ValueSet-us-core-diagnosticreport-report-and-note-codes.html)
*   [US Core DocumentReference Category](ValueSet-us-core-documentreference-category.html)
*   [US Core DocumentReference Type](ValueSet-us-core-documentreference-type.html)
*   [US Core Encounter Type](ValueSet-us-core-encounter-type.html)
*   [US Core Narrative Status](ValueSet-us-core-narrative-status.html)
*   [US Core Observation Value Codes (SNOMED-CT)](ValueSet-us-core-observation-value-codes.html)
*   [US Core Procedure Codes](ValueSet-us-core-procedure-code.html)
*   [US Core Provenance Participant Type Codes](ValueSet-us-core-provenance-participant-type.html)
*   [US Core Provider Role (NUCC)](ValueSet-us-core-provider-role.html)
*   [US Core Status for Smoking Status Observation](ValueSet-us-core-observation-smoking-status-status.html)
*   [US Core Smoking Status Observation Codes](ValueSet-us-core-smoking-status-observation-codes.html)
* [US Core Observation Smokingstatus Max-Binding](ValueSet-us-core-observation-smokingstatus-max.html)
*   [USPS Two Letter Alphabetic Codes](ValueSet-us-core-usps-state.html)
*   {:.new-content #FHIR-28391}[US Core Vital Signs ValueSet](ValueSet-us-core-vital-signs.html)

### Code Systems

See the [FHIR terminology section]({{site.data.fhir.path}}terminologies-systems.html) for a complete discussion on code systems and a list of codes system names used in FHIR.  Most code systems used in this guide are defined in the base FHIR specification. The following code systems are unique to this guide and not listed in the base FHIR specification.  If a URI is listed here, it **SHALL** be used in the US Core profiles to identify the code system in preference to any other code system URI.
{:.new-content}

**Code systems published in this IG** - Includes US Core defined code systems and externally defined code systems

<!-- {% raw %}{% include list-simple-codesystems.xhtml %}{% endraw %} -->

*   [Race & Ethnicity - CDC](CodeSystem-cdcrec.html)*
*   [US Core CarePlan Category Extension Codes](CodeSystem-careplan-category.html)
*   [US Core Condition Category Extension Codes](CodeSystem-condition-category.html)
*   [US Core DocumentReferences Category Codes](CodeSystem-us-core-documentreference-category.html)
*   [US Core Provenance Participant Type Extension Codes](CodeSystem-us-core-provenance-participant-type.html)

<div markdown="1" class="new-content">
<div markdown="1" class="stu-note">
\* In the future, the Race & Ethnicity - CDC code system and value sets will migrate from US Core to [HL7 Terminology](https://terminology.hl7.org/).
</div>
</div>
<br />

**Externally Published code systems**

|URI|Source|Comment|OID (for non-FHIR systems)|
|---|---|---|---|
|`http://www.cms.gov/Medicare/Coding/HCPCSReleaseCodeSets`|[CMS](https://www.cms.gov/Medicare/Coding/HCPCSReleaseCodeSets)|*Healthcare Common Procedure Coding System (HCPCS) level II alphanumeric codes*|2.16.840.1.113883.6.285|
|`http://www.cms.gov/Medicare/Coding/ICD10`|[CMS](http://www.cms.gov/Medicare/Coding/ICD10/)|*International Classification of Diseases, 10th Revision, Procedure Coding System (ICD-10-PCS)* -  See [ICD-10 PCS Codes](http://www.icd10data.com/icd10pcs) for online access to codes for general information purposes. |2.16.840.1.113883.6.4|
|`http://ada.org/cdt`|[ADA](http://www.ada.org/en/publications/cdt)|*Code on Dental Procedures and Nomenclature*|2.16.840.1.113883.6.13|
|`https://www.usps.com`|[USPS](http://pe.usps.com/text/pub28/28apb.htm)|*United States Postal Service Two–Letter State and Possession Abbreviations*|2.16.840.1.113883.6.92|
{:.grid .new-content}

<!--
|[urn:oid:2.16.840.1.113883.6.238](CodeSystem-cdcrec.html)|[CDC](https://www.cdc.gov/phin/resources/vocabulary/index.html)|*Race & Ethnicity - CDC* - See [CDC Race and Ethnicity Code Set Version 1.0](https://www.cdc.gov/phin/resources/vocabulary/documents/cdc-race--ethnicity-background-and-purpose.pdf).|2.16.840.1.113883.6.238


<p>
</p>

### ConceptMaps

The following concept mappings have been defined as part of the this guide.

  {%raw%}{% include list-simple-conceptmaps.xhtml %}{%endraw%}
<p>
</p>

-->
<div class="new-content" markdown="1">
### Using Value Set Authority Center (VSAC)

This guide links terminology directly to the FHIR® Terminology Service for VSAC Resources ([Value Set Authority Center (VSAC) - NIH](https://vsac.nlm.nih.gov/)) where applicable using a RESTful API service for accessing the VSAC value sets and supported code systems.

  - It is a requirement of VSAC to log in using your own *UMLS API Key* to view the value sets. [VSAC UMLS Licensing information](https://www.nlm.nih.gov/vsac/support/usingvsac/requestumlslicense.html).  (See the screen shots below)
  - The value sets in VSAC are specified using a VSAC value set OID.  
  - The retrieval of a value set using the FHIR API structure using just the OID provided will only retrieve the value set definition, when available, and to obtain the expansion, the expansion operation is used.

 For example, the [US Core Smoking Status Observation Profile] valueCodeableConcept element has a preferred binding to the Smoking Status value set in VSAC using this link `https://vsac.nlm.nih.gov/valueset/2.16.840.1.113883.11.20.9.38/expansion`. The screenshot below illustrates that by clicking on the link:

 {% include img.html img="vsac-1.png" caption="Figure 1: VSAC link" %}

The reader is redirected to the VSAC login page to enter an API Key:

 {% include img.html img="vsac-2.png" caption="Figure 2: VSAC API-Key Login" %}

After successfully entered the API Key the value set can be inspected, downloaded, etc:

 {% include img.html img="vsac-3.png" caption="Figure 3: VSAC Smoking Status ValueSet" %}

Note that only one login is required per session.
</div>

{% include link-list.md %}
