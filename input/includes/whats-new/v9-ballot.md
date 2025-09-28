{% include img-small.html img="todo.png" %}

* We have updated US Core to include the new [U.S. Core Data for Interoperability (USCDI) v6](https://www.healthit.gov/isa/united-states-core-data-interoperability-uscdi#uscdi-v6) Data Elements and Classes that the  Assistant Secretary for Technology Policy (ASTP) published:

  * For the USCDI Care Plan data element, we added `CarePlan.addresses` to the [US Core CarePlan Profile](https://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-careplan.html) as an Additional USCDI element.
    * We documented the future direction to continue transitioning from text-based content to discrete references such as needs (`CarePlan.addresses`), goals (`CarePlan.goal`), and strategies (`CarePlan.activity`).

  * For the USCDI Family Health History data element, we created a new [US Core FamilyMemberHistory Profile](https://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-familymemberhistory.html) to capture relevant health conditions of family members.

  * For the USCDI Facility Address data element, no changes were needed because the [US Core Location Profile](https://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-location.html) represents the physical location of available services or resources, with `Location.address` as a *Must Support* element.

  * For the USCDI Date of Onset data element, we updated the [US Core Condition Problems and Health Concerns Profile](https://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-condition-problems-health-concerns.html) *Must Support* guidance to make the `assertedDate` Extension, `Condition.onsetDateTime`, and `Condition.recordedDate` all *Must Support*.

  * For the USCDI Unique Device Identifier (UDI) data element we renamed the [US Core Implantable Device Profile](https://hl7.org/fhir/us/core/StructureDefinition-us-core-implantable-device.html) to [US Core Device Profile](https://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-device.html). In addition, we changed the constraints on all UDI specific elements from *Must Support* to *Additional USCDI* and relaxed `Device.patient` from *Mandatory* to *Must Support* to support a broader range of use cases.

  * For the USCDI Portable Medical Order data element:
    * We created a new [US Core PMO ServiceRequest Profile](https://healthedata1.github.io/test-stuff/StructureDefinition-us-core-pmo-servicerequest.html) to support clinical orders based on end-of-life or life-sustaining care Portable Medical Orders, such as a POLST.
