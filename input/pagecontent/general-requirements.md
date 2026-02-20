
This page documents requirements common to all US Core actors in this guide. The conformance verbs - **SHALL**, **SHOULD**, **MAY** - used in this guide are defined in [FHIR Conformance Rules].

<!-- This page defines how CapabilityStatements are used and the expectations for mandatory and Must Support elements in the US Core Profiles. It provides guidance on how a system may support *only* the resources as profiled by US Core to represent clinical information (Profile Support) versus a system claiming conformance to *both* the US Core Profile content structure *and* the RESTful interactions defined for it (Profile Support + Interaction Support).  Note that the conformance verbs - **SHALL**, **SHOULD**, **MAY** - used in this guide are defined in [FHIR Conformance Rules]. -->


### US Core Conformance Artifacts

The [Profiles and Extensions] page lists the US Core Profiles defined for this implementation guide.  US Core Profile [StructureDefinitions] define the *minimum* elements, extensions, vocabularies, and ValueSets that **SHALL** be present and constrains how the elements are used when using the profile. Each US Core Profile page has a "Quick Start" guide to the supported FHIR RESTful transactions for each profile.

The US Core Profile elements include *Mandatory*, *Must Support*, and *Additional USCDI Requirements*.  Mandatory elements are required and have a minimum cardinality of 1 (min=1). Must Support element Server and Client expectations are defined by US Core. Additional USCDI Requirements elements are neither Mandatory nor Must Support but designated USCDI Requirements for ASTP Health IT Certification and, for certified systems, are equivalent to Must Support elements. All Mandatory, Must Support, or Additional USCDI Requirements are in scope for [ASTP Health IT Certification] (g(10) certification) testing. The [Must Support] page defines the Server and Client expectations for processing these different element requirements and illustrates how they are displayed and documented.

The [Capability Statements] page outlines conformance requirements and expectations for the US Core Servers and Client applications. In addition, the [US Core Server CapabilityStatement] and [US Core Client CapabilityStatement] identify the specific profiles and RESTful transactions that need support. The US Core Profiles identify the structural constraints, terminology bindings, and invariants.  Similarly, each US Core SearchParameter and Operation resource specify how the Server understands them. However, implementers must refer to the CapabilityStatement for details on the RESTful transactions, specific profiles, and the search parameters applicable to each US Core actor.

<div class="bg-success" markdown="1">
The [Requirements Table] and [Requirements Resource][Capability Statements] list the requirements defined in the US Core Implementation Guide's narrative sections. The <sup>[§](#.html)</sup> footnote associated with a narrative section’s sentence, phrase, or bullet indicates a requirement and links to the requirement in the requirements table.
</div><!-- new-content -->

### Conforming to US Core

There are two different ways to implement US Core:

1. Profile Only Support:  Systems may support *only* the US Core Profiles to represent clinical information.
1. Profile Support + Interaction Support: Systems may support *both* the US Core Profile content structure *and* the RESTful interactions defined for a resource.

#### Profile Only Support

Systems may deploy and support one or more US Core Profiles to represent clinical information. They use the profile's content model without any expectations to implement the US Core interactions.

An example scenario would be a Server using only the [FHIR Bulk Data Access (Flat FHIR)] approach to export the US Core Data for Interoperability resources.  For this Server, the US Core interactions are unnecessary.

To support a US Core Profile, a Server:

- **SHALL** Be able to populate all profile data elements that are mandatory and flagged as Must Support as defined by that profile's StructureDefinition.<sup>[§][CONF-0001]</sup>
- **SHOULD** declare support for a US Core Profile by including its official URL in the Server's `CapabilityStatement.rest.resource.supportedProfile` element.<sup>[§][CONF-0002]</sup>
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

Servers may deploy and support one or more US Core Profiles to represent clinical information<sup>[§][CONF-0003]</sup> *and* one or more of the following US Core interactions:

- "Quick Start" defined for each Profile<sup>[§][CONF-0004]</sup>
- [Clinical Notes]<sup>[§][CONF-0005]</sup>
- [Medication List]<sup>[§][CONF-0006]</sup>
- [Basic Provenance]<sup>[§][CONF-0007]</sup>
- [Screening and Assessments]<sup>[§][CONF-0008]</sup>

Servers implementing both can claim conformance to the US Core Profile content structure and the RESTful interactions defined by implementing all or parts of the US Core CapabilityStatement into their capabilities as described below.<sup>[§][CONF-0009],[§][CONF-0010]</sup>
A Server that certifies to the [21st Century Cures Act for accessing patient data] **SHALL** implement all components in the USCDI and the US Core CapabilityStatement.<sup>[§][CONF-0011],[§][CONF-0012]</sup>

