
This section outlines important definitions, interpretations, and requirements common to all US Core actors used in this guide.
The conformance verbs - **SHALL**, **SHOULD**, **MAY** - used in this guide are defined in [FHIR Conformance Rules].

The base [FHIR Must Support] guidance requires specifications define exactly the support expected for elements labeled *Must Support*.  

This page defines the rules for interpreting profile elements and subelements labeled *Must Support* for requesters and responders.

<!-- end TOC -->

### Claiming Conformance to a US Core Profile

To claim conformance to a US Core Profile US Core Servers **SHALL**:

  - Be able to populate all profile data elements that have a minimum cardinality >= 1 and/or flagged as *Must Support* as defined by that profile’s StructureDefinition.
  - Conform to the [US Core Server Capability Statement] expectations for that profile’s type.


### Must Support

For querying and reading US Core Profiles, *Must Support* on any profile data element **SHALL** be interpreted as follows (see the [Future of US Core] page for writing and updating US Core Profiles.) :

* US Core Responders **SHALL** be capable of populating all data elements as part of the query results as specified by the [US Core Server Capability Statement].
* US Core Requestors **SHALL** be capable of processing resource instances containing the data elements without generating an error or causing the application to fail. In other words US Core Requestors **SHOULD** be capable of displaying the data elements for human use or storing it for other purposes.
* In situations where information on a particular data element is not present and the reason for absence is unknown, US Core Responders **SHALL NOT** include the data elements in the resource instance returned as part of the query results.
* When querying US Core Responders, US Core Requestors **SHALL** interpret missing data elements within resource instances as data not present in the US Core Responder's system.
* In situations where information on a particular data element is missing and the US Core Responder knows the precise reason for the absence of data, US Core Responders **SHALL** send the reason for the missing information using values (such as nullFlavors) from the value set where they exist or using the dataAbsentReason extension.
* US Core Requestors **SHALL** be able to process resource instances containing data elements asserting missing information.

* NOTE: Typically *US Core Responder* Actor = Server and *US Core Requestor Actor* = Client
* NOTE: The above definition of *Must Support* is derived from HL7v2 concept "Required but may be empty - RE" described in HL7v2 V28_CH02B_Conformance.doc.
* NOTE: Readers are advised to understand [FHIR Terminology] requirements, [FHIR RESTful API] based on the HTTP protocol, along with [FHIR Data Types], [FHIR Search] and [FHIR Resource] formats before implementing US Core requirements.



#### Must Support - Resource References

In certain profiles only specific resource references are labeled as *Must Support*.

For example, the [US Core DocumentReference Profile] author US Core Practitioner Profile is labeled *Must Support*. When claiming conformance to the [US Core DocumentReference Profile]:

* US Core Responders **SHALL** be capable of providing a DocumentReference.author with a valid reference to a US Core Practitioner Profile.
* US Core Requestors **SHALL** be capable of processing a DocumentReference.author with a valid reference to a US Core Practitioner Profile.

Systems can support other references but this is not a requirement of US Core.

{% include img.html img="Must_Support_DocumentReference.jpg" caption="Figure 1: US Core DocumentReference.author" %}

In certain profiles only a single resource reference is present on an element labeled *Must Support*.

For example, the [US Core AllergyIntolerance Profile] patient is labeled *Must Support*. When claiming conformance to the [US Core AllergyIntolerance Profile]:

* US Core Responders **SHALL** be capable of providing an AllergyIntolerance.patient with a valid reference to a US Core Patient Profile.
* US Core Requestors **SHALL** be capable of processing an AllergyIntolerance.patienta with a valid reference to a US Core Patient Profile.

{% include img.html img="Must_Support_AllergyIntolerance.jpg" caption="Figure 2: US Core AllergyIntolerance.patient" %}

#### Must Support - Choice of Data Types

In certain profiles only specific elements are labeled as *Must Support*.

For example, the [US Core Laboratory Result Observation Profile] effectiveDateTime is labeled *Must Support*. When claiming conformance to the [US Core Laboratory Result Observation Profile]:

* US Core Responders **SHALL** be capable of populating Observation.effectiveDateTime.
* US Core Requestors **SHALL** be capable of processing Observation.effectiveDateTime.

Systems can support the other elements, but this is not a requirement of US Core.


{% include img.html img="Must_Support_Observation.effective.jpg" caption="Figure 3: US Core Observation.effectiveDateTime" %}

For the [US Core Laboratory Result Observation Profile] value element, multiple elements are labeled *Must Support*.

When claiming conformance to the [US Core Laboratory Result Observation Profile]:

