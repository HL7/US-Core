
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


- Systems **SHALL** establish a risk analysis and management regime that conforms with HIPAA security regulatory requirements.<sup>[§][CONF-0550],[§][CONF-0551]</sup> In addition, US Federal systems **SHOULD** conform with the risk management and mitigation requirements defined in NIST 800 series documents.<sup>[§][CONF-0552],[§][CONF-0553]</sup> This **SHOULD** include security category assignment following NIST 800-60 vol. 2 Appendix D.14.<sup>[§][CONF-0554],[§][CONF-0555]</sup> The coordination of risk management and the related security and privacy controls – policies, administrative practices, and technical controls – **SHOULD** be defined in the Business Associate Agreement when available.<sup>[§][CONF-0556],[§][CONF-0557]</sup>
- Systems **SHALL** reference a single time source to establish a common time base for security auditing and clinical data records among computing systems.<sup>[§][CONF-0558],[§][CONF-0559]</sup> The selected time service **SHOULD** be documented in the Business Associate Agreement when available.<sup>[§][CONF-0560],[§][CONF-0561]</sup>
- Systems **SHALL** keep audit logs of the various transactions.<sup>[§][CONF-0562],[§][CONF-0563]</sup>
-   Systems **SHALL** use TLS version 1.2 or higher for all transmissions not taking place over a secure network connection.<sup>[§][CONF-0564],[§][CONF-0565]</sup>
     (Using TLS even within a secured network environment is still encouraged to provide defense in depth.) US Federal systems **SHOULD** conform with FIPS PUB 140-2.<sup>[§][CONF-0566],[§][CONF-0567]</sup>
-   Systems **SHALL** conform to [FHIR Communications Security] requirements.<sup>[§][CONF-0568],[§][CONF-0569]</sup>
-   For Authentication and Authorization, Systems **SHALL** support [SMART App Launch] Version 2.0.0 <span class="bg-success" markdown="1">or later</span><!-- new-content --> for Client <-> Server interactions. NOTE: The SMART App Launch specifications include the required OAuth 2.0 scopes for enabling security decisions.<sup>[§][CONF-0570],[§][CONF-0571]</sup>
-   Systems **SHALL** implement consent requirements per their state, local, and institutional policies.<sup>[§][CONF-0572],[§][CONF-0573]</sup> The Business Associate Agreements **SHOULD** document systems' mutual consent requirements.<sup>[§][CONF-0574],[§][CONF-0575]</sup>
-   Systems **SHOULD** provide Provenance statements using the [US Core Provenance Profile] resource and associated requirements.<sup>[§][CONF-0576],[§][CONF-0577]</sup>
-   Systems **MAY** implement the [FHIR Digital Signatures] and provide feedback on its appropriateness for US Core transactions.<sup>[§][CONF-0578],[§][CONF-0579]</sup>
-   Systems **MAY** protect the confidentiality of data at rest via encryption and associated access controls. The policies and methods used are outside the scope of this specification.<sup>[§][CONF-0580],[§][CONF-0581]</sup>

### Clinical Safety

When implementing FHIR and US Core, implementers need to be aware of the risks and tradeoffs and are encouraged to review the [clinical safety] section in the core specification.

{% include link-list.md %}
