
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

1. Organization.identifier:NPI is a must support element with type = ['Identifier'] <<<  has Pattern
1. **DiagnosticReport.presentedForm is a must support element with type = ['Attachment']**
1. PractitionerRole.telecom is a must support element with type = ['ContactPoint'] <<<< MS on sub elements
1. CarePlan.text is a must support element with type = ['Narrative']  <<<< MS on sub elements
1. CarePlan.text is a must support element with type = ['Narrative']  <<<< MS on sub elements
1. Location.address is a must support element with type = ['Address'] <<<< MS on sub elements
Patient.name is a must support element with type = ['HumanName'] <<<< MS on sub elements
Patient.address is a must support element with type = ['HumanName'] <<<< MS on sub elements

## By Profile

### head-occipital-frontal-circumference-percentile
- Observation
   - Observation.status is min== 1 with must support == True element with type = ['code']

   - Observation.category is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.category:VSCat is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.category:VSCat.coding is min== 1 with must support == True element with type = ['Coding']

   - Observation.category:VSCat.coding.system is min== 1 with must support == True element with type = ['uri']

   - Observation.category:VSCat.coding.code is min== 1 with must support == True element with type = ['code']

   - Observation.code is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.subject is min== 1 with must support == True element with type = ['Reference']

   - Observation.effective[x] is min== 1 with must support == True element with type = ['dateTime', 'Period']

   - Observation.value[x] is min== 0 with must support == True element with type = ['Quantity']

   - Observation.value[x]:valueQuantity is min== 0 with must support == True element with type = ['Quantity']

   - Observation.value[x]:valueQuantity.value is min== 1 with must support == True element with type = ['decimal']

   - Observation.value[x]:valueQuantity.unit is min== 1 with must support == True element with type = ['string']

   - Observation.value[x]:valueQuantity.system is min== 1 with must support == True element with type = ['uri']

   - Observation.value[x]:valueQuantity.code is min== 1 with must support == True element with type = ['code']

   - Observation.dataAbsentReason is min== 0 with must support == True element with type = ['CodeableConcept']

   - Observation.component is min== 0 with must support == True element with type = ['BackboneElement']

   - Observation.component.code is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.component.value[x] is min== 0 with must support == True element with type = ['Quantity', 'CodeableConcept', 'string', 'boolean', 'integer', 'Range', 'Ratio', 'SampledData', 'time', 'dateTime', 'Period']

   - Observation.component.dataAbsentReason is min== 0 with must support == True element with type = ['CodeableConcept']

### pediatric-bmi-for-age
- Observation
   - Observation.status is min== 1 with must support == True element with type = ['code']

   - Observation.category is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.category:VSCat is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.category:VSCat.coding is min== 1 with must support == True element with type = ['Coding']

   - Observation.category:VSCat.coding.system is min== 1 with must support == True element with type = ['uri']

   - Observation.category:VSCat.coding.code is min== 1 with must support == True element with type = ['code']

   - Observation.code is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.subject is min== 1 with must support == True element with type = ['Reference']

   - Observation.effective[x] is min== 1 with must support == True element with type = ['dateTime', 'Period']

   - Observation.value[x] is min== 0 with must support == True element with type = ['Quantity']

   - Observation.value[x]:valueQuantity is min== 0 with must support == True element with type = ['Quantity']

   - Observation.value[x]:valueQuantity.value is min== 1 with must support == True element with type = ['decimal']

   - Observation.value[x]:valueQuantity.unit is min== 1 with must support == True element with type = ['string']

   - Observation.value[x]:valueQuantity.system is min== 1 with must support == True element with type = ['uri']

   - Observation.value[x]:valueQuantity.code is min== 1 with must support == True element with type = ['code']

   - Observation.dataAbsentReason is min== 0 with must support == True element with type = ['CodeableConcept']

   - Observation.component is min== 0 with must support == True element with type = ['BackboneElement']

   - Observation.component.code is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.component.value[x] is min== 0 with must support == True element with type = ['Quantity', 'CodeableConcept', 'string', 'boolean', 'integer', 'Range', 'Ratio', 'SampledData', 'time', 'dateTime', 'Period']

   - Observation.component.dataAbsentReason is min== 0 with must support == True element with type = ['CodeableConcept']

### pediatric-weight-for-height
- Observation
   - Observation.status is min== 1 with must support == True element with type = ['code']

   - Observation.category is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.category:VSCat is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.category:VSCat.coding is min== 1 with must support == True element with type = ['Coding']

   - Observation.category:VSCat.coding.system is min== 1 with must support == True element with type = ['uri']

   - Observation.category:VSCat.coding.code is min== 1 with must support == True element with type = ['code']

   - Observation.code is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.subject is min== 1 with must support == True element with type = ['Reference']

   - Observation.effective[x] is min== 1 with must support == True element with type = ['dateTime', 'Period']

   - Observation.value[x] is min== 0 with must support == True element with type = ['Quantity']

   - Observation.value[x]:valueQuantity is min== 0 with must support == True element with type = ['Quantity']

   - Observation.value[x]:valueQuantity.value is min== 1 with must support == True element with type = ['decimal']

   - Observation.value[x]:valueQuantity.unit is min== 1 with must support == True element with type = ['string']

   - Observation.value[x]:valueQuantity.system is min== 1 with must support == True element with type = ['uri']

   - Observation.value[x]:valueQuantity.code is min== 1 with must support == True element with type = ['code']

   - Observation.dataAbsentReason is min== 0 with must support == True element with type = ['CodeableConcept']

   - Observation.component is min== 0 with must support == True element with type = ['BackboneElement']

   - Observation.component.code is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.component.value[x] is min== 0 with must support == True element with type = ['Quantity', 'CodeableConcept', 'string', 'boolean', 'integer', 'Range', 'Ratio', 'SampledData', 'time', 'dateTime', 'Period']

   - Observation.component.dataAbsentReason is min== 0 with must support == True element with type = ['CodeableConcept']

