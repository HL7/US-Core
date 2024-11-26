### Operations

The following operation has been defined for the US Core Implementation Guide. For more information on [FHIR RESTful operations], see the FHIR specification.

  {% include list-simple-operationdefinitions.xhtml %}

<br />

### Search Parameters
<div class="bg-success" markdown="1">

The following search parameters have been defined for the US Core Implementation Guide. The FHIR specification provides more information on the [FHIR RESTful search API] and the standard [Search Parameter Registry].

**SEE IMPLEMENTER NOTES BELOW**

</div><!-- new-content -->

#### Optional Search Parameters
<div class="bg-success" markdown="1">

The following search parameters have been defined as optional search parameters for search.  US Core does not define any Server or Client expectations for their use.
</div><!-- new-content -->

- [race]
- [ethnicity]
- [gender-identity]

#### Search Parameters defined by this Implementation Guide
<div class="bg-success" markdown="1">

The following search parameters have been defined by US Core. They are defined to be used for search and to document Server and Client expectations. Unlike the search parameter in the next section, they are not derived from the standard FHIR SearchParameters.
</div><!-- new-content -->

##### CareTeam
- [role]

##### Condition
- [asserted-date]

##### Encounter
- [discharge-disposition]

##### Goal
- [description]

##### Patient

#### Search Parameters derived from the Base FHIR Specification
<div class="bg-success" markdown="1">

These SearchParameter are used solely to document Server and Client expectations. Their definitions are derived from the standard FHIR SearchParameter and define additional expectations for the following SearchParameter elements:

- `multipleAnd`
- `multipleOr`
- `comparator`
- `modifier`
- `chain`

They **SHALL NOT** be interpreted as search parameters for search. Servers and Clients **SHOULD** use the standard FHIR SearchParameters.

</div><!-- new-content -->
{% include uscore_sp_list.md %}

{% include link-list.md %}
