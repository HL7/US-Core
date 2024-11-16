{% include img-small.html img="todo.png" %}

- We have updated US Core to include the new [U.S. Core Data for Interoperability (USCDI) v5](https://www.healthit.gov/isa/united-states-core-data-interoperability-uscdi#uscdi-v5) Data Elements and Classes that the Office of the National Coordinator (ONC) published in July of 2024:

  - We have added the USCDI Clinical Notes Operative Note and Emergency Department Note data elements to US Core's ["Common Clinical Notes" list](clinical-notes.html) and to the [US Core Clinical Note Type](ValueSet-us-core-clinical-note-type.html) value set.

  - For the USCDI Immunization Lot Number data element, we added `Immunization.lotNumber` to the [US Core Immunization Profile](StructureDefinition-us-core-immunization.html) as a *Must Support* element.

  - For the USCDI Route of Administration data element, we added `MedicationRequest.dosageInstruction.route` to the [US Core MedicationRequest Profile](StructureDefinition-us-core-medicationrequest.html) and `MedicationDispense.dosageInstruction.route` to the [US Core MedicationDispense Profile](StructureDefinition-us-core-medicationdispense.html) as *Must Support* elements and use an extensible value set of SNOMED CT and NCI Thesaurus SPL codes.

  - For the USCDI Orders data class:
    - The [US Core MedicationRequest Profile](StructureDefinition-us-core-medicationrequest.html) supports the USCDI Medication Order data element.
    - To support the USCDI Laboratory Order, Diagnostic Imaging Order, Clinical Test Order, and Procedure Order data element, we provide detailed guidance on terminology for the [US Core ServiceRequest Profile](StructureDefinition-us-core-servicerequest.html) `ServiceRequest.category` and `ServiceRequest.code` elements.

  - For the USCDI Patient Demographics/Information data class:
    - The [US Core Patient Profile](StructureDefinition-us-core-patient.html) `Patient.name.use` *Additional USCDI* element supports the USCDI Name to Use data element.
    - To support the USCDI Pronouns data element, we added the FHIR standard [Individual Pronouns Extension] to the [US Core Patient Profile](StructureDefinition-us-core-patient.html)  as an *Additional USCDI* element.
    - To support the USCDI Interpreter -Needed data element, we added the [US Core Interpreter Required Extension](StructureDefinition-us-core-interpreter-required.html) to the [US Core Patient Profile](StructureDefinition-us-core-patient.html) and [US Core Encounter Profile](StructureDefinition-us-core-encounter.html) as *Additional USCDI* elements. (Note that the version 5.1.0 FHIR standard [Patient Interpreter Required](https://hl7.org/fhir/extensions/5.1.0/StructureDefinition-patient-interpreterRequired.html) extension does not meet the USCDI terminology requirement or the multiple context needed. Change request [FHIR-47587](https://jira.hl7.org/browse/FHIR-47587) was submitted to address these limitations.)
  
  - For the USCDI Observation data class:
    - To support the Sex Parameter for Clinical Use data element, we added the 5.1.0 FHIR standard [Patient Sex Parameter for Clinical Use Extension](https://hl7.org/fhir/extensions/5.1.0/StructureDefinition-patient-sexParameterForClinicalUse.html) to the [US Core Patient Profile](StructureDefinition-us-core-patient.html) as an *Additional USCDI* element, and document its use on other US Core Profiles for specific clinical contexts.
     - To support the Advance Directive Observation data element, we added the [US Core Observation ADI Documentation Profile](StructureDefinition-us-core-observation-adi-documentation.html), [US Core ADI DocumentReference Profile](StructureDefinition-us-core-adi-documentreference.html), and [US Core Authentication Time Extension](StructureDefinition-us-core-authentication-time.html).
  
  - For the USCDI Provenance Author and Author Role data elements, because systems typically do not use the Provenance Resource to represent this information at an individual level (in other words, activities by the patient or provider), We updated the [Basic Provenance] page to document the various FHIR resource elements that track the "small p provenance" information at the individual level. Based on current usage, we added these *Must Support* elements to the following profiles:
  
    - `Observation.performer` to [US Core Vitals Signs](StructureDefinition-us-core-vital-signs.html)
    - `Observation.performer` to [US Core Average Blood Pressure Profile](StructureDefinition-us-core-average-blood-pressure.html)
  
    and these *Additional USCDI* elements to the following profiles:

    - `Procedure.performer.actor` to [US Core Procedure](StructureDefinition-us-core-procedure.html)

  - Other USCDI changes:
     -  We updated the [US Core Location Profile](StructureDefinition-us-core-location.html) `Location.type` binding to [US Core Location Type](ValueSet-us-core-location-type.html) to support:
        - the National Healthcare Safety Network (NHSN) [Healthcare Facility Patient Care Location (HSLOC)](https://www.cdc.gov/nhsn/cdaportal/terminology/codesystem/hsloc.html) codes as an applicable standard to the USCDI Encounter Location data element,
        - the Centers for Medicare & Medicaid Services (CMS) maintained [Place of Service Code Set(POS)](https://www.cms.gov/medicare/coding-billing/place-of-service-codes/code-sets) codes (see FHIR-46258)
- We updated and clarify conformance rules for [Must Support for Resource References](must-support.html#must-support---resource-references),and included lists of Must Support target profiles for each US Core Profile.