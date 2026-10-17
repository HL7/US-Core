{% include img-small.html img="todo.png" %}

* **USCDI-related Updates**: We have updated US Core to include the new [U.S. Core Data for Interoperability (USCDI) v7](https://www.healthit.gov/isa/united-states-core-data-interoperability-uscdi#uscdi-v7) Data Elements and Classes that the  Office of the National Coordinator for Health Information Technology (ONC) published.  USCDI v7 includes 30 new data elements and one significantly revised data element (Tobacco and Nicotine Product Use, an evolution of the Smoking Status data element) for a total of 31 overall new data elements across multiple data classes:

  * Of the 31 overall new data elements, the following 14 data elements are already represented in in US Core as *Must Support* or *Additional USCDI* elements, and no changes were introduced in this version:

    | USCDI v7 Data Element | US Core Profile | US Core element |
    |---|---|---|
    | Condition Status | [US Core Condition Problems and Health Concerns Profile](StructureDefinition-us-core-condition-problems-health-concerns.html) | `Condition.clinicalStatus` |
    | Deceased Indicator | [US Core Patient Profile](StructureDefinition-us-core-patient.html) | `Patient.deceased[x]` (*Additional USCDI*) |
    | Device Type | [US Core Device Profile](StructureDefinition-us-core-device.html) | `Device.type` |
    | Diagnostic Report Date and Time | [US Core DiagnosticReport Profile for Laboratory Results Reporting](StructureDefinition-us-core-diagnosticreport-lab.html)<br>[US Core DiagnosticReport Profile for Report and Note Exchange](StructureDefinition-us-core-diagnosticreport-note.html) | `DiagnosticReport.issued` |
    | Facility Telecom | [US Core Location Profile](StructureDefinition-us-core-location.html) | `Location.telecom` |
    | Health Insurance Coverage Period | [US Core Coverage Profile](StructureDefinition-us-core-coverage.html) | `Coverage.period` |
    | Health Insurance Payer | [US Core Coverage Profile](StructureDefinition-us-core-coverage.html) | `Coverage.payor` |
    | Health Insurance Plan | [US Core Coverage Profile](StructureDefinition-us-core-coverage.html) | `Coverage.class:plan` |
    | Health Insurance Plan Identifier | [US Core Coverage Profile](StructureDefinition-us-core-coverage.html) | `Coverage.class:plan.value`<br>`Coverage.class:plan.name` |
    | Immunization Record Source | [US Core Immunization Profile](StructureDefinition-us-core-immunization.html) | `Immunization.primarySource` |
    | Immunization Status | [US Core Immunization Profile](StructureDefinition-us-core-immunization.html) | `Immunization.status` |
    | Medication Dispense Quantity | [US Core MedicationRequest Profile](StructureDefinition-us-core-medicationrequest.html)<br>[US Core MedicationDispense Profile](StructureDefinition-us-core-medicationdispense.html) | `MedicationRequest.dispenseRequest.quantity`<br>`MedicationDispense.quantity` |
    | Patient Identifier | [US Core Patient Profile](StructureDefinition-us-core-patient.html) | `Patient.identifier` |
    | Procedure Status | [US Core Procedure Profile](StructureDefinition-us-core-procedure.html) | `Procedure.status` |
    {:.grid}

  * For the USCDI Allergy Intolerance Criticality data element, we added `AllergyIntolerance.criticality` to the [US Core AllergyIntolerance Profile](StructureDefinition-us-core-allergyintolerance.html) as an *Additional USCDI* element.

  * For the USCDI Healthcare Agent data element, we added guidance to the [US Core CareTeam Profile](StructureDefinition-us-core-careteam.html) and the [US Core RelatedPerson Profile](StructureDefinition-us-core-relatedperson.html) on recording the person legally authorized to make healthcare decisions for a patient. `CareTeam.participant.role` is bound to a new US Core value set that adds the durable power of attorney (DPOWATT), healthcare power of attorney (HPOWATT), and Patient Healthcare agent (LOINC 81335-2) codes to Care Team Member Function, and the `RelatedPerson.relationship` binding strength is raised from *preferred* to *extensible*. **Note that the US Core Care Team Member Function value set is pending authoring in VSAC. Until it is published, `CareTeam.participant.role` is bound to a placeholder value set that does not resolve, and validation reports that the value set cannot be found.**

  * For the USCDI Referral Note data element, we added Referral Note (LOINC 57133-1) to the ["Common Clinical Notes" list](clinical-notes.html#clinical-notes) on the Clinical Notes guidance page and to the [US Core Clinical Note Type](ValueSet-us-core-clinical-note-type.html) value set, raising the minimum set of note types servers support from ten to eleven.

  * For the USCDI Tobacco and Nicotine Product Use data element, which USCDI v7 renamed and broadened from Smoking Status, we renamed the US Core Smoking Status Observation Profile to the [US Core Tobacco And Nicotine Use Observation Profile](StructureDefinition-us-core-smokingstatus.html) and updated its description for the expanded scope. The value sets bound to `Observation.status`, `Observation.code` and `Observation.value[x]` have also been renamed to [US Core Tobacco And Nicotine Observation Status](ValueSet-us-core-observation-smoking-status-status.html), [Tobacco And Nicotine Use Status](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1267.6/expansion), and [Tobacco And Nicotine Use](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1267.3/expansion).  **Note that the review to add codes to those value sets for broader tobacco and nicotine coverage is pending in VSAC.**

  * For the USCDI Nutrition Assessment data element, we added guidance to the [Screening and Assessments](screening-and-assessments.html#nutrition-assessment) page on recording nutrition assessments using the existing Screening and Assessments framework, and added a new category code, "nutrition-assessment", to the [US Core Category](CodeSystem-us-core-category.html) code system and to the [US Core Screening Assessment Observation Category](ValueSet-us-core-screening-assessment-observation-category.html) value set, the minimum set of category codes servers support for the USCDI Health Status Assessments data class. **Note that the terminology for this data element is still pending a decision. The new [US Core Nutrition Assessment](ValueSet-us-core-nutrition-assessment.html) value set is a placeholder containing the panel items of the LOINC Nutrition assessment panel (75282-4) and is expected to change.**

  * For the USCDI Reason Not Performed data element, we:
    *  added `Procedure.statusReason` to the [US Core Procedure Profile](StructureDefinition-us-core-procedure.html) as a *Must Support* element, and preadopted the FHIR R5 `Procedure.recorded` element as a cross-version extension and an *Additional USCDI* element.
    *  raised the binding strength of `Immunization.statusReason` on the [US Core Immunization Profile](StructureDefinition-us-core-immunization.html) from *example* to *extensible*.
    *  raised the patient + status combination search API conformance to **SHALL** for both profiles.
    *  The US Core MedicationAdministration Profile is also in scope for this data element and addressed in the USCDI Medication Administration data element.

    **Note that the bindings are provisional, pending the review of the terminology aligned with the HL7 FHIR US Quality Core Implementation Guide.**

  * For the USCDI Specimen Collection Date and Time and Specimen Collection Method data elements, we added `Specimen.collection.collected[x]` and `Specimen.collection.method` to the [US Core Specimen Profile](StructureDefinition-us-core-specimen.html) as *Additional USCDI* elements. Note that `Observation.effective[x]` on the [US Core Laboratory Result Observation Profile](StructureDefinition-us-core-observation-lab.html) is already a *Must Support* element and also maps to Specimen Collection Date and Time.

  * For the USCDI Referral Order data element, we added Patient referral (procedure) (SNOMED CT 3457005) to the [US Core ServiceRequest Category Codes](ValueSet-us-core-servicerequest-category.html) value set and added guidance to the [US Core ServiceRequest Profile](StructureDefinition-us-core-servicerequest.html) recommending it as the `ServiceRequest.category` code for referral orders. The `ServiceRequest.code` binding remains unconstrained, as it is for the USCDI Procedure Order data element.
