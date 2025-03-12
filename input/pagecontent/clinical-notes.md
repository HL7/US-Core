
​This section provides implementers with important definitions, requirements, and guidance on creating, using, and sharing Clinical Notes.

### Clinical Notes

Clinical notes are a key component in communicating a patient's current status. In the context of this implementation guide, the term "clinical notes" refers to the wide variety of documents generated on behalf of a patient in many care activities. They include notes to support transitions of care, care planning, quality reporting, billing, and even handwritten notes by providers. This implementation guide does not define new note types or set content requirements per note type. Instead, this implementation guide focuses on exposing clinical notes stored in existing systems.

This implementation guide defines how systems exchange ten "Common Clinical Notes" and three DiagnosticReport categories.

Servers **SHALL** support, at *minimum*, these ten "Common Clinical Notes":

  1. [Consultation Note (11488-4)]
  1. [Discharge Summary (18842-5)]
  1. [History & Physical Note (34117-2)]
  1. [Procedures Note (28570-0)] 
  1. [Progress Note (11506-3)]
  1. [Imaging Narrative (18748-4)]
  1. [Laboratory Report Narrative (11502-2)]
  1. [Pathology Report Narrative (11526-1)]
  1. [Surgical Operation Note (11504-8)]
  1. [Emergency Department Note (34111-5)]

Servers **SHALL** support, at *minimum*, these three DiagnosticReport categories:

  1. [Cardiology (LP29708-2)]
  1. [Pathology (LP7839-6)]
  1. [Radiology (LP29684-5)]

