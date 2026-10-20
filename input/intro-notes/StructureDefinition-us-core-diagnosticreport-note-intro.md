
{% include us-core-maturity.md id="us-core-diagnosticreport-note" %}

**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-   Query for a specific clinical test result, such as an electrocardiogram (ECG)
-   Query for a specific imaging test result
-   Query for a specific Radiology note (e.g., 84178-3 Interventional Radiology Note)
-   Query for a category of reports (e.g., all Cardiology reports)

### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.

**Each Diagnostic Report Must Have:**

1. a status
1. a category<sup>1</sup>
1. a code describing the type of report
1. a patient
1. the diagnostically relevant time (known as the "effective time" and typically the time of the procedure)<sup>2</sup>

**Each Diagnostic Report Must Support:**

1. encounter associated with DiagnosticReport
1. instant the report was released
1. an author (actor) producing the report<sup>3</sup>
2. a results interpreter<sup>3</sup>
3. a reference to one or more test results
4. a reference to the full report (presentedForm)

{% include additional-requirements-intro.md type="DiagnosticReport" plural="true" %}

1. <span class="bg-success" markdown="1">a business identifier for the report<sup>4</sup></span><!-- new-content -->
1. <span class="bg-success" markdown="1">a reference to the order the report fulfills<sup>4</sup></span><!-- new-content -->
1. <span class="bg-success" markdown="1">a reference to one or more imaging studies<sup>4</sup></span><!-- new-content -->
1. <span class="bg-success" markdown="1">a reference to one or more images<sup>4</sup></span><!-- new-content -->

<span class="bg-success" markdown="1"><sup>1,2,3,4</sup> see guidance below</span><!-- new-content -->

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the US Core Profile to support implementation and certification.

- See [Clinical Notes]
- <sup>2</sup>`DiagnosticReport.effective[x]` has the following constraint: **SHALL** be present if status is 'partial', 'preliminary', 'final', 'amended', 'corrected', or 'appended'.<sup>[§][CONF-0356]</sup>
- <sup>1</sup>The `DiagnosticReport.category` binding Must Support, at a minimum, the [US Core DiagnosticReport Category Codes] of Cardiology, Radiology, and Pathology. Other categories **MAY** be supported.<sup>[§][CONF-0361]</sup>
  - It is up to the data source to categorize the documents they send. Therefore, Clients need to understand that data categorization is somewhat subjective, and the categorization applied by the source may not align with the Client's expectations. Any linkages between specific LOINC codes and the LP-type codes can be used as guidance. If LOINC develops a hierarchy or categorization to align these concepts, US Core will be updated.
- A Server will return how a customer has categorized their reports at a particular site. Categorization of reports is not consistent across sites. (e.g., a system may categorize an orthopedic note as cardiology.)
- For Diagnostic Imaging Reports systems **SHOULD** support using the subset of LOINC codes listed in Table 4: LOINC® Document Type Codes in [HL7 Standard for CDA® Release 2: Imaging Integration; Basic Imaging Reports in CDA and DICOM, Release 1]<sup>[§][CONF-0364]</sup>
{% include provenance-author-bullet-generator.md footnote-symbol='<sup>3</sup>' %}
<div class="bg-success" markdown="1">

#### USCDI Diagnostic Imaging Reference Data Element

- <sup>4</sup>Diagnostic imaging results in visual images requiring interpretation, and clinical test results and reports can also reference images as part of the report. There is no single approach for accessing imaging studies alongside clinical data using a single authorization flow to give patients and providers access to the images. For the USCDI *Diagnostic Imaging Reference* Data Element, this profile marks four elements as Additional USCDI Requirements. A Server supports all four; they address different parts of the problem and none replaces another.

   * The `DiagnosticReport.imagingStudy` element **SHOULD** be used to support exchange with systems that can view DICOM (Digital Imaging and Communications in Medicine) studies, series, and SOP (Service-Object Pair) instances referenced in the [ImagingStudy] resource.<sup>[§][CONF-0838]</sup> The reference is to the [US Core ImagingStudy Profile], which carries the identifiers and the endpoint information needed to locate or access the study. This is the principal mechanism for meeting the *Diagnostic Imaging Reference* Data Element.
   * The `DiagnosticReport.media.link` element **SHOULD** be used to support links to various patient-friendly content, such as jpg images of x-rays (see the DiagnosticReport Chest X-ray Report Example).<sup>[§][CONF-0837]</sup> Supporting `DiagnosticReport.media.link` is not a substitute for meeting the *Diagnostic Imaging Reference* Data Element.
   * Systems can also use business identifiers such as accession numbers in `DiagnosticReport.identifier` to access the source images from external sources. The same accession number appears on the order as `ServiceRequest.identifier` and on the study as `ImagingStudy.identifier`.
      * The `DiagnosticReport.basedOn` element connects the DiagnosticReport to the originating order in the EHR. Systems that initiate the order **SHOULD** use this element when reporting the results,<sup>[§][CONF-0836]</sup> because imaging identifiers such as the accession number originate with the order and are what connect the order, the report, and the imaging study.

  The [Argonaut SMART Imaging Access project](https://confluence.hl7.org/spaces/AP/pages/161060067/SMART+Imaging+Access) defined an approach to access imaging studies using a single authorization flow.
</div><!-- new-content -->

{% include link-list.md %}
