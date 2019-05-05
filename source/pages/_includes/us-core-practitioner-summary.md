**Practitioner**

#### Summary of the Mandatory Requirements
1. One or more  Identifiers  in `Practitioner.identifier`
      - which must have an  uri value  in `Practitioner.identifier.system`
      - which must have a  string value  in `Practitioner.identifier.value`
1. One or more  HumanNames  in `Practitioner.name`
      - which must have a  string value  in `Practitioner.name.family`

#### Summary of the Must Support Requirements
1.  A  Identifier  in `Practitioner.identifier`
   - which must have a fixed `Practitioner.identifier.system` = `http://hl7.org/fhir/sid/us-npi`