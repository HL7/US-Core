<!-- This liquid script creates a US Core provenance requirements table using input data from input/data/provenance-elements.csv
with the following columns:
- Row
- Is_Source : boolean flag if is provenance source element
- Survey1, Survey2 : results of online vendor surveys
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
- Target_Resource_8: provenance source element target resource (can be up to 7)
- vendor_support_Target_Resource_7: boolean flag if vendors surveyed on their use of the provenance source element target resource
- Comments

TODO. add row highlighting for Is_New==True item
-  no include parameters:  -->


{% assign rows = site.data.provenance-elements %}
{% for item in rows %}
{% if forloop.first %}
<table class="grid">
<thead>
<tr>
<!-- <th>Row #</th> -->
<th>US Core Profile</th>
<!-- <th>Survey 2 Results</th> -->
<th>Data Element Corresponding to Author Provenance</th>
<th>Target Resource Types Corresponding to Author Role Provenance</th>
</tr>
</thead>
<tbody>
{% endif %}
{% if item["Is_Source"] == "TRUE" %}
  {% assign targets= '' %}
  {% for i in (1..8) %}
    {% assign key = "Target_Resource_" | append: i %}
    {% assign MS_key = "Target_Resource_" | append: i | append: "_is_MS" %}
    {% assign is_new_key = "Target_Resource_" | append: i | append: "_is_new" %}
    {% assign target = item[key] %}
    {% if target %}
      {% if item[MS_key] == "TRUE" %}{% assign target = target | prepend: "<strong>" | append: "**</strong>" %}{% endif %}
      {% if item[is_new_key] == "TRUE" %}{% assign target = target | prepend: '<span class="bg-success" markdown="1">' | append: "</span><!-- new-content -->" %}{% endif %}
      {% assign targets = targets | append: target | append: "," %}
    {% endif %}
  {% endfor %}
<tr>
<td><a href="{{item.Path}}">{{item.US_Core_Profile}}</a></td>
<td><code>{% if item.is_MS == "TRUE" %}<strong>{% endif %}{{item.FiveWs_author | append: item.FiveWs_source | append: item.FiveWs_actor}}{% if item.is_MS == "TRUE" %}*</strong>{% endif %}</code></td>
<td>{{ targets | split: "," | join: ", " }}</td>
</tr>
{% endif %}

{% if forloop.last %}
</tbody>
</table>
{% endif %}
{% endfor %}