### us-core-allergyintolerance
- AllergyIntolerance
   - AllergyIntolerance.clinicalStatus is min== 0 with must support == True element with type = ['CodeableConcept']

   - AllergyIntolerance.verificationStatus is min== 0 with must support == True element with type = ['CodeableConcept']

   - AllergyIntolerance.code is min== 1 with must support == True element with type = ['CodeableConcept']

   - AllergyIntolerance.patient is min== 1 with must support == True element with type = ['Reference']

   - AllergyIntolerance.reaction is min== 0 with must support == True element with type = ['BackboneElement']

   - AllergyIntolerance.reaction.manifestation is min== 1 with must support == True element with type = ['CodeableConcept']

### us-core-birthsex
- Extension
### us-core-bloodpressure
- Observation
   - Observation.status is min== 1 with must support == True element with type = ['code']

   - Observation.category is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.category:VSCat is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.category:VSCat.coding is min== 1 with must support == True element with type = ['Coding']

   - Observation.category:VSCat.coding.system is min== 1 with must support == True element with type = ['uri']

   - Observation.category:VSCat.coding.code is min== 1 with must support == True element with type = ['code']

   - Observation.code is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.subject is min== 1 with must support == True element with type = ['Reference']

   - Observation.effective[x] is min== 1 with must support == True element with type = ['dateTime', 'Period']

   - Observation.value[x] is min== 0 with must support == True element with type = ['Quantity', 'CodeableConcept', 'string', 'boolean', 'integer', 'Range', 'Ratio', 'SampledData', 'time', 'dateTime', 'Period']

   - Observation.dataAbsentReason is min== 0 with must support == True element with type = ['CodeableConcept']

   - Observation.component is min== 2 with must support == True element with type = ['BackboneElement']

   - Observation.component.code is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.component.value[x] is min== 0 with must support == True element with type = ['Quantity', 'CodeableConcept', 'string', 'boolean', 'integer', 'Range', 'Ratio', 'SampledData', 'time', 'dateTime', 'Period']

   - Observation.component.dataAbsentReason is min== 0 with must support == True element with type = ['CodeableConcept']

   - Observation.component:systolic is min== 1 with must support == True element with type = ['BackboneElement']

   - Observation.component:systolic.code is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.component:systolic.value[x] is min== 0 with must support == True element with type = ['Quantity']

   - Observation.component:systolic.value[x].value is min== 1 with must support == True element with type = ['decimal']

   - Observation.component:systolic.value[x].unit is min== 1 with must support == True element with type = ['string']

   - Observation.component:systolic.value[x].system is min== 1 with must support == True element with type = ['uri']

   - Observation.component:systolic.value[x].code is min== 1 with must support == True element with type = ['code']

   - Observation.component:systolic.dataAbsentReason is min== 0 with must support == True element with type = ['CodeableConcept']

   - Observation.component:diastolic is min== 1 with must support == True element with type = ['BackboneElement']

   - Observation.component:diastolic.code is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.component:diastolic.value[x] is min== 0 with must support == True element with type = ['Quantity']

   - Observation.component:diastolic.value[x].value is min== 1 with must support == True element with type = ['decimal']

   - Observation.component:diastolic.value[x].unit is min== 1 with must support == True element with type = ['string']

   - Observation.component:diastolic.value[x].system is min== 1 with must support == True element with type = ['uri']

   - Observation.component:diastolic.value[x].code is min== 1 with must support == True element with type = ['code']

   - Observation.component:diastolic.dataAbsentReason is min== 0 with must support == True element with type = ['CodeableConcept']

### us-core-bmi
- Observation
   - Observation.status is min== 1 with must support == True element with type = ['code']

   - Observation.category is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.category:VSCat is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.category:VSCat.coding is min== 1 with must support == True element with type = ['Coding']

   - Observation.category:VSCat.coding.system is min== 1 with must support == True element with type = ['uri']

   - Observation.category:VSCat.coding.code is min== 1 with must support == True element with type = ['code']

   - Observation.code is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.subject is min== 1 with must support == True element with type = ['Reference']

   - Observation.effective[x] is min== 1 with must support == True element with type = ['dateTime', 'Period']

   - Observation.value[x] is min== 0 with must support == True element with type = ['Quantity']

   - Observation.value[x]:valueQuantity is min== 0 with must support == True element with type = ['Quantity']

   - Observation.value[x]:valueQuantity.value is min== 1 with must support == True element with type = ['decimal']

   - Observation.value[x]:valueQuantity.unit is min== 1 with must support == True element with type = ['string']

   - Observation.value[x]:valueQuantity.system is min== 1 with must support == True element with type = ['uri']

   - Observation.value[x]:valueQuantity.code is min== 1 with must support == True element with type = ['code']

   - Observation.dataAbsentReason is min== 0 with must support == True element with type = ['CodeableConcept']

   - Observation.component is min== 0 with must support == True element with type = ['BackboneElement']

   - Observation.component.code is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.component.value[x] is min== 0 with must support == True element with type = ['Quantity', 'CodeableConcept', 'string', 'boolean', 'integer', 'Range', 'Ratio', 'SampledData', 'time', 'dateTime', 'Period']

   - Observation.component.dataAbsentReason is min== 0 with must support == True element with type = ['CodeableConcept']

