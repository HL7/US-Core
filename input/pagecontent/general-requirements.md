<!-- new content comment remove prior to publishing-->
This page has been added for this version.
{:.new-content}

This page outlines important and requirements common to all US Core actors used in this guide. The conformance verbs - **SHALL**, **SHOULD**, **MAY** - used in this guide are defined in [FHIR Conformance Rules].

<!-- This page defines how CapabilityStatements are used and the expectations for mandatory and must support elements in the US Core Profiles. It provides guidance on how a system may support *only* the resources as profiled by US Core to represent clinical information (Profile Support) versus a system claiming conformance to *both* the US Core Profile content structure *and* the RESTful interactions defined for it (Profile Support + Interaction Support).  Note that the conformance verbs - **SHALL**, **SHOULD**, **MAY** - used in this guide are defined in [FHIR Conformance Rules]. -->


### US Core Conformance Artifacts:

The [Profiles and Extensions] page list the US Core Profiles and have been defined for this implementation guide.  Core Profile [StructureDefinitions] defines the *minimum* elements, extensions, vocabularies and value sets which SHALL be present when using the profile. Each Profile page has a “Quick Start” guide to the supported FHIR RESTfUL transactions for each Profile

The Profile elements consist of both *Mandatory* and *Must Support* elements.  *Mandatory* elements are elements with an minimum cardinality of 1 (min=1). The base [FHIR Must Support] guidance requires specifications to define exactly the support expected for profile elements labeled *Must Support*.  The [Must Support] page illustrates how these elements are displayed and defines the rules for interpreting profile elements and subelements labeled *Mandatory* and *Must Support* for requesters and responders.

The [Capability Statements] page outlines conformance requirements and expectations for the US Core Servers and Client applications.  The [US Core Server CapabilityStatement] and [US Core Client CapabilityStatement] identify the specific profiles and RESTful transactions that need to be supported. Note that the individual US Core profiles identify the structural constraints, terminology bindings and invariants.  Similarly, the individual US Core SearchParameter and Operation resources specify how they are understood by the server. However, implementers must refer to the CapabilityStatement for details on the RESTful transactions, specific profiles and the search parameters applicable to each of the US Core actors.

### Conforming to US Core

There are two different ways to implement US Core:

1. Profile Only Support:  Systems may support *only* the US Core Profiles to represent clinical information.
1. Profile Support + Interaction Support: Systems may support *both* the US Core Profile content structure *and* the RESTful interactions defined for a resource.

#### Profile Only Support

Systems may deploy, and support, one or more US Core Profiles to represent clinical information. They are using the profile’s content model without any expectations to implement the US Core interactions.

An example scenario would be a server using only the [FHIR Bulk Data Access (Flat FHIR)] approach to export resources needed for the US Core Data for Interoperability.  For this server, the US Core interactions are unnecessary.

To support a US Core Profile, a server:

- **SHALL** Be able to populate all profile data elements that are mandatory and/or flagged as Must Support as defined by that profile’s StructureDefinition.
- **SHOULD** declare support for a US Core Profile by including its official URL in the server's `CapabilityStatement.rest.resource.supportedProfile` element
    - the US Core Profile's official or "canonical" URL can be found on each US Core Profile page

      example CapabilityStatement snippet for a server supporting the US Core Patient Profile:
      ~~~
      {
        "resourceType": "CapabilityStatement",
        ...
        "rest": [
          {
            "mode": "server",
            ...
            "resource": [
              ...
              {
                "type": "Patient",
                "supportedProfile": [
                  "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"
                ],
                ...
              }
            ]
          }
        ]
      }
      ~~~


#### Profile Support + Interaction Support

Systems may deploy, and support, one or more US Core Profiles to represent clinical information *and* the US Core interactions to access the information. Systems that implement *both* can claim conformance to US Core Profile content structure *and* the RESTful interactions defined for it. This is done by implementing all or parts of the USCore CapabilityStatement into their capabilities.

A server that certifies to the [21st Century Cures Act for accessing patient data] must implement all components in the USCDI and the US Core CapabilityStatement.


To claim conformance to a US Core Profile a server:

- **SHALL** Be able to populate all profile data elements that are mandatory and/or flagged as Must Support as defined by that profile’s StructureDefinition.
- **SHALL** declare conformance with the [US Core Server Capability Statement] by including its official URL in the server's `CapabilityStatement.instantiates` element: `http://hl7.org/fhir/us/core/CapabilityStatement/us-core-server`