##### Claiming conformance to a US Core Profile

 A conformant Server:


- **SHALL** Be able to populate all profile data elements that are mandatory and/or flagged as Must Support as defined by that profile's StructureDefinition.<sup>[§][CONF-0013]</sup>
- **SHOULD** declare conformance with the [US Core Server CapabilityStatement] by including its official URL in the Server's `CapabilityStatement.instantiates` element: `http://hl7.org/fhir/us/core/CapabilityStatement/us-core-Server`<sup>[§][CONF-0014]</sup>

- **SHALL** specify the full capability details from the US Core CapabilityStatement it claims to implement.<sup>[§][CONF-0015]</sup>
    - Declare support for the US Core Profile by including its official URL in the Server's `CapabilityStatement.rest.resource.supportedProfile` element.<sup>[§][CONF-0016]</sup>
      - the US Core Profile's official or "canonical" URL is located on each US Core Profile page.
    - Declare support for the US Core Profile's FHIR RESTful transactions.<sup>[§][CONF-0017]</sup>
      - The FHIR RESTful transactions for the US Core Profiles are documented in the "Quick Start" section on every profile page.


    Example CapabilityStatement snippet for a Server conforming to the US Core Patient Profile:

    {% include examplebutton_default.html example="conform-patient" b_title = "Click Here for an example CapabilityStatement snippet for a Server conforming to the US Core Patient Profile:" %}

### Using Codes in US Core Profiles

The following rules summarize the requirements defined by [FHIR Terminology] for coded elements (CodeableConcept, Coding, and code datatypes).

#### Required Bindings For Coded Elements

[Required binding] to a ValueSet definition means that one of the codes from the specified ValueSet **SHALL** be used. For `CodeableConcept`, which permits multiple codings and a text element, this rule applies to *at least* one of the codings, and text only is *not* valid.<sup>[§][CONF-0018],[§][CONF-0019],[§][CONF-0020]</sup>

For example, the [US Core AllergyIntolerance Profile] `clinicalStatus` element has a required binding to the AllergyIntoleranceClinicalStatusCodes ValueSet. Therefore, when claiming conformance to this profile:

- US Core Responders **SHALL** provide a code *exclusively* from this ValueSet in  `AllergyIntolerance.clinicalStatus.code`.<sup>[§][CONF-0021]</sup>
- US Core Requestors **SHALL** be capable of processing the code in `AllergyIntolerance.clinicalStatus.code`.<sup>[§][CONF-0022]</sup>

  {% include img.html img="Must_Support_AllergyIntolerance_clinicalStatus.png" caption="Figure 1: US Core AllergyIntolerance.clinicalStatus" %}

#### Required Bindings When Slicing by ValueSets

FHIR profiles use [slicing] when a coded element is a repeating elements and a particular ValueSet is desired for at least one of the repeats. To enforce this constraint, the ValueSet binding must be required to ensure that the slicing logic is unambiguous, consistent, and valid.  When the slicing is "open" and the defined slice has a minimum cardinality of one, the slice with a code from the value set is mandatory.  However, When the slicing is "open" and the defined slice has a minimum cardinality of zero, other slices with other codes are allowed when no suitable code exists in the defined slices. This is functionally equivalent to an Extensible Binding described below. Note that slicing by valueset does not affect the over the wire structure or validation of instances of these resources. The example in Figure 2 below illustrates this structure for the repeating `DocumentReference.category` element:

- The category element requires at least one and allows multiple DocumentReference categories.
- The defined category:uscore "slice" element allows zero to many concepts from the required ValueSet, US Core DocumentReference Category.
- Servers can use a category code outside the required ValueSet when it does not contain a suitable concept


  {% include img.html img="Must_Support_DocumentReference_category.png" caption="Figure 2: US Core DocumentReference.category" %}

#### Extensible Binding for Coded Elements

[Extensible Binding]  means that one of the codes from the specified ValueSet **SHALL** be used if an applicable concept is present.<sup>[§][CONF-0023]</sup>  If no suitable code exists in the ValueSet, alternate code(s) may be provided.<sup>[§][CONF-0024]</sup>  For `CodeableConcept`, which permits multiple codings and a text element, this rule applies to *at least* one of the codings.<sup>[§][CONF-0025]</sup> If only text is available and it has no conceptual overlap with the bound coded values, then just text may be used.<sup>[§][CONF-0026]</sup>

The [US Core AllergyIntolerance Profile] illustrates the extensible binding rules for the CodeableConcept datatype.  The `AllergyIntolerance.code` element has an extensible binding to the VSAC ValueSet "Common substances for allergy and intolerance documentation including refutations" Allergy. When claiming conformance to this profile:

- US Core Responders **SHALL** provide:<sup>[§][CONF-00]</sup>
  - A code from this valueset in `AllergyIntolerance.code.code` *if the concept exists* in the ValueSet
  - Or an alternative code *if the concept does not exist* in the ValueSet
  - Or text in `AllergyIntolerance.code. text' if only text is available.
- US Core Requestors **SHALL** be capable of processing the code in `AllergyIntolerance.code.code` or text in `AllergyIntolerance.code.text`<sup>[§][CONF-0028]</sup>

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

Alternate codes may be provided in addition to the standard codes defined in required or extensible ValueSets. These alternate codes are called "additional codings".<sup>[§][CONF-0029]</sup> They may be equivalent to or narrower in meaning than the standard concept code.<sup>[§][CONF-0030]</sup>

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
    //NOTE: this is a additional coding to a different code system (SNOMED CT)
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

A FHIR [modifier element] is an element that modifies the meaning of a resource element. Although Servers and Clients **SHALL** be able to process [Mandatory] or [Must Support] elements, not all modifier elements are Mandatory or Must Support, and there is no requirement for supporting them.<sup>[§][CONF-0031],[§][CONF-0032],[§][CONF-0033]</sup> Therefore, FHIR Clients need to be aware of unexpected modifier elements in the data they receive because they can alter the meaning of the data and can potentially lead to errors or even security risks if not properly handled. In addition, modifiers can be introduced when the data is created, edited, or transmitted, so it is crucial to ensure that all modifiers are understood and handled correctly.

In addition to declaring which US Core profiles they support, Servers **MAY** communicate a system-wide profile in their CapabilityStatement to identify which additional elements, including modifier elements, they support.<sup>[§][CONF-0034]</sup> However, systems are free to include other data elements - and receivers **SHOULD** accept instances that even contain unexpected data elements *except* when those elements are modifier elements.<sup>[§][CONF-0035],[§][CONF-0036]</sup> Unless a Client determines they can process it safely, rejection is typically the only safe action if unexpected modifier elements are present.<sup>[§][CONF-0037]</sup> For example, an app or system may process modifier elements nested inside an ignored element or in a resource only for human review.

Some examples of modifiers that are not Must Support elements in US Core Profiles include:

- `implicitRules` element common to all profiles
- `modifierExtension` element common to all profiles
- `Observation.value[x].comparator`
- `Practitioner.identifier.use`
- `Patient.active`

Implementers **SHOULD** review the "Key Elements Tab" on the US Core profile pages.<sup>[§][CONF-0038]</sup> This view lists all the Must Support and modifier elements for a profile, as demonstrated in the figure below.

 {% include img.html img="modifier-element-view.png" caption="Figure 5: Modifier Elements Listed in Key Element View" %}

### Missing Data

There are situations when information on a particular data element is missing, and the source system does not know the reason for the absence of data. If the source system does not have data for an element with a minimum cardinality = 0 (including elements labeled *Must Support*), the data element **SHALL** be omitted from the resource.<sup>[§][CONF-0039]</sup> However, if the data element is a *Mandatory* element (in other words, where the minimum cardinality is > 0), it **SHALL** be present *even if* the source system does not have data.<sup>[§][CONF-0040]</sup> The core specification guides what to do in this situation, which is summarized below:

1.  For *non-coded* data elements, use the [DataAbsentReason Extension] in the data type.
  - Use the code `unknown` - The value is expected to exist but is not known.<sup>[§][CONF-0041]</sup>

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
      - If the source system has text but no coded data, only the `text` element is used.<sup>[§][CONF-0042]</sup>
          - For Coding datatypes, the text-only data is represented as a `display` element.<sup>[§][CONF-0043]</sup>
      - If there is neither text nor coded data:
        - Use the appropriate "unknown" concept code from the ValueSet if available.<sup>[§][CONF-0044]</sup>
        - If the ValueSet does not have the appropriate "unknown" concept code, use `unknown` from the [DataAbsentReason Code System].<sup>[§][CONF-0045]</sup>



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
      - use the appropriate "unknown" concept code from the ValueSet if available.<sup>[§][CONF-0046]</sup>
      - if the ValueSet does not have the appropriate "unknown" concept code, you must use a concept from the ValueSet. Otherwise, the instance will not be conformant.<sup>[§][CONF-0047]</sup>

        - For the US Core profiles, the following mandatory or conditionally mandatory* status elements with required binding have no appropriate "unknown" concept code:
          - `AllergyIntolerance.clinicalStatus`*
          - `Condition.clinicalStatus`*
          - `DocumentReference.status`
          - `Immunization.status`
          - `Goal.lifecycleStatus`

        *The `clinicalStatus` element is conditionally mandatory based on resource-specific constraints.

        If any of these status codes is missing, a `404` HTTP error code and an OperationOutcome **SHALL** be returned in response to a read transaction on the resource.<sup>[§][CONF-0048]</sup> If returning a response to a search, the problematic resource **SHALL** be excluded from the search set, and a *warning* OperationOutcome **SHOULD** be included indicating that other search results were found but could not be compliantly expressed and have been suppressed.<sup>[§][CONF-0049],[§][CONF-0049]</sup>

### FHIR RESTful Search API Requirements

The [FHIR RESTful Search API] requires that Servers that support search **SHALL** support the HTTP `POST`-based search.<sup>[§][CONF-0051]</sup> For all the supported search interactions in this guide, Servers **SHALL** also support the `GET`-based search.<sup>[§][CONF-0052]</sup>

- When searching using the `token` type searchparameter  [(how to search by token)]
    - The Client **SHALL** provide at least a code value and **MAY** provide both the system and code values.<sup>[§][CONF-0053],[§][CONF-0054]</sup>
    - The Server **SHALL** support both.<sup>[§][CONF-0055]</sup>
- When searching using the `reference` type searchparameter  [(how to search by reference)]
    - The Client **SHALL** provide at least an id value and **MAY** provide both the Type and id values.<sup>[§][CONF-0056],[§][CONF-0057]</sup>
    - The Server **SHALL** support both.<sup>[§][CONF-0058]</sup>
- When searching using the `date` type searchparameter [(how to search by date)]:
    - The Client **SHALL** provide values precise to the *day* for elements of datatype `date` and to the *second + time offset* for elements of datatype `dateTime`.<sup>[§][CONF-0059],[§][CONF-0060]</sup>
    - The Server **SHALL** support values precise to the *day* for elements of datatype `date` and  to the *second + time offset* for elements of datatype `dateTime`.<sup>[§][CONF-0061],[§][CONF-0062]</sup>

    The table below summarizes the date precision:

    |SearchParameter|Element Datatype|Minimum Date Precision|Example|
    |---|----|---|---|
    |date|date|day|`GET [base]/Patient?family=Shaw&birthdate=2007-03-20`|
    |date|dateTime, Period|second + time offset|`GET [base]Observation?patient=555580&category=laboratory&date=ge2018-03-14T00:00:00-08:00`|
    {:.grid}

### Search for Servers Requiring Status

Servers are *strongly* encouraged to support a query for resources *without* requiring a status parameter.  However, if business requirements prohibit this, they **SHALL** follow the guidelines here.<sup>[§][CONF-0063],[§][CONF-0064]</sup>
{: .highlight-note}

For searches where the Client does not supply a status parameter, an implementation's business rules may override the FHIR RESTful search expectations and require a status parameter to be provided.<sup>[§][CONF-0065]</sup>  These systems are allowed to reject such requests as follows:

- **SHALL** return an HTTP `400` status.<sup>[§][CONF-0066]</sup>
- **SHALL** return an [OperationOutcome] specifying that status(es) must be present.<sup>[§][CONF-0067]</sup>
- **SHALL** support search with status if status required.<sup>[§][CONF-0068]</sup>
- **SHALL NOT** restrict search results ( i.e., apply 'hidden' filters) when a Client includes status parameters in the query.<sup>[§][CONF-0069]</sup>
  - If a system doesn't support a specific status code value that is queried, it  **SHOULD** return an HTTP `200` status with a search bundle.<sup>[§][CONF-0070]</sup> The search bundle **SHOULD** contain resources matching the search criteria *and* an OperationOutcome warning the Client which status code value is not supported.<sup>[§][CONF-0071],[§][CONF-0072]</sup>

   - For example, in a query enumerating all the `AllergyIntolerance.verificationStatus` statuses to a system that supports concepts `unconfirmed`, `confirmed`, and `entered-in-error` but not the concept `refuted`, the search parameter refers to an unsupported code since `refuted` is not known to the Server.

     {% include examplebutton_default.html example="missing-status" b_title = "Click Here to See a Rejected Search Due to Missing Status Example" %}

- **SHALL** document this behavior in its CapabilityStatement for the "search-type" interaction in `CapabilityStatement.rest.resource.interaction.documentation`.<sup>[§][CONF-0093]</sup>
- For "entered-in-error" status, see the [representing entered in error information](general-guidance.html#representing-entered-in-error-information) section.

<br />

{% include link-list.md %}
