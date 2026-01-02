<!-- This liquid script creates context specific text for each pages quickstart using input data from input/data/scopes.csv -->
{% assign smart_scope = false %}
{% for scope in site.data.profile_metadata %}
  {% if scope.rel_url == page.name %}
    {% capture smart_scope %}

      {% assign conf_verbs = "SHALL,SHOULD,MAY" | split: "," %}
      {% for conf in conf_verbs %}
        {%- if scope.resource_scope_conf == conf or scope.cat1_scope_conf == conf or scope.cat12_scope_conf == conf or scope.cat2_scope_conf == conf or scope.cat4_scope_conf == conf or scope.cat5_scope_conf == conf or scope_cat6_conf == conf %}
Servers providing access to {{ scope.data_element }} data **{{conf}}** support these [US Core SMART Scopes]:
          {%- if scope.resource_scope_conf == conf %}
  -  [resource level scopes]\: `<patient|user|system>/{{ scope.resource_type }}.rs`
          {% endif -%}
          {% for i in (1..6) %}{% assign category =  'cat' | append: i |append: '_scope' %}{% assign category_conformance =  category |append: '_conf' -%}
            {%- if scope[category] and scope[category_conformance] == conf %}
  -  [granular scopes]\: `<patient|user|system>/{{ scope.resource_type }}.rs?category={{ scope[category] }}`
            {% endif -%}
          {% endfor -%}
        {% endif -%}
      {% endfor -%}
     {% endcapture %}
    {% break %}
  {% endif %}
{% endfor %}

<!--  ======================== end liquid ================================ -->

---

**Quick Start**{:#search style="font-size: 20px;"}
<a name="quick-start"> </a>

---

Below is an overview of the required Server RESTful FHIR interactions for this profile - for example, search and read operations - when supporting the US Core interactions to access this profile's information (Profile Support + Interaction Support). Note that systems that support only US Core Profiles (Profile Only Support) are not required to support these interactions.  See the [US Core Server CapabilityStatement] for a complete list of supported RESTful interactions for this IG.

{% if smart_scope -%}- See the [Scopes Format](scopes.html#scopes-format) section for a description of the SMART scopes syntax.{% endif %}
- See the [Search Syntax](general-guidance.html#search-syntax) section for a description of the US Core search syntax.
- See the [General Requirements] section for additional rules and expectations when a Server requires status parameters.
- See the [General Guidance] section for additional guidance on searching for multiple patients.

{% if smart_scope -%}
#### US Core Scopes
{{smart_scope}}
{% endif %}