A DiagnosticReport category query allows a Client to retrieve multiple documents in a single query (see [Support Requirements](#support-requirements)).

The Argonaut project team provided this initial list to HL7 after surveying the Argonaut and the US Veterans Administration (VA) participants. They represent the *minimum* set a system must support to claim conformance to this guide. In addition, systems are encouraged to support other common notes types, such as:

* [Referral Note (57133-1)]
* [Surgical Operation Note (11504-8)]
* [Nurse Note (34746-8)]

The complete list of note (document) types is available in the [US Core DocumentReference Type Value Set].

### FHIR Resources to Exchange Clinical Notes

The [US Core DocumentReference Profile] and [US Core DiagnosticReport Profile for Report and Note exchange] support the exchange of clinical notes. (See  [Resource Selection](#resource-selection) for a complete discussion on the decision to use these resources.)

DocumentReference is the best choice when the narrative is broader than a specific order or report, such as a Progress Note or Discharge Summary Note. For example, the DocumentReference Resource can point to a short 2-3 sentence status of the patient or reference a complex CDA or Composition document, which can include *both* a narrative and discrete information.

DiagnosticReport is the best choice when a system needs to share discrete information or coded interpretations. The `DiagnosticReport.result` element supports the discrete data, and the `DiagnosticReport.presentedForm` element can represent the entire narrative report.

There is no single best practice for representing a scanned or narrative-only report due to the overlapping scope of the underlying resources and variability in system implementation. Reports may be represented by either a DocumentReference or a DiagnosticReport, as demonstrated by the green area in Figure 1. For example, some systems consider any scanned report or note a DocumentReference. Other systems allow users to categorize the scanned report as Lab and store it as DiagnosticReport.[^1]

{% include img-portrait.html img="DiagnosticReport_DocumentReference_Resource_Overlap.png" caption="Figure 1: DiagnosticReport and DocumentReference Report Overlap" %}

To enable consistent access to scanned DiagnosticReport clinical reports, the FHIR Server **SHALL** expose these overlapping scanned or narrative-only reports through *both* DiagnosticReport and DocumentReference by representing the same attachment URL using the corresponding elements listed below.[^2]  Exposing the content in this manner guarantees the Client will receive all the clinical information available for a patient and can easily identify duplicate data.

* `DocumentReference.content.attachment.url`
* `DiagnosticReport.presentedForm.url`

For example, when `DiagnosticReport.presentedForm.url` references a Scan (PDF), that Attachment **SHALL** also be accessible through `DocumentReference.content.attachment.url`.(See Figure 2) This guide requires servers to implement the duplicate reference to allow Clients to find Pathology reports or other Diagnostic Reports in either resource. If servers properly categorized scanned reports and used the correct resource per report type (e.g., Pathology scan in DiagnosticReport), this wouldn't be required. However, at the time of this IG's development, this duplication requirement is necessary due to a lack of consistency in the proper use of these resources.

{% include img.html img="both-url.jpg" caption="Figure 2: Expose a PDF Report Through Both DiagnosticReport and DocumentReference" %}

**Example JSON Snippets Referencing Common Binary in DocumentReference and DiagnosticReport**

DocumentReference:
```
{
  ...snip...
    "content": [
        {
            "attachment": {
                "contentType": "application/xhtml",
                "url": "http://example.org/fhir/Binary/1e404af3-077f-4bee-b7a6-a9be97e1ce32",
                "creation": "2005-12-24"
            }
        }
    ]
}
```
DiagnosticReport:
```
{
  ...snip...
   "presentedForm": [
        {
            "contentType": "application/xhtml",
            "url": "http://example.org/fhir/Binary/1e404af3-077f-4bee-b7a6-a9be97e1ce32",
            "creation": "2005-12-24"
        }
    ]
}
```


Not all scanned information stored through DocumentReference will be exposed through DiagnosticReport since DocumentReference stores other non-clinical information. For example, DocumentReference can point to an insurance card.

#### Support Requirements

This guide requires systems to implement the [US Core DocumentReference Profile] and to support a *minimum* of all ten  Common Clinical Notes listed above. Systems may extend their capabilities to the complete [US Core DocumentReference Type Value Set]. This requirement is necessary because some systems scan lab reports and don't store them in the DiagnosticReport resource. See [FHIR Resources to Exchange Clinical Notes](#fhir-resources-to-exchange-clinical-notes) for more detail.

This guide requires systems to implement the [US Core DiagnosticReport Profile for Report and Note exchange] and to support a *minimum* of the three report categories:

* [Cardiology (LP29708-2)]
* [Pathology (LP7839-6)]
* [Radiology (LP29684-5)]

Systems may support other categories as well.

The vendors that participated in developing this guide did not differentiate between the Diagnostic Report categories of Imaging and Radiology in their servers. Therefore, Client applications that query with category code of [Radiology (LP29684-5)] will receive Radiology and other imaging reports.

The following **SHOULD** be exposed via DiagnosticReport
* Imaging Narrative
* Laboratory Report Narrative
* Pathology Report Narrative
* Procedure Note

Servers that support DiagnosticReport will include the clinical note narrative content in `DiagnosticReport.presentedForm`.

A method for discovering the types of notes and reports that a server supports is described in the [Determining Server Note Type](#using-expand) section below.

Note that this guide focuses on exposing existing information, not how systems allow users to capture data. The contents of the notes or reports, even using standard LOINC concepts, may vary widely by the health system or location. For example, CT Spleen WO contrast (LOINC 30621-7) may include individual sections for history, impressions, conclusions, or just an impressions section. In addition, discharge Summaries may have different facility or regulatory content requirements.

#### Search

The standard FHIR [search] API retrieves clinical notes and reports. In this guide, the US Core [CapabilityStatement] and the *Quick Start* sections for the US Core Clinical Notes and Diagnostic Report and US Core DocumentReference Profiles define the required search parameters and describe how they are used.

Common Client search scenarios include:

1. A Client interested in all Radiology reports can use the following query:

   `GET [base]/DiagnosticReport?patient=[id]&category=http://loinc.org|LP29684-5`

1. A Client interested in all Clinical Notes can use the following query:

   `GET [base]/DocumentReference?patient=[id]&category=clinical-note`

1. A Client interested in all Discharge Summary Notes can use the following query:

  `GET [base]/DocumentReference?patient=[id]&type=http://loinc.org|18842-5`

<br/>

### Determining Server Note Type
{: #using-expand}

In addition to inspecting a server CapabilityStatement, a Client can determine the note and report types supported by a server by invoking the standard FHIR Value Set Expansion ([$expand]) operation defined in the **FHIR R4 specification**. Because servers may support different read and write formats, it is also used to determine the formats (for example, text, pdf) the server supports read and write transactions. Therefore, a FHIR server claiming support to this guide **SHOULD** support the $expand operation.

#### Discovering Note and Report Types

The note and report types for a particular server are discovered by invoking the #expand operation as follows:

`GET [base]/ValueSet/$expand?context=[context]&contextDirection=[contextDirection]`


Where:
- [contextDirection] = `incoming` for write operations and `outgoing` for read operations.
- [context] = 
   - `http://hl7.org/fhir/us/core/StructureDefinition/us-core-diagnosticreport-note#DiagnosticReport.category` for DiagnosticReport report category discovery
   -  `http://hl7.org/fhir/us/core/StructureDefinition/us-core-diagnosticreport-note#DiagnosticReport.code` for DiagnosticReport report type discovery
   - `http://hl7.org/fhir/us/core/StructureDefinition/us-core-documentreference#DocumentReference.category` for DocumentReference note category discovery
   -  `http://hl7.org/fhir/us/core/StructureDefinition/us-core-documentreference#DocumentReference.type` for DocumentReference note type discovery

**Examples**


{% include examplebutton.html example="note-and-report-types-scenario1" b_title = "Click on Here To See Scenario 1 Example" %}

{% include examplebutton.html example="note-and-report-types-scenario2" b_title = "Click on Here To See Scenario 2 Example" %}

{% include examplebutton.html example="note-and-report-types-scenario3" b_title = "Click on Here To See Scenario 3 Example" %}
{% include examplebutton.html example="note-and-report-types-scenario4" b_title = "Click on Here To See Scenario 4 Example" %}

#### Discovering Server Read and Write Formats

The read and write formats for a particular server are discovered by invoking the #expand operation as follows:

`GET [base]/ValueSet/$expand?context=[context]&contextDirection=[contextDirection]`

Where:
- [contextDirection] = `incoming` for write operations and `outgoing` for read operations.
 - [context] =
   - `http://hl7.org/fhir/us/core/StructureDefinition/us-core-diagnosticreport-note#DiagnosticReport.presentedForm.contentType` for DiagnosticReport report content type discovery.
   - `http://hl7.org/fhir/us/core/StructureDefinition/us-core-documentreference#DocumentReference.content.attachment.contentType` for DocumentReference note content type discovery


 **Examples**

 {% include examplebutton.html example="read-and-write-format-scenario1" b_title = "Click on Here To See Scenario 1 Example" %}
 {% include examplebutton.html example="read-and-write-format-scenario2" b_title = "Click on Here To See Scenario 2 Example" %}

### Resource Selection

When reviewing the minimal number of elements required for each Resource, the [FHIR Version {{site.data.fhir.version}}]({{site.data.fhir.path}}index.html) specification includes several appropriate places to include clinical notes such as Composition, ClinicalImpression, DocumentReference, DiagnosticReport, etc.  The developers of this guide also considered creating a new ClinicalNotes resource.   They evaluated the following characteristics to differentiate which FHIR resource was most appropriate:

* Discrete result information
* Note types
* Consistent Client access to scanned or narrative-only reports

While several resources work well for a specific use case, they don't solve the question "find all Clinical Notes for a patient?", especially considering the variability of Note formats. For example, systems use text, XHTML, PDF, and CDA to capture clinical notes. This variability led the designers to select the DocumentReference and DiagnosticReport resources as index mechanisms to the underlying content. In other words, a Client can query one of these resources, and it will return a pointer to a specific resource or the underlying binary content.

For example, consider the following situation for a Discharge Summary Note:

* System A supports the Discharge Summary as a Composition resource
* System B supports the Discharge Summary as a CDA Document
* System C supports the Discharge Summary as a PDF Document

The following single query into DocumentReference supports all three scenarios:

  GET [base]/DocumentReference?patient=[id]&type=http://loinc.org|18842-5

The server returns either a pointer to the Composition or the Binary resource. If other more specific resources are developed for Clinical Notes, systems can update their pointers to the new resource.  

#### Clinical Notes vs ClinicalImpression

[ClinicalImpression] resource supports the record of a clinical assessment.

>
A record of a clinical assessment performed to determine what problem(s) may affect the patient before planning the treatments or management strategies that are best to manage a patient's condition. Assessments are often 1:1 with a clinical consultation or encounter, but this varies greatly depending on the clinical workflow. This resource is called "ClinicalImpression" rather than "ClinicalAssessment" to avoid confusion with the recording of assessment tools such as Apgar score
>

However, in existing EHRs, the clinical impression is often contained within a broader note construct, and the Argonauts did not find the boundary between a clinical note and ClinicalImpression clear enough to leverage the resources to share clinical notes.

---

Footnotes

[^1]: Storing scanned reports as a DiagnosticReport, with appropriate categorization, enables Clients to access the scanned reports along with DiagnosticReports containing discrete information. For example, a Client can request all `DiagnosticReport.category`="LAB" and receive reports with discrete information and any scanned reports. However, not all systems store and categorize laboratory reports with DiagnosticReport.

[^2]: The developers of this guide considered requiring Clients to query *both* DocumentReference and DiagnosticReport to get all the information for a patient. However, the requirement to query two places is potentially dangerous if a Client doesn't understand or follow this requirement and queries only one resource type, potentially missing vital information from the other type.

{% include link-list.md %}
