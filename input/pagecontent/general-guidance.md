
### Referencing US Core Profiles

The search expectations and US Core Profiles have been developed and tested using *logical FHIR ids*.  Therefore a [reference] to a US Core resource **SHOULD** include a logical id (`Reference.reference`), not an identifier (`Reference.identifier`).


Many of the profiles in this guide [reference] other FHIR resources that are also US Core Profiles.  These references are defined in the formal profile definitions.  For example, [US Core CareTeam Profile] references US Core Patient.  For any other references to base FHIR resources[^2] or not formally defined in a US Core Profiles, the referenced resource **SHOULD** be a US Core Profile if a US Core Profile exists for the resource type.  For example, although `Condition.asserter` is not constrained by this guide, the reference to Patient or Practitioner **SHOULD** be a valid US Core Patient or US Core Practitioner.  US Core Resources in the [differential view] and marked as "Must Support" follow the [Must Support] rules.  Other resources allowed in the base FHIR specification may be referenced.  For example, RelatedPerson is a permitted target reference in `DocumentReference.author`.

### Contained Resources

When responding to a query, servers **SHOULD** not use inline [contained] resources to represent the returned data. The only time a contained resource can be used is when the source data exists only within the context of the FHIR transaction. For example, the guidance in the [Medication List] page describes how a contained Medication in MedicationRequest is used for representing the medication. In addition, if referencing a contained resource in a US Core Profile, the contained resource **SHOULD** be a US Core Profile if a US Core Profile exists for the resource type.  Further guidance about the general use case for contained can be found in the base FHIR specification.  


###  Suppressed Data

In situations where the specific piece of data is hidden due to a security or privacy reason, using a code from the [DataAbsentReason Code System] such as `masked` may exceed the data receiver's access rights to know. However, masking data **SHOULD** be handled based on implemented policies. For elements with a minimum cardinality = 0 (including elements labeled *Must Support*), the element **SHOULD** be omitted from the resource. For *Mandatory* elements (in other words, where the minimum cardinality is > 0), use the code "unknown" following the guidance on [Missing Data] in the Conformance Sections.



### SNOMED CT United States Edition

[SNOMED CT] (Systematized Nomenclature of Medicine -- Clinical Terms) is a comprehensive clinical terminology widely used in healthcare to support the electronic exchange of clinical health information. US Core uses the US Edition of SNOMED CT, a standalone release that combines the content of the US Extension and the International releases of SNOMED CT. It is used extensively in US CORE for various clinical concepts, including problems, procedures, allergies, and laboratory results. When using SNOMED codes in US Core Profiles, implementers **MAY** use the default system URI which refers to an unspecified edition/version as shown in option one below. However, for terminology servers to be able to validate US Edition-only codes, implementers  **SHOULD**  provide the accompanying system URI to describe the edition as shown in option two.

#### SNOMED CT Edition and Version Options

1. Using only the system `http://snomed.info/sct` which refers to an unspecified edition/version. For example:
   
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


###  Using UCUM codes in the [Quantity] datatype

Some US Core Profiles (for example, the [US Core Vital Signs Profile]) bind the `valueQuantity` datatypes to the [UCUM] code system. A FHIR [UCUM Codes ValueSet] that defines all UCUM codes is in the FHIR specification. This guidance specifies how to represent the Quantity datatype when the correct UCUM units are missing, or the units are missing, which will likely occur in the real world.  

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
- If UCUM units are not available then represent units in the `unit` element.

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

### Representing Entered in Error Information

Clinical information that has been entered in error in the patient's record needs to be represented by the FHIR Server in a way so that Clients can expose the corrected information to their end users.

**Server Recommendations:**
- A FHIR Server **SHOULD** not delete resources.
- A FHIR server **SHOULD** update the appropriate resource status to `entered-in-error` or `inactive`.
- A FHIR Server **SHOULD** allow these resources to be searchable by client applications.
- If the FHIR server has updated the resource status to `entered-in-error`:
    -  For *patient facing* applications, A FHIR Server **SHOULD** remove the contents of resource leaving only an id and status.   Note this typically will not be conformant with the US Core or FHIR StructureDefinitions.
    - For *provider-facing* applications,  the content may be supplied with content and additional detail (such as the reason for the status change) that the patient viewing system would typically not have access to.

### Representing Deleted Information

