
The following operations and search parameters have been defined for the US Core Implementation Guide.  For more information on the [FHIR RESTful operations], [FHIR RESTful search api] and the standard [Search Param Registry] see the FHIR specification.

### Operations

  {% include list-simple-operationdefinitions.xhtml %}

<br />

### Search Parameters

*Condition**
- [us-core-asserted-date]

**Encounter**
- [us-core-discharge-disposition]

**Patient**
- [us-core-race]
- [us-core-ethnicity]
- [us-core-gender-identity]

NOTE: The following search parameters **SHALL NOT** be interpreted on their own as requirements for server:
This section lists the search parameters definitions that are used within the capability statement to define the search capabilities expectations for the US Core Server.  This is not a list of search requirements for the client or server.
{:.bg-warning}


**AllergyIntolerance**
  - [clinical-status](SearchParameter-us-core-allergyintolerance-clinical-status.html)
  - [patient](SearchParameter-us-core-allergyintolerance-patient.html)


**CarePlan**
  - [category](SearchParameter-us-core-careplan-category.html)
  - [date](SearchParameter-us-core-careplan-date.html)
  - [patient](SearchParameter-us-core-careplan-patient.html)
  - [status](SearchParameter-us-core-careplan-status.html)


**CareTeam**
  - [patient](SearchParameter-us-core-careteam-patient.html)
  - [status](SearchParameter-us-core-careteam-status.html)


**Condition**
  - [category](SearchParameter-us-core-condition-category.html)
  - [clinical-status](SearchParameter-us-core-condition-clinical-status.html)
  - [patient](SearchParameter-us-core-condition-patient.html)
  - [onset-date](SearchParameter-us-core-condition-onset-date.html)
  - [code](SearchParameter-us-core-condition-code.html)


**Device**
  - [patient](SearchParameter-us-core-device-patient.html)
  - [type](SearchParameter-us-core-device-type.html)


**DiagnosticReport**
  - [status](SearchParameter-us-core-diagnosticreport-status.html)
  - [patient](SearchParameter-us-core-diagnosticreport-patient.html)
  - [category](SearchParameter-us-core-diagnosticreport-category.html)
  - [code](SearchParameter-us-core-diagnosticreport-code.html)
  - [date](SearchParameter-us-core-diagnosticreport-date.html)


**DocumentReference**
  - [_id](SearchParameter-us-core-documentreference-id.html)
  - [status](SearchParameter-us-core-documentreference-status.html)
  - [patient](SearchParameter-us-core-documentreference-patient.html)
  - [category](SearchParameter-us-core-documentreference-category.html)
  - [type](SearchParameter-us-core-documentreference-type.html)
  - [date](SearchParameter-us-core-documentreference-date.html)
  - [period](SearchParameter-us-core-documentreference-period.html)


**Encounter**
  - [_id](SearchParameter-us-core-encounter-id.html)
  - [class](SearchParameter-us-core-encounter-class.html)
  - [date](SearchParameter-us-core-encounter-date.html)
  - [identifier](SearchParameter-us-core-encounter-identifier.html)
  - [patient](SearchParameter-us-core-encounter-patient.html)
  - [status](SearchParameter-us-core-encounter-status.html)
  - [type](SearchParameter-us-core-encounter-type.html)


**Goal**
  - [lifecycle-status](SearchParameter-us-core-goal-lifecycle-status.html)
  - [patient](SearchParameter-us-core-goal-patient.html)
  - [target-date](SearchParameter-us-core-goal-target-date.html)


**Immunization**
  - [patient](SearchParameter-us-core-immunization-patient.html)
  - [status](SearchParameter-us-core-immunization-status.html)
  - [date](SearchParameter-us-core-immunization-date.html)


**Location**
  - [name](SearchParameter-us-core-location-name.html)
  - [address](SearchParameter-us-core-location-address.html)
  - [address-city](SearchParameter-us-core-location-address-city.html)
  - [address-state](SearchParameter-us-core-location-address-state.html)
  - [address-postalcode](SearchParameter-us-core-location-address-postalcode.html)


**MedicationRequest**
  - [status](SearchParameter-us-core-medicationrequest-status.html)
  - [intent](SearchParameter-us-core-medicationrequest-intent.html)
  - [patient](SearchParameter-us-core-medicationrequest-patient.html)
  - [encounter](SearchParameter-us-core-medicationrequest-encounter.html)
  - [authoredon](SearchParameter-us-core-medicationrequest-authoredon.html)


<!--
**MedicationStatement**
  - [status](SearchParameter-us-core-medicationstatement-status.html)
  - [patient](SearchParameter-us-core-medicationstatement-patient.html)
  - [effective](SearchParameter-us-core-medicationstatement-effective.html)
-->

**Observation**
  - [status](SearchParameter-us-core-observation-status.html)
  - [category](SearchParameter-us-core-observation-category.html)
  - [code](SearchParameter-us-core-observation-code.html)
  - [date](SearchParameter-us-core-observation-date.html)
  - [patient](SearchParameter-us-core-observation-patient.html)


**Organization**
  - [name](SearchParameter-us-core-organization-name.html)
  - [address](SearchParameter-us-core-organization-address.html)


**Patient**
  - [_id](SearchParameter-us-core-patient-id.html)
  - [birthdate](SearchParameter-us-core-patient-birthdate.html)
  - [family](SearchParameter-us-core-patient-family.html)
  - [gender](SearchParameter-us-core-patient-gender.html)
  - [given](SearchParameter-us-core-patient-given.html)
  - [identifier](SearchParameter-us-core-patient-identifier.html)
  - [name](SearchParameter-us-core-patient-name.html)

**Practitioner**
  - [name](SearchParameter-us-core-practitioner-name.html)
  - [identifier](SearchParameter-us-core-practitioner-identifier.html)
  - [specialty](SearchParameter-us-core-practitionerrole-specialty.html)
  - [practitioner](SearchParameter-us-core-practitionerrole-practitioner.html)


**PractitionerRole**
  - [specialty](SearchParameter-us-core-practitionerrole-specialty.html)
  - [practitioner](SearchParameter-us-core-practitionerrole-practitioner.html)


**Procedure**
  - [status](SearchParameter-us-core-procedure-status.html)
  - [patient](SearchParameter-us-core-procedure-patient.html)
  - [date](SearchParameter-us-core-procedure-date.html)
  - [code](SearchParameter-us-core-procedure-code.html)


{% include link-list.md %}
