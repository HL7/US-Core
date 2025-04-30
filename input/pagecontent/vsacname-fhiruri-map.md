
<!--  liquid script for creating a markdown table from a csv file in the input/data folder source file = input/data/vsacname-fhiruri-map.csv
This table is updated with the Jupyter script : /Users/ehaas/Documents/Python/Jupyter/MyNotebooks/jq_tests/vsacname_fhiruri_mapper.ipynb


columns:
VSAC Code System Name
FHIR URI

NOTE THAT THIS TABLE SHOULD BE UPDATED PRIOR TO PUBLISHING
 -->

The following table maps the VSAC Code System Names to the FHIR Code System URIs.  It is based off the [VSAC's FHIR Server Capability Statement].  This information is also available as a [csv](tables/vsacname-fhiruri-map.csv) or [excel](tables/vsacname-fhiruri-map.xlsx) file. 

{% assign rows = site.data.vsacname-fhiruri-map %}
|VSAC Code System Name|FHIR URI|
|---|---|---|
{% for item in rows offset:1 -%}
|{{item["VSAC Code System Name"]}}|{{item["FHIR URI"]}}|
{% if forloop.last %}{:.grid}{% endif -%}
{% endfor %}

{% include link-list.md %}