A FHIR Server **SHOULD** not delete records. If a system supports the deletion of records, they **SHOULD** refer to the [Deletion Safety Checks] in the FHIR specification.

### Narrative

The [US Core CarePlan Profile] requires a narrative summary of the patient assessment and plan of treatment. However, *any* US Core Profile may include a human-readable narrative containing a summary of the resource and may be used to represent the resource's content to a human.  For further guidance, refer to the [Narrative documentation] in the FHIR Specification.

### Language Support

There is a basic need to access records in your language, and the data provider **SHOULD** do their best to translate (safely) to the requested language. Understanding that this will be variably complete depending on the nature of the record. For example, translating the following elements is relatively straightforward:

- `Coding.display`
- Generated narrative
- `Attachment.title`

The following guidelines outline requesting and returning a resource in the requested language.

* Clients MAY request language/locale using the http [`Accept-Language`] header.
* Servers **SHOULD** make reasonable efforts to translate what can be safely translated.
* Servers **SHOULD** populate the Resource's `language` element with a code that is based on the underlying language of record, *not* the requested language.
    * Using the [Human Language] Extension when the language of a display, etc, is known to be different from the stated (or inferred) language.

      Example
      ~~~
          <?xml version="1.0" encoding="UTF-8"?>
          <Patient xmlns="http://hl7.org/fhir">
              <id value="language-example-1"/>
              <meta>
              [...snip...]
              </meta>
              <language value=" es"/>
              <!--0..1 Language of the resource content in this case Spanish-->
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

* Using the [Translation] Extension when the server is providing additional translations by its own choice or in response to a different `Accept-Language` than what the resource is stored in.

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


<!--
### Timezone and Time Offsets (*STRAWMAN PROPOSAL*)

>A *timezone* is a geographical region in which residents observe the same standard time. A *time offset* is an amount of time subtracted from or added to Coordinated Universal Time (UTC) time to get the current civil time, whether it is standard time or daylight saving time (DST).[^1]

- Servers **SHALL** store the existing supplied time offset or convert to "Z" (-0 offset) time.


  - best practice is to preserve the original time offset so clients are able to display the correct time independent of the current user location
