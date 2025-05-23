
 The [SMART App Launch] implementation guide describes a set of foundational patterns based on OAuth 2.0 for Client applications to authorize, authenticate, and integrate with FHIR-based data systems. This page documents the SMART on FHIR obligations and capabilities for US Core Servers supporting User-Facing Applications and Backend Services. 

### *Capability Sets* for US Core Servers Supporting User-Facing Applications and Backend Services
{: #capability-sets}

To promote interoperability, SMART on FHIR defines a set of core capabilities. An individual SMART Server will publish a granular list of its capabilities, and a set of these capabilities is combined to support a specific use, a *Capability Set*. See SMART App Launch's [FHIR OAuth authorization Endpoints and Capabilities] for more details. Servers **MAY** support the other SMART on FHIR *Capability Sets* and capabilities than those listed below.

#### *Capabilities* for Implementations Supporting User-Facing Applications

At least one of the following SMART on FHIR *Capability Sets* **SHOULD** be supported for US Core Servers that support User-Facing Applications. For certified systems, both **SHALL** be supported:

- [Patient Access for Standalone Apps]
- [Clinician Access for EHR Launch]

#### *Capabilities* for Implementations Supporting Backend Services

Implementations supporting Backend Services -- for example, to meet US EHR certification requirements - **SHALL** include support for the `Client-confidential-asymmetric` capability and `system/scopes`.

### US Core Servers SHALL Support Token Introspection

US Core Server **SHALL** support token introspection defined by the SMART App Launch Guide. For more details and additional consideration, see SMART App Launch's [Token Introspection].

### SMART Scopes

SMART's scopes, defined in Version 2.0.0 and later of the SMART App Launch implementation guide, allow access permissions to be delegated to a Client application. To allow access to specific data about a single patient, the US Core API requires Servers to support [resource level scopes] and "[granular scopes]", the finer-grained scopes using search parameters.  US Core's required scopes (**SHALL**) are based on community-based consensus that the scope meets a system requirement, clinical need, or federal regulation. Similarly, US Core's recommended scopes (**SHOULD**) rely on community-based consensus that the scope meets a system requirement or clinical need as a best practice. 

The US Core required scopes listed below are named in the [HTI-1 final rule], which requires support for the Condition and Observation category scopes. (Note that although mentioned in HTI-1 final rule, there is no "Clinical Test" category for Observation in US Core.) The recommended granular scopes listed below are of particular interest to patients and health systems. Implementations meeting US EHR certification requirements must support all US Core's required scopes. Other systems only need to support scopes for the US Core APIs they support. 

Each US Core Profile page includes a "Quick Start" section summarizing each profile's supported search transactions and scopes. Servers **MAY** support other scopes in addition to those listed below and in the Quick Start sections. US Core Clients should follow the [principle of least privilege] and access only the necessary resources. In other words, if a Client needs only vital sign observations, it should request access only to Observations with a category of "vital-signs". Note that a granular scope grants access to all resources matching that granular scope *regardless of whether other categories* are present.

#### Scopes Format
 SMART App Launch Version 2.0.0 introduced a scope syntax of: `<patient|user|system> / <fhir-resource>. <c | r | u | d |s> [?param=value]`

For example, to limit read and search access to a specific patient's laboratory observations but not other observations, the Server grants the following patient-specific scope:

`patient/Observation.rs?category=http://terminology.hl7.org/CodeSystem/observation-category|laboratory`.

This example uses a `patient/` prefix, but implementers may support `system/` and `user/`.

#### US Core Scopes

The table below summarizes the US Core scope requirements (**SHALL**) and best practice recommendations (**SHOULD**) for resource-level adn granular scopes. This information can be found for each US Core Profile in the profile page's "Quick Start" section.

 For "User-Facing Applications", a system's support for patient-level (`patient`) or user-level (`user`) scopes depends on its published list of SMART on FHIR capabilities (see the [capability sets](#capability-sets) above).  For example, if a Server lists `permission-patient` and `permission-user` in its capabilities, it **SHALL** support both patient-level and user-level required scopes and **SHOULD** support both patient-level and user-level recommended best-practice scopes.

 For "Backend-Services", System-level scopes (`system`) describe data that a Client system is directly authorized to access. Systems that support system-level (`system`) scopes **SHALL** support the required US Core scopes and **SHOULD** support the recommended US Core scopes.



##### Scopes For Requesting FHIR Resources By Type

The following scopes that correspond directly to FHIR resource types **SHALL** be supported


{% include resource-scopes-table.md conformance="SHALL" crud='rs'%}

<table class="grid">
<thead>
<tr>
<th>Resource Type</th>
<th>Resource Level Scope</th>
</tr>
</thead>
<tbody>
{% for resource_scope in resource_scopes -%}
<tr>
<td>{{resource_scope}}</td>
<td><code>{{ resource_scope | prepend: '<patient|user|system>/' | append: '.rs' }}</code></td>
</tr>
{% endfor %}
</tbody>
</table>

The following scopes that correspond directly to FHIR resource types **MAY** be supported

{% include resource-scopes-table.md conformance="MAY" crud='rs' %}

<table class="grid">
<thead>
<tr>
<th>Resource Type</th>
<th>Resource Level Scope</th>
</tr>
</thead>
<tbody>
{% for resource_scope in resource_scopes -%}
<tr>
<td>{{resource_scope}}</td>
<td><code>{{ resource_scope | prepend: '<patient|user|system>/' | append: '.rs' }}</code></td>
</tr>
{% endfor %}
</tbody>
</table>



##### Granular Scopes For Requesting FHIR Resources

The following *granular* scopes **SHALL** be supported


{% include granular-scopes-table.md conformance="SHALL" crud='rs' %}

<table class="grid">
<thead>
<tr>
<th>Resource Type</th>
<th>Granular Scope</th>
</tr>
</thead>
<tbody>
{% for granular_scope in granular_scopes -%}
<tr>
<td>{{granular_scope | split: '.' | first }}</td>
<td><code>{{ granular_scope | prepend: '<patient|user|system>/' }}</code></td>
</tr>
{% endfor %}
</tbody>
</table>

The following *granular* scopes **SHOULD** be supported

{% include granular-scopes-table.md conformance="SHOULD" crud ='rs' %}

<table class="grid">
<thead>
<tr>
<th>Resource Type</th>
<th>Granular Scope</th>
</tr>
</thead>
<tbody>
{% for granular_scope in granular_scopes -%}
<tr>
<td>{{granular_scope | split: '.' | first }}</td>
<td><code>{{ granular_scope | prepend: '<patient|user|system>/' }}</code></td>
</tr>
{% endfor %}
</tbody>
</table>



###### Best Practices

End users often select all the scopes presented if given a "select all" option.  Therefore, client provisioning is key to empowering patients with scopes and avoiding unnecessary access. This page reflects best practices when implementing Granular Scopes. See also [Considerations for Scope Consent] in the SMART App Launch implementation guide.

**Best practices for server developers include**

- Use published US Core granular scopes whenever possible.
- Systems that add custom (i.e., non-US Core) granular scopes must not duplicate existing US Core scopes.
- When using granular scopes, ensure that all data supplied in the Resource has a granular scope that can be used to access it.
- Document all the scopes they provide on their published list of SMART on FHIR capabilities and offline documentation.
- Display Considerations
  - Display a summary of the requested scopes in clear, concise language that the user can understand.
  - Groupings and text displayed to patients do not need to match the Granular Scopes listed in US Core.
  - Systems may provide the user an option to see more detail on the access provided by a US Core Granular Scope (for example, a detailed view button)
- Client access requirements may evolve. Servers should allow clients to update their original provisioning request to add or subtract scopes

**Best practices for app developers include**

- Read and understand what granular scopes are available for a system as documented in its SMART on FHIR capabilities and offline documentation.
- Limit the requested scopes to the available granular scopes.
- Request the appropriate level of access for your use case and only request the necessary scopes. (For example, a pharmacy app may not need access to all observations.)


### Servers SHALL support the following metadata in their `/.well-known/smart-configuration`

In addition to the capabilities defined in the Server's CapabilityStatement, Servers **SHALL** document their SMART capabilities in their [Well-Known Uniform Resource Identifiers (URIs)] JSON file.

#### Required SMART App Launch Metadata

The SMART App Launch guide requires the following JSON file metadata:

- `issuer` (conditional)
- `jwks_uri` (conditional)
- `authorization_endpoint`
- `grant_types_supported`
- `token_endpoint`
- `capabilities`
- `code_challenge_methods_supported`

#### Additional US Core Requirements

US Core requires following additional metadata:

- `scopes_supported`: Array of scopes a Client may request.
    - The Server **SHALL** list all the required US Core Scopes for the US Core Profiles they support in the `scopes_supported` array; additional scopes **MAY** be supported (so Clients should not consider this array an exhaustive list). 

    - Servers **MAY** limit Clients' scopes to those configured at registration time. Servers **SHALL** allow users to select a subset of the requested scopes at the approval time. The app **SHOULD** inspect the returned scopes and accommodate the differences from the scopes it asked for and registered.
- `introspection_endpoint`: The URL to a Server's introspection endpoint, which can be used to validate a token. 
  - Servers **SHALL** document this endpoint in the file

#### Example `.well-known/smart-configuration` File

This example `.well-known/smart-configuration` file shows all the required and recommended metadata listed in SMART App Launch for a certified system supporting User-Facing Applications and Backend Services. The Server lists all the required and recommended US Core scopes for both `patient/`, `user/`, and  `system/` in the `scopes_supported` metadata array.  See the SMART App Launch implementation guide for more examples and details.

~~~http
HTTP/1.1 200 OK
Content-Type: application/json
~~~

{% include granular-scopes-table.md %}
{% include resource-scopes-table.md conformance="SHALL" %}

~~~json
{
  "issuer": "https://ehr.example.com",
  "jwks_uri": "https://ehr.example.com/.well-known/jwks.json",
  "authorization_endpoint": "https://ehr.example.com/auth/authorize",
  "token_endpoint": "https://ehr.example.com/auth/token",
  "token_endpoint_auth_methods_supported": [
    "Client_secret_basic",
    "private_key_jwt"
  ],
  "grant_types_supported": [
    "authorization_code",
    "Client_credentials"
  ],
  "registration_endpoint": "https://ehr.example.com/auth/register",
  "scopes_supported": [
    "openid",
    "profile",
    "launch",
    "launch/patient",
    "offline_access",
{% for resource_scope in resource_scopes -%}
    {{ resource_scope | prepend: '    "patient/'| append: '.rs' }}",
{{ resource_scope | prepend: '    "user/'| append: '.rs' }}",
{{ resource_scope | prepend: '    "system/'| append: '.rs' }}",
{% endfor -%}
{% for granular_scope in granular_scopes -%}
    {{ granular_scope | prepend: '    "patient/'}}",
{{ granular_scope | prepend: '    "user/'}}",
{{ granular_scope | prepend: '    "system/'}}"{% unless forloop.last %},{% endunless %}
{% endfor -%}
  ],
  "response_types_supported": ["code"],
  "management_endpoint": "https://ehr.example.com/user/manage",
  "introspection_endpoint": "https://ehr.example.com/user/introspect",
  "revocation_endpoint": "https://ehr.example.com/user/revoke",
  "code_challenge_methods_supported": ["S256"],
  "capabilities": [
    "launch-ehr",
    "permission-patient",
    "permission-user",
    "permission-v2",
    "Client-public",
    "Client-confidential-symmetric",
    "Client-confidential-asymmetric",
    "context-ehr-patient",
    "sso-openid-connect"
  ]
}
~~~
 
{% include link-list.md %}