
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
1. a category*
1. a code describing the type of report
1. a patient
1. the diagnostically relevant time (known as the "effective time" and typically the time of the procedure)*

\*This element has the following constraint: **SHALL** be present if status is
'partial', 'preliminary', 'final', 'amended', 'corrected', or 'appended'.

**Each Diagnostic Report Must Support:**

1. encounter associated with DiagnosticReport
1. instant the report was released
1. an author (actor) producing the report
2. a results interpreter*
3. a reference to one or more test results
4. a reference to one or more images
5. a reference to the full report (presentedForm)

\* see guidance below

**Profile Specific Implementation Guidance:**

- See [Clinical Notes]
- The `DiagnosticReport.category` binding Must Support, at a minimum, the [US Core DiagnosticReport Category Codes] of Cardiology, Radiology, and Pathology. Other categories may be supported.
  - It is up to the data source to categorize the documents they send. Therefore, Clients need to understand that data categorization is somewhat subjective, and the categorization applied by the source may not align with the Client's expectations. Any linkages between specific LOINC codes and the LP-type codes may be used as guidance. If LOINC develops a hierarchy or categorization to align these concepts, US Core will be updated.
- A Server will return how a customer has categorized their reports at a particular site. Categorization of reports is not consistent across sites. (e.g., a system may categorize an orthopedic note as cardiology.)
- For Diagnostic Imaging Reports systems **SHOULD** support using the subset of  LOINC codes defined in CONF-DIR-19 in *HL7 Implementation Guide for CDA Release 2: Imaging Integration, Levels 1, 2, and 3, Basic Imaging Reports in CDA and DICOM Diagnostic Imaging Reports (DIR) - Universal Realm, Release 1.0.
{% include provenance-author-bullet-generator.md %}
-  Diagnostic imaging results in visual images requiring interpretation and clinical test results/reports may also reference images as part of the report. There is no single approach for accessing imaging studies alongside clinical data using a single authorization flow to give patients and providers access to the images.

   * The `DiagnosticReport.media.link` element **SHOULD** be used to support links to various patient-friendly content, such as jpg images of x-rays (see the DiagnosticReport Chest X-ray Report Example).
   * The `DiagnosticReport.imagingStudy` element **SHOULD** be used to support exchange with systems that can view DICOM (Digital Imaging and Communications in Medicine) studies, series, and SOP (Service-Object Pair) instances referenced in the [ImagingStudy] resource.
   * Alternatively, systems can use business identifiers such as accession numbers in the `identifier` element to access the source images from external sources.
   * The [Argonaut SMART Imaging Access project](https://confluence.hl7.org/spaces/AP/pages/161060067/SMART+Imaging+Access) defined an approach to access imaging studies using a single authorization flow.

- The `DiagnosticRequest.basedOn` element connects the DiagnosticReport to the originating order in the EHR. Systems that initiate the order **SHOULD** use this element when reporting the results.


{% include link-list.md %}