* US Core Responders **SHALL** be capable of populating Observation.valueQuantity, Observation.valueCodeableConcept, and Observation.valueString.
* US Core Requestors **SHALL** be capable of processing Observation.valueQuantity, Observation.valueCodeableConcept, and Observation.valueString.

Systems can support the other elements, but this is not a requirement of US Core.


{% include img.html img="Must_Support_Observation.value.jpg" caption="Figure 4: US Core Observation.value[x]" %}

<div markdown="1" class="bg-info">

## Summary of markdown elements

### complex datatypes

1. Organization.identifier:NPI is a must support element with type = ['Identifier']
1. DiagnosticReport.presentedForm is a must support element with type = ['Attachment']
1. PractitionerRole.telecom is a must support element with type = ['ContactPoint']
1. CarePlan.text is a must support element with type = ['Narrative']
1. CarePlan.text is a must support element with type = ['Narrative']
1. Location.address is a must support element with type = ['Address']
Patient.name is a must support element with type = ['HumanName']

## By Profile

### head-occipital-frontal-circumference-percentile
- Observation
- Observation.code
   - Observation.code is a must support element with type = ['CodeableConcept']

- Observation.valueQuantity
   - no type (either a backbone or defined as pattern)

- Observation.valueQuantity.value
   - Observation.valueQuantity.value is a must support element with type = ['decimal']

- Observation.valueQuantity.unit
   - Observation.valueQuantity.unit is a must support element with type = ['string']

- Observation.valueQuantity.system
   - Observation.valueQuantity.system is a must support element with type = ['uri']

- Observation.valueQuantity.code
   - Observation.valueQuantity.code is a must support element with type = ['code']

### us-core-allergyintolerance
- AllergyIntolerance
- AllergyIntolerance.clinicalStatus
   - no type (either a backbone or defined as pattern)

- AllergyIntolerance.verificationStatus
   - no type (either a backbone or defined as pattern)

- AllergyIntolerance.code
   - no type (either a backbone or defined as pattern)

- AllergyIntolerance.patient
   - AllergyIntolerance.patient is a must support element with type = ['Reference']

- AllergyIntolerance.reaction
   - no type (either a backbone or defined as pattern)

- AllergyIntolerance.reaction.manifestation
   - no type (either a backbone or defined as pattern)

### us-core-birthsex
- Extension
- Extension.url
- Extension.valueCode
### us-core-bloodpressure
- Observation
- Observation.code
   - Observation.code is a must support element with type = ['CodeableConcept']

- Observation.component
   - no type (either a backbone or defined as pattern)

- Observation.component
   - no type (either a backbone or defined as pattern)

- Observation.component.code
   - no type (either a backbone or defined as pattern)

- Observation.component.valueQuantity
   - Observation.component:systolic.valueQuantity is a must support element with type = ['Quantity']

- Observation.component.valueQuantity.value
   - Observation.component:systolic.valueQuantity.value is a must support element with type = ['decimal']

- Observation.component.valueQuantity.unit
   - Observation.component:systolic.valueQuantity.unit is a must support element with type = ['string']

- Observation.component.valueQuantity.system
   - Observation.component:systolic.valueQuantity.system is a must support element with type = ['uri']

- Observation.component.valueQuantity.code
   - Observation.component:systolic.valueQuantity.code is a must support element with type = ['code']

- Observation.component
   - no type (either a backbone or defined as pattern)

- Observation.component.code
   - no type (either a backbone or defined as pattern)

- Observation.component.valueQuantity
   - Observation.component:diastolic.valueQuantity is a must support element with type = ['Quantity']

- Observation.component.valueQuantity.value
   - Observation.component:diastolic.valueQuantity.value is a must support element with type = ['decimal']

- Observation.component.valueQuantity.unit
   - Observation.component:diastolic.valueQuantity.unit is a must support element with type = ['string']

- Observation.component.valueQuantity.system
   - Observation.component:diastolic.valueQuantity.system is a must support element with type = ['uri']

- Observation.component.valueQuantity.code
   - Observation.component:diastolic.valueQuantity.code is a must support element with type = ['code']

### us-core-bmi
- Observation
- Observation.code
   - Observation.code is a must support element with type = ['CodeableConcept']

- Observation.valueQuantity
   - no type (either a backbone or defined as pattern)

- Observation.valueQuantity.value
   - Observation.valueQuantity.value is a must support element with type = ['decimal']

- Observation.valueQuantity.unit
   - Observation.valueQuantity.unit is a must support element with type = ['string']

- Observation.valueQuantity.system
   - Observation.valueQuantity.system is a must support element with type = ['uri']

- Observation.valueQuantity.code
   - Observation.valueQuantity.code is a must support element with type = ['code']