- The data source timezone **SHOULD** be preserved
  - Use a [TZ Extension] on `[Resource]`  (plan to use new meta timezone element in R5)
    - ValueCode:
      - system = https://www.iana.org/time-zones
      - values bound to codes derived from the tz database: <https://en.wikipedia.org/wiki/Tz_database>
  - The TZ Extension is also used to override the global timezone information within particular dateTime elements

    Example:

    ~~~
    {
      "resource": {
        "id": "1",
          "extension": [
            {
              "url": "http://hl7.org/fhir/us/core/StructureDefinition/tz",
              "valueCode": "US/Pacific"
            }
            ],
... [snip] ...
      "authoredOn": "2019-08-28T15:20:27+00:00",
      "_authoredOn": {
           "extension": [
             {
              "url": "http://hl7.org/fhir/us/core/StructureDefinition/tz",
              "valueCode": "US/Mountain"
              }
            ]
      },
... [snip] ...
    ~~~

Client algorithm for resolving time offsets and timezones.

  1. Look for a time offset on a specific datetime. If present, treat that as the data source time offset.
  1. Look for a data source timezone in `[dateTime element].extension`. If present, treat that as the data source timezone.
  1. Look for a data source timezone in `[Resource].meta.extension`. If present, treat that as the data source timezone.
  1. If there is no data source timezone in `[dateTime element].extension` or `[Resource].meta.extension`. The timezone may be calculated from the source location and time offset.
  * If hours and minutes are specified and there is no time offset on a specific datetime, the resource is invalid.

-->

### Read (Fetch) Syntax

Fetching resource interactions are defined by the [FHIR RESTful API]. Guidance is included on the US core Profile pages for conformance and informative purposes:

 **`GET [base]/[Resource-type]/[id] {parameters}`**

-   GET is the HTTP verb used for fetching a resource
-   Content surrounded by \[\] is mandatory *for the client* to supply and will be replaced by the string literal identified.
    -   base: The Service Root URL (e.g., "<https://fhir-open-api-dstu2.smarthealthit.org>”)
    -   Resource-type: The name of a resource type (e.g., "Patient")
    -   id: The Logical Id of a resource(e.g., "24342")
-   Content surrounded by {} is optional *for the client* to supply and will be replaced by the string literal identified.
    -   parameters: URL parameters as defined for the particular interaction (e.g."?\_format=xml"}

For more information, see the [FHIR RESTful API]

### Search Syntax

Searching resources is defined by the [FHIR RESTful API] and included here for informative purposes. The [US Core FHIR RESTful Search API] Section documents the server and client rules for the RESTful interactions described in this guide.

All the search interactions in this guide use the `GET` command with the following syntax:

 **`GET [base]/[Resource-type]?[parameter1]{:m1|m2|...}={c1|c2|...}[value1{,value2,...}]{&[parameter2]{:m1|m2|...}={c1|c2|...}[value1{,value2,...}]&...}`**

-   GET is the HTTP verb used for fetching a resource
-   Variables surrounded by "\[\]" are mandatory *for the client* to supply and will be replaced by the string literal identified.
-   Variables surrounded by "\{\}" are optional *for the client* to supply and will be replaced by the string literal identified.
    -   base: The Service Root URL (e.g., "<https://fhir-open-api-dstu2.smarthealthit.org>”)
    -  Resource-type: The name of a resource type (e.g., "Patient")
    -  parameter: the search parameters as defined for the particular interaction (e.g."?patient=Patient/123")
    -  value: the search parameter value for a particular search
       - When searching using the `token` type searchparameter [(how to search by token)], the syntax `{system|}[code]` means that the system value is optional *for the client* to supply.:
       - When searching using the `reference` type searchparameter [(how to search by reference)], the syntax `{Type/}[id]` means that the Type value is optional *for the client* to supply:
       - When searching using the `date` type searchparameter [(how to search by date)], the syntax `data={gt|lt|ge|le}[date]` means the date comparators "gt", "lt", "ge", and "le" are optional.   Date type searches without a comparator prefix are equivalent to searches with the "eq" comparator *even if* a server does not support the comparator.
    - \{:m1|m2|...}: The list of supported search parameter modifiers
    - {c1|c2|...}: The list of supported search parameter comparators
    - {,value2,...}: Optional multiple 'OR' Values
    - {&parameter2={:m1|m2|...}={c1|c2|...}[value1{,value2,...}&...}: Optional multiple 'AND' search parameters


In the simplest case, a search is executed by performing a GET operation in the RESTful framework:

`GET [base]/[Resource-type]?name=value&...`

For this RESTful search, the parameters are a series of name=\[value\] pairs encoded in the URL. The search parameter names are defined for each resource. For example, the Observation resource has the name "code" for searching on the LOINC code.  For more information, see the [FHIR RESTful Search API]

Note that the patient may be *implicit* in the context of some implementations (e.g., using SMART). Then the patient parameter can be omitted:

`GET [base]/[Resource-type]{?other-parameters}`

### Searching Multiple Patients

Currently, most EHRs permit queries that provide a single patient id but do not support the comma-separated query or a query where the patient parameter is omitted, as described in the standard FHIR REST API. Instead, a user-facing app can perform multiple "parallel" queries on a list of patient ids.  Alternatively, the [FHIR Bulk Data Access (Flat FHIR)] specification can be used to perform a "back end" system-level query to access large volumes of information on a group of individuals. It can also be used to identify and query against an unknown population, such as when looking for population-based research data or population-level queries for public health surveillance.

However, neither specification defines how a user-facing provider app is able to seek real-time "operational" data on multiple patients (such as all patients with recent lab results). Opportunities to add this capability to this guide are discussed in [Future of US Core]


### Compartment Based Search

US Core servers are not required to support  patient [compartment] based searches.

### Across Platform Searches

US Core servers are not required to resolve absolute URLs that are external to their environment.

### Limiting The Number Of Search Results

Servers may choose to return the results in a series of pages to manage the number of search results returned. The search result set contains the URLs used to request additional pages from the search set. For a simple RESTful search, the page links are contained in the returned bundle as links. See the [managing returned resources] in the FHIR specification for more information.

------------------------------------------------------------------------
<!--
[^1]: https://en.wikipedia.org/w/index.php?title=UTC_offset#Time_zones_and_time_offsets
-->
Footnotes:

[^1]: This extension is [converted from a new element] in a future version of CapabilityStatement.

[^2]: For example, the base Location resource is being referenced by the US Core Encounter and US Core PractitionerRole resources.

{% include link-list.md %}
