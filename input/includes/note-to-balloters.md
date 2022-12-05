<div class="note-to-balloters" markdown="1">

#### The January 2023 Ballot

This ballot addresses the following:

- We have updated US Core to include the [U.S. Core Data for Interoperability (USCDI) v3] Data Elements and Classes that the Office of the National Coordinator (ONC) published in July of 2021:

  - **Applied**: [Health Insurance Information](StructureDefinition-us-core-coverage.html) Using US Core to represent and access data related to an individual's insurance coverage for health care.
  - **Applied**: The SDOH Assessments documentation has been rewritten and renamed to [Screening and Assessments](screening-and-assessments.html), reflecting its expanded coverage of Health Status/Assessments Data Elements. It documents how to use [US Core Observation Screening Assessment Profile] and the [US Core Simple Observation Profile] to represent and access health status and assessments, including: *Functional Status*, *Disability Status*, and *Mental/Cognitive Status* in addition to *SDOH Assessments*.
  - **Applied**: [US Core Observation Pregnancy Status Profile](StructureDefinition-us-core-observation-pregnancystatus.html) and [US Core Observation Pregnancy Intent Profile](StructureDefinition-us-core-observation-pregnancyintent.html) have been added to specifically address pregnancy status.
  - **Applied**: **Laboratory:** The [US Core Laboratory Observation Profile](StructureDefinition-us-core-observation-lab.html) already supports the result status and terminology requirements for coded and numeric results. The [US Core Specimen Profile](StructureDefinition-us-core-specimen.html) has been added to support Specimen Type.  
  - **Applied**: **Medications:** Updates to the [US Core MedicationRequest Profile](StructureDefinition-us-core-medicationrequest.html) to support Dose, Dose Unit of Measure, Indication and the [US Core MedicationDispense Profile](StructureDefinition-us-core-medicationdispense.html) has been added to support Fill Status.
  - **Applied**: **Patient Demographics/Information**
      - Date of Death [See Change Here](StructureDefinition-us-core-patient.html)
      - Tribal Affiliation [See Change Here](StructureDefinition-us-core-patient.html) 
      - Sex (for clinical use)[See Change Here](StructureDefinition-us-core-sex-for-clinical-use.html) 
        - Note that the [US Core BirthSex Extension](StructureDefinition-us-core-birthsex.html) will not be deprecated.
      - Related Person's Name and Related Person's Relationship [See](StructureDefinition-us-core-relatedperson.html)
      - Occupation and Occupation Industry [See Change Here](StructureDefinition-us-core-observation-occupation.html)
  - **Applied**: **Procedures:** Reason for Referral [See Change Here](StructureDefinition-us-core-servicerequest.html) and [See Change Here](StructureDefinition-us-core-procedure.html)

- Several profiles from version 5.0.1 have been *retired* or *renamed* and *rescoped* in this version to accommodate the USCDI Health Status/Assessments Data Classes and as a result of implementer feedback. The [Cross Version Comparisions Table](changes-between-versions.html#cross-version-comparisons) summarized these significant revisions.
- We continue our efforts to link terminology directly to the FHIR® Terminology Service for VSAC Resources ([Value Set Authority Center (VSAC) - NIH](https://vsac.nlm.nih.gov/)) where applicable and, as a result, align terminology between US Core and [HL7 C-CDA](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=492).
- Implementers submitted over 70 trackers since the publication of US Core ver 5.0.0 and 5.0.1. We have addressed them and applied over 50 changes. See the [change log] for detailed list of change and where applied.
  - For tracker [FHIR-32949](https://jira.hl7.org/browse/FHIR-32949), we added a [US Core CarePlan Profile **Ballot Comment**](StructureDefinition-us-core-careplan.html) for community feedback.
  
Where possible, new and updated content are highlighted with green text and background
{:.new-content}
  
</div><!-- new-content -->