- **SHALL** specify the full capability details from the US Core CapabilityStatement it claims to implement.
    - Declare support for the US Core Profile by including its official URL in the server's `CapabilityStatement.rest.resource.supportedProfile` element
    - Declare support for the US Core Profile's FHIR RESTful transactions
        - The US Core Profile's official or "canonical" URL can be found on each US Core Profile page

    example CapabilityStatement snippet for a server conforming to the US Core Patient Profile:

    {% include examplebutton_default.html example="conform-patient" b_title = "Click Here an example CapabilityStatement snippet for a server conforming to the US Core Patient Profile:" %}

### Using Codes in US Core Profiles

The rules provided here summarize the requirements defined by [FHIR Terminology] for coded elements (CodeableConcept, Coding, and code datatypes).

#### Required Bindings Coded Elements

[Required binding] to a value set definition means that one of the codes from the specified value set **SHALL** be used. For `CodeableConcept` using only text is *not* valid, but multiple codings (translations) are permitted as is discussed below.

For example, the [US Core AllergyIntolerance Profile] clinicalStatus element has a required binding to the AllergyIntoleranceClinicalStatusCodes ValueSet. When claiming conformance to this profile:

- US Core Responders **SHALL** provide a code *exclusively* from this valueset in  `AllergyIntolerance.clinicalStatus.code`.
- US Core Requestors **SHALL** be capable of processing the code in `AllergyIntolerance.clinicalStatus.code`.

  {% include img.html img="Must_Support_AllergyIntolerance_clinicalStatus.png" caption="Figure 4: US Core AllergyIntolerance.clinicalStatus" %}

#### Required Bindings When Slicing by Value Sets

<span class="bg-success" markdown="1">Because of the  FHIR conformance rule:</span><!-- new-content -->

<span class="bg-success" markdown="1">> If an extensible binding is applied to an element with maximum cardinality > 1, the binding applies to all the elements.([Terminology Binding Extensible])</span><!-- new-content -->

FHIR profiles use [slicing] when a coded element is a repeating element and a particular value set is desired for at least one of the repeats. This is a special case where a *required* value set binding is used to differentiate the repeat.  In this guide, the minimum cardinality for these 'slices' is set to 0 so that other codes are allowed when no suitable code exists in the value set (equivalent to  Extensible Binding below). <span class="bg-success" markdown="1">*Note that the introduction of slicing by valueset does not affect the over the wire structure or validation of instances of these resources.*</span><!-- new-content -->   The example in figure 5 below illustrates this structure for the repeating Condition.category element:

- This structure allows 0..\* concept(s) from the *required* value set.
- This structure, by being 0..\*, allows servers to send concepts not in the required value set.


  {% include img.html img="Must_Support_Condition_category.png" caption="Figure 5: US Core Condition.category" %}

#### Extensible Binding for CodeableConcept Datatype

[Extensible Binding] to a value set definition means that one of the codes from the specified value set **SHALL** be used if an applicable concept is present, but if no suitable code exists in the value set, alternate code(s) may be provided in its place.  For `CodeableConcept` multiple codings are permitted and this rule applies to one of the codings.  Also for `CodeableConcept` if only text is available, then just text may be used.

To illustrate extensible binding for CodeableConcept datatype, the [US Core AllergyIntolerance Profile] code element has an extensible binding to the VSAC ValueSet "Common substances for allergy and intolerance documentation including refutations" Allergy. When claiming conformance to this profile:

- US Core Responders **SHALL** provide:
  - a code from this valueset in `AllergyIntolerance.code.code` *if the concept exists* in the value set
  - or an alternative code *if the concept does not exist* in the value set
  - or text in `AllergyIntolerance.code.text`if only text is available.
- US Core Requestors **SHALL** be capable of processing the code in `AllergyIntolerance.code.code` or text in `AllergyIntolerance.code.text`

  {% include img.html img="Must_Support_AllergyIntolerance_code.png" caption="Figure 6: US Core AllergyIntolerance.code" %}

Although the FHIR guidance for extensible bindings indicates that *all conceptual overlaps* including free text be mapped the coded values in the bindings, US Core guidance provides more flexibility for situations where implementers cannot fully comply with the FHIR base guidance. This flexibility is sometimes necessary and expected for legacy and text only data. For newly recorded, non legacy data, a system **SHOULD** meet the conformance of the value set.

For example, the [US Core Procedure Codes] and  [US Core Condition Codes] value sets contain a number of high-level abstract codes. For data not captured by the system transmitting the information, the coded data should be automatically converted to a fine-grained code from the specified value set. If this is not possible, the system can provide the existing code or the free text, *and a high-level abstract code*, such as SNOMED CT 'Procedure', to remain conformant with the extensible binding.

