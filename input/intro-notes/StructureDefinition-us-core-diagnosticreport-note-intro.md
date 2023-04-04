
**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-   Query for a specific clinical test result such as electrocardiogram (ECG)
-   Query for a specific imaging test result
-   Query for a specific Radiology note (e.g., 84178-3 Interventional Radiology Note)
-   Query for category of reports (e.g. all Cardiology reports)


### Mandatory and Must Support Data Elements

The following data-elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Views] below provides the  formal summary, definitions, and  terminology requirements.  

**Each Diagnostic Report must have:**

1.  a status
1.  a category
1.  a code describing the type of report
1.  a patient
1.  the diagnostically relevant time (known as the "effective time" and typically the time of the procedure)*

\*This element has the following constraint: **SHALL** be present if status is
'partial', 'preliminary', 'final', 'amended', 'corrected' or 'appended'.

**Each Diagnostic Report must support:**

1.  the encounter the report occurred within
1.  instant the report was released
1.  an author (actor) producing the report
2.  a reference to one or more test results
2.  a reference to one or more images
4.  a reference to the full report (presentedForm)

**Profile specific implementation guidance:**

- See [Clinical Notes]
- The `DiagnosticReport.category` binding must support at a minimum the [US Core DiagnosticReport Category Codes] of Cardiology, Radiology, and Pathology. Other categories may be supported.
  - It is up to the data source to categorize the documents they send. Therefore, clients need to understand that data categorization is somewhat subjective and the categorization applied by the source may not align with the client’s expectations. Any linkages between specific LOINC codes and the LP-type codes may be used as guidance. If LOINC develops a hierarchy or categorization to align these concepts, US Core will be updated.
- A server will return how a customer has categorized their reports at a particular site. Categorization of reports is not consistent across sites. (e.g. a system may categorize an orthopedic note as cardiology.)
- For Diagnostic Imaging Reports systems **SHOULD** support using the subset of  LOINC codes defined in CONF-DIR-19 in *HL7 Implementation Guide for CDA Release 2: Imaging Integration, Levels 1, 2, and 3, Basic Imaging Reports in CDA and DICOM Diagnostic Imaging Reports (DIR) - Universal Realm, Release 1.0.

<div class="bg-success" markdown="1">
-  Diagnostic imaging results in visual images requiring interpretation and clinical test results/reports may also reference images as part of the report. There is no single approach for accessing imaging studies alongside clinical data using a single authorization flow to give patients and providers access the images.
   * The `media.link` element is marked as must support and the [Media] resource to which it links can support a variety of patient-friendly content such as jpg images of xrays (see the DiagnosticReport Chest Xray Report Example).
   * DICOM studies, series, and SOP instances are encoded as UUID identifiers in the [ImagingStudy] resource which is referenced by the `imagingStudy` element. This optional element can be used by systems with the tools and specific viewers to view these images.
   * Alternatively, systems can use business identifiers such as accession numbers in the `identifer` element to access the source images from external sources.
</div><!-- new-content -->


{% include link-list.md %}
