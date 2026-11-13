* **USCDI-related Updates**: We have updated US Core to include the new [U.S. Core Data for Interoperability (USCDI) v7](https://www.healthit.gov/isa/united-states-core-data-interoperability-uscdi#uscdi-v7) Data Elements and Classes that the  Office of the National Coordinator for Health Information Technology (ONC) published.  USCDI v7 includes 30 new data elements and one significantly revised data element (Tobacco and Nicotine Product Use, an evolution of the Smoking Status data element) for a total of 31 overall new data elements across multiple data classes:

  * Of the 31 overall new data elements, the following 14 data elements are already represented in US Core as *Must Support* or *Additional USCDI* elements, and no changes were introduced in this version:

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

  * **New Profiles**:

    * For the new USCDI *Appointment* Data Element, we added the [US Core Appointment Profile](StructureDefinition-us-core-appointment.html). We also added `Encounter.appointment` to the [US Core Encounter Profile](StructureDefinition-us-core-encounter.html) as an *Additional USCDI* element to link an encounter to the appointment that scheduled it.

    * For the new USCDI *Medication Administration* Data Element, we added the [US Core MedicationAdministration Profile](StructureDefinition-us-core-medicationadministration.html). `MedicationAdministration.statusReason` also supports the new USCDI *Reason Not Performed* Data Element. The [Medication List](medication-list.html) guidance is unchanged and remains based on MedicationRequest.

    * For the new USCDI *Medical Device Order* Data Element, we added the [US Core DeviceRequest Profile](StructureDefinition-us-core-devicerequest.html). We also added guidance that a medical device order may instead be represented with the [US Core ServiceRequest Profile](StructureDefinition-us-core-servicerequest.html) or the [US Core MedicationRequest Profile](StructureDefinition-us-core-medicationrequest.html), depending on whether the request is procedure-focused or medication-related.

    * For the new USCDI *Nutrition Order* Data Element, we added the [US Core NutritionOrder Profile](StructureDefinition-us-core-nutritionorder.html) for oral diet orders. We also added guidance that a nutrition order may instead be represented with the [US Core ServiceRequest Profile](StructureDefinition-us-core-servicerequest.html) or the [US Core MedicationRequest Profile](StructureDefinition-us-core-medicationrequest.html), depending on context.

    * For the new USCDI *Diagnostic Imaging Reference* Data Element, we added the [US Core ImagingStudy Profile](StructureDefinition-us-core-imagingstudy.html) for the information needed to locate or access a diagnostic imaging study, and guidance on using `ImagingStudy.endpoint`. To link the imaging order, report, and study, we also:
        * added `DiagnosticReport.identifier`, `DiagnosticReport.basedOn`, `DiagnosticReport.imagingStudy`, and `DiagnosticReport.media.link` to the [US Core DiagnosticReport Profile for Report and Note Exchange](StructureDefinition-us-core-diagnosticreport-note.html) as *Additional USCDI* elements.
        * added `ServiceRequest.identifier` to the [US Core ServiceRequest Profile](StructureDefinition-us-core-servicerequest.html) as an *Additional USCDI* element.
        * added the `patient` + `identifier` combination search as a **SHALL** for the [US Core ImagingStudy Profile](StructureDefinition-us-core-imagingstudy.html) and a **SHOULD** for the [US Core DiagnosticReport Profile for Report and Note Exchange](StructureDefinition-us-core-diagnosticreport-note.html) and the [US Core ServiceRequest Profile](StructureDefinition-us-core-servicerequest.html).

    * For the new USCDI *Accommodation* Data Element, we added the [US Core Patient Accommodation Profile](StructureDefinition-us-core-patient-accommodation.html) to record the supports and services a patient needs to access care. We also added the "accommodation" category code to the [US Core Category](CodeSystem-us-core-category.html) code system.
  * **New Elements and Terminology**:

    * For the new USCDI *Allergy Intolerance Criticality* Data Element, we added `AllergyIntolerance.criticality` to the [US Core AllergyIntolerance Profile](StructureDefinition-us-core-allergyintolerance.html) as an *Additional USCDI* element.

    * For the new USCDI *Healthcare Agent* Data Element, we bound `CareTeam.participant.role` in the [US Core CareTeam Profile](StructureDefinition-us-core-careteam.html) to a new US Core Care Team Member Function value set that adds the durable power of attorney, healthcare power of attorney, and patient healthcare agent codes, raised the `RelatedPerson.relationship` binding in the [US Core RelatedPerson Profile](StructureDefinition-us-core-relatedperson.html) from *preferred* to *extensible*, and added guidance to both profiles on recording the person legally authorized to make healthcare decisions for a patient.

    * Many USCDI Clinical Notes are already supported in US Core. For the new USCDI *Referral Note* Data Element, we added Referral Note (LOINC 57133-1) to the ["Common Clinical Notes" list](clinical-notes.html#clinical-notes) and to the [US Core Clinical Note Type](ValueSet-us-core-clinical-note-type.html) value set.

    * For the USCDI *Tobacco and Nicotine Product Use* Data Element, which replaces *Smoking Status*, we renamed the US Core Smoking Status Observation Profile to the [US Core Tobacco And Nicotine Use Observation Profile](StructureDefinition-us-core-smokingstatus.html). We also renamed the value sets bound to `Observation.status`, `Observation.code`, and `Observation.value[x]` to [US Core Tobacco And Nicotine Observation Status](ValueSet-us-core-observation-smoking-status-status.html), [Tobacco And Nicotine Use Status](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1267.6/expansion), and [Tobacco And Nicotine Use](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1267.3/expansion).

    * For the new USCDI *Nutrition Assessment* Data Element, we added the "nutrition-assessment" category code to the [US Core Category](CodeSystem-us-core-category.html) code system and to the [US Core Screening Assessment Observation Category](ValueSet-us-core-screening-assessment-observation-category.html) value set. We also added guidance on recording nutrition assessments to the [Screening and Assessments](screening-and-assessments.html#nutrition-assessment) page.

    * For the new USCDI *Reason Not Performed* Data Element, we:
        * added `Procedure.statusReason` to the [US Core Procedure Profile](StructureDefinition-us-core-procedure.html) as a *Must Support* element, and preadopted the FHIR R5 `Procedure.recorded` element as a cross-version extension and an *Additional USCDI* element.
        * Updated the [US Core Immunization Profile](StructureDefinition-us-core-immunization.html) `Immunization.statusReason` terminology to an *extensible* binding to the HL7 Terminology (THO) [ActNoImmunizationReason](https://terminology.hl7.org/ValueSet-v3-ActNoImmunizationReason.html) value set.
        * changed the `patient` + `status` combination search to a **SHALL**
        * added `MedicationAdministration.statusReason` as a *Must Support* element in the new [US Core MedicationAdministration Profile](StructureDefinition-us-core-medicationadministration.html).

    * For the new USCDI *Specimen Collection Date and Time* and *Specimen Collection Method* Data Elements, we added `Specimen.collection.collected[x]` and `Specimen.collection.method` to the [US Core Specimen Profile](StructureDefinition-us-core-specimen.html) as *Additional USCDI* elements. `Specimen.collection.method` has a *preferred* binding to the [Specimen Collection Method](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1267.44/expansion) value set, and we added guidance on its use with `Specimen.type`. `Observation.effective[x]` in the [US Core Laboratory Result Observation Profile](StructureDefinition-us-core-observation-lab.html) already supports *Specimen Collection Date and Time*.

    * For the new USCDI *Referral Order* Data Element, we added Patient referral (procedure) (SNOMED CT 3457005) to the [US Core ServiceRequest Category Codes](ValueSet-us-core-servicerequest-category.html) value set, and added guidance to the [US Core ServiceRequest Profile](StructureDefinition-us-core-servicerequest.html) recommending it as the `ServiceRequest.category` for referral orders.

  * **New Guidance**:

    * For the new USCDI *Adverse Events* Data Class and its *Adverse Event Condition* and *Adverse Event Outcome* Data Elements, we added the [Adverse Events: Clinical Records and Patient Safety Reporting](adverse-events.html) guidance page. It documents how existing US Core Profiles record adverse events as clinical events. US Core does not define an AdverseEvent profile. We also added a link to the new page from each of these profile pages:


* **Individual Level Provenance**: The USCDI Provenance Author Time Stamp data element now maps to individual level provenance as well as to the [US Core Provenance Profile](StructureDefinition-us-core-provenance.html). The individual provenance table on the [Basic Provenance](basic-provenance.html#author-author-role-and-author-time-stamp-data-elements) page adds an Author Time Stamp column naming, for each profile, the element that records when the information was first captured, and each profile page's "Profile Specific Implementation Guidance" section names that element alongside the author elements. We added the following *Additional USCDI* elements:

  | # | US Core Profile | Author Time Stamp Element |
  |---|---|---|
  | 1 | [US Core AllergyIntolerance Profile](StructureDefinition-us-core-allergyintolerance.html) | `AllergyIntolerance.recordedDate` |
  | 2 | [US Core CarePlan Profile](StructureDefinition-us-core-careplan.html) | `CarePlan.created` |
  | 3 | [US Core FamilyMemberHistory Profile](StructureDefinition-us-core-familymemberhistory.html) | `FamilyMemberHistory.date` |
  | 4 | [US Core Immunization Profile](StructureDefinition-us-core-immunization.html) | `Immunization.recorded` |
  | 5 | 25 US Core Observation Profiles (for example, [US Core Laboratory Result Observation Profile](StructureDefinition-us-core-observation-lab.html)) | `Observation.issued` |
  {:.grid}

* **Actor Definitions**: To complement the US Core Capability Statements and Requirements resources, we added US Core [Actor Definitions](https://hl7.org/fhir/R5/actordefinition.html) for:
  * [US Core Responder (Server)](ActorDefinition-us-core-server-actor.html)
  * [US Core Requestor (Client)](ActorDefinition-us-core-client-actor.html)
  * [US Core Certifying System](ActorDefinition-us-core-certifying-system-actor.html)

  These resources are based on FHIR R5 and define the types of systems covered by this implementation guide.

- **Writing Documents**: in the Looking Ahead Section, we updated the *Writing Clinical Notes* page to [Writing Documents](writing-documents.html) which defines a US Core approach to writing any document type, such as clinical notes, insurance cards, and advance directives to a FHIR server as `DocumentReference` resources.  It is based on the 2026 Argonaut-sponsored [FHIR Write - DocumentReference](https://confluence.hl7.org/spaces/AP/pages/441130048/FHIR+Write+-+DocumentReference) project.

* **Terminology**: We continue aligning terminology between US Core and [HL7 C-CDA] and, where needed, linking it to the FHIR® Terminology Service for VSAC Resources ([Value Set Authority Center (VSAC)]) or [HL7 Terminology (THO)]. The following value set has been moved:

   |Pre 10.0.0 US Core ValueSet|10.0.0 ValueSet|THO/VSAC|
   |---|---|---|
   | [US Core Goal Codes](https://hl7.org/fhir/us/core/STU9/ValueSet-us-core-goal-description.html)|[VSAC 2.16.840.1.113762.1.4.1267.46](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1267.46/expansion)|VSAC|
   {:.grid}
