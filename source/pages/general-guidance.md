---
title: General Guidance
layout: default
---

This section outlines important definitions and interpretations and requirements common to all US Core actors used in this guide.
The conformance verbs - **SHALL**, **SHOULD**, **MAY** - used below and in this guide are defined in [FHIR Conformance Rules].

---

<!-- TOC  the css styling for this is \pages\assets\css\project.css under 'markdown-toc'-->
**Contents**

* Do not remove this line (it will not be displayed)
{:toc}

---

<!-- end TOC -->

### U.S. Core Data for Interoperability and 2015 Edition Common Clinical Data Set

The US Core Profiles were originally designed to meet the 2015 Edition certification criterion for Patient Selection 170.315(g)(7), and Application Access – Data Category Request 170.315(g)(8). They were created for each item in the [2015 Edition Common Clinical Data Set (CCDS)].  The Location, Organization, and Practitioner Profiles are not called out specifically in the certification criteria but are included because they are directly referenced by other profiles.  The US Core Profiles are informed by the prior [Data Access Framework] and the [Argonaut Data Query] Implementation Guides. However, the profiles here are stand alone and include new requirements from the latest proposed ONC [U.S. Core Data for Interoperability (USCDI)] and includes all the [API Resource Collection in Health (ARCH)] resources.

The table below lists the US Core Profile and FHIR Resources used for the corresponding USCDI Data elements:

{% include uscdi_table.md %}

### Changes Between Major Version of FHIR

With each major version in FHIR, the core data models have undergone changes.  The FHIR core specification provides a [base resource differential] to help implementers navigate version changes.

### Must Support
In the context of US Core, *Must Support* on any data element SHALL be interpreted as follows:


* US Core Responders SHALL be capable of including the data element as part of the query results as specified by the [US Core Server Capability Statement].
* US Core Requestors SHALL be capable of processing resource instances containing the data elements without generating an error or causing the application to fail. In other words US Core Requestors SHOULD be capable of displaying the data elements for human use or storing it for other purposes.
* In situations where information on a particular data element is not present and the reason for absence is unknown, US Core Responders SHALL NOT include the data elements in the resource instance returned as part of the query results.
* When querying US Core Responders, US Core Requestors SHALL interpret missing data elements within resource instances as data not present in the US Core Responder's systems.
* In situations where information on a particular data element is missing and the US Core Responder knows the precise reason for the absence of data, US Core Responders SHALL send the reason for the missing information using values (such as nullFlavors) from the value set where they exist or using the dataAbsentReason extension.
* US Core Requestors SHALL be able to process resource instances containing data elements asserting missing information.


* NOTE: Typically *US Core Responder* Actor = Server and *US Core Requestor Actor* = Client
* NOTE: US Core Responders who do not have the capability to store or return a data element tagged as Supported in US Core profiles can still claim conformance to the US Core profiles per the US Core conformance resources.
* NOTE: The above definition of Supported is derived from HL7v2 concept "Required but may be empty - RE" described in HL7v2 V28_CH02B_Conformance.doc.
* NOTE: Readers are advised to understand [FHIR Terminology] requirements, [FHIR RESTful API] based on the HTTP protocol, along with [FHIR Data Types], [FHIR Search] and [FHIR Resource] formats before implementing US Core requirements.

### Referencing US Core profiles