### us-core-bodyheight
- Observation
   - Observation.status is min== 1 with must support == True element with type = ['code']

   - Observation.category is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.category:VSCat is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.category:VSCat.coding is min== 1 with must support == True element with type = ['Coding']

   - Observation.category:VSCat.coding.system is min== 1 with must support == True element with type = ['uri']

   - Observation.category:VSCat.coding.code is min== 1 with must support == True element with type = ['code']

   - Observation.code is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.subject is min== 1 with must support == True element with type = ['Reference']

   - Observation.effective[x] is min== 1 with must support == True element with type = ['dateTime', 'Period']

   - Observation.value[x] is min== 0 with must support == True element with type = ['Quantity']

   - Observation.value[x]:valueQuantity is min== 0 with must support == True element with type = ['Quantity']

   - Observation.value[x]:valueQuantity.value is min== 1 with must support == True element with type = ['decimal']

   - Observation.value[x]:valueQuantity.unit is min== 1 with must support == True element with type = ['string']

   - Observation.value[x]:valueQuantity.system is min== 1 with must support == True element with type = ['uri']

   - Observation.value[x]:valueQuantity.code is min== 1 with must support == True element with type = ['code']

   - Observation.dataAbsentReason is min== 0 with must support == True element with type = ['CodeableConcept']

   - Observation.component is min== 0 with must support == True element with type = ['BackboneElement']

   - Observation.component.code is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.component.value[x] is min== 0 with must support == True element with type = ['Quantity', 'CodeableConcept', 'string', 'boolean', 'integer', 'Range', 'Ratio', 'SampledData', 'time', 'dateTime', 'Period']

   - Observation.component.dataAbsentReason is min== 0 with must support == True element with type = ['CodeableConcept']

### us-core-bodytemperature
- Observation
   - Observation.status is min== 1 with must support == True element with type = ['code']

   - Observation.category is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.category:VSCat is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.category:VSCat.coding is min== 1 with must support == True element with type = ['Coding']

   - Observation.category:VSCat.coding.system is min== 1 with must support == True element with type = ['uri']

   - Observation.category:VSCat.coding.code is min== 1 with must support == True element with type = ['code']

   - Observation.code is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.subject is min== 1 with must support == True element with type = ['Reference']

   - Observation.effective[x] is min== 1 with must support == True element with type = ['dateTime', 'Period']

   - Observation.value[x] is min== 0 with must support == True element with type = ['Quantity']

   - Observation.value[x]:valueQuantity is min== 0 with must support == True element with type = ['Quantity']

   - Observation.value[x]:valueQuantity.value is min== 1 with must support == True element with type = ['decimal']

   - Observation.value[x]:valueQuantity.unit is min== 1 with must support == True element with type = ['string']

   - Observation.value[x]:valueQuantity.system is min== 1 with must support == True element with type = ['uri']

   - Observation.value[x]:valueQuantity.code is min== 1 with must support == True element with type = ['code']

   - Observation.dataAbsentReason is min== 0 with must support == True element with type = ['CodeableConcept']

   - Observation.component is min== 0 with must support == True element with type = ['BackboneElement']

   - Observation.component.code is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.component.value[x] is min== 0 with must support == True element with type = ['Quantity', 'CodeableConcept', 'string', 'boolean', 'integer', 'Range', 'Ratio', 'SampledData', 'time', 'dateTime', 'Period']

   - Observation.component.dataAbsentReason is min== 0 with must support == True element with type = ['CodeableConcept']

### us-core-bodyweight
- Observation
   - Observation.status is min== 1 with must support == True element with type = ['code']

   - Observation.category is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.category:VSCat is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.category:VSCat.coding is min== 1 with must support == True element with type = ['Coding']

   - Observation.category:VSCat.coding.system is min== 1 with must support == True element with type = ['uri']

   - Observation.category:VSCat.coding.code is min== 1 with must support == True element with type = ['code']

   - Observation.code is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.subject is min== 1 with must support == True element with type = ['Reference']

   - Observation.effective[x] is min== 1 with must support == True element with type = ['dateTime', 'Period']

   - Observation.value[x] is min== 0 with must support == True element with type = ['Quantity']

   - Observation.value[x]:valueQuantity is min== 0 with must support == True element with type = ['Quantity']

   - Observation.value[x]:valueQuantity.value is min== 1 with must support == True element with type = ['decimal']

   - Observation.value[x]:valueQuantity.unit is min== 1 with must support == True element with type = ['string']

   - Observation.value[x]:valueQuantity.system is min== 1 with must support == True element with type = ['uri']

   - Observation.value[x]:valueQuantity.code is min== 1 with must support == True element with type = ['code']

   - Observation.dataAbsentReason is min== 0 with must support == True element with type = ['CodeableConcept']

   - Observation.component is min== 0 with must support == True element with type = ['BackboneElement']

   - Observation.component.code is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.component.value[x] is min== 0 with must support == True element with type = ['Quantity', 'CodeableConcept', 'string', 'boolean', 'integer', 'Range', 'Ratio', 'SampledData', 'time', 'dateTime', 'Period']

   - Observation.component.dataAbsentReason is min== 0 with must support == True element with type = ['CodeableConcept']

