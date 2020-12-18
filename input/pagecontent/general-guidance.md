
This section outlines important definitions, interpretations, and requirements common to all US Core actors used in this guide.
The conformance verbs - **SHALL**, **SHOULD**, **MAY** - used in this guide are defined in [FHIR Conformance Rules].

<!-- end TOC -->
### U.S. Core Data for Interoperability

The US Core Profiles were originally designed to meet the 2015 Edition certification criterion for Patient Selection 170.315(g)(7), and Application Access – Data Category Request 170.315(g)(8). They were created for each item in the [2015 Edition Common Clinical Data Set (CCDS)].  The Location, Organization, and Practitioner Profiles are not called out specifically in the certification criteria but are included because they are directly referenced by other profiles.  The US Core Profiles are informed by the prior [Data Access Framework] and the [Argonaut Data Query] Implementation Guides. However, the profiles here are stand alone and include requirements from the [U.S. Core Data for Interoperability (USCDI) v1].

The table below lists the US Core Profile and FHIR Resources used for the corresponding USCDI Data elements:

{% include uscdi_table.md %}


### Changes Between Major Versions of FHIR

With each major version in FHIR, the core data models have undergone changes.  The FHIR core specification provides a [base resource differential] to help implementers navigate version changes.

### Referencing US Core Profiles

