**PractitionerRole**

#### Summary of the Mandatory Requirements
1.  A Practitioner Reference  in `PractitionerRole.practitioner`
1.  A Organization Reference  in `PractitionerRole.organization`
1.  A  CodeableConcept  in `PractitionerRole.code`
with an [extensible](http://hl7.org/fhir/R4/terminologies.html#extensible)
 binding to [US Core Provider Role (NUCC)](http://hl7.org/fhir/us/core/ValueSet/us-core-provider-role)
1.  A  CodeableConcept  in `PractitionerRole.specialty`
with an [extensible](http://hl7.org/fhir/R4/terminologies.html#extensible)
 binding to [US Core Provider Speciality (NUCC)](http://hl7.org/fhir/us/core/ValueSet/us-core-provider-specialty)

#### Summary of the Must Support Requirements
1. One or more Location References  in `PractitionerRole.location`
1. One or more  ContactPoints  in `PractitionerRole.telecom`
   - which must have a  code value  in `PractitionerRole.telecom.system`
with a [required](http://hl7.org/fhir/R4/terminologies.html#required)
 binding to [ContactPointSystem](http://hl7.org/fhir/ValueSet/contact-point-system|4.0.0)
   - which must have a  string value  in `PractitionerRole.telecom.value`
1. One or more Endpoint References  in `PractitionerRole.endpoint`

#### Summary of Constraints
1. SHALL have contact information or a reference to an Endpoint