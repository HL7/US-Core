{% assign smart_scope = false %}
{% for scope in site.data.scopes %}
  {% if scope.page_path == page.path %}
    {%capture smart_scope %}
- Servers providing access to {{ scope.data }} data **SHOULD** use version 2.0.0 of SMART App Launch support for:
  -  [resource level scopes] (for example, `patient/{{ scope.resource_type }}.rs`){% if scope.category_1 %}
  -  [granular scopes] (for example, `patient.{{scope.resource_type }}.rs?{{ scope.category_1 }}`{% if scope.category_2 %} and `patient.{{scope.resource_type }}.rs?{{ scope.category_2 }}`{% endif %}{% if scope.category_3 %} and `patient.{{scope.resource_type }}.rs?{{ scope.category_3 }}`{% endif %}){% endif %}.
     {% endcapture %}
    {% break %}
  {% endif %}
{% endfor %}

---

**Quick Start**{:#search style="font-size: 20px;"}
<a name="quick-start"> </a>

---

Below is an overview of the required Server RESTful FHIR interactions for this profile - for example, search and read operations - when supporting the US Core interactions to access this profile's information (Profile Support + Interaction Support). Note that systems that support only US Core Profiles (Profile Only Support) are not required to support these interactions.  See the [US Core Server CapabilityStatement] for a complete list of supported RESTful interactions for this IG.

- The syntax used to describe the interactions is described [here](general-guidance.html#search-syntax).
{% if smart_scope -%}<div class="bg-success" markdown="1">{{smart_scope}}</div><!-- new-content -->{% endif %}
- See the [General Requirements] section for additional rules and expectations when a server requires status parameters.
- See the [General Guidance] section for additional guidance on searching for multiple patients.
