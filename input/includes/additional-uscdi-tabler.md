
<!--  liquid script for creating a markdown table from a csv file in the input/data folder source file = input/data/additional-uscdi-requirements.csv. columns:
 'IsNew' - new element for highlighting
'AddlUSCDI:  USCDI DE
'Profile': Profile name using markdown link brackets
'FHIRElement': FHIR element that is add'l USCDI
 -->

{% assign rows = site.data.additional-uscdi-requirements %}
{% for item in rows -%}
{% if item.Is_New != "!" -%}
{% if forloop.first -%}
| Additional USCDI Requirements | Profile | FHIR Element |
|---|---|---|
{% else -%}
{% if item.Is_New == "True" %}|<span class="bg-success" markdown="1">{{item.Addl_USCDI}}</span><!-- new-content -->|<span class="bg-success" markdown="1">[{{item.Profile}}]</span><!-- new-content -->|<span class="bg-success" markdown="1">`{{item.FHIR_Element}}`</span><!-- new-content -->|{% else %}|{{item.Addl_USCDI}}|{{item.Profile}}|`{{item.FHIR_Element}}`|{% endif %}
{% endif -%}
{% endif -%}
{% if forloop.last %}{:.grid}{% endif -%}
{% endfor %}





