
This page is new content for US Core Version 7.0.0
{:.new-content}

~~Because of FHIR's resource-based data model, related but distinct data tend to be grouped together in the same FHIR resource type. The original SMART on FHIR scope syntax (and US regulation) tends to limit authorization servers to granting access to all data in the same FHIR resource type, or not giving access to all. For example, a patient can only share an encounter diagnosis if they share their entire problem list, or a health system can only enable backend access to a patient cohort's SDOH data if it enables access to labs.~~

~~Since version 2.0.0 of [SMART App Launch] clients and servers have more specific control over shared data within a specific resource type using [*granular scopes*](https://hl7.org/fhir/smart-app-launch/scopes-and-launch-context.html#finer-grained-resource-constraints-using-search-parameters). US core encourages user experimentation with granular scope and is seeking general feedback.  In addition, specific feedback is sought on best practices around [scope string length](https://hl7.org/fhir/smart-app-launch/scopes-and-launch-context.html#scope-size-over-the-wire) and JWT-based tokens.~~


Introductory text...


### Granular Scopes

To meet the ONC's granular scope requirement in [HTI-1 proposed rule]([+https://www.federalregister.gov/d/2023-07229/p-991+]). US Core API requires support for  *granular scopes* as defined in Version 2.0.0 of [SMART App Launch]. US Core requires scopes for:

1. specific data types defined in US Core and 
2. those of particular interest to US citizens and health systems.

#### Scopes Format
Version 2.0.0 of [SMART App Launch] introduced a scope syntax of: `<patient|user|system> / <fhir-resource>. <c | r | u | d |s> [?param=value]`

For example, to limit read and search access to a specific patient's laboratory observations but not other observations, the server grants the following scope:

`patient/Observation.rs?category=http://terminology.hl7.org/CodeSystem/observation-category|laboratory`.



The example scopes below use a single FHIR search parameter of category applied to Condition and Observation. They use a `system/` prefix, but implementers can also support `patient/` and `user/`.

* `system/Condition.rs?category=http://terminology.hl7.org/CodeSystem/condition-category|encounter-diagnosis`
* `system/Condition.rs?category=http://terminology.hl7.org/CodeSystem/condition-category|problem-list-item`
* `system/Condition.rs?category=http://hl7.org/fhir/us/core/CodeSystem/condition-category|health-concern`
* `system/Observation.rs?category=http://terminology.hl7.org/CodeSystem/observation-category|clinical-test`
* `system/Observation.rs?category=http://terminology.hl7.org/CodeSystem/observation-category|laboratory`

#### US Core Scopes

The table below summarizes the US Core scope requirements. The same information can be found in each US Core Profile page's "Quick Start" section.

<!-- This liquid script creates a US Core scope requirements table using input data from input/data/scopes.csv -->

{% assign rows = site.data.scopes %}
{% assign data_element = "" %}

{% for item in rows %}
{% if forloop.first %}

<table class="grid">
<thead>
<tr>
<th>US Core Profile</th>
<th>Resource Level Scopes</th>
<th>Granular Scopes</th>
</tr>
</thead>
<tbody>
{% endif %}

{% unless item.add_scope == "FALSE" %}
<tr>
<td><a href="{{item.page_path}}">{{item.profile_title}}</a></td>
<td><code>patient/{{ scope.resource_type }}.rs</code></td>
<td>{% if item.category_1 %}
  <code>{{item.category_1}}</code>
  {% endif %}
  {% if item.category_2 %}
  <br /><code>{{item.category_2}}</code>
  {% endif %}
  {% if item.category_3 %}
  <br /><code>{{item.category_3}}</code>
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

- The server **SHALL** support all scopes listed here; additional scopes MAY be supported (so clients should not consider this an exhaustive list).

- Servers **MAY** limit clients' scopes to those configured at registration time. Servers **SHOULD** allow users to select a subset of the requested scopes at the approval time. The app **SHOULD** inspect the returned scopes and accommodate the differences from the scopes it requested and registered.

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
 