### us-core-bodyheight
- Observation
- Observation.code
   - Observation.code is a must support element with type = ['CodeableConcept']

- Observation.valueQuantity
   - no type (either a backbone or defined as pattern)

- Observation.valueQuantity.value
   - Observation.valueQuantity.value is a must support element with type = ['decimal']

- Observation.valueQuantity.unit
   - Observation.valueQuantity.unit is a must support element with type = ['string']

- Observation.valueQuantity.system
   - Observation.valueQuantity.system is a must support element with type = ['uri']

- Observation.valueQuantity.code
   - Observation.valueQuantity.code is a must support element with type = ['code']

### us-core-bodytemperature
- Observation
- Observation.code
   - Observation.code is a must support element with type = ['CodeableConcept']

- Observation.valueQuantity
   - no type (either a backbone or defined as pattern)

- Observation.valueQuantity.value
   - Observation.valueQuantity.value is a must support element with type = ['decimal']

- Observation.valueQuantity.unit
   - Observation.valueQuantity.unit is a must support element with type = ['string']

- Observation.valueQuantity.system
   - Observation.valueQuantity.system is a must support element with type = ['uri']

- Observation.valueQuantity.code
   - Observation.valueQuantity.code is a must support element with type = ['code']

### us-core-bodyweight
- Observation
- Observation.code
   - Observation.code is a must support element with type = ['CodeableConcept']

- Observation.valueQuantity
   - no type (either a backbone or defined as pattern)

- Observation.valueQuantity.value
   - Observation.valueQuantity.value is a must support element with type = ['decimal']

- Observation.valueQuantity.unit
   - Observation.valueQuantity.unit is a must support element with type = ['string']

- Observation.valueQuantity.system
   - Observation.valueQuantity.system is a must support element with type = ['uri']

- Observation.valueQuantity.code
   - Observation.valueQuantity.code is a must support element with type = ['code']

### us-core-careplan
- CarePlan
- CarePlan.text
   - CarePlan.text is a must support element with type = ['Narrative']

- CarePlan.text.status
   - CarePlan.text.status is a must support element with type = ['code']

- CarePlan.status
   - CarePlan.status is a must support element with type = ['code']

- CarePlan.intent
   - CarePlan.intent is a must support element with type = ['code']

- CarePlan.category
   - CarePlan.category is a must support element with type = ['CodeableConcept']

- CarePlan.category
   - CarePlan.category:AssessPlan is a must support element with type = ['CodeableConcept']

- CarePlan.subject
   - CarePlan.subject is a must support element with type = ['Reference']

### us-core-careteam
- CareTeam
- CareTeam.status
   - CareTeam.status is a must support element with type = ['code']

- CareTeam.subject
   - CareTeam.subject is a must support element with type = ['Reference']

- CareTeam.participant
   - no type (either a backbone or defined as pattern)

- CareTeam.participant.role
   - CareTeam.participant.role is a must support element with type = ['CodeableConcept']

- CareTeam.participant.member
   - CareTeam.participant.member is a must support element with type = ['Reference']

### us-core-condition
- Condition
- Condition.clinicalStatus
   - Condition.clinicalStatus is a must support element with type = ['CodeableConcept']

- Condition.verificationStatus
   - Condition.verificationStatus is a must support element with type = ['CodeableConcept']

- Condition.category
   - Condition.category is a must support element with type = ['CodeableConcept']

- Condition.code
   - Condition.code is a must support element with type = ['CodeableConcept']

- Condition.subject
   - Condition.subject is a must support element with type = ['Reference']

### us-core-diagnosticreport-lab
- DiagnosticReport
- DiagnosticReport.status
   - DiagnosticReport.status is a must support element with type = ['code']

- DiagnosticReport.category
   - DiagnosticReport.category is a must support element with type = ['CodeableConcept']

- DiagnosticReport.category
   - DiagnosticReport.category:LaboratorySlice is a must support element with type = ['CodeableConcept']

- DiagnosticReport.code
   - DiagnosticReport.code is a must support element with type = ['CodeableConcept']

- DiagnosticReport.subject
   - DiagnosticReport.subject is a must support element with type = ['Reference']

- DiagnosticReport.effective[x]
   - DiagnosticReport.effective[x] is a must support element with type = ['dateTime', 'Period']

- DiagnosticReport.issued
   - DiagnosticReport.issued is a must support element with type = ['instant']

- DiagnosticReport.performer
   - DiagnosticReport.performer is a must support element with type = ['Reference']

- DiagnosticReport.result
   - DiagnosticReport.result is a must support element with type = ['Reference']