Many of the profiles in this guide [reference]({{site.data.fhir.path}}references.html) other FHIR resources that are also US Core profiles.  This is defined in the formal profile definitions.  For example, [US Core Careteam](StructureDefinition-us-core-careteam.html#profile) references US Core Patient.  For any other references not formally defined in a US Core profiles, the referenced resource SHOULD be a US Core profile if a US Core profile exists for the resource type.  For example, although `Condition.asserter` is not constrained by this guide, the reference to Patient or Practitioner **SHOULD** be a valid US Core Patient or US Core Practitioner.

### Missing Data

If the source system does not have data for a *Must Support* data element, the data element is omitted from the resource as described above.  If the source system does not have data for a *required* data element (in other words, where the minimum cardinality is > 0), the core specification provides guidance which is summarized below:

1.  For *non-coded* data elements, use the [DataAbsentReason Extension] in the data type
  - Use the code `unknown` - The value is expected to exist but is not known.

    Example: Patient resource where the patient name is not available.

    ~~~
    {
      "resourceType" : "Patient",
           ...
           "name":[
             "extension" : [
             "url" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason",
             "valueCode" : "unknown"
              }]
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
      - For the following data elements no appropriate "unknown" concept code is available, therefore the element must be populated:
          - `Immunization.status`
          - `DocumentReference.status`
          - `CarePlan.text.status`
          - `Goal.lifecycleStatus`


### Using Codes in US Core profiles

#### Required binding for CodeableConcept Datatype
{:.no_toc}

Required binding to a value set definition means that one of the codes from the specified value set SHALL be used and using only text is not valid. Multiple codings (translations) are permitted as is discussed below.

#### Extensible binding for CodeableConcept Datatype
{:.no_toc}

Extensible binding to a value set definition for this IG means that if the data type is CodeableConcept, then one of the coding values SHALL be from the specified value set if a code applies, but if no suitable
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

####  Using UCUM codes in the [Quantity] datatype
{:.no_toc}

Both the [Vital Signs Profile] and [US Core Laboratory Result Observation Profile] bind the `valueQuantity` datatypes to the [UCUM] code system.  A FHIR [UCUM Codes value set] that defines all UCUM codes is in the FHIR specification. This guidance specifies how to represent the Quantity datatype when the correct UCUM units are missing or the units are missing altogether which will likely occur in the real world.  

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

### Representing Deleted Information

Clinical information that has been removed from the patient's record needs to be represented in a way so that client systems know they can delete them.

- A FHIR server SHOULD not delete resources.

- The resource status SHOULD be updated to the appropriate status such as  `entered-in-error` or `inactive`, and these resources SHOULD *still* be searchable by client applications.

- If the status is `entered-in-error`:

  - for patient viewing systems the content of resource SHOULD be removed. In other words a blank resource.

  - A provider facing system MAY be supplied with additional details that the patient viewing system would typically not have access to.

### Language Support

There is a basic need be able to access records in your language, and the data provider should do their best to translate (safely) to the language being requested. Understanding that this will be variably complete depending on the nature of the record. For example translating the following elements is relatively straightforward:

- `Coding.display`
- Generated narrative
- `Attachment.title`

The following guidelines outline how to request and return a resource in the requested language.

* Clients MAY request language/locale using the http `Accept-Language` header.  < link >
* Servers SHOULD make reasonable efforts to translate what can be safely translated.
* Servers SHOULD populate the Resource's `language` element which is reasonably based on the underlying language of record, *not* the requested language.
    * Servers SHALL use the http://hl7.org/fhir/StructureDefinition/language extension when the language of a display, etc is known to be different to the stated (or inferred) language.

          <todo  example snippet>

* Servers SHALL use the http://hl7.org/fhir/StructureDefinition/translation where they wish to provide language translations.
        <todo  example snippet>
* Servers SHALL make discoverable what languages it can support.
  - via its CapabilityStatement
  - other means

For further guidance on language and locale for generation of the resource narrative, see http://hl7.org/fhir/narrative.html#lang

### Timezone and Time Offsets (*STRAWMAN PROPOSAL*)

>A *timezone* is a geographical region in which residents observe the same standard time. A *time offset* is an amount of time subtracted from or added to Coordinated Universal Time (UTC) time to get the current civil time, whether it is standard time or daylight saving time (DST).[^1]

- Servers **SHALL** store the existing supplied time offset or convert to "Z"(-0 offset) time.
  - best practice is to preserve the original time offset so clients are able to display the correct time independent of the current user location
- The data source timezone **SHOULD** be preserved
  - Use a [TZ Extension] on `[Resource].meta`  (plan to use new meta timezone element in R5)
    - ValueCode:
      - system = https://www.iana.org/time-zones
      - values bound to codes derived from the tz database: <https://en.wikipedia.org/wiki/Tz_database>
  - The TZ Extension is also used to override the global timezone information within particular dateTime elements

    Example:

    ~~~
    {
      "resource": {
        "id" : "1",
        "meta": {
          "extension": [
            {
              "url": "http://hl7.org/fhir/us/core/StructureDefinition/tz",
              "valueCode": "PDT"
            }
            ]
          },
... [snip] ...
      "authoredOn" : "2019-08-28T15:20:27+00:00",
      "_authoredOn" : {
           "extension": [
             {
              "url": "http://hl7.org/fhir/us/core/StructureDefinition/tz",
              "valueCode": "MDT"
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

### Read(Fetch) syntax

For fetching a resource interactions on profile pages are defined with the following syntax:

 **`GET [base]/[Resource-type]/[id] {parameters}`**

-   GET is the HTTP verb used for fetching a resource
-   Content surrounded by \[\] is mandatory, and will be replaced by the string literal identified.
    -   base: The Service Root URL (e.g. “<https://fhir-open-api-dstu2.smarthealthit.org>”)
    -   Resource-type: The name of a resource type (e.g. “Patient”)
    -   id: The Logical Id of a resource(e.g. “24342”)
-   Content surrounded by {} is optional
    -   parameters: URL parameters as defined for the particular interaction (e.g."?\_format=xml"}

For more information see the [FHIR RESTful API]

### Search Syntax

For searching a resource, interactions on profile pages are defined with the following syntax:

 **`GET [base]/[Resource-type]?[parameter1]{:m1|m2|...}={c1|c2|...}[value1{,value2,...}]{&parameter2={:m1|m2|...}={c1|c2|...}[value1{,value2,...}&...}`**

-   GET is the HTTP verb used for fetching a resource
-   Content surrounded by \[\] is mandatory, and will be replaced by the string literal identified.
    -   base: The Service Root URL (e.g. “<https://fhir-open-api-dstu2.smarthealthit.org>”)
    -  Resource-type: The name of a resource type (e.g. “Patient”)
    -  parameter: the search parameters as defined for the particular interaction (e.g."?patient=Patient/123")
    -  value: the search parameter value for a particular search
    - \{:m1|m2|...}: The list of supported search parameter modifiers
    - {c1|c2|...}: The list of supported search parameter comparators
    - {,value2,...}: Optional multiple 'OR' Values
    - {&parameter2={:m1|m2|...}={c1|c2|...}[value1{,value2,...}&...}: Optional multiple 'AND' search parameters


In the simplest case, a search is executed by performing a GET operation in the RESTful framework:

`GET [base]/[Resource-type]?name=value&...`

For this RESTful search, the parameters are a series of name=\[value\] pairs encoded in the URL. The search parameter names are defined for each resource. For example, the Observation resource the name “code” for search on the LOINC code.  For more information see the [FHIR RESTful Search API]

Note that the patient may be *implicit* in the context in some implementations (e.g. using SMART). Then the patient parameter can be omitted:

`GET [base]/[Resource-type]{?other-parameters}`

### Search for Servers Requiring Status

For searches where the client does not supply a status parameter, an implementation's business rules may override the FHIR RESTful search expectations and require a status parameter to be provided.  These systems are allowed to reject such requests as follows:

- **SHALL** return an http `404` status
- **SHALL** return an [OperationOutcome] specifying that status(es) must be present.
- **SHALL NOT** restrict search results ( i.e. apply 'hidden' filters) when a client includes status parameters in the query.
- **SHALL** document this behavior in its CapabilityStatement for the "search-type" interaction in `CapabilityStatement.rest.resource.interaction.documentation`.
- Follow the [deleted data](#representing-deleted-information) guidance above.
- If a system doesn't support a specific status that is queried, search results **SHOULD** return an http `200` status with search bundle containing resources matching the search criteria *and* an OperationOutcome warning the client which status value is not supported.

   - For example, in a query enumerating all the `AllergyIntolerance.verificationStatus` statuses to a system that supports concepts `unconfirmed`, `confirmed`, `entered-in-error` but not `refuted`, the search parameter is referring to an unknown code since `refuted` is not known to the server.

{% include examplebutton_default.html example="missing-status" b_title = "Click Here to See a Rejected Search Due to Missing Status Example" %}

### Searching multiple patients

Currently most EHRs permit queries that provide a singles patient id, but do not support the comma separated query or a query where the patient parameter is omitted as described the standard FHIR REST API. Instead, a user facing app can perform multiple "parallel" queries on a list of patient ids.  Alternatively, the [FHIR Bulk Data Access (Flat FHIR)] specification can be used to perform a "back end" system level query to access a large volumes of information on a group of individuals or when trying to identify and query against an unknown population such as when looking for population based research data.

However, neither specification defines how a user facing provider apps is able to seek realtime "operational" data on multiple patients (such as all patients with recent lab results). Opportunities to add this capability to this guide are discussed in [Future of US Core]

### Compartment Based Search

This IG does not support patient [compartment] based searches.

### Across Platform Searches

US Core servers are not required to resolve full URLs that are external to their environment.

### Guidance On Limiting The Number Of Search Results

In order to manage the number of search results returned, the server may choose to return the results in a series of pages. The search result set contains the URLs that the client uses to request additional pages from the search set. For a simple RESTful search, the page links are contained in the returned bundle as links. See the [managing returned resources] in the FHIR specification for more information.

------------------------------------------------------------------------
[^1]: https://en.wikipedia.org/w/index.php?title=UTC_offset&action=edit&section=1

{% include link-list.md %}
