<!-- This liquid script creates context specific text for each pages quickstart using input data from input/data/scopes.csv -->
{% assign smart_scope = false %}
{% for scope in site.data.scopes %}
  {% if scope.page_path == page.path %}
    {%capture smart_scope %}
Servers providing access to {{ scope.data }} data **SHALL** support these [US Core SMART Scopes]:
  -  [resource level scopes]\: `patient/{{ scope.resource_type }}.rs`{% if scope.category_1 %}
  -  [granular scopes]\: `patient.{{ scope.resource_type }}.rs?category={{ scope.category_1 }}`{% if scope.category_2 %} and `patient.{{scope.resource_type }}.rs?category={{ scope.category_2 }}`{% endif %}{% if scope.category_3 %} and `patient.{{scope.resource_type }}.rs?category={{ scope.category_3 }}`{% endif %}{% endif %}.
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
- See the [General Requirements] section for additional rules and expectations when a server requires status parameters.
- See the [General Guidance] section for additional guidance on searching for multiple patients.



<div class="bg-success" markdown="1">

{% if smart_scope -%}
#### US Core Scopes
{{smart_scope}}
{% endif %}

</div><!-- new-content -->