### us-core-diagnosticreport-note
- DiagnosticReport
- DiagnosticReport.status
   - DiagnosticReport.status is a must support element with type = ['code']

- DiagnosticReport.category
   - DiagnosticReport.category is a must support element with type = ['CodeableConcept']

- DiagnosticReport.code
   - DiagnosticReport.code is a must support element with type = ['CodeableConcept']

- DiagnosticReport.subject
   - DiagnosticReport.subject is a must support element with type = ['Reference']

- DiagnosticReport.encounter
   - DiagnosticReport.encounter is a must support element with type = ['Reference']

- DiagnosticReport.effective[x]
   - DiagnosticReport.effective[x] is a must support element with type = ['dateTime', 'Period']

- DiagnosticReport.issued
   - DiagnosticReport.issued is a must support element with type = ['instant']

- DiagnosticReport.performer
   - DiagnosticReport.performer is a must support element with type = ['Reference']

- DiagnosticReport.presentedForm
   - DiagnosticReport.presentedForm is a must support element with type = ['Attachment']

### us-core-direct
- Extension
- Extension.url
- Extension.valueBoolean
### us-core-documentreference
- DocumentReference
- DocumentReference.identifier
   - no type (either a backbone or defined as pattern)

- DocumentReference.status
   - no type (either a backbone or defined as pattern)

- DocumentReference.type
   - no type (either a backbone or defined as pattern)

- DocumentReference.category
   - no type (either a backbone or defined as pattern)

- DocumentReference.subject
   - DocumentReference.subject is a must support element with type = ['Reference']

- DocumentReference.date
   - no type (either a backbone or defined as pattern)

- DocumentReference.author
   - DocumentReference.author is a must support element with type = ['Reference']

- DocumentReference.custodian
   - DocumentReference.custodian is a must support element with type = ['Reference']

- DocumentReference.content
   - no type (either a backbone or defined as pattern)

- DocumentReference.content.attachment
   - no type (either a backbone or defined as pattern)

- DocumentReference.content.attachment.contentType
   - no type (either a backbone or defined as pattern)

- DocumentReference.content.attachment.data
   - no type (either a backbone or defined as pattern)

- DocumentReference.content.attachment.url
   - no type (either a backbone or defined as pattern)

- DocumentReference.content.format
   - no type (either a backbone or defined as pattern)

- DocumentReference.context
   - no type (either a backbone or defined as pattern)

- DocumentReference.context.encounter
   - DocumentReference.context.encounter is a must support element with type = ['Reference']

- DocumentReference.context.period
   - no type (either a backbone or defined as pattern)

### us-core-encounter
- Encounter
- Encounter.identifier
   - Encounter.identifier is a must support element with type = ['Identifier']

- Encounter.identifier.system
   - Encounter.identifier.system is a must support element with type = ['uri']

- Encounter.identifier.value
   - Encounter.identifier.value is a must support element with type = ['string']

- Encounter.status
   - Encounter.status is a must support element with type = ['code']

- Encounter.class
   - Encounter.class is a must support element with type = ['Coding']

- Encounter.type
   - Encounter.type is a must support element with type = ['CodeableConcept']

- Encounter.subject
   - Encounter.subject is a must support element with type = ['Reference']

- Encounter.participant
   - no type (either a backbone or defined as pattern)

- Encounter.participant.type
   - Encounter.participant.type is a must support element with type = ['CodeableConcept']

- Encounter.participant.period
   - Encounter.participant.period is a must support element with type = ['Period']

- Encounter.participant.individual
   - Encounter.participant.individual is a must support element with type = ['Reference']

- Encounter.period
   - Encounter.period is a must support element with type = ['Period']

- Encounter.reasonCode
   - Encounter.reasonCode is a must support element with type = ['CodeableConcept']

- Encounter.reasonReference
   - Encounter.reasonReference is a must support element with type = ['Reference']

- Encounter.hospitalization
   - no type (either a backbone or defined as pattern)

- Encounter.hospitalization.dischargeDisposition
   - Encounter.hospitalization.dischargeDisposition is a must support element with type = ['CodeableConcept']

- Encounter.location
   - no type (either a backbone or defined as pattern)

- Encounter.location.location
   - Encounter.location.location is a must support element with type = ['Reference']

- Encounter.serviceProvider
   - Encounter.serviceProvider is a must support element with type = ['Reference']

### us-core-ethnicity
- Extension
- Extension.extension
   - Extension.extension:ombCategory is a must support element with type = ['Extension']

- Extension.extension.url
- Extension.extension.value[x]
- Extension.extension
- Extension.extension.url
- Extension.extension.value[x]
- Extension.extension
   - Extension.extension:text is a must support element with type = ['Extension']

