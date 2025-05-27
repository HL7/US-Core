
### Referencing US Core Profiles

The search expectations and US Core Profiles have been developed and tested using *logical FHIR ids*.  Therefore, a [reference] to a US Core resource **SHOULD** include a logical id (`Reference.reference`), not an identifier (`Reference.identifier`).


FHIR resource elements of the [Reference] datatype reference other FHIR resources. For all references, US Core Responders **SHOULD** return resources that conform to a US Core profile if a US Core profile exists for the resource type. In some cases, US Core profiles explicitly constrain these references to point to the relevant US Core profile because the element is typically a *Must Support* or *Additional USCDI Requirements* element. For example, `CareTeam.subject` in [US Core CareTeam Profile] references the [US Core Patient Profile]. In other cases, referencing elements point to the base FHIR resource because they are not a *Must Support* or *Additional USCDI Requirements* element and, therefore, are unconstrained by US Core. (This is an editorial decision to simplify and improve the readability of the Profile rendering in this guide.) For example, although US Core does not constrain `Condition.asserter`, its reference to Patient or Practitioner **SHOULD** be a valid [US Core Patient Profile] or [US Core Practitioner Profile].

### Operations

[FHIR RESTful operations] define a list of parameters and their definitions. If the operation parameter is a resource, it **SHOULD** conform to a US Core Profiles whenever possible.  However, Use Core Profiles are designed for the FHIR RESTful read and search API and may not fit the operation parameter scope.

### Contained Resources

When responding to a query, Servers **SHOULD** not use inline [contained] resources to represent the returned data. A contained resource can only be used when the source data exists within the context of the FHIR transaction. For example, the guidance in the [Medication List] page describes how a contained Medication in MedicationRequest is used to represent the medication. In addition, if referencing a contained resource in a US Core Profile, the contained resource **SHOULD** be a US Core Profile if a US Core Profile exists for the resource type.  Further guidance about the general use case for contained can be found in the base FHIR specification.  


###  Suppressed Data

In situations where the specific piece of data is hidden for security or privacy reasons, using a code from the [DataAbsentReason Code System] such as `masked` may exceed the data receiver's access rights to know. However, masking data **SHOULD** be handled based on implemented policies. For elements with a minimum cardinality = 0 (including elements labeled **Must Support**), the element **SHOULD** be omitted from the resource. For *Mandatory* elements (in other words, where the minimum cardinality is > 0), use the code "unknown" following the guidance on [Missing Data] in the Conformance Sections.



### SNOMED CT United States Edition

[SNOMED CT] (Systematized Nomenclature of Medicine -- Clinical Terms) is a comprehensive clinical terminology widely used in healthcare to support the electronic exchange of clinical health information. US Core uses the US Edition of SNOMED CT, a standalone release that combines the content of the US Extension and the International releases of SNOMED CT. It is used extensively in US CORE for various clinical concepts, including problems, procedures, allergies, and laboratory results. When using SNOMED codes in US Core Profiles, implementers **MAY** use the default system URI, which refers to an unspecified edition/version, as shown in option one below. However, for terminology Servers to be able to validate US Edition-only codes, implementers  **SHOULD**  provide the accompanying system URI to describe the edition as shown in option two.

#### SNOMED CT Edition and Version Options

1. Using only the system `http://snomed.info/sct` refers to an unspecified edition/version. For example:
   
    ~~~
    "code": {
            "coding": [
                {
                    "system": "http://snomed.info/sct,
                    "code": "763875007",
                    "display": "Product containing sulfonamide (product)"
                }
            ],
            "text": "sulfonamide antibacterial"
        },
    ~~~

2. Using the system  *plus* the unspecified version US Edition URI `http://snomed.info/sct/731000124108`. For example:

    ~~~
    "code": {
            "coding": [
                {
                    "system": "http://snomed.info/sct",
                    "version": "http://snomed.info/sct/731000124108",
                    "code": "763875007",
                    "display": "Product containing sulfonamide (product)"
                }
            ],
            "text": "sulfonamide antibacterial"
        },
    ~~~

  For more details, see [Using SNOMED CT with FHIR]. 



### Using CQL With US Core

[Clinical Quality Language (CQL)] is a high-level, domain-specific language focused on clinical quality and targeted at measure and decision support artifact authors.  To use CQL with FHIR,  a [model definition] for the profiles and extensions defined in US Core must be provided to the CQL implementation environment. To support implementations using Clinical Quality Language (CQL) and US-Core, these model definitions are provided as FHIR [Library] resources:

- [US Core Version 3.1.1 Model Definition]
- [US Core Version 4.0.0 Model Definition]
- [US Core Version 5.0.1 Model Definition]
- [US Core Version 6.1.0 Model Definition]
- [US Core Version 7.0.0 Model Definition]
- [US Core Version 8.0.0 Model Definition]

