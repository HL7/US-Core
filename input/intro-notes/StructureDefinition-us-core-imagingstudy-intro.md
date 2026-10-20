{% include new_page.md %}

{% include us-core-maturity.md id="us-core-imagingstudy" %}

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core ImagingStudy Profile:

-   Query for ImagingStudy resources belonging to a Patient
-   Query for a Patient's ImagingStudy resources by accession number or DICOM Study Instance UID
-   [Record or update] a Patient ImagingStudy

### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.

**Each ImagingStudy Must Have:**

1. a status
1. a patient

**Each ImagingStudy Must Support:**

1. one or more identifiers for the study<sup>1</sup>
1. an accession number<sup>1</sup>
1. one or more endpoints providing access to the study<sup>2</sup>

<sup>1,2</sup> see guidance below

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the US Core Profile to support implementation and certification.

* This profile sets minimum expectations for the information needed to locate or access an imaging study, while allowing implementers to include additional study details, such as modality and series- and instance-level information, when needed.
* The [US Core DiagnosticReport Profile for Report and Note Exchange] references this profile through `DiagnosticReport.imagingStudy`. That reference is the principal way a report conveys the USCDI Diagnostic Imaging Reference data element.
* <sup>1</sup>`ImagingStudy.identifier` is sliced to identify two identifiers in common use:
  * The `accessionNumber` slice identifies the order the study fulfills and is used to query for a study. It is not used to retrieve the images. The same accession number appears on the order as `ServiceRequest.identifier` and on the report as `DiagnosticReport.identifier`, which is what ties the three together.
  * The `studyInstanceUID` slice is the DICOM Study Instance UID, patterned on the `urn:dicom:uid` identifier system. It is neither mandatory nor Must Support in this version of US Core. It is defined so systems that hold the Study Instance UID have a consistent way to communicate it, and it establishes a path for a future version.
* <sup>2</sup>`ImagingStudy.endpoint` is the network service that provides access to the study. Endpoints serve several different functions and audiences such as:
  * launching a remote picture archiving and communication system (PACS) or viewer
  * providing a patient-accessible viewer
  * providing a provider-accessible viewer
  * enabling the transfer or retrieval of imaging objects, for example through a DICOMweb WADO-RS service

  A system can offer different endpoints depending on the authorization and the intended use. The receiving system is not assumed to contain an imaging viewer itself, and the presence of an endpoint does not guarantee access to the images.
* The [Argonaut SMART Imaging Access](https://confluence.hl7.org/spaces/AP/pages/161060067/SMART+Imaging+Access) project defines an approach to accessing imaging studies using a single authorization flow.


{% include link-list.md %}