- Extension.extension.url
- Extension.extension.value[x]
- Extension.url
- Extension.value[x]
### us-core-goal
- Goal
- Goal.lifecycleStatus
   - Goal.lifecycleStatus is a must support element with type = ['code']

- Goal.description
   - Goal.description is a must support element with type = ['CodeableConcept']

- Goal.subject
   - Goal.subject is a must support element with type = ['Reference']

- Goal.target
   - no type (either a backbone or defined as pattern)

- Goal.target.due[x]
   - Goal.target.due[x] is a must support element with type = ['date', 'Duration']

### us-core-headcircumference
- Observation
- Observation.code
   - Observation.code is a must support element with type = ['CodeableConcept']

- Observation.valueQuantity
   - no type (either a backbone or defined as pattern)

- Observation.valueQuantity.value
   - Observation.valueQuantity.value is a must support element with type = ['decimal']

- Observation.valueQuantity.unit
   - Observation.valueQuantity.unit is a must support element with type = ['string']

- Observation.valueQuantity.system
   - Observation.valueQuantity.system is a must support element with type = ['uri']

- Observation.valueQuantity.code
   - Observation.valueQuantity.code is a must support element with type = ['code']

### us-core-heartrate
- Observation
- Observation.code
   - Observation.code is a must support element with type = ['CodeableConcept']

- Observation.valueQuantity
   - no type (either a backbone or defined as pattern)

- Observation.valueQuantity.value
   - Observation.valueQuantity.value is a must support element with type = ['decimal']

- Observation.valueQuantity.unit
   - Observation.valueQuantity.unit is a must support element with type = ['string']

- Observation.valueQuantity.system
   - Observation.valueQuantity.system is a must support element with type = ['uri']

- Observation.valueQuantity.code
   - Observation.valueQuantity.code is a must support element with type = ['code']

### us-core-immunization
- Immunization
- Immunization.status
   - Immunization.status is a must support element with type = ['code']

- Immunization.statusReason
   - no type (either a backbone or defined as pattern)

- Immunization.vaccineCode
   - Immunization.vaccineCode is a must support element with type = ['CodeableConcept']

- Immunization.patient
   - Immunization.patient is a must support element with type = ['Reference']

- Immunization.occurrence[x]
   - Immunization.occurrence[x] is a must support element with type = ['dateTime', 'string']

- Immunization.primarySource
   - Immunization.primarySource is a must support element with type = ['boolean']

### us-core-implantable-device
- Device
- Device.udiCarrier
   - no type (either a backbone or defined as pattern)

- Device.udiCarrier.deviceIdentifier
   - no type (either a backbone or defined as pattern)

- Device.udiCarrier.carrierAIDC
- Device.udiCarrier.carrierHRF
- Device.distinctIdentifier
- Device.manufactureDate
   - no type (either a backbone or defined as pattern)

- Device.expirationDate
   - no type (either a backbone or defined as pattern)

- Device.lotNumber
   - no type (either a backbone or defined as pattern)

- Device.serialNumber
   - no type (either a backbone or defined as pattern)

- Device.type
   - Device.type is a must support element with type = ['CodeableConcept']

- Device.patient
   - Device.patient is a must support element with type = ['Reference']

### us-core-location
- Location
- Location.status
   - Location.status is a must support element with type = ['code']

- Location.name
   - Location.name is a must support element with type = ['string']

- Location.telecom
   - Location.telecom is a must support element with type = ['ContactPoint']

- Location.address
   - Location.address is a must support element with type = ['Address']

- Location.address.line
   - Location.address.line is a must support element with type = ['string']

- Location.address.city
   - Location.address.city is a must support element with type = ['string']

- Location.address.state
   - Location.address.state is a must support element with type = ['string']

- Location.address.postalCode
   - Location.address.postalCode is a must support element with type = ['string']

- Location.managingOrganization
   - Location.managingOrganization is a must support element with type = ['Reference']

### us-core-medication
- Medication
- Medication.code
   - no type (either a backbone or defined as pattern)

### us-core-medicationrequest
- MedicationRequest
- MedicationRequest.status
   - MedicationRequest.status is a must support element with type = ['code']

- MedicationRequest.intent
   - no type (either a backbone or defined as pattern)

- MedicationRequest.reported[x]
   - MedicationRequest.reported[x] is a must support element with type = ['boolean', 'Reference']

- MedicationRequest.medication[x]
   - MedicationRequest.medication[x] is a must support element with type = ['CodeableConcept', 'Reference']

- MedicationRequest.subject
   - MedicationRequest.subject is a must support element with type = ['Reference']

