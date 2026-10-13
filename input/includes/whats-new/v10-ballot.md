{% include img-small.html img="todo.png" caption="coming soon..." %}

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

  * For the USCDI Specimen Collection Date and Time and Specimen Collection Method data elements, we added `Specimen.collection.collected[x]` and `Specimen.collection.method` to the [US Core Specimen Profile](StructureDefinition-us-core-specimen.html) as *Additional USCDI* elements. Note that `Observation.effective[x]` on the [US Core Laboratory Result Observation Profile](StructureDefinition-us-core-observation-lab.html) is already a *Must Support* element and also maps to Specimen Collection Date and Time.