### us-core-careplan
- CarePlan
   - CarePlan.text is min== 1 with must support == True element with type = ['Narrative']

   - CarePlan.text.status is min== 1 with must support == True element with type = ['code']

   - CarePlan.status is min== 1 with must support == True element with type = ['code']

   - CarePlan.intent is min== 1 with must support == True element with type = ['code']

   - CarePlan.category is min== 1 with must support == True element with type = ['CodeableConcept']

   - CarePlan.category:AssessPlan is min== 1 with must support == True element with type = ['CodeableConcept']

   - CarePlan.subject is min== 1 with must support == True element with type = ['Reference']

### us-core-careteam
- CareTeam
   - CareTeam.status is min== 0 with must support == True element with type = ['code']

   - CareTeam.subject is min== 1 with must support == True element with type = ['Reference']

   - CareTeam.participant is min== 1 with must support == True element with type = ['BackboneElement']

   - CareTeam.participant.role is min== 1 with must support == True element with type = ['CodeableConcept']

   - CareTeam.participant.member is min== 1 with must support == True element with type = ['Reference']

### us-core-condition
- Condition
   - Condition.clinicalStatus is min== 0 with must support == True element with type = ['CodeableConcept']

   - Condition.verificationStatus is min== 0 with must support == True element with type = ['CodeableConcept']

   - Condition.category is min== 1 with must support == True element with type = ['CodeableConcept']

   - Condition.code is min== 1 with must support == True element with type = ['CodeableConcept']

   - Condition.subject is min== 1 with must support == True element with type = ['Reference']

### us-core-diagnosticreport-lab
- DiagnosticReport
   - DiagnosticReport.status is min== 1 with must support == True element with type = ['code']

   - DiagnosticReport.category is min== 1 with must support == True element with type = ['CodeableConcept']

   - DiagnosticReport.category:LaboratorySlice is min== 1 with must support == True element with type = ['CodeableConcept']

   - DiagnosticReport.code is min== 1 with must support == True element with type = ['CodeableConcept']

   - DiagnosticReport.subject is min== 1 with must support == True element with type = ['Reference']

   - DiagnosticReport.effective[x] is min== 1 with must support == True element with type = ['dateTime', 'Period']

   - DiagnosticReport.issued is min== 1 with must support == True element with type = ['instant']

   - DiagnosticReport.performer is min== 0 with must support == True element with type = ['Reference']

   - DiagnosticReport.result is min== 0 with must support == True element with type = ['Reference']

### us-core-diagnosticreport-note
- DiagnosticReport
   - DiagnosticReport.status is min== 1 with must support == True element with type = ['code']

   - DiagnosticReport.category is min== 1 with must support == True element with type = ['CodeableConcept']

   - DiagnosticReport.code is min== 1 with must support == True element with type = ['CodeableConcept']

   - DiagnosticReport.subject is min== 1 with must support == True element with type = ['Reference']

   - DiagnosticReport.encounter is min== 0 with must support == True element with type = ['Reference']

   - DiagnosticReport.effective[x] is min== 1 with must support == True element with type = ['dateTime', 'Period']

   - DiagnosticReport.issued is min== 0 with must support == True element with type = ['instant']

   - DiagnosticReport.performer is min== 0 with must support == True element with type = ['Reference']

   - DiagnosticReport.presentedForm is min== 0 with must support == True element with type = ['Attachment']

### us-core-direct
- Extension
### us-core-documentreference
- DocumentReference
   - DocumentReference.identifier is min== 0 with must support == True element with type = ['Identifier']

   - DocumentReference.status is min== 1 with must support == True element with type = ['code']

   - DocumentReference.type is min== 1 with must support == True element with type = ['CodeableConcept']

   - DocumentReference.category is min== 1 with must support == True element with type = ['CodeableConcept']

   - DocumentReference.subject is min== 1 with must support == True element with type = ['Reference']

   - DocumentReference.date is min== 0 with must support == True element with type = ['instant']

   - DocumentReference.author is min== 0 with must support == True element with type = ['Reference']

   - DocumentReference.custodian is min== 0 with must support == True element with type = ['Reference']

   - DocumentReference.content is min== 1 with must support == True element with type = ['BackboneElement']

   - DocumentReference.content.attachment is min== 1 with must support == True element with type = ['Attachment']

   - DocumentReference.content.attachment.contentType is min== 1 with must support == True element with type = ['code']

   - DocumentReference.content.attachment.data is min== 0 with must support == True element with type = ['base64Binary']

   - DocumentReference.content.attachment.url is min== 0 with must support == True element with type = ['url']

   - DocumentReference.content.format is min== 0 with must support == True element with type = ['Coding']

   - DocumentReference.context is min== 0 with must support == True element with type = ['BackboneElement']

   - DocumentReference.context.encounter is min== 0 with must support == True element with type = ['Reference']

   - DocumentReference.context.period is min== 0 with must support == True element with type = ['Period']