### Using multiple codes with CodeableConcept Datatype
{:.no_toc #translations}

Alternate codes may be provided in addition than the standard codes defined in required or extensible value sets. The alternate codes are called “translations”. These translations may be equivalent to or narrower in meaning to the standard concept code.

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



### Missing Data

There are situations when information on a particular data element is missing and the source system does not know reason for the absence of data. If the source system does not have data for an element with a minimum cardinality = 0 (including elements labeled *Must Support*), <span class="bg-success" markdown="1">the data element **SHALL** be omitted from the resource.  If the data element is a a *Mandatory* element (in other words, where the minimum cardinality is > 0), it **SHALL** be present for *even if* the source system does not have data. The core specification provides guidance for what to do in this situation, which is summarized below:</span><!-- new-content -->

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
                   "url": "http://terminology.hl7.org/CodeSystem/data-absent-reason",
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
   - *example*, *preferred*, or *extensible* binding strengths (CodeableConcept , or Coding datatypes):
      - if the source systems has text but no coded data, only the text element is used.
          - for Coding datatypes, the text only data is represented as a `display` element.
      - if there is neither text or coded data:
        - use the appropriate "unknown" concept code from the value set if available
        - if the value set does not have the appropriate "unknown" concept code, use `unknown` from the [DataAbsentReason Code System].

        Example: AllergyIntolerance resource where the manifestation is unknown.
        ~~~
        ...
        "reaction" : [
          {
            "manifestation" : [
              {
                "coding" : [
                  {
                    "system" : "http://terminology.hl7.org/CodeSystem/data-absent-reason",
                    "code" : "unknown",
                    "display" : "unknown"
                  }
                ]
              }
            ]
          }
        ]
        ...
        ~~~

   - *required* binding strength (CodeableConcept or code datatypes):
      - use the appropriate "unknown" concept code from the value set if available
      - if the value set does not have the appropriate “unknown” concept code you must use a concept from the value set otherwise the instance will not be conformant

        - For the US Core profiles, the following mandatory <span class="bg-success" markdown="1">or conditionally mandatory*</span><!-- new-content --> status elements with required binding have no appropriate "unknown" concept code:
          - `AllergyIntolerance.clinicalStatus`*
          - `Condition.clinicalStatus`*
          - `DocumentReference.status`
          - `Immunization.status`
          - `Goal.lifecycleStatus`

        *The clinicalStatus element is <span class="bg-success" markdown="1">conditionally mandatory based on resource specific constraints.</span><!-- new-content -->

        If one of these status code is missing, a `404` http error code and an OperationOutcome **SHALL** be returned in response to a read transaction on the resource. If returning a response to a search, the problematic resource **SHALL** be excluded from the search set and a *warning* OperationOutcome **SHOULD** be included indicating that additional search results were found but could not be compliantly expressed and have been suppressed.

### FHIR RESTful Search API Requirements

The [FHIR RESTful Search API] requires that servers that support search **SHALL** support the http `POST` based search. However, for all the supported search interactions in this guide, servers SHALL also support the `GET` based search.

- When searching using the `token` type searchparameter  [(how to search by token)]
    - The client **SHALL** provide at least a code value and **MAY** provide both the system and code values.
    - The server **SHALL** support both.
- When searching using the `reference` type searchparameter  [(how to search by reference)]
    - The client **SHALL** provide at least a id value and **MAY** provide both the Type and id values.
    - The server **SHALL** support both.
- When searching using the `date` type searchparameter [(how to search by date)]:
    - The client **SHALL** provide values precise to the *day* for elements of datatype `date` and to the *second + time offset* for elements of datatype `dateTime`.
    - The server **SHALL** support values precise to the *day* for elements of datatype `date` and  to the *second + time offset* for elements of datatype `dateTime`.

    The table below summarizes the date precision:

    |SearchParameter|Element Datatype|Minimum Date Precision|Example|
    |---|----|---|---|
    |date|date|day|`GET [base]/Patient?family=Shaw&birthdate=2007-03-20`|
    |date|dateTime, Period|second + time offset|`GET [base]Observation?patient=555580&category=laboratory&date=ge2018-03-14T00:00:00-08:00`|
    {:.grid}

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
- For "entered-in-error" status, see the [guidance](#representing-entered-in-error-information) above.

<br />

{% include link-list.md %}
