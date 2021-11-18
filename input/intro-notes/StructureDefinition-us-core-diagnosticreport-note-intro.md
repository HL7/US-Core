
This profile sets minimum expectations for searching and fetching Diagnostic Reports and Notes using the [DiagnosticReport] resource. This profile identifies the mandatory core elements, extensions, vocabularies and value sets which **SHALL** be present in the DiagnosticReport when using this profile. Prior to reviewing this profile, implementers are encouraged to read the [Clinical Notes Guidance] to understand the overlap of [US Core DiagnosticReport Profile for Report and Note exchange] and [US Core DocumentReference Profile].

**Example Usage Scenarios:**

The following are example usage scenarios for the Diagnostic Report profile:

-   {:.new-content}Query for a specific clinical test result such as electrocardiogram (ECG)
-   {:.new-content}Query for a specific imaging test result
-   Query for a specific Radiology note (e.g., 84178-3 Interventional Radiology Note)
-   Query for category of reports (e.g. all Cardiology reports)


### Mandatory and Must Support Data Elements

The following data-elements must always be present ([Mandatory] definition]) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.  

**Each Diagnostic Report must have:**

1.  a status
1.  a category
1.  a code describing the type of report
1.  a patient
1.  {:.new-content}date and time the report was created*

*This element has the following constraint: SHALL be present if status is
'partial', 'preliminary', 'final', 'amended', 'corrected' or 'appended'.{:.new-content}

**Each Diagnostic Report must support:**

1.  the encounter the report occurred within
1.  instant the report was released
1.  an author (actor) producing the report
2.  {:.new-content}a reference one or more test results
2.  {:.new-content}a reference one or more images*
3.  {:.new-content}a reference to one or more DICOM imaging studies*
4.  a reference to the full report (presentedForm)

*See the next section

**Profile specific implementation guidance:**

- See [Clinical Notes Guidance]
- The `DiagnosticReport.category` binding must support at a minimum the [US Core DiagnosticReport Category Codes] of Cardiology, Radiology, and Pathology. Other categories may be supported.
- A server will return how a customer has categorized their reports at a particular site. Categorization of reports is not consistent across sites. (e.g. a system may categorize an orthopedic note as cardiology.)
-  {:.new-content}Diagnostic imaging results in visual images requiring interpretation and clinical test results/reports may also reference images as part of the report. DiagnosticReport resource can link to both DICOM imaging studies and binary images directly by referencing [ImagingStudy] in `DocumentReference.imagingStudy`, or [Media]  in`DocumentReference.media`.
   *   Although both are marked as must support, the server system is not required to support both, but **SHALL** support at least one of these elements.
   * The client application **SHALL** support both elements and target resources.

Media which is referenced in R4 is only [Maturity Level] FMM 1 and in the FHIR R5 release Media is replaced by DocumentReference (Maturity Level FMM 3+).  Should this profile use an extension to reference DocumentReference instead of Media?
{:.note-to-balloters}

#### Examples

- {:.new-content}[Cardiology Report](DiagnosticReport-cardiology-report.html)
- [Radiology Report](DiagnosticReport-chest-xray-report.html)
- {:.new-content}[DXA Bone Density](DiagnosticReport-bone-density-report.html)

{% include link-list.md %}