### us-core-encounter
- Encounter
   - Encounter.identifier is min== 0 with must support == True element with type = ['Identifier']

   - Encounter.identifier.system is min== 1 with must support == True element with type = ['uri']

   - Encounter.identifier.value is min== 1 with must support == True element with type = ['string']

   - Encounter.status is min== 1 with must support == True element with type = ['code']

   - Encounter.class is min== 1 with must support == True element with type = ['Coding']

   - Encounter.type is min== 1 with must support == True element with type = ['CodeableConcept']

   - Encounter.subject is min== 1 with must support == True element with type = ['Reference']

   - Encounter.participant is min== 0 with must support == True element with type = ['BackboneElement']

   - Encounter.participant.type is min== 0 with must support == True element with type = ['CodeableConcept']

   - Encounter.participant.period is min== 0 with must support == True element with type = ['Period']

   - Encounter.participant.individual is min== 0 with must support == True element with type = ['Reference']

   - Encounter.period is min== 0 with must support == True element with type = ['Period']

   - Encounter.reasonCode is min== 0 with must support == True element with type = ['CodeableConcept']

   - Encounter.reasonReference is min== 0 with must support == True element with type = ['Reference']

   - Encounter.hospitalization is min== 0 with must support == True element with type = ['BackboneElement']

   - Encounter.hospitalization.dischargeDisposition is min== 0 with must support == True element with type = ['CodeableConcept']

   - Encounter.location is min== 0 with must support == True element with type = ['BackboneElement']

   - Encounter.location.location is min== 1 with must support == True element with type = ['Reference']

   - Encounter.serviceProvider is min== 0 with must support == True element with type = ['Reference']

### us-core-ethnicity
- Extension
   - Extension.extension:ombCategory is min== 0 with must support == True element with type = ['Extension']

   - Extension.extension:text is min== 1 with must support == True element with type = ['Extension']

### us-core-goal
- Goal
   - Goal.lifecycleStatus is min== 1 with must support == True element with type = ['code']

   - Goal.description is min== 1 with must support == True element with type = ['CodeableConcept']

   - Goal.subject is min== 1 with must support == True element with type = ['Reference']

   - Goal.target is min== 0 with must support == True element with type = ['BackboneElement']

   - Goal.target.due[x] is min== 0 with must support == True element with type = ['date', 'Duration']

### us-core-headcircumference
- Observation
   - Observation.status is min== 1 with must support == True element with type = ['code']

   - Observation.category is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.category:VSCat is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.category:VSCat.coding is min== 1 with must support == True element with type = ['Coding']

   - Observation.category:VSCat.coding.system is min== 1 with must support == True element with type = ['uri']

   - Observation.category:VSCat.coding.code is min== 1 with must support == True element with type = ['code']

   - Observation.code is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.subject is min== 1 with must support == True element with type = ['Reference']

   - Observation.effective[x] is min== 1 with must support == True element with type = ['dateTime', 'Period']

   - Observation.value[x] is min== 0 with must support == True element with type = ['Quantity']

   - Observation.value[x]:valueQuantity is min== 0 with must support == True element with type = ['Quantity']

   - Observation.value[x]:valueQuantity.value is min== 1 with must support == True element with type = ['decimal']

   - Observation.value[x]:valueQuantity.unit is min== 1 with must support == True element with type = ['string']

   - Observation.value[x]:valueQuantity.system is min== 1 with must support == True element with type = ['uri']

   - Observation.value[x]:valueQuantity.code is min== 1 with must support == True element with type = ['code']

   - Observation.dataAbsentReason is min== 0 with must support == True element with type = ['CodeableConcept']

   - Observation.component is min== 0 with must support == True element with type = ['BackboneElement']

   - Observation.component.code is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.component.value[x] is min== 0 with must support == True element with type = ['Quantity', 'CodeableConcept', 'string', 'boolean', 'integer', 'Range', 'Ratio', 'SampledData', 'time', 'dateTime', 'Period']

   - Observation.component.dataAbsentReason is min== 0 with must support == True element with type = ['CodeableConcept']

### us-core-heartrate
- Observation
   - Observation.status is min== 1 with must support == True element with type = ['code']

   - Observation.category is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.category:VSCat is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.category:VSCat.coding is min== 1 with must support == True element with type = ['Coding']

   - Observation.category:VSCat.coding.system is min== 1 with must support == True element with type = ['uri']

   - Observation.category:VSCat.coding.code is min== 1 with must support == True element with type = ['code']

   - Observation.code is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.subject is min== 1 with must support == True element with type = ['Reference']

   - Observation.effective[x] is min== 1 with must support == True element with type = ['dateTime', 'Period']

   - Observation.value[x] is min== 0 with must support == True element with type = ['Quantity']

   - Observation.value[x]:valueQuantity is min== 0 with must support == True element with type = ['Quantity']

   - Observation.value[x]:valueQuantity.value is min== 1 with must support == True element with type = ['decimal']

   - Observation.value[x]:valueQuantity.unit is min== 1 with must support == True element with type = ['string']

   - Observation.value[x]:valueQuantity.system is min== 1 with must support == True element with type = ['uri']

   - Observation.value[x]:valueQuantity.code is min== 1 with must support == True element with type = ['code']

   - Observation.dataAbsentReason is min== 0 with must support == True element with type = ['CodeableConcept']

   - Observation.component is min== 0 with must support == True element with type = ['BackboneElement']

   - Observation.component.code is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.component.value[x] is min== 0 with must support == True element with type = ['Quantity', 'CodeableConcept', 'string', 'boolean', 'integer', 'Range', 'Ratio', 'SampledData', 'time', 'dateTime', 'Period']

   - Observation.component.dataAbsentReason is min== 0 with must support == True element with type = ['CodeableConcept']

