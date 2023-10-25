
This page is new content for US Core Version 7.0.0
{:.new-content}

To meet the ONC's granular scope requirement in [HTI-1 proposed rule], the US Core API requires support for both [resource level scopes] and [granular scopes] as defined in Version 2.0.0 of [SMART App Launch]. US Core requires scopes for:

1. specific data types defined in US Core and 
2. those of particular interest to US citizens and health systems.

#### Scopes Format
Version 2.0.0 of [SMART App Launch] introduced a scope syntax of: `<patient|user|system> / <fhir-resource>. <c | r | u | d |s> [?param=value]`

For example, to limit read and search access to a specific patient's laboratory observations but not other observations, the server grants the following scope:

`patient/Observation.rs?category=http://terminology.hl7.org/CodeSystem/observation-category|laboratory`.



The example scopes below use a single FHIR search parameter of category applied to Condition and Observation. They use a `patient/` prefix, but implementers can also support `system/` and `user/`.

* `patient/Condition.rs?category=http://terminology.hl7.org/CodeSystem/condition-category|encounter-diagnosis`
* `patient/Condition.rs?category=http://terminology.hl7.org/CodeSystem/condition-category|problem-list-item`
* `patient/Condition.rs?category=http://hl7.org/fhir/us/core/CodeSystem/condition-category|health-concern`
* `patient/Observation.rs?category=http://terminology.hl7.org/CodeSystem/observation-category|clinical-test`
* `patient/Observation.rs?category=http://terminology.hl7.org/CodeSystem/observation-category|laboratory`

#### US Core Scopes

The table below summarizes the US Core scope requirements. The same information can be found in each US Core Profile page's "Quick Start" section.

<!-- This liquid script creates a US Core scope requirements table using input data from input/data/scopes.csv -->

{% assign scopes = site.data.scopes %}
{% assign data_element = "" %}

{% for scope in scopes %}
{% if forloop.first %}

<table class="grid">
<thead>
<tr>
<th>US Core Profile</th>
<th>Scopes</th>
</tr>
</thead>
<tbody>
{% endif %}

{% unless scope.add_scope == "FALSE" %}
<tr>
<td><a href="{{scope.page_path}}">{{scope.profile_title}}</a></td>
<td>
resource level scope: <code>patient/{{ scope.resource_type }}.rs</code>
{% if scope.category_1 %}
  <br />granular scope: <code>patient.{{ scope.resource_type }}.rs?category={{scope.category_1}}</code>
  {% endif %}
  {% if scope.category_2 %}
  <br />granular scope: <code>patient.{{ scope.resource_type }}.rs?category={{scope.category_2}}</code>
  {% endif %}
  {% if scope.category_3 %}
  <br />granular scope: <code>patient.{{ scope.resource_type }}.rs?category={{scope.category_3}}</code>
  {% endif %}
</td>
</tr>
{% endunless %}

{% if forloop.last %}
</tbody>
</table>
{% endif %}

{% endfor %}

 

#### US Core Server Obligations

The scopes are formally defined in a server hosts a [smart-configuration file](http://www.hl7.org/fhir/smart-app-launch/conformance.html#using-well-known) at `[url]/.well-known/smart-configuration` that is available to both authenticated and unauthenticated clients. 

- The server **SHALL** support all scopes listed in the table above for the US Core Profiles they support; additional scopes **MAY** be supported (so clients should not consider this an exhaustive list). 

- Servers **MAY** limit clients' scopes to those configured at registration time. Servers **SHALL** allow users to select a subset of the requested scopes at the approval time. The app **SHOULD** inspect the returned scopes and accommodate the differences from the scopes it requested and registered.

Example .well-known/smart-configuration file ...with all the US Core scopes...


~~~http
HTTP/1.1 200 OK
Content-Type: application/json
~~~

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
   /// <<<<<<<<<ADD All US Core Scopes HERE?>>>>>>>>
  "scopes_supported": ["openid", "profile", "launch", "launch/patient", "patient/*.rs", "user/*.rs", "offline_access"],
   /// <<<<<<<<<>>>>>>>>
  "response_types_supported": ["code"],
  "management_endpoint": "https://ehr.example.com/user/manage",
  "introspection_endpoint": "https://ehr.example.com/user/introspect",
  "revocation_endpoint": "https://ehr.example.com/user/revoke",
  "code_challenge_methods_supported": ["S256"],
  "capabilities": [
    "launch-ehr",
    "permission-patient",
    "permission-v2",
    "client-public",
    "client-confidential-symmetric",
    "context-ehr-patient",
    "sso-openid-connect"
  ]
}
~~~
 

{% include link-list.md %}




