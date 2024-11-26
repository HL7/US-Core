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
{% if item.Target_Resource_1 %}
  {% if item.Target_Resource_1_is_MS == "TRUE" %}{% assign targets = "<strong>Practitioner**</strong>," %}
  {% else %}{% assign targets = "Practitioner," %}{% endif %}
{% endif %}
{% if item.Target_Resource_2 %}
  {% if item.Target_Resource_2_is_MS == "TRUE" %}{% assign targets = targets | append: "<strong>Organization**</strong>," %}
  {% else %}{% assign targets = targets | append: "Organization," %}{% endif %}
{% endif %}
{% if item.Target_Resource_3 %}
  {% if item.Target_Resource_3_is_MS == "TRUE" %}{% assign targets = targets | append: "<strong>PractitionerRole**</strong>," %}
  {% else %}{% assign targets = targets | append: "PractitionerRole," %}{% endif %}
{% endif %}
{% if item.Target_Resource_4 %}
{% if item.Target_Resource_4_is_MS == "TRUE" %}{% assign targets = targets | append: "<strong>Patient**</strong>," %}
  {% else %}{% assign targets = targets | append: "Patient," %}{% endif %}
{% endif %}
{% if item.Target_Resource_5 %}
  {% assign targets = targets | append: "RelatedPerson," %}
{% endif %}
{% if item.Target_Resource_6 %}
  {% assign targets = targets | append: "CareTeam," %}
{% endif %}
{% if item.Target_Resource_7 %}
  {% assign targets = targets | append: "Device," %}
{% endif %}
{% if item.Target_Resource_7 %}
  {% assign targets = targets | append: "DeviceMetric," %}
{% endif %}

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