### us-core-immunization
- Immunization
   - Immunization.status is min== 1 with must support == True element with type = ['code']

   - Immunization.statusReason is min== 0 with must support == True element with type = ['CodeableConcept']

   - Immunization.vaccineCode is min== 1 with must support == True element with type = ['CodeableConcept']

   - Immunization.patient is min== 1 with must support == True element with type = ['Reference']

   - Immunization.occurrence[x] is min== 1 with must support == True element with type = ['dateTime', 'string']

   - Immunization.primarySource is min== 1 with must support == True element with type = ['boolean']

### us-core-implantable-device
- Device
   - Device.udiCarrier is min== 0 with must support == True element with type = ['BackboneElement']

   - Device.udiCarrier.deviceIdentifier is min== 1 with must support == True element with type = ['string']

   - Device.manufactureDate is min== 0 with must support == True element with type = ['dateTime']

   - Device.expirationDate is min== 0 with must support == True element with type = ['dateTime']

   - Device.lotNumber is min== 0 with must support == True element with type = ['string']

   - Device.serialNumber is min== 0 with must support == True element with type = ['string']

   - Device.type is min== 1 with must support == True element with type = ['CodeableConcept']

   - Device.patient is min== 1 with must support == True element with type = ['Reference']

### us-core-location
- Location
   - Location.status is min== 0 with must support == True element with type = ['code']

   - Location.name is min== 1 with must support == True element with type = ['string']

   - Location.telecom is min== 0 with must support == True element with type = ['ContactPoint']

   - Location.address is min== 0 with must support == True element with type = ['Address']

   - Location.address.line is min== 0 with must support == True element with type = ['string']

   - Location.address.city is min== 0 with must support == True element with type = ['string']

   - Location.address.state is min== 0 with must support == True element with type = ['string']

   - Location.address.postalCode is min== 0 with must support == True element with type = ['string']

   - Location.managingOrganization is min== 0 with must support == True element with type = ['Reference']

### us-core-medication
- Medication
   - Medication.code is min== 1 with must support == True element with type = ['CodeableConcept']

### us-core-medicationrequest
- MedicationRequest
   - MedicationRequest.status is min== 1 with must support == True element with type = ['code']

   - MedicationRequest.intent is min== 1 with must support == True element with type = ['code']

   - MedicationRequest.reported[x] is min== 0 with must support == True element with type = ['boolean', 'Reference']

   - MedicationRequest.medication[x] is min== 1 with must support == True element with type = ['CodeableConcept', 'Reference']

   - MedicationRequest.subject is min== 1 with must support == True element with type = ['Reference']

   - MedicationRequest.encounter is min== 0 with must support == True element with type = ['Reference']

   - MedicationRequest.authoredOn is min== 1 with must support == True element with type = ['dateTime']

   - MedicationRequest.requester is min== 1 with must support == True element with type = ['Reference']

   - MedicationRequest.dosageInstruction is min== 0 with must support == True element with type = ['Dosage']

   - MedicationRequest.dosageInstruction.text is min== 0 with must support == True element with type = ['string']

### us-core-observation-lab
- Observation
   - Observation.status is min== 1 with must support == True element with type = ['code']

   - Observation.category is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.category:Laboratory is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.code is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.subject is min== 1 with must support == True element with type = ['Reference']

   - Observation.effective[x] is min== 0 with must support == True element with type = ['dateTime', 'Period', 'Timing', 'instant']

   - Observation.value[x] is min== 0 with must support == True element with type = ['Quantity', 'CodeableConcept', 'string', 'boolean', 'integer', 'Range', 'Ratio', 'SampledData', 'time', 'dateTime', 'Period']

   - Observation.dataAbsentReason is min== 0 with must support == True element with type = ['CodeableConcept']

### us-core-organization
- Organization
   - Organization.identifier is min== 0 with must support == True element with type = ['Identifier']

   - Organization.identifier.system is min== 0 with must support == True element with type = ['uri']

   - Organization.identifier.value is min== 0 with must support == True element with type = ['string']

   - Organization.identifier:NPI is min== 0 with must support == True element with type = ['Identifier']

   - Organization.active is min== 1 with must support == True element with type = ['boolean']

   - Organization.name is min== 1 with must support == True element with type = ['string']

   - Organization.telecom is min== 0 with must support == True element with type = ['ContactPoint']

   - Organization.telecom.system is min== 0 with must support == True element with type = ['code']

   - Organization.telecom.value is min== 0 with must support == True element with type = ['string']

   - Organization.address is min== 0 with must support == True element with type = ['Address']

   - Organization.address.line is min== 0 with must support == True element with type = ['string']

   - Organization.address.city is min== 0 with must support == True element with type = ['string']

   - Organization.address.state is min== 0 with must support == True element with type = ['string']

   - Organization.address.postalCode is min== 0 with must support == True element with type = ['string']

   - Organization.address.country is min== 0 with must support == True element with type = ['string']

