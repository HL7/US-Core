<div class="note-to-balloters" markdown="1">

#### The January 2024 Ballot

This ballot addresses the following:

- We have updated US Core to include the new [U.S. Core Data for Interoperability (USCDI) v4] Data Elements and Classes that the Office of the National Coordinator (ONC) published in July of 2023:
  
  - For the USCDI Allergies and Intolerances Substance (Non-Medication) data element, no change was needed for the [US Core AllergyIntolerance Profile] because the existing `code` element binding to [Common substances for allergy and intolerance documentation including refutations](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1186.8/expansion) already includes "Non-pharmacologic agent"
  
  - For the USCDI Encounter Identifier data element, no changes were needed because the [US Core Encounter Profile] already supports `Encounter.identifier` as a *Must Support* element.
  
  - For the USCDI Facility Information data class and elements, the [US Core Location Profile] already supports Facility Name and has been updated to support Facility Identifier and Type.  The [US Core Immunization Profile] has been updated to reference the US Core Location resource directly as a *Must Support* element, and the following US Core Profiles have been updated to *indirectly* reference the location/facility via [US Core Encounter Profile] as a *Must Support* element:
    - [US Core DiagnosticReport Profile for Laboratory Results Reporting]
    - [US Core Immunization Profile]
    - [US Core MedicationDispense Profile]
    - [US Core Observation Clinical Result Profile]
    - [US Core Procedure Profile]
    - [US Core ServiceRequest Profile]
  
  - For the USCDI Time of Procedure data element, no changes were needed because:
    - the [US Core Procedure Profile] already supports `Procedure.performed[x]` as a *Must Support* element.
    - the [US Core DiagnosticReport Profile for Report and Note Exchange] already supports `DiagnosticReport.performed[x]` as a *Must Support* element.
    - the [US Core Immunization Profile] already supports `Immunization.occurrence[x]` as a *Must Support* element.
  
  - For the USCDI Average Blood Pressure data class, the new [US Core Average Blood Pressure Profile] has been added to US Core. It uses the [Vital Signs with Qualifying Elements: Average Blood Pressure Profile] as a blueprint.
  
  - For the USCDI Medications data class and elements, the [US Core MedicationRequest Profile] already supports Medication Instructions and has been updated to support Medication Adherence as an *Additional USCDI Requirement* using the new [US Core Medication Adherence Extension].

  - For the USCDI Laboratory data class and elements, the [US Core Laboratory Result Observation Profile] already supports Result Unit of Measure data element for using UCUM for coded quantity units and has been updated to support Result Reference Range and Result Interpretation as a *Must Support* elements. The [US Core Specimen Profile] has been updated to support Specimen Identifier as a *Must Support* element, and Specimen Source Site and Specimen Condition Acceptability as *Additional USCDI Requirements*.

  - For the USCDI Goals and Preferences data class Treatment Intervention Preference and Care Experience Preference data elements, [US Core Treatment Intervention Preference Profile] and [US Core Care Experience Preference Profile] have been added to US Core and use the PACIO Advance Directive Interoperability Implementation Guide's Care Experience Preference Profile and Personal Intervention Preference Profile as blueprints.

  - For the USCDI Health Status Assessments data class, including the data elements Physical Activity, Substance Use, and Alcohol Use, US Core's [Screening and Assessments] Guidance is used.  To enhance interoperability, an extensible "starter set" of concepts constrains each Screening and Assessments domain.  These value sets are summarized [here](screening-and-assessments.html#terminology).

- Clarify USCDI Requirements: We updated our documentation and approach on the relationship between USCDI and US Core how we identify [Must Support vs Additional USCDI Requirements](must-support.html#additional-uscdi-requirements). See examples of this and association documentation:
   - [Here](StructureDefinition-us-core-patient.html#profile)
   - [Here](general-requirements.html#us-core-conformance-artifacts)
   - [Here](must-support.html#additional-uscdi-requirements)
   - [Here](uscdi.html)
   - [Here](CapabilityStatement-us-core-server.html#summary-of-additional-uscdi-requirement-references)


- We continue our efforts to link terminology directly to the FHIR® Terminology Service for VSAC Resources ([Value Set Authority Center (VSAC)] where applicable and, as a result, align terminology between US Core and [HL7 C-CDA]. The Following Valuesets have been moved:
  - todo...

- Added Procedure.reasonCode and Procedure.reasonReference as *Additional USCDI Requirements* to meet the USCDI Data Element,Reason for Referral when a ServiceRequest is not used to request a procedure. See these changes: 
   - [Here](StructureDefinition-us-core-procedure.html)
   - [Here](StructureDefinition-us-core-servicerequest.html)
   - [Here](Procedure-defib-implant.html)
   - [Here](uscdi.html)

- Scopes: To meet the ONC’s granular scope requirement in [HTI-1 proposed rule](https://www.federalregister.gov/d/2023-07229/p-991+), We added required support for granular scopes as defined in Version 2.0.0 of [SMART App Launch] and moved the SMART scopes guidance from Future of US Core to a [Conformance Page](scopes.html) and updated requirements for each profile.
  
- FHIR Write: Add Argonaut Write Guidance for Vital Sign Observations to Record or Update Data section on the Future of US Core Page. [See Changes Here](future-of-US-core.html#record-or-update-data) and [Here](fhir-write.html)
  
- Implementers submitted over 60 trackers since the publication of US Core ver 6.1.0. We have addressed them and applied over 50 changes. See the [change log] for detailed list of change and where applied.
  
</div><!-- note-to-balloters -->