Note that US Core Model Definitions are also available in the [Common CQL Assets for FHIR (US-Based)] implementation guide at <https://hl7.org/fhir/us/cql/2025May/Library-USCore-ModelInfo.html>

For more information about using IG-specific model information with CQL and how these libraries were constructed, refer to the [Using CQL With FHIR] Implementation Guide.


###  Using UCUM codes in the [Quantity] datatype

Some US Core Profiles bind the `Quantity.code` element in the Quantity datatype to the [UCUM] code system. For example, in the [US Core Laboratory Result Observation Profile], `Observation.valueQuantity`, `Observation.referenceRange.low`, and `Observation.referenceRange.high` are bound to UCUM. Systems should also use UCUM for the optional `valueRange` and `valueRatio` datatypes (which are complex datatypes with Quantity elements). A FHIR [UCUM Codes ValueSet] that defines all UCUM codes is in the FHIR specification. This guidance specifies how to represent the Quantity datatype when the correct UCUM units are missing or when the units are missing, which will likely occur in the real world.  

**UCUM code provided**

```
 "valueQuantity": {
    "value": 26.0,
    "unit": "g/mL",
   "system": "http://unitsofmeasure.org",
   "code": "g/mL"
  }
```

**free text units only**:
- If UCUM units are unavailable, represent units in the `unit` element.

```
 "valueQuantity": {
    "value": 26.0,
    "unit": "RR",
     }
```

**no units**

```
 "valueQuantity": {
    "value": 26.0
 }
```



### Representing Deleted Information

A FHIR Server **SHOULD** not delete records. A FHIR Server **SHOULD** update the appropriate resource status to `entered-in-error` or `inactive` (refer to the next section). If a system supports the deletion of records, they **SHOULD** refer to the [Deletion Safety Checks] in the FHIR specification.

### Representing Entered in Error Information

Clinical information entered in error in the patient's record needs to be represented by the FHIR Server so that Clients can expose the corrected information to their end users.

**Server Recommendations:**
- A FHIR Server **SHOULD** not delete resources.
- A FHIR Server **SHOULD** update the appropriate resource status to `entered-in-error` or `inactive`.
- A FHIR Server **SHOULD** allow these resources to be searchable by Client applications.
- If the FHIR Server has updated the resource status to `entered-in-error`:
    -  For *patient facing* applications, A FHIR Server **SHOULD** remove the resource's contents, leaving only an id and status.   Note that this typically will not conform to the US Core or FHIR StructureDefinitions.
    - For *provider-facing* applications,  the content may be supplied with content and additional detail (such as the reason for the status change) that the patient viewing system would typically not have access to.



### Narrative

The [US Core CarePlan Profile] requires a narrative summary of the patient assessment and plan of treatment. However, *any* US Core Profile can include a human-readable narrative containing a summary of the resource and may be used to represent the resource's content to a human.  For further guidance, refer to the [Narrative documentation] in the FHIR Specification.

### Language Support

There is a basic need to access records in your language, and the data provider **SHOULD** do their best to translate (safely) to the requested language. Understand that this will be variably complete depending on the nature of the record. For example, translating the following elements is relatively straightforward:

- `Coding.display`
- Generated narrative
- `Attachment.title`

The following guidelines outline requesting and returning a resource in the requested language.

* Clients MAY request language/locale using the http [`Accept-Language`] header.
* Servers **SHOULD** make reasonable efforts to translate what can be safely translated.
* Servers **SHOULD** populate the Resource's `language` element with a code based on the underlying language of record, *not* the requested language.
    * Using the [Human Language] Extension when the language of a display, etc, is known to differ from the stated (or inferred) language.

      Example
      ~~~
          <?xml version="1.0" encoding="UTF-8"?>
          <Patient xmlns="http://hl7.org/fhir">
              <id value="language-example-1"/>
              <meta>
              [...snip...]
              </meta>
              <language value=" es"/>
              <!--0..1 Language of the resource content, in this case, Spanish-->
              <text>
              [...snip...]
              </text>
              <extension url="http://hl7.org/fhir/us/core/StructureDefinition/us-core-race">
                  <extension url="ombCategory">
                      <valueCoding>
                          <system value="urn:oid:2.16.840.1.113883.6.238"/>
                          <code value=" 2106-3"/>
                          <display value="White">
                              <!--Human Language extension-->
                              <extension url="http://hl7.org/fhir/StructureDefinition/language">
                                  <valueCode value=" en"/>
                                  <!--English is different from stated language-->
                              </extension>
                          </display>
                      </valueCoding>
                  </extension>
              [...snip...]
      ~~~

