
### Patient Privacy and Security

US Core transactions often use patient-specific information, which could be exploited by malicious actors resulting in the exposure of patient data. For this reason, all US Core transactions must be secured appropriately with access to limited authorized individuals, data protected in transit, and appropriate audit measures taken.

Implementers **SHOULD** be aware of these [security considerations] associated with FHIR transactions, particularly those related to:

-   [Communications]
-   [Authentication]
-   [Authorization/Access Control]
-   [Audit Logging]
-   [Digital Signatures]
-   [Security Labels]
-   [Narrative]

For US Core, security conformance requirements are as follows:


- Systems **SHALL** establish a risk analysis and management regime that conforms with HIPAA security regulatory requirements. In addition, US Federal systems **SHOULD** conform with the risk management and mitigation requirements defined in NIST 800 series documents. This **SHOULD** include security category assignment following NIST 800-60 vol. 2 Appendix D.14. The coordination of risk management and the related security and privacy controls – policies, administrative practices, and technical controls – **SHOULD** be defined in the Business Associate Agreement when available.
- Systems **SHALL** reference a single time source to establish a common time base for security auditing and clinical data records among computing systems. The selected time service **SHOULD** be documented in the Business Associate Agreement when available.
- Systems **SHALL** keep audit logs of the various transactions.
-   Systems **SHALL** use TLS version 1.2 or higher for all transmissions not taking place over a secure network connection.
     (Using TLS even within a secured network environment is still encouraged to provide defense in depth.) US Federal systems **SHOULD** conform with FIPS PUB 140-2.
-   Systems **SHALL** conform to [FHIR Communications Security] requirements.
-   For Authentication and Authorization, Systems **SHALL** support [SMART App Launch] Version 2.0.0 for Client <-> Server interactions. NOTE: The SMART App Launch specifications include the required OAuth 2.0 scopes for enabling security decisions.
-   Systems **SHALL** implement consent requirements per their state, local, and institutional policies. The Business Associate Agreements **SHOULD** document systems' mutual consent requirements.
-   Systems **SHOULD** provide Provenance statements using the [US Core Provenance Profile] resource and associated requirements.
-   Systems **MAY** implement the [FHIR Digital Signatures] and provide feedback on its appropriateness for US Core transactions.
-   Systems **MAY** protect the confidentiality of data at rest via encryption and associated access controls. The policies and methods used are outside the scope of this specification.

### Clinical Safety

When implementing FHIR and US Core, implementers need to be aware of the risks and tradeoffs and are encouraged to review the [clinical safety] section in the core specification.

{% include link-list.md %}
