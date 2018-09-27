---
title: General Security Considerations
layout: default
active: security
---

US Core transactions often make use of patient-specific information which could be exploited by malicious actors resulting in exposure of patient data. For this reason, all US Core transactions must be secured appropriately with access to limited authorized individuals, data protected in transit, and appropriate audit measures taken.

Implementers should be aware of the [security considerations] associated with FHIR transactions, particularly those related to:

-   [Communications]
-   [Authentication]
-   [Authorization/Access Control]
-   [Audit Logging]
-   [Digital Signatures]
-   [Security Labels]
-   [Narrative]

For the purposes of US Core, security conformance requirements are as follows:


- Systems SHALL establish a risk analysis and management regime that conforms with HIPAA security regulatory requirements. In addition US Federal systems SHOULD conform with the risk management and mitigation requirements defined in NIST 800 series documents. This SHOULD include security category assignment in accordance with NIST 800-60 vol. 2 Appendix D.14. The coordination of risk management and the related security and privacy controls – policies, administrative practices, and technical controls – SHALL be defined in the Business Associate Agreements.
- Systems SHALL reference a single time source to establish a common time base for security auditing, as well as clinical data records, among computing systems. The selected time service SHOULD be documented in the Business Associate Agreements.

- Systems SHALL use the [AuditEvent] resource to capture audit logs of the various transactions. Systems SHOULD capture as many AuditEvent resource data elements as appropriate based on requirements of FHIR [Audit Logging] and local policies.
-   Systems SHALL use TLS version 1.2 or higher for all transmissions not taking place over a secure network connection.
    (Using TLS even within a secured network environment is still encouraged to provide defense in depth.) US Federal systems SHOULD conform with FIPS PUB 140-2.
-   Systems SHALL conform to [FHIR Communications] requirements.
-   For Authentication and Authorization, Systems SHALL use the [Smart on FHIR OAuth 2.0 profiles](http://docs.smarthealthit.org/authorization/). NOTE: The Smart On FHIR specifications include the required OAuth2 scopes for enabling security decisions.
-   Systems SHOULD implement requirements from [FHIR Security Labels] to provide information on the type and sensitivity of data.
-   Systems SHALL implement consent requirements per their state, local, and institutional policies. The Business Associate Agreements SHOULD document systems mutual consent requirements. US Core actors SHALL ensure that any necessary consent records such DAF actors SHALL ensure that any necessary FHIR Consent records exist DAF actors SHALL ensure that FHIR [Consent] or other consent records exist and are reviewed prior to each exchange of patient-identifiable healthcare information. This verification should be logged in the same manner as other transactions, as discussed above under [General Security Considerations].
-   Systems SHOULD makes the right Provenance statements using the [FHIR Provenance] resource and associated requirements.
-   Systems MAY implement the [FHIR Digital Signatures] and provide feedback on it’s appropriateness for US Core transactions.
-   Systems MAY protect the confidentiality of data at rest via encryption and associated access controls. The policies and methods used are outside the scope of this specification.


  [FHIR Communications]: {{site.data.fhir.path}}security.html#http
  [Smart On FHIR]: http://fhir-docs.smarthealthit.org/argonaut-dev/authorization/backend-services/
  [FHIR Security Labels]: {{site.data.fhir.path}}security-labels.html
  [FHIR Provenance]: {{site.data.fhir.path}}provenance.html
  [FHIR Digital Signatures]: {{site.data.fhir.path}}security.html#digital%20signatures

  [security considerations]: {{site.data.fhir.path}}security.html
  [Communications]: {{site.data.fhir.path}}security.html#http
  [Authentication]: {{site.data.fhir.path}}security.html#authentication
  [Authorization/Access Control]: {{site.data.fhir.path}}security.html#authorization/access%20control
  [Audit Logging]: {{site.data.fhir.path}}security.html#audit%20logging
  [Digital Signatures]: {{site.data.fhir.path}}security.html#digital%20signatures
  [Security Labels]: {{site.data.fhir.path}}security-labels.html
  [Narrative]: {{site.data.fhir.path}}security.html#narrative
  [AuditEvent]: {{site.data.fhir.path}}auditevent.html
  [Audit Logging]: {{site.data.fhir.path}}security.html#audit
  [Consent]: {{site.data.fhir.path}}consent.html