* Using the [Translation] Extension when the Server provides additional translations by its own choice or in response to a different `Accept-Language` than what the resource is stored in.

    Example
    ~~~
        <?xml version="1.0" encoding="UTF-8"?>
        <Patient xmlns="http://hl7.org/fhir">
            <id value="language-example-2"/>
            <meta>
            [...snip...]
            </meta>
            <language value=" en"/>
            <!--0..1 Language of the resource content: English-->
            <text>
            [...snip...]
            </text>
            <extension url="http://hl7.org/fhir/us/core/StructureDefinition/us-core-race">
                <extension url="ombCategory">
                    <valueCoding>
                        <system value="urn:oid:2.16.840.1.113883.6.238"/>
                        <code value=" 2106-3"/>
                        <display value="White">
                        <!-- Translation -->
                        <extension
                             url="http://hl7.org/fhir/StructureDefinition/translation" >
                         <extension url="lang"> <!-- 1..1 Code for Language -->
                          <valueCode value="es"/><!-- 0..1 Value of extension -->
                         </extension>
                         <extension url="content"> <!-- 1..1 Content in other Language -->
                          <valueString value="Blanca">
                         </extension>
                        </extension>
                        </display>
                    </valueCoding>
                </extension>
                [...snip...]
    ~~~

* Servers **SHOULD** make it known what languages are supported in their CapabilityStatement(s) using this extension[^1]:

    `http://hl7.org/fhir/5.0/StructureDefinition/extension-CapablilityStatement.acceptLanguage`

For further guidance on language and locale for the generation of the resource narrative, see [Multi-Language support in FHIR (Localization/Internationalization)] in the core specification.

### Read (Fetch) Syntax

Fetching resource interactions are defined by the [FHIR RESTful API]. Guidance is included on the US core Profile pages for conformance and informative purposes:

 **`GET [base]/[Resource-type]/[id] {parameters}`**

