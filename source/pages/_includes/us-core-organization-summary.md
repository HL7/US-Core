**Organization**

#### Summary of the Mandatory Requirements
1.  A  boolean  in `Organization.active`
1.  A  string  in `Organization.name`

#### Summary of the Must Support Requirements
1. {: .note-to-balloters}One or more  Identifiers  in `Organization.identifier`
1. {: .note-to-balloters}A  Identifier  in `Organization.identifier`
   - which should have a fixed `Organization.identifier.system` = `http://example.org/fhir/sid/us-npi`
   - which should have a  string value  in `Organization.identifier.value`
1.  A  Identifier  in `Organization.identifier`
   - which should have a fixed `Organization.identifier.system` = `urn:oid:2.16.840.1.113883.4.7`
   - which should have a  string value  in `Organization.identifier.value`
1. {: .note-to-balloters}One or more  ContactPoints  in `Organization.telecom`
 with the following constraints: *The telecom of an organization can never be of use &#39;home&#39;*
1. {: .note-to-balloters}One or more  Addresses  in `Organization.address`
 with the following constraints: *An address of an organization can never be of use &#39;home&#39;*
   - which should have one or more  string values  in `Organization.address.line`
   - which should have a  string value  in `Organization.address.city`
   - which should have a  string value  in `Organization.address.state`
with an [extensible](http://hl7.org/fhir/R4/terminologies.html#extensible)
 binding to [USPS Two Letter Alphabetic Codes](ValueSet-us-core-usps-state.html)
   - which should have a  string value  in `Organization.address.postalCode`
   - which should have a  string value  in `Organization.address.country`
1. One or more Endpoint References  in `Organization.endpoint`

#### Summary of Constraints
1. The organization SHALL at least have a name or an identifier, and possibly more than one
1. The telecom of an organization can never be of use &#39;home&#39;
1. An address of an organization can never be of use &#39;home&#39;
