 {% comment %}
  ========================================================================
  This liquid script generates context specific search parameter narratives for each profiles base on the page context and type:

invoke with:
{% include quickstart-search.md type=type fixed_categories='{system|}[code]' code_codes='{system|}[code]'
%} note that the parent include tags are not accessible and have to be included specifically
the include parameters:
 - type (required)  = profile resource type
 - title (required) = profile name
 - fixed_category (optional) = a fixed category code for supplied examples  and implementation notes - these are profile dependent for resources with multiple profiles like Condition or Observation.
 - code1, code2, code3 (optional) = codes for supplied examples - these are profile dependent for resources with multiple profiles like Condition or Observation.
- single_example(optional) = flag for using only a single example. default is false, used for resources with multiple profiles like Condition or Observation, where not all examples provided are appropriate.

The source data is at input/data/search_requirements.csv where manual edits to the table contents are made
when new searchparameters are added, deprecated, etc.

search_requirements.csv columns:

- Index: row id
- base: The resource type this search parameter applies to. For search combinations this field is empty.
- code: name for parameter in search url. For search combinations this is a list of comma separated names
- base_conf: Conformance verb  = "SHALL"|"SHOULD"|"MAY" indicating what the level of support for Server RESTful FHIR interactions for the resource type when supporting the US Core interactions
- type_documentation: Additional requirements for the parameter type. For search combinations this field is empty.
- exists: Flag to indicate if the search parameter is derived from a base FHIR searchparameter. For search combinations this field is empty.
- is_new: Flag for new or updated content for the current version. Default is "FALSE" or empty and set to "TRUE for new or updated content for the current version. It is used for QA review and published ballot versions of the guide. It set to "FALSE" before publishing new versions of the guide.
- type: The type of value that a search parameter may contain, and how the content is interpreted. see https://hl7.org/fhir/searchparameter-definitions.html#SearchParameter.type  For search combinations this is a list of comma separated types.
- expression: A FHIRPath expression that returns a set of elements for the search parameter. For search combinations this field is empty. (currently not used)
- multipleOr: not used
- multipleOr_conf: Conformance verb  = "SHALL"|"SHOULD"|"MAY" indicating what the level of support for multiple values are allowed for each time the parameter exists. Values are separated by commas, and the parameter matches if any of the values match. For search combinations this field is empty.
- multipleAnd: not used
- multipleAnd_conf:Conformance verb  = "SHALL"|"SHOULD"|"MAY" indicating what the level of support for multiple parameters are allowed - e.g. more than one parameter with the same name. The search matches if all the parameters match. For search combinations this field is empty.
- shall_modifier: A comma separated list of modifiers that "SHALL" be supported for the search parameter. For search combinations this field is empty.
- should_modifier:  A comma separated list of modifiers that "SHOULD" be supported for the search parameter. For search combinations this field is empty.
- shall_comparator: A comma separated list of comparators that "SHALL" be supported for the search parameter. For search combinations this field is empty.
- should_comparator: A comma separated list of comparators that "SHOULD" be supported for the search parameter. For search combinations this field is empty.
- shall_chain: A comma separated list of the names of search parameters which may be chained to the containing search parameter that "SHALL" be supported for the search parameter. For search combinations this field is empty.
- should_chain: A comma separated list of the names of search parameters which may be chained to the containing search parameter that "SHOULD" be supported for the search parameter. For search combinations this field is empty.
- shall_include: A comma separated list of _include parameters that "SHALL" be supported for the search parameter. For search combinations this field is empty.
- should_include: A comma separated list of _include parameters that "SHOULD" be supported for the search parameter. For search combinations this field is empty.
- description: Human readable description of the search conformance
- example: Manually curated example search URLs.  For category variable use "!CATEGORY", for  code variables use "!CODE1", "!CODE2", "!CODE3".
- imp_note: Human readable implementer notes that describe the interaction and other details about the search.
- rel_url: Relative path to the SearchParameter Narrative content in the IG.

This script filters out the searchparameters for the Profile's resource type using the page context and uses the  'search-requirement-handler.md' to generate the narrative text.


establishes the page context and gets type
page.path = {{page.path}}
type = {{ include.type }}
title = {{ include.title }}
then run through the csv file for all the data


TODO: add highlighting for new and updated content
=============================================================================
{% endcomment %}

---



{% assign resource_type = include.type -%}
{% assign profile_name = include.title -%}
{% assign fixed_category = include.category -%}
{% assign code1 = include.code1 -%}
{% assign code2 = include.code2 -%}
{% assign code3 = include.code3 -%}
{% assign single_example = include.single_example %}  {% comment %} defaults to false {% endcomment -%}
{% assign shall_searches = site.data.search_requirements | where: "base", resource_type | where: "base_conf", "SHALL" -%}
{% if shall_searches.size > 0 %}
#### Mandatory Search Parameters:

The following search parameters and search parameter combinations **SHALL** be supported:

{% for search in shall_searches %}
{% include search-requirement-handler.md conf_verb="SHALL" search=search %}


{% endfor -%}
{% endif %}


{% assign should_searches = site.data.search_requirements | where: "base", resource_type | where: "base_conf", "SHOULD" -%}
{% if should_searches.size > 0 %}
#### Optional Search Parameters:

The following search parameters and search parameter combinations **SHOULD** be supported
{% for search in should_searches %}
{% include search-requirement-handler.md conf_verb="SHOULD" search=search %}


{% endfor -%}
{% endif %}