-   GET is the HTTP verb used for fetching a resource
-   Content surrounded by \[\] is mandatory *for the Client* to supply and will be replaced by the string literal identified.
    -   base: The Service Root URL (e.g., "<https://fhir-open-api-dstu2.smarthealthit.org>”)
    -   Resource-type: The name of a resource type (e.g., "Patient")
    -   id: The Logical Id of a resource(e.g., "24342")
-   Content surrounded by {} is optional *for the Client* to supply and will be replaced by the string literal identified.
    -   parameters: URL parameters as defined for the particular interaction (e.g., "?\_format=xml"}

For more information, see the [FHIR RESTful API]

### Search Syntax

Searching resources is defined by the [FHIR RESTful API] and included here for informative purposes. The [US Core FHIR RESTful Search API] Section documents the Server and Client rules for the RESTful interactions described in this guide.

All the search interactions in this guide use the `GET` command with the following syntax:

 **`GET [base]/[Resource-type]?[parameter1]{:m1|m2|...}={c1|c2|...}[value1{,value2,...}]{&[parameter2]{:m1|m2|...}={c1|c2|...}[value1{,value2,...}]&...}`**

-   GET is the HTTP verb used for fetching a resource
-   Variables surrounded by "\[\]" are mandatory *for the Client* to supply and will be replaced by the string literal identified.
-   Variables surrounded by "\{\}" are optional *for the Client* to supply and will be replaced by the string literal identified.
    -   base: The Service Root URL (e.g., "<https://fhir-open-api-dstu2.smarthealthit.org>”)
    -  Resource-type: The name of a resource type (e.g., "Patient")
    -  parameter: the search parameters as defined for the particular interaction (e.g.,"?patient=Patient/123")
    -  value: the search parameter value for a particular search
       - When searching using the `token` type searchparameter [(how to search by token)], the syntax `{system|}[code]` means that the system value is optional *for the Client* to supply.:
       - When searching using the `reference` type SearchParameter [(how to search by reference)], the syntax `{Type/}[id]` means that the Type value is optional *for the Client* to supply:
       - When searching using the `date` type SearchParameter [(how to search by date)], the syntax `data={gt|lt|ge|le}[date]` means the date comparators "gt", "lt", "ge", and "le" are optional.   Date type searches without a comparator prefix are equivalent to searches with the "eq" comparator *even if* a Server does not support the comparator.
    - \{:m1|m2|...}: The list of supported search parameter modifiers
    - {c1|c2|...}: The list of supported search parameter comparators
    - {,value2,...}: Optional multiple 'OR' Values
    - {&parameter2={:m1|m2|...}={c1|c2|...}[value1{,value2,...}&...}: Optional multiple 'AND' search parameters


In the simplest case, a search is executed by performing a GET operation in the RESTful framework:

`GET [base]/[Resource-type]?name=value&...`

For this RESTful search, the parameters are a series of name=\[value\] pairs encoded in the URL. The search parameter names are defined for each resource. For example, the Observation resource has the name "code" for searching on the LOINC code.  For more information, see the [FHIR RESTful Search API].

Note that when the patient is *implicit* in the context of some implementations (e.g., using SMART), the patient parameter can be omitted:

`GET [base]/[Resource-type]{?other-parameters}`

### Searching Multiple Patients

Currently, most EHRs permit queries that provide a single patient resource id but do not support the comma-separated query or a query where the patient parameter is omitted, as described in the standard FHIR REST API. Instead, a user-facing app can perform multiple "parallel" queries on a list of patient ids.  Alternatively, the [FHIR Bulk Data Access (Flat FHIR)] specification can be used to perform a "back end" system-level query to access large volumes of information on a group of individuals. It can also be used to identify and query against an unknown population, such as when looking for population-based research data or population-level queries for public health surveillance.

However, neither specification defines how a user-facing provider app can seek real-time "operational" data on multiple patients (such as all patients with recent lab results). Opportunities to add this capability to this guide are discussed in [US Core Roadmap].



### Searching Using lastUpdated

Servers **SHOULD** support the [`_lastUpdated`] search parameter for US Core Profiles and **SHOULD** populate [Resource.meta.lastUpdated] for US Core Profiles as accurately as possible. Servers **SHALL** document in `CapabilityStatement.rest.resource.searchParam.documentation` the types of changes that can be detected using the `_lastUpdated` search parameter (see example snippet below).

Example CapabilityStatement snippet for a Server supporting the `_lastUpdated` search parameter for US Core Laboratory Result Observation Profile 

~~~
{
"resourceType": "CapabilityStatement",
    ...
    "rest": [
      {
        "mode": "Server",
        ...
        "resource": [
            {
              "type": "Observation",
              "supportedProfile": [
                  "http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-lab",
                  ...
                ],
                 ...
              "searchParam": [
                  {
                  "name": "_lastUpdated",
                  "definition": "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated",
                  "type": "date",
                  "documentation": "This parameter is supported for Observations with the category
                  \"laboratory\" and allows searching for Observations that have been created or the 
                  status updated since the specified date."
                  },
                  ...
                ]
              ...  
            }
            ...
          ]
         ... 
       }
    ]
}
~~~

<div class="stu-note" markdown="1">

Many Servers are unable to accurately populate the `.meta.lastUpdated` element. 

**Note to Clients:**
- Updates to `.meta.lastUpdated` may not reflect a change in the resource and resource updates may not result in updates to `.meta.lastUpdated`.
- `_lastUpdated` search results may not reflect changes Clients can access and all updates to a resource may not be returned using the `_lastUpdated` search. (in other words, false negatives and false positives `_lastUpdated` search results are possible).
- Updates to `.meta.lastUpdated` may reflect changes a Client can not access. (for example, the Client may not be authorized to see the changed data).
- Supporting `.meta.lastUpdated` in a resource does not imply support for searches using the `_lastUpdated` search parameter.
- Support for searches using the `_lastUpdated` search parameter does not require Servers to support `.meta.lastUpdated`; Servers can use an alternative method to track changes to an instance.

**Note to Servers:**
- Updating the timestamp too frequently is better than missing updates.

Work is in progress to enable [FHIR Topic-Based Subscription] for notifications on relevant events as an alternative to search polling.
</div><!-- stu-note -->

### Compartment Based Search

US Core Servers are not required to support patient [compartment] based searches.

### Across Platform Searches

US Core Servers are not required to resolve absolute URLs external to their environment.

### Limiting The Number Of Search Results

Servers can choose to return the results in a series of pages to manage the number of search results returned. The search result set contains the URLs used to request additional pages from the search set. For a simple RESTful search, the page links are included in the returned bundle as links. See the [managing returned resources] in the FHIR specification for more information.


### Client Best Practices for Search:

To reduce API volume and ensure reliable use when implementing FHIR RESTful searches:

1. When the Server supports it, Clients **SHOULD** use the _include search parameter to retrieve referenced content instead of searching for a resource and then performing a separate search for other references (for example, Patient, Encounter, and Location) in the result set.

2. If the Server does not support the `_include`  search parameter, Clients **SHOULD** consolidate duplicate searches before searching for referenced resources in the result set

3. The [HTTP Cache-Control](https://httpwg.org/specs/rfc9111.html) response header stores a response associated with a request and reuses the stored response for subsequent requests. If Cache-Control is present in the Server response headers, the Clients **SHOULD NOT** search the same data within the time stated in `Cache-Control` headers.


------------------------------------------------------------------------
<!--
[^1]: https://en.wikipedia.org/w/index.php?title=UTC_offset#Time_zones_and_time_offsets
-->
Footnotes:

[^1]: This extension is [converted from a new element] in a future version of CapabilityStatement.

[^2]: For example, the base Location resource is referenced by the US Core Encounter and US Core PractitionerRole resources.

{% include link-list.md %}