The search expectations and US Core Profiles have been developed and tested using *logical FHIR ids*.  Therefore a [reference] to a US Core resource **SHOULD** include a logical id (`Reference.reference`), not an identifier (`Reference.identifier`).
{:.new-content #FHIR-28573}

Many of the profiles in this guide [reference] other FHIR resources that are also US Core Profiles.  This is defined in the formal profile definitions.  For example, [US Core CareTeam Profile] references US Core Patient.  For any other references to base FHIR resources[^2] or not formally defined in a US Core Profiles, the referenced resource **SHOULD** be a US Core Profile if a US Core Profile exists for the resource type.  For example, although `Condition.asserter` is not constrained by this guide, the reference to Patient or Practitioner **SHOULD** be a valid US Core Patient or US Core Practitioner.  US Core Resources in the [differential view] and marked as "Must Support" follow the Must Support rules described in [Conformance Expectations].  Other resources allowed in the base FHIR specification may be referenced even though the current publication framework does not display them.  For example, RelatedPerson is an allowed target reference in `DocumentReference.author`.

### Contained Resources

[Contained resources] **SHOULD NOT** be used when responding to a query. The only time contained resource can be used is when the source data exists only within the context of the FHIR transaction. For example, the [Medication List Guidance] page describes how a contained Medication in MedicationRequest is used for representing the medication.  If referencing a contained resource in a US Core Profile, the contained resource **SHOULD** be a US Core Profile if a US Core Profile exists for the resource type.  Further guidance about the general use case for contained can be found in the base FHIR specification.  
{:.new-content #FHIR-28396}

### Missing Data

If the source system does not have data for a *Must Support* data element, the data element is omitted from the resource as described above.  If the source system does not have data for a *required* data element (in other words, where the minimum cardinality is > 0), the core specification provides guidance which is summarized below:

1.  For *non-coded* data elements, use the [DataAbsentReason Extension] in the data type
  - Use the code `unknown` - The value is expected to exist but is not known.

    Example: Patient resource where the patient name is not available.

    ~~~
    {
      "resourceType" : "Patient",
           ...
           "name": [
             {
               "extension": [
                 {
                   "url": "http://hl7.org/fhir/StructureDefinition/data-absent-reason",
                   "valueCode": "unknown"
                 }
               ]
             }
           ]
            "telecom" :
            ...
         }
    ~~~

1. For *coded* data elements:
   - *example*, *preferred*, or *extensible* binding strengths (CodeableConcept datatypes):
      - if the source systems has text but no coded data, only the text element is used.
      - if there is neither text or coded data:
        - use the appropriate "unknown" concept code from the value set if available
        - if the value set does not have the appropriate "unknown" concept code, use `unknown` from the [DataAbsentReason Code System].
   - *required* binding strength (CodeableConcept or code datatypes):
      - use the appropriate "unknown" concept code from the value set if available
      - For the following status elements no appropriate "unknown" concept code is available, therefore the element must be populated:
          - `AllergyIntolerance.clinicalStatus`
          - `Condition.clinicalStatus`
          - `DocumentReference.status`
          - `Immunization.status`
          - `Goal.lifecycleStatus`

        If one of these a status code is missing, a `404` http error code and an OperationOutcome **SHALL** be returned in response to a query for the resource.

<!--{%raw%}

### Using Codes in US Core Profiles

#### Required binding for CodeableConcept Datatype
{:.no_toc}

Required binding to a value set definition means that one of the codes from the specified value set **SHALL** be used and using only text is not valid. Multiple codings (translations) are permitted as is discussed below.

#### Extensible binding for CodeableConcept Datatype
{:.no_toc}

Extensible binding to a value set definition for this IG means that if the data type is CodeableConcept, then one of the coding values **SHALL** be from the specified value set if a code applies, but if no suitable
 code exists in the value set, alternate code(s) may be provided in its place. If only text available, then just text may be used.

#### Using multiple codes with CodeableConcept Datatype
{:.no_toc}

Alternate codes may be provided in addition to the standard codes defined in required or extensible value sets. The alternate codes are called “translations”. These translations may be equivalent to or narrower in meaning to the standard concept code.

Example of multiple translation for Body Weight concept code.

~~~
    "code": {
        "coding": [
         {
            "system": "http://loinc.org",  //NOTE:this is the standard concept defined in the value set//
            "code": "29463-7",
            "display": "Body Weight"
          },
    //NOTE:this is a translation to a more specific concept
         {
            "system": "http://loinc.org",
            "code": "3141-9",
            "display": "Body Weight Measured"
          },
    //NOTE:this is a translation to a different code system (Snomed CT)
         {
            "system": "http://snomed.info/sct",
            "code":  “364589006”,
            "display": "Body Weight"
          }
    //NOTE:this is a translation to a locally defined code
         {
            "system": "http://AcmeHealthCare.org",
            "code":  “BWT”,
            "display": "Body Weight"
          }
        ],
        "text": "weight"
      },
~~~

Example of translation of CVX vaccine code to NDC code.

~~~
    "vaccineCode" : {
        "coding" : [
          {
            "system" : "{{site.data.fhir.path}}sid/cvx",
            "code" : "158",
            "display" : "influenza, injectable, quadrivalent"
          },
          {
            "system" : "{{site.data.fhir.path}}sid/ndc",
            "code" : "49281-0623-78",
            "display" : "FLUZONE QUADRIVALENT"
          }
        ]
      },
~~~
{% endraw %}
-->

####  Using UCUM codes in the [Quantity] datatype
{:.no_toc}

Both the [US Core Vital Signs Profile] and [US Core Laboratory Result Observation Profile] bind the `valueQuantity` datatypes to the [UCUM] code system.  A FHIR [UCUM Codes value set] that defines all UCUM codes is in the FHIR specification. This guidance specifies how to represent the Quantity datatype when the correct UCUM units are missing or the units are missing altogether which will likely occur in the real world.  

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

<div class="new-content" id="FHIR-28091" markdown="1">

### Representing Entered in Error and Deleted Information

Clinical information that has been entered-in-error in the patient's record needs to be represented by the FHIR Server in a way so that Clients can expose the corrected information to their end users.

**Server Recommendations:**
- A FHIR Server **SHOULD NOT** delete resources.
- A FHIR server  **SHOULD** update  the appropriate  resource status to `entered-in-error` or `inactive`.
- A FHIR Server  **SHOULD**  allow these resources to be searchable by client applications.
- If the FHIR server has updated the resource status to `entered-in-error`:
    -  For *patient facing* applications, A FHIR Server  **SHOULD** remove the contents of resource  leaving only an id and status.   Note this typically will not be conformant with the US Core or FHIR StructureDefinitions.
    - For *provider facing* applications,  the content **MAY** be supplied with content and additional detail (such as the reason for the status change) that the patient viewing system would typically not have access to.
</div>

### Language Support

There is a basic need be able to access records in your language, and the data provider should do their best to translate (safely) to the language being requested. Understanding that this will be variably complete depending on the nature of the record. For example translating the following elements is relatively straightforward:

- `Coding.display`
- Generated narrative
- `Attachment.title`

The following guidelines outline how to request and return a resource in the requested language.

* Clients MAY request language/locale using the http [`Accept-Language`] header.
* Servers **SHOULD** make reasonable efforts to translate what can be safely translated.
* Servers **SHOULD** populate the Resource's `language` element with a code which is based on the underlying language of record, *not* the requested language.
    * Servers **SHALL** use the <http://hl7.org/fhir/StructureDefinition/language> extension when the language of a display, etc is known to be different to the stated (or inferred) language.

      Example
      ~~~
          <?xml version="1.0" encoding="UTF-8"?>
          <Patient xmlns="http://hl7.org/fhir">
              <id value="language-example-1"/>
              <meta>
              [...snip...]
              </meta>
              <language value="es"/>
              <!--0..1 Language of the resource content in this case Spanish-->
              <text>
              [...snip...]
              </text>
              <extension url="http://hl7.org/fhir/us/core/StructureDefinition/us-core-race">
                  <extension url="ombCategory">
                      <valueCoding>
                          <system value="urn:oid:2.16.840.1.113883.6.238"/>
                          <code value="2106-3"/>
                          <display value="White">
                              <!--Human Language extension-->
                              <extension url="http://hl7.org/fhir/StructureDefinition/language">
                                  <valueCode value="en"/>
                                  <!--English is different from stated language-->
                              </extension>
                          </display>
                      </valueCoding>
                  </extension>
              [...snip...]
      ~~~

* Servers **SHALL** use the <http://hl7.org/fhir/StructureDefinition/translation> extension when the server is providing additional translations by its own choice or in response to a different `Accept-Language` than what the resource is stored in.

    Example
    ~~~
        <?xml version="1.0" encoding="UTF-8"?>
        <Patient xmlns="http://hl7.org/fhir">
            <id value="language-example-2"/>
            <meta>
            [...snip...]
            </meta>
            <language value="en"/>
            <!--0..1 Language of the resource content: English-->
            <text>
            [...snip...]
            </text>
            <extension url="http://hl7.org/fhir/us/core/StructureDefinition/us-core-race">
                <extension url="ombCategory">
                    <valueCoding>
                        <system value="urn:oid:2.16.840.1.113883.6.238"/>
                        <code value="2106-3"/>
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

For further guidance on language and locale for generation of the resource narrative, see the [Multi-language support for Narratives] in the core specification.


<!--
### Timezone and Time Offsets (*STRAWMAN PROPOSAL*)

>A *timezone* is a geographical region in which residents observe the same standard time. A *time offset* is an amount of time subtracted from or added to Coordinated Universal Time (UTC) time to get the current civil time, whether it is standard time or daylight saving time (DST).[^1]

- Servers **SHALL** store the existing supplied time offset or convert to "Z"(-0 offset) time.


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
        "id" : "1",
          "extension": [
            {
              "url": "http://hl7.org/fhir/us/core/StructureDefinition/tz",
              "valueCode": "US/Pacific"
            }
            ],
... [snip] ...
      "authoredOn" : "2019-08-28T15:20:27+00:00",
      "_authoredOn" : {
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

For fetching a resource interactions on profile pages are defined with the following syntax:

 **`GET [base]/[Resource-type]/[id] {parameters}`**

-   GET is the HTTP verb used for fetching a resource
-   Content surrounded by \[\] is mandatory *for the client* to supply, and will be replaced by the string literal identified.
    -   base: The Service Root URL (e.g. “<https://fhir-open-api-dstu2.smarthealthit.org>”)
    -   Resource-type: The name of a resource type (e.g. “Patient”)
    -   id: The Logical Id of a resource(e.g. “24342”)
-   Content surrounded by {} is optional *for the client* to supply, and will be replaced by the string literal identified.
    -   parameters: URL parameters as defined for the particular interaction (e.g."?\_format=xml"}

For more information see the [FHIR RESTful API]

### Search Syntax

For searching a resource, interactions on profile pages are defined with the following syntax:

 **`GET [base]/[Resource-type]?[parameter1]{:m1|m2|...}={c1|c2|...}[value1{,value2,...}]{&[parameter2]{:m1|m2|...}={c1|c2|...}[value1{,value2,...}]&...}`**

-   GET is the HTTP verb used for fetching a resource
-   Variables surrounded by "\[\]" are mandatory *for the client* to supply, and will be replaced by the string literal identified.
-   Variables surrounded by "\{\}" are optional *for the client* to supply, and will be replaced by the string literal identified.
    -   base: The Service Root URL (e.g. “<https://fhir-open-api-dstu2.smarthealthit.org>”)
    -  Resource-type: The name of a resource type (e.g. “Patient”)
    -  parameter: the search parameters as defined for the particular interaction (e.g."?patient=Patient/123")
    -  value: the search parameter value for a particular search
       - When searching using the `token` type searchparameter [(how to search by token)], the syntax `{system|}[code]` means that the system value is optional *for the client* to supply.:
         * The client **SHALL** provide at least a code value and **MAY** provide both the system and code values.
         * The server **SHALL** support both.
       - {:.new-content #FHIR-27905}When searching using the `reference` type searchparameter [(how to search by reference)], the syntax `{Type/}[id]` means that the Type value is optional *for the client* to supply:
         * The client **SHALL** provide at least a id value and **MAY** provide both the Type and id values.
         * The server **SHALL** support both.
    - \{:m1|m2|...}: The list of supported search parameter modifiers
    - {c1|c2|...}: The list of supported search parameter comparators
    - {,value2,...}: Optional multiple 'OR' Values
    - {&parameter2={:m1|m2|...}={c1|c2|...}[value1{,value2,...}&...}: Optional multiple 'AND' search parameters


In the simplest case, a search is executed by performing a GET operation in the RESTful framework:

`GET [base]/[Resource-type]?name=value&...`

For this RESTful search, the parameters are a series of name=\[value\] pairs encoded in the URL. The search parameter names are defined for each resource. For example, the Observation resource the name “code” for search on the LOINC code.  For more information see the [FHIR RESTful Search API]

Note that the patient may be *implicit* in the context in some implementations (e.g. using SMART). Then the patient parameter can be omitted:

`GET [base]/[Resource-type]{?other-parameters}`

<div class="new-content" markdown="1" id="FHIR-27906">

#### Date Precision Expectations

When searching using the `date` type searchparameter [(how to search by date)]:
* The client **SHALL** provide values precise to the *day* for elements of datatype `date` and to the *second + time offset* for elements of datatype `dateTime`.
* The server **SHALL** support values precise to the *day* for elements of datatype `date` and  to the *second + time offset* for elements of datatype `dateTime`.

The table below summarizes the date precision:

|SearchParameter|Element Datatype|Minimum Date Precision|Example|
|---|----|---|---|
|date|date|day|`GET [base]/Patient?family=Shaw&birthdate=2007-03-20`|
|date|dateTime, Period|second + time offset|`GET [base]Observation?patient=555580&category=laboratory&date=ge2018-03-14T00:00:00-08:00`|
{:.grid}

</div>

### Search for Servers Requiring Status

Servers are *strongly* encouraged to support a query for resources *without* requiring a status parameter.  However, if business requirements prohibit this they **SHALL** follow the guidelines here.
{: .highlight-note}

For searches where the client does not supply a status parameter, an implementation's business rules may override the FHIR RESTful search expectations and require a status parameter to be provided.  These systems are allowed to reject such requests as follows:

- **SHALL** return an http `400` status
- **SHALL** return an [OperationOutcome] specifying that status(es) must be present.
- **SHALL** support search with status if status required
- **SHALL NOT** restrict search results ( i.e. apply 'hidden' filters) when a client includes status parameters in the query.
  - If a system doesn't support a specific status code value that is queried, search results **SHOULD** return an http `200` status with search bundle containing resources matching the search criteria *and* an OperationOutcome warning the client which status code value is not supported.

   - For example, in a query enumerating all the `AllergyIntolerance.verificationStatus` statuses to a system that supports concepts `unconfirmed`, `confirmed`, `entered-in-error` but not `refuted`, the search parameter is referring to an unsupported code since `refuted` is not known to the server.

     {% include examplebutton_default.html example="missing-status" b_title = "Click Here to See a Rejected Search Due to Missing Status Example" %}

- **SHALL** document this behavior in its CapabilityStatement for the "search-type" interaction in `CapabilityStatement.rest.resource.interaction.documentation`.
- Follow the [deleted data](#representing-entered-in-error-and-deleted-information) guidance above.



### Searching Multiple Patients

Currently, most EHRs permit queries that provide a single patient id, but do not support the comma separated query or a query where the patient parameter is omitted as described in the standard FHIR REST API. Instead, a user facing app can perform multiple "parallel" queries on a list of patient ids.  Alternatively, the [FHIR Bulk Data Access (Flat FHIR)] specification can be used to perform a "back end" system level query to access a large volumes of information on a group of individuals or when trying to identify and query against an unknown population such as when looking for population based research data.

However, neither specification defines how a user facing provider app is able to seek realtime "operational" data on multiple patients (such as all patients with recent lab results). Opportunities to add this capability to this guide are discussed in [Future of US Core]


### Compartment Based Search

This IG does not support patient [compartment] based searches.

### Across Platform Searches

US Core servers are not required to resolve full URLs that are external to their environment.

### Guidance On Limiting The Number Of Search Results

In order to manage the number of search results returned, the server may choose to return the results in a series of pages. The search result set contains the URLs that the client uses to request additional pages from the search set. For a simple RESTful search, the page links are contained in the returned bundle as links. See the [managing returned resources] in the FHIR specification for more information.

------------------------------------------------------------------------
<!--
[^1]: https://en.wikipedia.org/w/index.php?title=UTC_offset#Time_zones_and_time_offsets
-->
Footnotes:

[^1]: This extension is [converted from a new element] in a future version of CapabilityStatement.

[^2]: For example, the base Location resource is being referenced by the US Core Encounter and US Core PractitionerRole resources.

{% include link-list.md %}
