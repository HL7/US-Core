**Organization**

#### Summary of the Mandatory Requirements
1. One or more  Identifiers  in `Organization.identifier`
   - which must have an  uri value  in `Organization.identifier.system`
1.  A  boolean  in `Organization.active`
1.  A  string  in `Organization.name`
1. One or more  ContactPoints  in `Organization.telecom`
 with the following constraints: *The telecom of an organization can never be of use &#39;home&#39;*
1. One or more  Addresses  in `Organization.address`
 with the following constraints: *An address of an organization can never be of use &#39;home&#39;*
   - which should up to 4  string values  in `Organization.address.line`
   - which should have a  string value  in `Organization.address.city`
   - which should have a  string value  in `Organization.address.state`
with an [extensible](http://hl7.org/fhir/R4/terminologies.html#extensible)
 binding to [USPS Two Letter Alphabetic Codes](ValueSet-us-core-usps-state.html)
   - which should have a  string value  in `Organization.address.postalCode`

#### Summary of the Must Support Requirements
1. One or more Endpoint References  in `Organization.endpoint`

#### Summary of Constraints
1. The organization SHALL at least have a name or an identifier, and possibly more than one
1. The telecom of an organization can never be of use &#39;home&#39;
1. An address of an organization can never be of use &#39;home&#39;
