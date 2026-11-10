<!-- This liquid script creates context specific text for each pages quickstart.
The source data is at input/data/profile_metadata.csv where manual edits to the table contents are made
when new profiles are added, deprecated, etc.
 -->
{% assign smart_scope = false %}
{% comment %} Resource types with more than one US Core profile, per input/data/profile_metadata.csv. {% endcomment %}
{% assign multi_profile_types = "Condition,DiagnosticReport,DocumentReference,Observation" | split: "," %}
{% for scope in site.data.profile_metadata %}
  {% if scope.rel_url == page.name %}
    {% capture smart_scope %}

      {% assign conf_verbs = "SHALL,SHOULD,MAY" | split: "," %}
      {% for conf in conf_verbs %}
        {%- if scope.resource_scope_conf == conf or scope.cat1_scope_conf == conf or scope.cat12_scope_conf == conf or scope.cat2_scope_conf == conf or scope.cat4_scope_conf == conf or scope.cat5_scope_conf == conf or scope_cat6_conf == conf %}
Servers providing access to {{ scope.data_element }} data **{{conf}}** support these [US Core SMART Scopes]:
          {%- if scope.resource_scope_conf == conf %}
  -  [resource level scopes]\: `<patient|user|system>/{{ scope.resource_type }}.rs`{% if scope.conf_req %} <sup>[§][{{ scope.conf_req }}]</sup>{% endif %}
          {% endif -%}
          {% for i in (1..6) %}{% assign category =  'cat' | append: i |append: '_scope' %}{% assign category_conformance =  category |append: '_conf' -%}{% assign category_req =  category_conformance |append: '_req' %}
            {%- if scope[category] and scope[category_conformance] == conf %}
  -  [granular scopes]\: `<patient|user|system>/{{ scope.resource_type }}.rs?category={{ scope[category] }}`{% if scope[category_req] %} <sup>[§][{{ scope[category_req] }}]</sup>{% endif %}
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

Below is an overview of the required Server RESTful FHIR interactions for this profile - for example, search and read operations - when supporting the US Core interactions to access this profile's information (Profile Support + Interaction Support). Note that systems that support only US Core Profiles (Profile Only Support) are not required to support these interactions. {% if multi_profile_types contains include.type %}<span class="bg-success" markdown="1">As described in [FHIR RESTful Search API Requirements], search requirements apply at the resource level and might involve elements that are not Must Support in this profile.</span><!-- new-content -->{% endif %}

{% if smart_scope -%}- See the [Scopes Format](scopes.html#scopes-format) section for a description of the SMART scopes syntax.{% endif %}
- See the [Search Syntax](general-guidance.html#search-syntax) section for a description of the US Core search syntax.
- See the [General Requirements] section for additional rules and expectations when a Server requires status parameters.
- See the [General Guidance] section for additional guidance on searching for multiple patients.
- See the [US Core Server CapabilityStatement] for a complete list of supported RESTful interactions for this IG.

{% if smart_scope -%}
#### US Core Scopes
{{smart_scope}}
{% endif %}