### us-core-patient
- Patient
   - Patient.identifier is min== 1 with must support == True element with type = ['Identifier']

   - Patient.identifier.system is min== 1 with must support == True element with type = ['uri']

   - Patient.identifier.value is min== 1 with must support == True element with type = ['string']

   - Patient.name is min== 1 with must support == True element with type = ['HumanName']

   - Patient.name.family is min== 0 with must support == True element with type = ['string']

   - Patient.name.given is min== 0 with must support == True element with type = ['string']

   - Patient.telecom.system is min== 1 with must support == True element with type = ['code']

   - Patient.telecom.value is min== 1 with must support == True element with type = ['string']

   - Patient.telecom.use is min== 0 with must support == True element with type = ['code']

   - Patient.gender is min== 1 with must support == True element with type = ['code']

   - Patient.birthDate is min== 0 with must support == True element with type = ['date']

   - Patient.address is min== 0 with must support == True element with type = ['Address']

   - Patient.address.line is min== 0 with must support == True element with type = ['string']

   - Patient.address.city is min== 0 with must support == True element with type = ['string']

   - Patient.address.state is min== 0 with must support == True element with type = ['string']

   - Patient.address.postalCode is min== 0 with must support == True element with type = ['string']

   - Patient.address.period is min== 0 with must support == True element with type = ['Period']

   - Patient.communication.language is min== 1 with must support == True element with type = ['CodeableConcept']

### us-core-practitioner
- Practitioner
   - Practitioner.identifier is min== 1 with must support == True element with type = ['Identifier']

   - Practitioner.identifier.system is min== 1 with must support == True element with type = ['uri']

   - Practitioner.identifier.value is min== 1 with must support == True element with type = ['string']

   - Practitioner.identifier:NPI is min== 0 with must support == True element with type = ['Identifier']

   - Practitioner.name is min== 1 with must support == True element with type = ['HumanName']

   - Practitioner.name.family is min== 1 with must support == True element with type = ['string']

### us-core-practitionerrole
- PractitionerRole
   - PractitionerRole.practitioner is min== 1 with must support == True element with type = ['Reference']

   - PractitionerRole.organization is min== 1 with must support == True element with type = ['Reference']

   - PractitionerRole.code is min== 0 with must support == True element with type = ['CodeableConcept']

   - PractitionerRole.specialty is min== 0 with must support == True element with type = ['CodeableConcept']

   - PractitionerRole.location is min== 0 with must support == True element with type = ['Reference']

   - PractitionerRole.telecom is min== 0 with must support == True element with type = ['ContactPoint']

   - PractitionerRole.telecom.system is min== 1 with must support == True element with type = ['code']

   - PractitionerRole.telecom.value is min== 1 with must support == True element with type = ['string']

   - PractitionerRole.endpoint is min== 0 with must support == True element with type = ['Reference']

### us-core-procedure
- Procedure
   - Procedure.status is min== 1 with must support == True element with type = ['code']

   - Procedure.code is min== 1 with must support == True element with type = ['CodeableConcept']

   - Procedure.subject is min== 1 with must support == True element with type = ['Reference']

   - Procedure.performed[x] is min== 1 with must support == True element with type = ['dateTime', 'Period']

### us-core-provenance
- Provenance
   - Provenance.target is min== 1 with must support == True element with type = ['Reference']

   - Provenance.target.reference is min== 1 with must support == True element with type = ['string']

   - Provenance.recorded is min== 1 with must support == True element with type = ['instant']

   - Provenance.agent is min== 1 with must support == True element with type = ['BackboneElement']

   - Provenance.agent.type is min== 0 with must support == True element with type = ['CodeableConcept']

   - Provenance.agent.who is min== 1 with must support == True element with type = ['Reference']

   - Provenance.agent.onBehalfOf is min== 0 with must support == True element with type = ['Reference']

   - Provenance.agent:ProvenanceAuthor is min== 0 with must support == True element with type = ['BackboneElement']

   - Provenance.agent:ProvenanceAuthor.type is min== 1 with must support == True element with type = ['CodeableConcept']

   - Provenance.agent:ProvenanceTransmitter is min== 0 with must support == True element with type = ['BackboneElement']

   - Provenance.agent:ProvenanceTransmitter.type is min== 1 with must support == True element with type = ['CodeableConcept']

### us-core-pulse-oximetry
- Observation
   - Observation.status is min== 1 with must support == True element with type = ['code']

   - Observation.category is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.category:VSCat is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.category:VSCat.coding is min== 1 with must support == True element with type = ['Coding']

   - Observation.category:VSCat.coding.system is min== 1 with must support == True element with type = ['uri']

   - Observation.category:VSCat.coding.code is min== 1 with must support == True element with type = ['code']

   - Observation.code is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.code.coding is min== 0 with must support == True element with type = ['Coding']

   - Observation.code.coding:PulseOx is min== 1 with must support == True element with type = ['Coding']

   - Observation.code.coding:O2Sat is min== 1 with must support == True element with type = ['Coding']

   - Observation.subject is min== 1 with must support == True element with type = ['Reference']

   - Observation.effective[x] is min== 1 with must support == True element with type = ['dateTime', 'Period']

   - Observation.value[x] is min== 0 with must support == True element with type = ['Quantity', 'CodeableConcept', 'string', 'boolean', 'integer', 'Range', 'Ratio', 'SampledData', 'time', 'dateTime', 'Period']

   - Observation.dataAbsentReason is min== 0 with must support == True element with type = ['CodeableConcept']

   - Observation.component is min== 0 with must support == True element with type = ['BackboneElement']

   - Observation.component.code is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.component.value[x] is min== 0 with must support == True element with type = ['Quantity', 'CodeableConcept', 'string', 'boolean', 'integer', 'Range', 'Ratio', 'SampledData', 'time', 'dateTime', 'Period']

   - Observation.component.dataAbsentReason is min== 0 with must support == True element with type = ['CodeableConcept']

   - Observation.component:FlowRate is min== 0 with must support == True element with type = ['BackboneElement']

   - Observation.component:FlowRate.code is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.component:FlowRate.value[x] is min== 0 with must support == True element with type = ['Quantity']

   - Observation.component:FlowRate.value[x].value is min== 1 with must support == True element with type = ['decimal']

   - Observation.component:FlowRate.value[x].unit is min== 1 with must support == True element with type = ['string']

   - Observation.component:FlowRate.value[x].system is min== 1 with must support == True element with type = ['uri']

   - Observation.component:FlowRate.value[x].code is min== 1 with must support == True element with type = ['code']

   - Observation.component:FlowRate.dataAbsentReason is min== 0 with must support == True element with type = ['CodeableConcept']

   - Observation.component:Concentration is min== 0 with must support == True element with type = ['BackboneElement']

   - Observation.component:Concentration.code is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.component:Concentration.value[x] is min== 0 with must support == True element with type = ['Quantity']

   - Observation.component:Concentration.value[x].value is min== 1 with must support == True element with type = ['decimal']

   - Observation.component:Concentration.value[x].unit is min== 1 with must support == True element with type = ['string']

   - Observation.component:Concentration.value[x].system is min== 1 with must support == True element with type = ['uri']

   - Observation.component:Concentration.value[x].code is min== 1 with must support == True element with type = ['code']

   - Observation.component:Concentration.dataAbsentReason is min== 0 with must support == True element with type = ['CodeableConcept']