- MedicationRequest.encounter
   - MedicationRequest.encounter is a must support element with type = ['Reference']

- MedicationRequest.authoredOn
   - no type (either a backbone or defined as pattern)

- MedicationRequest.requester
   - MedicationRequest.requester is a must support element with type = ['Reference']

- MedicationRequest.dosageInstruction
   - no type (either a backbone or defined as pattern)

- MedicationRequest.dosageInstruction.text
   - no type (either a backbone or defined as pattern)

### us-core-observation-lab
- Observation
- Observation.status
   - Observation.status is a must support element with type = ['code']

- Observation.category
   - Observation.category is a must support element with type = ['CodeableConcept']

- Observation.category
   - Observation.category:Laboratory is a must support element with type = ['CodeableConcept']

- Observation.code
   - Observation.code is a must support element with type = ['CodeableConcept']

- Observation.subject
   - Observation.subject is a must support element with type = ['Reference']

- Observation.effective[x]
   - Observation.effective[x] is a must support element with type = ['dateTime', 'Period', 'Timing', 'instant']

- Observation.value[x]
   - Observation.value[x] is a must support element with type = ['Quantity', 'CodeableConcept', 'string', 'boolean', 'integer', 'Range', 'Ratio', 'SampledData', 'time', 'dateTime', 'Period']

- Observation.dataAbsentReason
   - Observation.dataAbsentReason is a must support element with type = ['CodeableConcept']

### us-core-organization
- Organization
- Organization.identifier
   - Organization.identifier is a must support element with type = ['Identifier']

- Organization.identifier.system
   - Organization.identifier.system is a must support element with type = ['uri']

- Organization.identifier.value
   - Organization.identifier.value is a must support element with type = ['string']

- Organization.identifier
   - Organization.identifier:NPI is a must support element with type = ['Identifier']

- Organization.identifier
- Organization.active
   - Organization.active is a must support element with type = ['boolean']

- Organization.name
   - Organization.name is a must support element with type = ['string']

- Organization.telecom
   - Organization.telecom is a must support element with type = ['ContactPoint']

- Organization.telecom.system
   - no type (either a backbone or defined as pattern)

- Organization.telecom.value
   - no type (either a backbone or defined as pattern)

- Organization.address
   - Organization.address is a must support element with type = ['Address']

- Organization.address.line
   - Organization.address.line is a must support element with type = ['string']

- Organization.address.city
   - Organization.address.city is a must support element with type = ['string']

- Organization.address.state
   - Organization.address.state is a must support element with type = ['string']

- Organization.address.postalCode
   - Organization.address.postalCode is a must support element with type = ['string']

- Organization.address.country
   - Organization.address.country is a must support element with type = ['string']

### pediatric-bmi-for-age
- Observation
- Observation.code
   - Observation.code is a must support element with type = ['CodeableConcept']

- Observation.valueQuantity
   - no type (either a backbone or defined as pattern)

- Observation.valueQuantity.value
   - Observation.valueQuantity.value is a must support element with type = ['decimal']

- Observation.valueQuantity.unit
   - Observation.valueQuantity.unit is a must support element with type = ['string']

- Observation.valueQuantity.system
   - Observation.valueQuantity.system is a must support element with type = ['uri']

- Observation.valueQuantity.code
   - Observation.valueQuantity.code is a must support element with type = ['code']

### pediatric-weight-for-height
- Observation
- Observation.code
   - Observation.code is a must support element with type = ['CodeableConcept']

- Observation.valueQuantity
   - no type (either a backbone or defined as pattern)

- Observation.valueQuantity.value
   - Observation.valueQuantity.value is a must support element with type = ['decimal']

- Observation.valueQuantity.unit
   - Observation.valueQuantity.unit is a must support element with type = ['string']

- Observation.valueQuantity.system
   - Observation.valueQuantity.system is a must support element with type = ['uri']

- Observation.valueQuantity.code
   - Observation.valueQuantity.code is a must support element with type = ['code']

### us-core-practitioner
- Practitioner
- Practitioner.identifier
   - Practitioner.identifier is a must support element with type = ['Identifier']

- Practitioner.identifier.system
   - Practitioner.identifier.system is a must support element with type = ['uri']

- Practitioner.identifier.value
   - Practitioner.identifier.value is a must support element with type = ['string']

- Practitioner.identifier
   - Practitioner.identifier:NPI is a must support element with type = ['Identifier']

- Practitioner.name
   - Practitioner.name is a must support element with type = ['HumanName']

- Practitioner.name.family
   - Practitioner.name.family is a must support element with type = ['string']

