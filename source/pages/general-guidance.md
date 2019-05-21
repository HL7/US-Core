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

If the source system does not have data for a *Must Support* data element, the data element is not present as described above.  If the source system does not have data for a *required* data element (in other words, where the minimum cardinality is > 0), the core specification provides guidance which is summarized below:

1.  For *non-coded* data elements, use the [DataAbsentReason Extension] in the data type
  - Use the code `unsupported` - The source system wasn't capable of supporting this element.

    Example: Patient resource where the patient name is not available.

    ~~~
    {
      "resourceType" : "Patient",
           ...
           "name":
             "extension" : [
             "url" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason",
             "valueCode" : "unsupported"
              }
            "telecom" :
            ...
         }
    ~~~

1. For *coded* data elements:
   - for *example*, *preferred*, or *extensible* binding strengths (CodeableConcept datatypes):
      - if the source systems has text but no coded data, only the text element is used.
      - if there is neither text or coded data:
        - use the appropriate "unknown" concept code from the value set if available
        - use `unknown` from the [DataAbsentReason Code System] id the value set does not have the appropriate concept.
1. For *required* binding strength (CodeableConcept or code datatypes):
  - use the appropriate "unknown" concept code from the value set if available
  - For the following data elements no appropriate "unknown" concept code is available, therefore the element must be populated:
      - `Immunization.status`
      - `DocumentReference.status`
      - `CarePlan.text.status`
      - `Goal.lifecycleStatus`


### Using Codes in US Core profiles

#### Required binding for CodeableConcept Datatype
{:.no_toc}

Required binding to a value set definition means that one of the codes from the specified value set SHALL be used and using only text is not valid. In this IG, we have defined the Extensible + Max-ValueSet binding to allow for either a code from the specified value set or text. Multiple codings (translations) are permitted as is discussed below.

#### Extensible binding for CodeableConcept Datatype
{:.no_toc}

Extensible binding to a value set definition for this IG means that if the data type is CodeableConcept, then one of the coding values SHALL be from the specified value set if a code applies, but if no suitable code exists in the value set and no further restrictions have been applied (such as the max valueset binding described in the next section), alternate code(s) may be provided in its place. If only text available, then just text may be used.

#### Extensible + Max-ValueSet binding for CodeableConcept Datatype
{:.no_toc #max-binding}

For this IG, we have defined the Extensible + Max-ValueSet binding to allow for either a code from the defined value set or text if the code is not available.  (for example, legacy data). This means, unlike a FHIR extensible binding, alternate code(s) are not permitted and a text value SHALL be supplied if the code is not available.  However, multiple codings (translations) are allowed as is discussed below.

Example: Immunization resource vaccineCode's CVX coding - the source only has the text "4-way Influenza" and no CVX code.

~~~
    {
      "resourceType": "Immunization",
      ...
      "vaccineCode": {
        "text":"4-way Influenza"
      },
      ...
    }
~~~

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

### Read(Fetch) resource notation:

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

### Search resource notation:

For searching a resource, interactions on profile pages are defined with the following syntax:

 **`GET [base]/[Resource-type]?[parameter1]{:m1|m2|...}={c1|c2|...}[value1{,value2,...}]{&parameter2={:m1|m2|...}={c1|c2|...}[value1{,value2,...}&...}`**

-   GET is the HTTP verb used for fetching a resource
-   Content surrounded by \[\] is mandatory, and will be replaced by the string literal identified.
    -   base: The Service Root URL (e.g. “<https://fhir-open-api-dstu2.smarthealthit.org>”)
    -  Resource-type: The name of a resource type (e.g. “Patient”)
    -  parameter: the search parameters as defined for the particular interaction (e.g."?patient=Patient/123")
    -  value: the search parameter value for a particular search
    - {:m1|m2|...}: The list of supported search parameter modifiers
    - {c1|c2|...}: The list of supported search parameter comparators
    - {,value2,...}: Optional multiple 'OR' Values
    - ]{&parameter2={:m1|m2|...}={c1|c2|...}[value1{,value2,...}&...}: Optional multiple 'AND' search parameters

For more information see the [FHIR RESTful Search API]


### Search Syntax

In the simplest case, a search is executed by performing a GET operation in the RESTful framework:

**GET [base]/[Resource-type]?name=value&...**

For this RESTful search, the parameters are a series of name=\[value\] pairs encoded in the URL. The search parameter names are defined for each resource. For example, the Observation resource the name “code” for search on the LOINC code. See [FHIR Search] for more information about searching in REST, messaging, and services.

### Syntax for searches limited by patient

There are several potential ways to search for resources associated with a specific patient depending on the context and implementation. These searches result in the same outcome.:

1. An explicitly defined patient using the 'patient' parameter that controls which set of resources are being searched by resource type.  Note that all the search interactions in this IG are published using this syntax:
  - **GET [base]/[Resource-type]?patient=24342{&otherparameters}**
   - There are several variations to this syntax which are listed below:

        -   GET \[base\]/\[Resource-type\]?Subject=\[id\]{&other parameters}
        -   GET \[base\]/\[Resource-type\]?Subject=Patient/\[id\]{&other parameters}
        -   GET \[base\]/\[Resource-type\]?Subject.\_id=\[id\]{&other parameters}
        -   GET \[base\]/\[Resource-type\]?subject:Patient=\[id\]{&other parameters}
        -   GET \[base\]/\[Resource-type\]?subject:Patient=Patient/\[id\]{&other parameters}
        -   GET \[base\]/\[Resource-type\]?subject:Patient=\[https://%5Burl%5D/Patient/id\]{&other parameters}
        -   GET \[base\]/\[Resource-type\]?subject:Patient.\_id=\[id\]{&other parameters}
        -   GET \[base\]/\[Resource-type\]?patient:Patient=\[https://%5Burl%5D/Patient/id\]{&other parameter

1. The patient may be *implicit* in the context (e.g. using SMART). Then the patient parameter can be omitted:
  - **GET [base]/[Resource-type]{?other-parameters}**

1. Patient [compartment] based search with a specified resource type in that compartment. **NOTE this IG does not support compartment based searches**.

### Across Platform Searches

US Core servers are not required to resolve full URLs that are external to their environment.

### Guidance on limiting the number of search results

In order to manage the number of search results returned, the server may choose to return the results in a series of pages. The search result set contains the URLs that the client uses to request additional pages from the search set. For a simple RESTful search, the page links are contained in the returned bundle as links. See the [managing returned resources] in the FHIR specification for more information.

------------------------------------------------------------------------

{% include link-list.md %}
