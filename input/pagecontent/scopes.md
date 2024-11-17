
This page is updated content for version 7.0.0


 SMART App Launch Implementation Guide Release 2.0.0 describes a set of foundational patterns based on OAuth 2.0 for client applications to authorize, authenticate, and integrate with FHIR-based data systems. This page documents the SMART on FHIR obligations and capabilities for US Core Servers supporting User-Facing Applications and Backend Services. 

### *Capability Sets* for US Core Servers Supporting User-Facing Applications and Backend Services
{: #capability-sets}

To promote interoperability, SMART on FHIR defines a set of core capabilities. An individual SMART server will publish a granular list of its capabilities, and a set of these capabilities is combined to support a specific use, a *Capability Set*. See SMART App Launch's [FHIR OAuth authorization Endpoints and Capabilities] for more details. Servers **MAY** support the other SMART on FHIR *Capability Sets* and capabilities than those listed below.

#### *Capabilities* for Implementations Supporting User-Facing Applications

At least one of the following SMART on FHIR *Capability Sets* **SHOULD** be supported for US Core Servers that support User-Facing Applications. For certified systems, both **SHALL** be supported:

- [Patient Access for Standalone Apps]
- [Clinician Access for EHR Launch]

#### *Capabilities* for Implementations Supporting Backend Services

Implementations supporting Backend Services -- for example, to meet US EHR certification requirements - **SHALL** include support for the `client-confidential-asymmetric` capability and `system/scopes`.

### US Core Servers SHALL Support Token Introspection

US Core Server **SHALL** support token introspection defined by the SMART App Launch Guide. For more details and additional consideration, see SMART App Launch's [Token Introspection].

### SMART Scopes

SMART's scopes, defined in Version 2.0.0 of the [SMART App Launch] implementation guide, allow access permissions to be delegated to a client application. The US Core API requires servers to support [resource level scopes] and [granular scopes], allowing access to specific data about a single patient. US Core's required scopes (**SHALL**) are based on community-based consensus that the scope meets a system requirement, clinical need, or federal regulation. Similarly, US Core's recommended scopes (**SHOULD**) rely on community-based consensus that the scope meets a system requirement or clinical need as a best practice. 

The US Core required scopes listed below are named in the [HTI-1 final rule], which requires support for the Condition and Observation category scopes. (Note that although mentioned in HTI-1 final rule, there is no "Clinical Test" category for Observation in US Core.) The recommended granular scope listed below is of particular interest to patients and health systems. Implementations meeting US EHR certification requirements must support all US Core's required scopes. Other systems only need to support scopes for the US Core APIs they support. 

Each US Core Profile page includes a "Quick Start" section summarizing each profile's supported search transactions and scopes. Servers **MAY** support other scopes in addition to those listed below and in the Quick Start sections. US Core clients should follow the [principle of least privilege] and access only the necessary resources. In other words, if a client needs only vital sign observations, it should request access only to Observations with a category of "vital-signs".

##### Scopes Format
 SMART App Launch Version 2.0.0 introduced a scope syntax of: `<patient|user|system> / <fhir-resource>. <c | r | u | d |s> [?param=value]`

For example, to limit read and search access to a specific patient's laboratory observations but not other observations, the server grants the following patient-specific scope:

`patient/Observation.rs?category=http://terminology.hl7.org/CodeSystem/observation-category|laboratory`.

This example uses a `patient/` prefix, but implementers may support `system/` and `user/`.

#### US Core Scopes

The table below summarizes the US Core scope requirements (**SHALL**) and best practice recommendations (**SHOULD**) for resource-level and granular scopes. This information can be found for each US Core Profile in the profile page's "Quick Start" section.

 For "User-Facing Applications", a system's support for patient-level (`patient`) or user-level (`user`) scopes depends on its published list of SMART on FHIR capabilities (see the [capability sets](#capability-sets) above).  For example, if a server lists `permission-patient` and `permission-user` in its capabilities, it **SHALL** support both patient-level and user-level required scopes and **SHOULD** support both patient-level and user-level recommended best-practice scopes.

 For "Backend-Services", System-level scopes (`system`) describe data that a client system is directly authorized to access. Systems that support system-level (`system`) scopes **SHALL** support the required US Core scopes and **SHOULD** support the recommended US Core scopes.

##### The Following Resource Level Scopes **SHALL** Be Supported


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

##### The Following Resource Level Scopes **MAY** Be Supported

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

##### The Following Granular Scopes **SHALL** Be Supported

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


##### The Following Granular Scopes **SHOULD** Be Supported

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

### Servers SHALL support the following metadata in their `/.well-known/smart-configuration`

In addition to the capabilities defined in the server's CapabilityStatement, servers **SHALL** document their SMART capabilities in their [Well-Known Uniform Resource Identifiers (URIs)] JSON file.

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

- `scopes_supported`: Array of scopes a client may request.
    - <span class="bg-success" markdown="1">The server **SHALL** list all the required US Core Scopes from the table above for the US Core Profiles they support in the `scopes_supported` array; additional scopes **MAY** be supported (so clients should not consider this array an exhaustive list). 
</span><!-- new-content -->
    - Servers **MAY** limit clients' scopes to those configured at registration time. Servers **SHALL** allow users to select a subset of the requested scopes at the approval time. The app **SHOULD** inspect the returned scopes and accommodate the differences from the scopes it asked for and registered.
- `introspection_endpoint`: The URL to a server's introspection endpoint, which can be used to validate a token. 
  - Servers **SHALL** document this endpoint in the file

#### Example `.well-known/smart-configuration` File

This example `.well-known/smart-configuration` file shows all the required and recommended metadata listed in SMART App Launch for a certified system supporting User-Facing Applications and Backend Services. The server lists all the required and recommended US Core scopes for both `patient/`, `user/`, and  `system/` in the `scopes_supported` metadata array.  See the [SMART App Launch] Implementation Guide for more examples and details.

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
    "client_secret_basic",
    "private_key_jwt"
  ],
  "grant_types_supported": [
    "authorization_code",
    "client_credentials"
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
    "client-public",
    "client-confidential-symmetric",
    "client-confidential-asymmetric",
    "context-ehr-patient",
    "sso-openid-connect"
  ]
}
~~~
 
{% include link-list.md %}