### us-core-practitionerrole
- PractitionerRole
- PractitionerRole.practitioner
   - PractitionerRole.practitioner is a must support element with type = ['Reference']

- PractitionerRole.organization
   - PractitionerRole.organization is a must support element with type = ['Reference']

- PractitionerRole.code
   - PractitionerRole.code is a must support element with type = ['CodeableConcept']

- PractitionerRole.specialty
   - PractitionerRole.specialty is a must support element with type = ['CodeableConcept']

- PractitionerRole.location
   - PractitionerRole.location is a must support element with type = ['Reference']

- PractitionerRole.telecom
   - PractitionerRole.telecom is a must support element with type = ['ContactPoint']

- PractitionerRole.telecom.system
   - PractitionerRole.telecom.system is a must support element with type = ['code']

- PractitionerRole.telecom.value
   - PractitionerRole.telecom.value is a must support element with type = ['string']

- PractitionerRole.endpoint
   - no type (either a backbone or defined as pattern)

### us-core-procedure
- Procedure
- Procedure.status
   - Procedure.status is a must support element with type = ['code']

- Procedure.code
   - Procedure.code is a must support element with type = ['CodeableConcept']

- Procedure.subject
   - Procedure.subject is a must support element with type = ['Reference']

- Procedure.performed[x]
   - Procedure.performed[x] is a must support element with type = ['dateTime', 'Period']

### us-core-provenance
- Provenance
- Provenance.target
   - Provenance.target is a must support element with type = ['Reference']

- Provenance.target.reference
   - no type (either a backbone or defined as pattern)

- Provenance.recorded
   - Provenance.recorded is a must support element with type = ['instant']

- Provenance.agent
   - no type (either a backbone or defined as pattern)

- Provenance.agent.type
   - Provenance.agent.type is a must support element with type = ['CodeableConcept']

- Provenance.agent.who
   - Provenance.agent.who is a must support element with type = ['Reference']

- Provenance.agent.onBehalfOf
   - Provenance.agent.onBehalfOf is a must support element with type = ['Reference']

- Provenance.agent
   - no type (either a backbone or defined as pattern)

- Provenance.agent.type
   - Provenance.agent:ProvenanceAuthor.type is a must support element with type = ['CodeableConcept']

- Provenance.agent
   - no type (either a backbone or defined as pattern)

- Provenance.agent.type
   - Provenance.agent:ProvenanceTransmitter.type is a must support element with type = ['CodeableConcept']

### us-core-pulse-oximetry
- Observation
- Observation.code
   - no type (either a backbone or defined as pattern)

- Observation.code.coding
   - no type (either a backbone or defined as pattern)

- Observation.code.coding
   - Observation.code.coding:PulseOx is a must support element with type = ['Coding']

- Observation.code.coding
   - Observation.code.coding:O2Sat is a must support element with type = ['Coding']

- Observation.component
   - no type (either a backbone or defined as pattern)

- Observation.component
   - no type (either a backbone or defined as pattern)

- Observation.component.code
   - Observation.component:FlowRate.code is a must support element with type = ['CodeableConcept']

- Observation.component.valueQuantity
   - no type (either a backbone or defined as pattern)

- Observation.component.valueQuantity.value
   - no type (either a backbone or defined as pattern)

- Observation.component.valueQuantity.unit
   - no type (either a backbone or defined as pattern)

- Observation.component.valueQuantity.system
   - Observation.component:FlowRate.valueQuantity.system is a must support element with type = ['uri']

- Observation.component.valueQuantity.code
   - Observation.component:FlowRate.valueQuantity.code is a must support element with type = ['code']

- Observation.component
   - no type (either a backbone or defined as pattern)

- Observation.component.code
   - Observation.component:Concentration.code is a must support element with type = ['CodeableConcept']

- Observation.component.valueQuantity
   - no type (either a backbone or defined as pattern)

- Observation.component.valueQuantity.value
   - no type (either a backbone or defined as pattern)

- Observation.component.valueQuantity.unit
   - no type (either a backbone or defined as pattern)

- Observation.component.valueQuantity.system
   - Observation.component:Concentration.valueQuantity.system is a must support element with type = ['uri']

- Observation.component.valueQuantity.code
   - Observation.component:Concentration.valueQuantity.code is a must support element with type = ['code']

### us-core-race
- Extension
- Extension.extension
   - Extension.extension:ombCategory is a must support element with type = ['Extension']

- Extension.extension.url
- Extension.extension.valueCoding
- Extension.extension
- Extension.extension.url
- Extension.extension.valueCoding
- Extension.extension
   - Extension.extension:text is a must support element with type = ['Extension']

