
This profile sets minimum expectations for searching and fetching Diagnostic Reports and Notes using the [DiagnosticReport] resource. This profile identifies the mandatory core elements, extensions, vocabularies and value sets which **SHALL** be present in the DiagnosticReport when using this profile. Prior to reviewing this profile, implementers are encouraged to read the [Clinical Notes Guidance] to understand the overlap of [US Core DiagnosticReport Profile for Report and Note exchange] and [US Core DocumentReference Profile].

**Example Usage Scenarios:**

The following are example usage scenarios for the this profile:

-   Query for a specific clinical test result such as electrocardiogram (ECG)
-   Query for a specific imaging test result
-   Query for a specific Radiology note (e.g., 84178-3 Interventional Radiology Note)
-   Query for category of reports (e.g. all Cardiology reports)


### Mandatory and Must Support Data Elements

The following data-elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.  

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

- See [Clinical Notes Guidance]
- The `DiagnosticReport.category` binding must support at a minimum the [US Core DiagnosticReport Category Codes] of Cardiology, Radiology, and Pathology. Other categories may be supported.
- A server will return how a customer has categorized their reports at a particular site. Categorization of reports is not consistent across sites. (e.g. a system may categorize an orthopedic note as cardiology.)
- For Diagnostic Imaging Reports systems SHOULD support using the subset of  LOINC codes defined in CONF-DIR-19 in *HL7 Implementation Guide for CDA Release 2: Imaging Integration, Levels 1, 2, and 3, Basic Imaging Reports in CDA and DICOM Diagnostic Imaging Reports (DIR) – Universal Realm, Release 1.0.*
-  Diagnostic imaging results in visual images requiring interpretation and clinical test results/reports may also reference images as part of the report. <span class="bg-success" markdown="1">The DiagnosticReport resource links to both [Media] which represents a specific kind of Observation whose value is image data and [ImagingStudy] which represents the content in a DICOM imaging study.</span><!-- new-content -->
   * <span class="bg-success" markdown="1">Only Media is marked as must support in this profile</span><!-- new-content -->
   * <span class="bg-success" markdown="1">The imagingStudy element **MAY** be used by systems to reference ImagingStudy.  However, it is not supported by the majority of systems and its inclusion would be an unnecessary barrier to adoption.</span><!-- new-content -->

{% include link-list.md %}
