
- We have updated US Core to include the new [U.S. Core Data for Interoperability (USCDI) v5](https://www.healthit.gov/isa/united-states-core-data-interoperability-uscdi#uscdi-v5) Data Elements and Classes that the Office of the National Coordinator (ONC) published in July of 2024:

  - We have added the USCDI Clinical Notes Operative Note and Emergency Department Note data elements to US Core's ["Common Clinical Notes" list](https://hl7.org/fhir/us/core/2025Jan/clinical-notes.html) and to the [US Core Clinical Note Type](https://hl7.org/fhir/us/core/2025Jan/ValueSet-us-core-clinical-note-type.html) value set.

  - For the USCDI Immunization Lot Number data element, we added `Immunization.lotNumber` to the [US Core Immunization Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-immunization.html) as a *Must Support* element.

  - For the USCDI Route of Administration data element, we added `MedicationRequest.dosageInstruction.route` to the [US Core MedicationRequest Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-medicationrequest.html) and `MedicationDispense.dosageInstruction.route` to the [US Core MedicationDispense Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-medicationdispense.html) as *Must Support* elements and use an extensible value set of SNOMED CT and NCI Thesaurus SPL codes.

  - For the USCDI Orders data class:
    - The [US Core MedicationRequest Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-medicationrequest.html) supports the USCDI Medication Order data element.
    - To support the USCDI Laboratory Order, Diagnostic Imaging Order, Clinical Test Order, and Procedure Order data element, we provide detailed guidance on terminology for the [US Core ServiceRequest Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-servicerequest.html) `ServiceRequest.category` and `ServiceRequest.code` elements.

  - For the USCDI Patient Demographics/Information data class:
    - The [US Core Patient Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-patient.html) `Patient.name.use` *Additional USCDI* element supports the USCDI Name to Use data element.
    - To support the USCDI Pronouns data element, we added the FHIR standard [Individual Pronouns Extension](http://hl7.org/fhir/StructureDefinition/individual-pronouns) to the [US Core Patient Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-patient.html)  as an *Additional USCDI* element.
    - To support the USCDI Interpreter -Needed data element, we added the [US Core Interpreter Needed Extension](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-interpreter-needed.html) to the [US Core Patient Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-patient.html) and [US Core Encounter Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-encounter.html) as *Additional USCDI* elements. (Note that the version 5.1.0 FHIR standard [Patient Interpreter Required](https://hl7.org/fhir/extensions/5.1.0/StructureDefinition-patient-interpreterRequired.html) extension does not meet the USCDI terminology requirement or the multiple context needed. Change request [FHIR-47587](https://jira.hl7.org/browse/FHIR-47587) was submitted to address these limitations.)
  
  - For the USCDI Observation data class:
    - To support the Sex Parameter for Clinical Use data element, we added the 5.1.0 FHIR standard [Patient Sex Parameter for Clinical Use Extension](https://hl7.org/fhir/extensions/5.1.0/StructureDefinition-patient-sexParameterForClinicalUse.html) to the [US Core Patient Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-patient.html) as an *Additional USCDI* element, and document its use on other US Core Profiles for specific clinical contexts.
     - To support the Advance Directive Observation data element, we added the [US Core Observation ADI Documentation Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-observation-adi-documentation.html), [US Core ADI DocumentReference Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-adi-documentreference.html), and [US Core Authentication Time Extension](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-authentication-time.html).
  
  - For the USCDI Provenance Author and Author Role data elements, because systems typically do not use the Provenance Resource to represent this information at an individual level (in other words, activities by the patient or provider), We updated the [Basic Provenance] page to document the various FHIR resource elements that track the "small p provenance" information at the individual level. Based on current usage, we added these *Must Support* elements to the following profiles:
  
    - `Observation.performer` to [US Core Vitals Signs](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-vital-signs.html)
    - `Observation.performer` to [US Core Average Blood Pressure Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-average-blood-pressure.html)
    - `Observation.performer` to [US Core Observation Clinical Result Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-observation-clinical-result.html) and [US Core Laboratory Result Observation Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-observation-lab.html)
    - `Observation.performer` to [US Core Smoking Status Observation Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-smokingstatus.html)
    - `DiagnosticReport.resultsInterpreter` to [US Core DiagnosticReport Profile for Laboratory Results Reporting](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-diagnosticreport-lab.html)
    - `DiagnosticReport.resultsInterpreter` to [US Core DiagnosticReport Profile for Report and Note Exchange](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-diagnosticreport-note.html)
    - `Goal.expressedBy` to [US Core Goal Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-goal.html)
    - `Immunization.performer.actor` to [US Core Immunization Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-immunization.html)
  
    and these *Additional USCDI* elements to the following profiles:

    - `Observation.performer` to [US Core Observation Pregnancy Intent Profile](
      StructureDefinition-us-core-observation-pregnancyintent.html) and [US Core Observation Pregnancy Status Profile](
      StructureDefinition-us-core-observation-pregnancystatus.html)
    - `Observation.performer` to [US Core Observation Sexual Orientation Profile](
      StructureDefinition-us-core-observation-sexual-orientation.html)
    - `Procedure.performer.actor` to [US Core Procedure](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-procedure.html)

  - Other USCDI changes:
     -  We updated the [US Core Location Profile](https://hl7.org/fhir/us/core/2025Jan/StructureDefinition-us-core-location.html) `Location.type` binding to [US Core Location Type](https://hl7.org/fhir/us/core/2025Jan/ValueSet-us-core-location-type.html) to support:
        - the National Healthcare Safety Network (NHSN) [Healthcare Facility Patient Care Location (HSLOC)](https://www.cdc.gov/nhsn/cdaportal/terminology/codesystem/hsloc.html) codes as an applicable standard to the USCDI Encounter Location data element,
        - the Centers for Medicare & Medicaid Services (CMS) maintained [Place of Service Code Set(POS)](https://www.cms.gov/medicare/coding-billing/place-of-service-codes/code-sets) codes (see FHIR-46258)
- We updated and clarified the conformance rules for *Additional USCDI Requirements, Must Support for Resource References, and included lists of Must Support target profiles for each US Core Profile on the [Must Support](https://hl7.org/fhir/us/core/2025Jan/must-support.html) page.
- We clarified the conformance expectation for [Screening and Assessment category codes](https://hl7.org/fhir/us/core/2025Jan/screening-and-assessments.html#terminology) when using US Core Profiles used to represent those activities.  For details see the changes associated with [FHIR-45319](https://hl7.org/fhir/us/core/2025Jan/changes.html#fhir-45319).
- We continue our efforts to align terminology between US Core and [HL7 C-CDA] and link terminology directly to the FHIR® Terminology Service for VSAC Resources ([Value Set Authority Center (VSAC)]) or [HL7 Terminology (THO)] where applicable.  The following ValueSets has been moved:
  
   |Pre 8.0.0-Ballot US Core ValueSet|8.0.0-Ballot ValueSet|THO/VSAC|
   |---|---|---|
   [US Core Discharge Disposition Value Set](https://hl7.org/fhir/us/core/STU7/ValueSet-us-core-discharge-disposition.html)|[V3 Discharge Disposition](https://terminology.hl7.org/6.0.2/ValueSet-v3-USEncounterDischargeDisposition.html)|THO|
   [US Core Pregnancy Status Codes](https://hl7.org/fhir/us/core/STU7/ValueSet-us-core-pregnancy-status.html)|[Pregnancy Status Observation](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1240.12/expansion)|VSAC|
   [US Core Pregnancy Intent Codes](https://hl7.org/fhir/us/core/STU7/ValueSet-us-core-pregnancy-intent.html)|[Pregnancy Intention](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1166.22/expansion)|VSAC|
   [US Core Survey Codes](https://hl7.org/fhir/us/core/STU7/ValueSet-us-core-survey-codes.html)|[Screening and Assessment Survey Codes](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1267.13/expansion)|VSAC|
   [US Core Encounter Type](https://hl7.org/fhir/us/core/STU7/ValueSet-us-core-encounter-type.html)|[Encounter Type](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1267.23/expansion)|VSAC|
   {:.grid}