### us-core-race
- Extension
   - Extension.extension:ombCategory is min== 0 with must support == True element with type = ['Extension']

   - Extension.extension:text is min== 1 with must support == True element with type = ['Extension']

### us-core-respiratoryrate
- Observation
   - Observation.status is min== 1 with must support == True element with type = ['code']

   - Observation.category is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.category:VSCat is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.category:VSCat.coding is min== 1 with must support == True element with type = ['Coding']

   - Observation.category:VSCat.coding.system is min== 1 with must support == True element with type = ['uri']

   - Observation.category:VSCat.coding.code is min== 1 with must support == True element with type = ['code']

   - Observation.code is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.subject is min== 1 with must support == True element with type = ['Reference']

   - Observation.effective[x] is min== 1 with must support == True element with type = ['dateTime', 'Period']

   - Observation.value[x] is min== 0 with must support == True element with type = ['Quantity']

   - Observation.value[x]:valueQuantity is min== 0 with must support == True element with type = ['Quantity']

   - Observation.value[x]:valueQuantity.value is min== 1 with must support == True element with type = ['decimal']

   - Observation.value[x]:valueQuantity.unit is min== 1 with must support == True element with type = ['string']

   - Observation.value[x]:valueQuantity.system is min== 1 with must support == True element with type = ['uri']

   - Observation.value[x]:valueQuantity.code is min== 1 with must support == True element with type = ['code']

   - Observation.dataAbsentReason is min== 0 with must support == True element with type = ['CodeableConcept']

   - Observation.component is min== 0 with must support == True element with type = ['BackboneElement']

   - Observation.component.code is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.component.value[x] is min== 0 with must support == True element with type = ['Quantity', 'CodeableConcept', 'string', 'boolean', 'integer', 'Range', 'Ratio', 'SampledData', 'time', 'dateTime', 'Period']

   - Observation.component.dataAbsentReason is min== 0 with must support == True element with type = ['CodeableConcept']

### us-core-smokingstatus
- Observation
   - Observation.status is min== 1 with must support == True element with type = ['code']

   - Observation.category is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.category:SocialHistory is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.code is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.subject is min== 1 with must support == True element with type = ['Reference']

   - Observation.effective[x]:effectiveDateTime is min== 1 with must support == True element with type = ['dateTime']

   - Observation.value[x]:valueCodeableConcept is min== 1 with must support == True element with type = ['CodeableConcept']

### us-core-vitalsigns
- Observation
   - Observation.status is min== 1 with must support == True element with type = ['code']

   - Observation.category is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.category:VSCat is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.category:VSCat.coding is min== 1 with must support == True element with type = ['Coding']

   - Observation.category:VSCat.coding.system is min== 1 with must support == True element with type = ['uri']

   - Observation.category:VSCat.coding.code is min== 1 with must support == True element with type = ['code']

   - Observation.code is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.subject is min== 1 with must support == True element with type = ['Reference']

   - Observation.effective[x] is min== 1 with must support == True element with type = ['dateTime', 'Period']

   - Observation.value[x] is min== 0 with must support == True element with type = ['Quantity', 'CodeableConcept', 'string', 'boolean', 'integer', 'Range', 'Ratio', 'SampledData', 'time', 'dateTime', 'Period']

   - Observation.dataAbsentReason is min== 0 with must support == True element with type = ['CodeableConcept']

   - Observation.component is min== 0 with must support == True element with type = ['BackboneElement']

   - Observation.component.code is min== 1 with must support == True element with type = ['CodeableConcept']

   - Observation.component.value[x] is min== 0 with must support == True element with type = ['Quantity', 'CodeableConcept', 'string', 'boolean', 'integer', 'Range', 'Ratio', 'SampledData', 'time', 'dateTime', 'Period']

   - Observation.component.dataAbsentReason is min== 0 with must support == True element with type = ['CodeableConcept']


</div>

{% include link-list.md %}