- Extension.extension.url
- Extension.extension.valueString
- Extension.url
- Extension.value[x]
### us-core-respiratoryrate
- Observation
- Observation.code
   - Observation.code is a must support element with type = ['CodeableConcept']

- Observation.valueQuantity
   - no type (either a backbone or defined as pattern)

- Observation.valueQuantity.value
   - Observation.valueQuantity.value is a must support element with type = ['decimal']

- Observation.valueQuantity.unit
   - Observation.valueQuantity.unit is a must support element with type = ['string']

- Observation.valueQuantity.system
   - Observation.valueQuantity.system is a must support element with type = ['uri']

- Observation.valueQuantity.code
   - Observation.valueQuantity.code is a must support element with type = ['code']

### us-core-smokingstatus
- Observation
- Observation.status
   - no type (either a backbone or defined as pattern)

- Observation.category
   - Observation.category is a must support element with type = ['CodeableConcept']

- Observation.category
   - Observation.category:SocialHistory is a must support element with type = ['CodeableConcept']

- Observation.code
   - Observation.code is a must support element with type = ['CodeableConcept']

- Observation.subject
   - Observation.subject is a must support element with type = ['Reference']

- Observation.effectiveDateTime
   - no type (either a backbone or defined as pattern)

- Observation.valueCodeableConcept
   - Observation.valueCodeableConcept is a must support element with type = ['CodeableConcept']

### us-core-vitalsigns
- Observation
- Observation.status
   - no type (either a backbone or defined as pattern)

- Observation.category
   - Observation.category is a must support element with type = ['CodeableConcept']

- Observation.category
   - Observation.category:VSCat is a must support element with type = ['CodeableConcept']

- Observation.category.coding
   - Observation.category:VSCat.coding is a must support element with type = ['Coding']

- Observation.category.coding.system
   - Observation.category:VSCat.coding.system is a must support element with type = ['uri']

- Observation.category.coding.code
   - Observation.category:VSCat.coding.code is a must support element with type = ['code']

- Observation.code
   - no type (either a backbone or defined as pattern)

- Observation.subject
   - Observation.subject is a must support element with type = ['Reference']

- Observation.effective[x]
   - Observation.effective[x] is a must support element with type = ['dateTime', 'Period']

- Observation.value[x]
   - Observation.value[x] is a must support element with type = ['Quantity', 'CodeableConcept', 'string', 'boolean', 'integer', 'Range', 'Ratio', 'SampledData', 'time', 'dateTime', 'Period']

- Observation.dataAbsentReason
   - no type (either a backbone or defined as pattern)

- Observation.component
   - no type (either a backbone or defined as pattern)

- Observation.component.code
   - no type (either a backbone or defined as pattern)

- Observation.component.value[x]
   - Observation.component.value[x] is a must support element with type = ['Quantity', 'CodeableConcept', 'string', 'boolean', 'integer', 'Range', 'Ratio', 'SampledData', 'time', 'dateTime', 'Period']

- Observation.component.dataAbsentReason
   - no type (either a backbone or defined as pattern)

### us-core-patient
- Patient
- Patient.extension
- Patient.extension
- Patient.extension
- Patient.identifier
   - Patient.identifier is a must support element with type = ['Identifier']

- Patient.identifier.system
   - Patient.identifier.system is a must support element with type = ['uri']

- Patient.identifier.value
   - Patient.identifier.value is a must support element with type = ['string']

- Patient.name
   - Patient.name is a must support element with type = ['HumanName']

- Patient.name.family
   - Patient.name.family is a must support element with type = ['string']

- Patient.name.given
   - Patient.name.given is a must support element with type = ['string']

- Patient.name.suffix
- Patient.name.period
- Patient.telecom
- Patient.telecom.system
   - no type (either a backbone or defined as pattern)

- Patient.telecom.value
   - no type (either a backbone or defined as pattern)

- Patient.telecom.use
   - no type (either a backbone or defined as pattern)

- Patient.gender
   - Patient.gender is a must support element with type = ['code']

- Patient.birthDate
   - Patient.birthDate is a must support element with type = ['date']

- Patient.address
   - no type (either a backbone or defined as pattern)

- Patient.address.line
   - no type (either a backbone or defined as pattern)

- Patient.address.city
   - no type (either a backbone or defined as pattern)

- Patient.address.state
   - no type (either a backbone or defined as pattern)

- Patient.address.postalCode
   - no type (either a backbone or defined as pattern)

- Patient.address.period
   - no type (either a backbone or defined as pattern)

- Patient.communication
- Patient.communication.language
   - Patient.communication.language is a must support element with type = ['CodeableConcept']

</div>

{% include link-list.md %}
