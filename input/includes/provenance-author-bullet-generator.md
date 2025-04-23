
<!-- This liquid script creates context specific text for each pages author and author role implementer guidance using input data from input/data/provenance-elements.csv with the following columns:
- Row
- Is_New: boolean to support highlighting new content
- Is_Source : boolean flag if is provenance source element
- Observation_grouping: tag for grouping profiles together like ADI or vitals
- polled_vendors: boolean flag if vendors surveyed on their use of the provenance source element for this profile
- US_Core_Profile: title of US Core Profile (secondary sort parameter)
- URL: Canonical URL of US Core Profile
- Path: relative path of US Core Profile
- Type: resource type of US Core Profile (primary sort parameter)
- FiveWs_author: provenance source element choice based on FiveWs mapping (one per row)
- FiveWs_source: provenance source element choice based on FiveWs mapping (one per row)
- FiveWs_actor: provenance source element choice based on FiveWs mapping (one per row)
- is_MS: boolean flag if provenance source element is US Core Must Support
- vendor_support_element: boolean flag if vendors surveyed on their use of the provenance source element
- Target_Resource_1: provenance source element target resource (can be up to 7)
- Target_Resource_1_is_MS: boolean flag if provenance source element target resource is US Core Must Support
- vendor_support_Target_Resource_1: boolean flag if vendors surveyed on their use of the provenance source element target resource
- Target_Resource_2: provenance source element target resource (can be up to 7)
- Target_Resource_2_is_MS: boolean flag if provenance source element target resource is US Core Must Support
- vendor_support_Target_Resource_2: boolean flag if vendors surveyed on their use of the provenance source element target resource
- Target_Resource_3: provenance source element target resource (can be up to 7)
- vendor_support_Target_Resource_3: boolean flag if vendors surveyed on their use of the provenance source element target resource
- Target_Resource_4: provenance source element target resource (can be up to 7)
- vendor_support_Target_Resource_4: boolean flag if vendors surveyed on their use of the provenance source element target resource
- Target_Resource_5: provenance source element target resource (can be up to 7)
- vendor_support_Target_Resource_5: boolean flag if vendors surveyed on their use of the provenance source element target resource
- Target_Resource_6: provenance source element target resource (can be up to 7)
- vendor_support_Target_Resource_6: boolean flag if vendors surveyed on their use of the provenance source element target resource
- Target_Resource_7: provenance source element target resource (can be up to 7)
- vendor_support_Target_Resource_7: boolean flag if vendors surveyed on their use of the provenance source element target resource
- Comments
-  no include parameters:  -->
{% assign rows = site.data.provenance-elements -%}
{% assign author = '' -%}
{% for item in rows -%}
  {% if item.Is_Source == "TRUE" -%}
  {% if item.Path == page.path -%}
   {% assign author = author | append: item.FiveWs_author | append: item.FiveWs_source | append: item.FiveWs_actor -%}
   {% assign author = author | append: "," -%}
    {% endif -%}
    {% endif -%}
{% endfor -%}
{% assign author_list = author | split: "," -%}
{% assign author_count = author_list | size -%}
{% for item in site.data.provenance-elements -%}
  {% if item.Is_Source == "TRUE" -%}
  {% if item.Path == page.path -%}
- {% if item.Is_New %}<span class="bg-success" markdown="1">{% endif %}{% if author_count == 1 %}*The profile element `{{ author_list | join: " and " }}` communicates the [individual level provenance] author data corresponding to the U.S. Core Data for Interoperability (USCDI) Provenance Author Data Elements.{% else %}*The profile elements `{{ author_list | join: " and " }}` communicate the [individual level provenance] author data corresponding to the U.S. Core Data for Interoperability (USCDI) Provenance Author Data Elements.{% endif %}{% if item.Is_New %}</span><!-- new-content -->{% endif %}
       {% break -%}
    {% endif -%}
    {% endif -%}
{% endfor %}
