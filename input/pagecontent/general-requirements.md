
This page documents requirements common to all US Core actors in this guide. The conformance verbs - **SHALL**, **SHOULD**, **MAY** - used in this guide are defined in [FHIR Conformance Rules].

<!-- This page defines how CapabilityStatements are used and the expectations for mandatory and Must Support elements in the US Core Profiles. It provides guidance on how a system may support *only* the resources as profiled by US Core to represent clinical information (Profile Support) versus a system claiming conformance to *both* the US Core Profile content structure *and* the RESTful interactions defined for it (Profile Support + Interaction Support).  Note that the conformance verbs - **SHALL**, **SHOULD**, **MAY** - used in this guide are defined in [FHIR Conformance Rules]. -->


### US Core Conformance Artifacts

The [Profiles and Extensions] page lists the US Core Profiles defined for this implementation guide.  US Core Profile [StructureDefinitions] define the *minimum* elements, extensions, vocabularies, and ValueSets that **SHALL** be present and constrains how the elements are used when using the profile. Each US Core Profile page has a "Quick Start" guide to the supported FHIR RESTful transactions for each profile.

The US Core Profile elements include *Mandatory*, *Must Support*, and *Additional USCDI Requirements*.  Mandatory elements are required and have a minimum cardinality of 1 (min=1). Must Support element Server and Client expectations are defined by US Core. Additional USCDI Requirements elements are neither Mandatory nor Must Support but designated USCDI Requirements for ASTP Health IT Certification and, for certified systems, are equivalent to Must Support elements. All Mandatory, Must Support, or Additional USCDI Requirements are in scope for [ASTP Health IT Certification] (g(10) certification) testing. The [Must Support] page defines the Server and Client expectations for processing these different element requirements and illustrates how they are displayed and documented.

The [Capability Statements] page outlines conformance requirements and expectations for the US Core Servers and Client applications. In addition, the [US Core Server CapabilityStatement] and [US Core Client CapabilityStatement] identify the specific profiles and RESTful transactions that need support. The US Core Profiles identify the structural constraints, terminology bindings, and invariants.  Similarly, each US Core SearchParameter and Operation resource specify how the Server understands them. However, implementers must refer to the CapabilityStatement for details on the RESTful transactions, specific profiles, and the search parameters applicable to each US Core actor.

### Conforming to US Core

There are two different ways to implement US Core:

1. Profile Only Support:  Systems may support *only* the US Core Profiles to represent clinical information.
1. Profile Support + Interaction Support: Systems may support *both* the US Core Profile content structure *and* the RESTful interactions defined for a resource.

#### Profile Only Support

Systems may deploy and support one or more US Core Profiles to represent clinical information. They use the profile's content model without any expectations to implement the US Core interactions.

An example scenario would be a Server using only the [FHIR Bulk Data Access (Flat FHIR)] approach to export the US Core Data for Interoperability resources.  For this Server, the US Core interactions are unnecessary.

To support a US Core Profile, a Server:

- **SHALL** Be able to populate all profile data elements that are mandatory and flagged as Must Support as defined by that profile's StructureDefinition.
- **SHOULD** declare support for a US Core Profile by including its official URL in the Server's `CapabilityStatement.rest.resource.supportedProfile` element.
    - The US Core Profile's official or "canonical" URL is located on each US Core Profile page

      example CapabilityStatement snippet for a Server supporting the US Core Patient Profile:
      ~~~
      {
        "resourceType": "CapabilityStatement",
        ...
        "rest": [
          {
            "mode": "Server",
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

Servers may deploy and support one or more US Core Profiles to represent clinical information *and* one or more of the following US Core interactions: 

- "Quick Start" defined for each Profile
- [Clinical Notes]
- [Medication List]
- [Basic Provenance]
- [Screening and Assessments]

Servers implementing both can claim conformance to the US Core Profile content structure and the RESTful interactions defined by implementing all or parts of the US Core CapabilityStatement into their capabilities as described below.
A Server that certifies to the [21st Century Cures Act for accessing patient data] must implement all components in the USCDI and the US Core CapabilityStatement.

##### Claiming conformance to a US Core Profile

 A conformant Server:


- **SHALL** Be able to populate all profile data elements that are mandatory and/or flagged as Must Support as defined by that profile's StructureDefinition.
- **SHOULD** declare conformance with the [US Core Server CapabilityStatement] by including its official URL in the Server's `CapabilityStatement.instantiates` element: `http://hl7.org/fhir/us/core/CapabilityStatement/us-core-Server`

- **SHALL** specify the full capability details from the US Core CapabilityStatement it claims to implement.
    - Declare support for the US Core Profile by including its official URL in the Server's `CapabilityStatement.rest.resource.supportedProfile` element.
      - the US Core Profile's official or "canonical" URL is located on each US Core Profile page.
    - Declare support for the US Core Profile's FHIR RESTful transactions.
      - The FHIR RESTful transactions for the US Core Profiles are documented in the "Quick Start" section on every profile page.
 

    Example CapabilityStatement snippet for a Server conforming to the US Core Patient Profile:

    {% include examplebutton_default.html example="conform-patient" b_title = "Click Here for an example CapabilityStatement snippet for a Server conforming to the US Core Patient Profile:" %}

### Using Codes in US Core Profiles

The following rules summarize the requirements defined by [FHIR Terminology] for coded elements (CodeableConcept, Coding, and code datatypes).

#### Required Bindings For Coded Elements

[Required binding] to a ValueSet definition means that one of the codes from the specified ValueSet **SHALL** be used. For `CodeableConcept`, which permits multiple codings and a text element, this rule applies to *at least* one of the codings, and only text is *not* valid.

For example, the [US Core AllergyIntolerance Profile] `clinicalStatus` element has a required binding to the AllergyIntoleranceClinicalStatusCodes ValueSet. Therefore, when claiming conformance to this profile:

- US Core Responders **SHALL** provide a code *exclusively* from this ValueSet in  `AllergyIntolerance.clinicalStatus.code`.
- US Core Requestors **SHALL** be capable of processing the code in `AllergyIntolerance.clinicalStatus.code`.

  {% include img.html img="Must_Support_AllergyIntolerance_clinicalStatus.png" caption="Figure 1: US Core AllergyIntolerance.clinicalStatus" %}

#### Required Bindings When Slicing by ValueSets

FHIR profiles use [slicing] when a coded element is a repeating elements and a particular ValueSet is desired for at least one of the repeats. To enforce this constraint, the ValueSet binding must be required to ensure that the slicing logic is unambiguous, consistent, and valid.  When the slicing is "open" and the defined slice has a minimum cardinality of one, the slice with a code from the value set is mandatory.  However, When the slicing is "open" and the defined slice has a minimum cardinality of zero, other slices with other codes are allowed when no suitable code exists in the defined slices. This is functionally equivalent to an Extensible Binding described below. Note that slicing by valueset does not affect the over the wire structure or validation of instances of these resources. The example in Figure 2 below illustrates this structure for the repeating `DocumentReference.category` element:

- The category element requires at least one and allows multiple DocumentReference categories.
- The defined category:uscore "slice" element allows zero to many concepts from the required ValueSet, US Core DocumentReference Category.
- Servers can use a category code outside the required ValueSet when it does not contain a suitable concept


  {% include img.html img="Must_Support_DocumentReference_category.png" caption="Figure 2: US Core DocumentReference.category" %}

#### Extensible Binding for Coded Elements

[Extensible Binding]  means that one of the codes from the specified ValueSet **SHALL** be used if an applicable concept is present.  If no suitable code exists in the ValueSet, alternate code(s) may be provided.  For `CodeableConcept`, which permits multiple codings and a text element, this rule applies to *at least* one of the codings. If only text is available and it has no conceptual overlap with the bound coded values, then just text may be used.

The [US Core AllergyIntolerance Profile] illustrates the extensible binding rules for the CodeableConcept datatype.  The `AllergyIntolerance.code` element has an extensible binding to the VSAC ValueSet "Common substances for allergy and intolerance documentation including refutations" Allergy. When claiming conformance to this profile:

- US Core Responders **SHALL** provide:
  - A code from this valueset in `AllergyIntolerance.code.code` *if the concept exists* in the ValueSet
  - Or an alternative code *if the concept does not exist* in the ValueSet
  - Or text in `AllergyIntolerance.code. text' if only text is available.
- US Core Requestors **SHALL** be capable of processing the code in `AllergyIntolerance.code.code` or text in `AllergyIntolerance.code.text`

  {% include img.html img="Must_Support_AllergyIntolerance_code.png" caption="Figure 3: US Core AllergyIntolerance.code" %}



#### Current Binding for Coded Elements

The FHIR rules for extensible bindings state that *all conceptual overlaps*, including free text, should be mapped to the coded values in the bindings. US Core adopts the [current] additional binding from FHIR R5 for more flexibility in exchanging legacy and text-only data. The current binding requires newly recorded, non-legacy data to be drawn from the value set.

For example, the [US Core Procedure Codes] and  [US Core Condition Codes] ValueSets cover the entire domain. For data not captured by fine-grained code, it is possible to provide a high-level abstract code, such as SNOMED CT "Procedure". Therefore, instead of requiring systems to map all legacy and text data to standard codes, the value set uses a "current" binding
 
<div class="stu-note" markdown="1">

The "current" binding corresponds to the US Core's interpretation of extensible bindings US Core version 6.1.0 and earlier.
</div><!-- stu-note -->

  {% include img.html img="Must_Support_Condition_code.png" caption="Figure 4: US Core Condition Problems and Health Concerns.code" %}



### Using multiple codes with CodeableConcept Datatype
{:.no_toc #translations}

Alternate codes may be provided in addition to the standard codes defined in required or extensible ValueSets. These alternate codes are called "additional codings". They may be equivalent to or narrower in meaning than the standard concept code.

Example of additional codings for Body Weight concept code.

~~~
    "code": {
        "coding": [
         {
            "system": "http://loinc.org",  //NOTE: this is the standard concept defined in the ValueSet//
            "code": "29463-7",
            "display": "Body Weight"
          },
    //NOTE: this is a additional coding to a more specific concept
         {
            "system": "http://loinc.org",
            "code": "3141-9",
            "display": "Body Weight Measured"
          },
    //NOTE: this is a additional coding to a different code system (Snomed CT)
         {
            "system": "http://snomed.info/sct",
            "code": "364589006",
            "display": "Body Weight"
          }
    //NOTE: this is a additional coding to a locally defined code
         {
            "system": "http://AcmeHealthCare.org",
            "code": "BWT",
            "display": "Body Weight"
          }
        ],
        "text": "weight"
      },
~~~

Example of additional coding of CVX vaccine code to NDC code.

~~~
    "vaccineCode": {
        "coding": [
          {
            "system" : "{{site.data.fhir.path}}sid/cvx",
            "code": "158",
            "display": "influenza, injectable, quadrivalent"
          },
          {
            "system" : "{{site.data.fhir.path}}sid/ndc",
            "code": "49281-0623-78",
            "display" : "FLUZONE QUADRIVALENT"
          }
        ]
      },
~~~

### Modifier Elements

A FHIR [modifier element] is an element that modifies the meaning of a resource element. Although Servers and Clients **SHALL** be able to process  [Mandatory] or [Must Support] elements, not all modifier elements are  Mandatory or Must Support, and there is no requirement for supporting them. Therefore, FHIR Clients need to be aware of unexpected modifier elements in the data they receive because they can alter the meaning of the data and can potentially lead to errors or even security risks if not properly handled. In addition, modifiers can be introduced when the data is created, edited, or transmitted, so it is crucial to ensure that all modifiers are understood and handled correctly.

In addition to declaring which US Core profiles they support, Servers **MAY** communicate a system-wide profile in their CapabilityStatement to identify which additional elements, including modifier elements, they support. However, systems are free to include other data elements - and receivers **SHOULD** accept instances that even contain unexpected data elements *except* when those elements are modifier elements. Unless a Client determines they can process it safely, rejection is typically the only safe action if unexpected modifier elements are present. For example, an app or system may process modifier elements nested inside an ignored element or in a resource only for human review.

Some examples of modifiers that are not Must Support elements in US Core Profiles include:

- `implicitRules` element common to all profiles
- `modifierExtension` element common to all profiles
- `Observation.value[x].comparator`
- `Practitioner.identifier.use`
- `Patient.active`

Implementers **SHOULD** review the "Key Elements Tab" on the US Core profile pages. This view lists all the Must Support and modifier elements for a profile, as demonstrated in the figure below.

 {% include img.html img="modifier-element-view.png" caption="Figure 5: Modifier Elements Listed in Key Element View" %}

### Missing Data

There are situations when information on a particular data element is missing, and the source system does not know the reason for the absence of data. If the source system does not have data for an element with a minimum cardinality = 0 (including elements labeled *Must Support*), the data element **SHALL** be omitted from the resource. However, if the data element is a *Mandatory* element (in other words, where the minimum cardinality is > 0), it **SHALL** be present *even if* the source system does not have data. The core specification guides what to do in this situation, which is summarized below:

1.  For *non-coded* data elements, use the [DataAbsentReason Extension] in the data type
  - Use the code `unknown` - The value is expected to exist but is not known.

    Example: Patient resource where the patient name is not available.

    ~~~
    {
      "resourceType": "Patient",
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
            "telecom":
            ...
         }
    ~~~

1. For *coded* data elements:
   - *example*, *preferred*, or *extensible* binding strengths (CodeableConcept or Coding datatypes):
      - If the source system has text but no coded data, only the `text` element is used.
          - For Coding datatypes, the text-only data is represented as a `display` element.
      - If there is neither text nor coded data:
        - Use the appropriate "unknown" concept code from the ValueSet if available.
        - If the ValueSet does not have the appropriate "unknown" concept code, use `unknown` from the [DataAbsentReason Code System].

      

        Example: CareTeam resource where the mandatory `CareTeam.participant.role` value is unknown.
        ~~~
        ...
        "participant": [
            {
                "role": [
                    {
                        "coding": [
                            {
                                "url": "http://hl7.org/fhir/StructureDefinition/data-absent-reason",
                                "code": "unknown",
                                "display": "unknown"
                            }
                        ]
                    }
                ],
                "member": {
                    "reference": "Practitioner/practitioner-1",
                    "display": "Ronald Bone, MD"
                }
            },
        ...
        ~~~


   - *required* binding strength (CodeableConcept or code datatypes):
      - use the appropriate "unknown" concept code from the ValueSet if available
      - if the ValueSet does not have the appropriate "unknown" concept code, you must use a concept from the ValueSet. Otherwise, the instance will not be conformant

        - For the US Core profiles, the following mandatory or conditionally mandatory* status elements with required binding have no appropriate "unknown" concept code:
          - `AllergyIntolerance.clinicalStatus`*
          - `Condition.clinicalStatus`*
          - `DocumentReference.status`
          - `Immunization.status`
          - `Goal.lifecycleStatus`

        *The `clinicalStatus` element is conditionally mandatory based on resource-specific constraints.

        If any of these status codes is missing, a `404` HTTP error code and an OperationOutcome **SHALL** be returned in response to a read transaction on the resource. If returning a response to a search, the problematic resource **SHALL** be excluded from the search set, and a *warning* OperationOutcome **SHOULD** be included indicating that other search results were found but could not be compliantly expressed and have been suppressed.

### FHIR RESTful Search API Requirements

The [FHIR RESTful Search API] requires that Servers that support search **SHALL** support the HTTP `POST`-based search. For all the supported search interactions in this guide, Servers **SHALL** also support the `GET`-based search.

- When searching using the `token` type searchparameter  [(how to search by token)]
    - The Client **SHALL** provide at least a code value and **MAY** provide both the system and code values.
    - The Server **SHALL** support both.
- When searching using the `reference` type searchparameter  [(how to search by reference)]
    - The Client **SHALL** provide at least an id value and **MAY** provide both the Type and id values.
    - The Server **SHALL** support both.
- When searching using the `date` type searchparameter [(how to search by date)]:
    - The Client **SHALL** provide values precise to the *day* for elements of datatype `date` and to the *second + time offset* for elements of datatype `dateTime`.
    - The Server **SHALL** support values precise to the *day* for elements of datatype `date` and  to the *second + time offset* for elements of datatype `dateTime`.

    The table below summarizes the date precision:

    |SearchParameter|Element Datatype|Minimum Date Precision|Example|
    |---|----|---|---|
    |date|date|day|`GET [base]/Patient?family=Shaw&birthdate=2007-03-20`|
    |date|dateTime, Period|second + time offset|`GET [base]Observation?patient=555580&category=laboratory&date=ge2018-03-14T00:00:00-08:00`|
    {:.grid}

### Search for Servers Requiring Status

Servers are *strongly* encouraged to support a query for resources *without* requiring a status parameter.  However, if business requirements prohibit this, they **SHALL** follow the guidelines here.
{: .highlight-note}

For searches where the Client does not supply a status parameter, an implementation's business rules may override the FHIR RESTful search expectations and require a status parameter to be provided.  These systems are allowed to reject such requests as follows:

- **SHALL** return an HTTP `400` status
- **SHALL** return an [OperationOutcome] specifying that status(es) must be present.
- **SHALL** support search with status if status required
- **SHALL NOT** restrict search results ( i.e., apply 'hidden' filters) when a Client includes status parameters in the query.
  - If a system doesn't support a specific status code value that is queried, it  **SHOULD** return an HTTP `200` status with a search bundle. The search bundle **SHOULD** contain resources matching the search criteria *and* an OperationOutcome warning the Client which status code value is not supported.

   - For example, in a query enumerating all the `AllergyIntolerance.verificationStatus` statuses to a system that supports concepts `unconfirmed`, `confirmed`, and `entered-in-error` but not the concept `refuted`, the search parameter refers to an unsupported code since `refuted` is not known to the Server.

     {% include examplebutton_default.html example="missing-status" b_title = "Click Here to See a Rejected Search Due to Missing Status Example" %}

- **SHALL** document this behavior in its CapabilityStatement for the "search-type" interaction in `CapabilityStatement.rest.resource.interaction.documentation`.
- For "entered-in-error" status, see the [representing entered in error information](general-guidance.html#representing-entered-in-error-information) section.

<br />

{% include link-list.md %}
