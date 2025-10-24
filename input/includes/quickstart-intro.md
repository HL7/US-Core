<!-- This liquid script creates context specific text for each pages quickstart using input data from input/data/scopes.csv -->
{% assign smart_scope = false %}
{% for scope in site.data.scopes %}
  {% if scope.page_name == page.name %}
    {% capture smart_scope %}

      {% assign scope_string = scope | inspect %}
      {% assign conf_verbs = "SHALL,SHOULD,MAY" | split: "," %}
      {% for conf in conf_verbs %}
        {%- if scope_string contains conf %}
Servers providing access to {{ scope.data_element }} data **{{conf}}** support these [US Core SMART Scopes]:
          {%- if scope.resource_conformance == conf %}
  -  [resource level scopes]\: `<patient|user|system>/{{ scope.resource_type }}.rs`
          {% endif -%}
          {% for i in (1..6) %}{% assign category =  'category_' | append: i %}{% assign category_conformance =  'category_' | append: i |append: '_conformance' -%}
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




