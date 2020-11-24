
This section outlines important definitions, interpretations, and requirements common to all US Core actors used in this guide.
The conformance verbs - **SHALL**, **SHOULD**, **MAY** - used in this guide are defined in [FHIR Conformance Rules].

The base [FHIR Must Support] guidance requires specifications define exactly the support expected for elements labeled *Must Support*.  

This page defines the rules for interpreting profile elements and subelements labeled *Must Support* for requesters and responders.

### Presentation of Must Support and Mandatory Elements in the Formal Profile Views

Each profile provides a several different formal views of all the must support elements in a tree format under tabs labeled "Differential Table",  "Snapshot Table", and "Snapshot Table (Must Support)".  In the "Differential Table" view all the must support elements defined for the profile are flagged with an <span style="padding-left: 3px; padding-right: 3px; color: white; background-color: red" title="This element must be supported">S</span>. An example of this is illustrated in figure 1.

  {% include img.html img="Must_Support_Differential_View.png" caption="Figure 1: Differential Table View" %}

In the "Snapshot Table" view in Figure 2, all the must support elements defined for the profile , and any mandatory or must support elements inherited from a base profile (e.g. [US Core Body Height Profile] based on [Vital Signs Profile]), are flagged with an <span style="padding-left: 3px; padding-right: 3px; color: white; background-color: red" title="This element must be supported">S</span>. An example of the "Snapshot Table" is shown in figure 2.

  {% include img.html img="Must_Support_Snapshot_View.png" caption="Figure 2: Snapshot Table View" %}

 In the "Snapshot Table (Must Support)" view, all the elements presented in the view are either mandatory or must support elements for conformance to the profile . These elements are defined in the US Core Profile, mandatory elements inherited from the base specification and, for the US Core Vital Signs profiles, any mandatory or must support elements inherited from the FHIR base Vital Signs profile. An example of the "Snapshot Table (Must Support)" is shown in figure 3.

  {% include img.html img="Must_Support_MS_View.png" caption="Figure 3: 'Must Support' View" %}

### Claiming Conformance to a US Core Profile

To claim conformance to a US Core Profile US Core Servers **SHALL**:

  - Be able to populate all profile data elements that mandatory - in other words, have a minimum cardinality >= 1 -  and/or flagged as *Must Support* as defined by that profile’s StructureDefinition.
  - Conform to the [US Core Server Capability Statement] expectations for that profile’s type.

### Mandatory Elements

  When an element is mandatory (min=1), the data is expected to always be present. Very rarely it may not be, and specific guidance is provided for [missing data].  The convention in this guide is to mark all min=1 elements as must support unless the are nested under optional element. An example of this is [`CarePlan.status`].

### Must Support Elements

For querying and reading US Core Profiles, *Must Support* on any profile data element **SHALL** be interpreted as follows (see the [Future of US Core] page for writing and updating US Core Profiles.) :

* US Core Responders **SHALL** be capable of populating all data elements as part of the query results as specified by the [US Core Server Capability Statement].
* US Core Requestors **SHALL** be capable of processing resource instances containing the data elements without generating an error or causing the application to fail. In other words US Core Requestors **SHOULD** be capable of displaying the data elements for human use or storing it for other purposes.
* In situations where information on a particular data element is not present and the reason for absence is unknown, US Core Responders **SHALL NOT** include the data elements in the resource instance returned as part of the query results.
* When querying US Core Responders, US Core Requestors **SHALL** interpret missing data elements within resource instances as data not present in the US Core Responder's system.
* In situations where information on a particular data element is missing and the US Core Responder knows the precise reason for the absence of data, US Core Responders **SHALL** send the reason for the missing information using values (such as nullFlavors) from the value set where they exist or using the dataAbsentReason extension.
* US Core Requestors **SHALL** be able to process resource instances containing data elements asserting missing information.

The terms *US Core Responder* Actor *US Core Requestor Actor* are used throughout the guide and typically refer to a server or a client.

Readers are advised to understand [FHIR Terminology] requirements, [FHIR RESTful API] based on the HTTP protocol, along with [FHIR Data Types], [FHIR Search] and [FHIR Resource] formats before implementing US Core requirements.


#### Must Support - Coded Elements
In addition the guidance provided by [FHIR Terminology], Coded elements (`CodeableConcept`, `Coding`, and `code` datatypes) marked as Must Support following the rules for their respective bindings.

##### Required bindings Coded Elements

[Required Binding] to a value set definition means that one of the codes from the specified value set **SHALL** be used. For `CodeableConcept` using only text is *not* valid, but multiple codings (translations) are permitted as is discussed below.

For example, the [US Core AllergyIntolerance Profile] clinicalStatus element has a required binding to the AllergyIntoleranceClinicalStatusCodes ValueSet. When claiming conformance to this profile:

- US Core Responders **SHALL** provide a code *exclusively* from this valueset in  `AllergyIntolerance.clinicalStatus.code`.
- US Core Requestors **SHALL** be capable of processing the code in `AllergyIntolerance.clinicalStatus.code`.

  {% include img.html img="Must_Support_AllergyIntolerance_clinicalStatus.png" caption="Figure 4: US Core AllergyIntolerance.clinicalStatus" %}

##### Extensible binding for CodeableConcept Datatype

[Extensible Binding] to a value set definition means that one of the codes from the specified value set **SHALL** be used if the concept applies, but if no suitable code exists in the value set, alternate code(s) may be provided in its place.  For `CodeableConcept` multiple codings are permitted and this rule applies to one of the codings.  Also for `CodeableConcept` if only text is available, then just text may be used.  

For example, the [US Core AllergyIntolerance Profile] code element has an extensible binding to the VSAC ValueSet "Common substances for allergy and intolerance documentation including refutations" Allergy. When claiming conformance to this profile:

- US Core Responders **SHALL** provide:
  - a code from this valueset in `AllergyIntolerance.code.code` *if the concept exists* in the value set
  - or an alternative code *if the concept does not exist* in the value set
  - or text in `AllergyIntolerance.code.text`if only text is available.
- US Core Requestors **SHALL** be capable of processing the code in `AllergyIntolerance.code.code` or text in `AllergyIntolerance.code.text`

  {% include img.html img="Must_Support_AllergyIntolerance_code.png" caption="Figure 5: US Core AllergyIntolerance.code" %}

##### Using multiple codes with CodeableConcept Datatype
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


##### Defined Pattern Elements

The StructureDefinitions define the US Core Profiles and the [ElementDefinition.pattern[x]] which is used almost exclusively for the CodeableConcept and Coding  datatypes. It specifies "a value that the value in the instance **SHALL** follow - that is, any value in the pattern must be found in the instance. Other additional values may be found too. This is effectively constraint by example."  If the element is marked as must support and defined by a pattern then the pattern defines the elements *and* element values that the server **SHALL** be capable of providing.

For example the [US Core DiagnosticReport Profile for Laboratory Results Reporting] category element is defined with a pattern requiring fixed values in DiagnosticReport.category.coding.system  and DiagnosticReport.category.coding.code for a Coding element. When claiming conformance to this profile:

- US Core Responders **SHALL** provide these values in a `DiagnosticReport.category`
- US Core Requestors **SHALL** be capable of processing these values `DiagnosticReport.category`

  {% include img.html img="Must_Support_DiagnosticReport_category.png" caption="Figure 6: US Core DiagnosticReport.category" %}

#### Must Support - Primitive Element

Primitive elements are are single elements with a primitive value. If they are marked as must support, then the server **SHALL** be capable of providing the element value to meet the must support requirement.

For example, the [US Core DiagnosticReport Profile] issued element is a primitive `instant` datatype. When claiming conformance to this profile:

- US Core Responders **SHALL** be capable of providing a value in a `DiagnosticReport.issued`
- US Core Requestors SHALL be capable of processing the value `DiagnosticReport.issued`

  {% include img.html img="Must_Support_DiagnosticReport_issued.png" caption="Figure 7: US Core DiagnosticReport.issued" %}

#### Must Support - Complex Elements

Complex element are composed of primitive and/or other complex elements.  This page provides guidance for the following complex datatypes:

- [`CodeableConcept`](#must-support---coded-elements)
- [`Coding`]((#must-support---coded-elements))
- [`Reference`](#must-support---resource-references)

For any complex element marked as must support, The server **SHALL** be capable of providing at least one of the sub-element values. If any sub-element is mark as must support it must meet the must support requirements as well and it satisfies the must support requirement for the parent element.

For example, the [US Core Laboratory Result Observation Profile] presentedForm element is labeled must support and has no must support sub-elements. When claiming conformance to this profile:

- US Core Responders **SHALL** be capable of providing a value in `DiagnosticReport.presentedForm` sub-element.
- US Core Requestors **SHALL** be capable of processing the value in `DiagnosticReport.presentedForm`.

  {% include img.html img="Must_Support_DiagnosticReport_presentedForm.png" caption="Figure 8: US Core DiagnosticReport.presentedForm" %}

For example, the [US Core Patient Profile] name element is labeled must support and has must support sub-elements "family" and "given". When claiming conformance to this profile:

- US Core Responders **SHALL** be capable of providing a value in `Patient.name.family` and `Patient.name.given`.
- US Core Requestors **SHALL** be capable of processing the value in value in `Patient.name.family` and `Patient.name.given`.

  {% include img.html img="Must_Support_Patient_name.png" caption="Figure 9: US Core Patient.name" %}

#### Must Support - Resource References

In certain profiles only specific resource references are labeled as *Must Support*.

For example, the [US Core DocumentReference Profile] author US Core Practitioner Profile is labeled *Must Support*. When claiming conformance to the [US Core DocumentReference Profile]:

* US Core Responders **SHALL** be capable of providing a DocumentReference.author with a valid reference to a US Core Practitioner Profile.
* US Core Requestors **SHALL** be capable of processing a DocumentReference.author with a valid reference to a US Core Practitioner Profile.

Systems can support other references but this is not a requirement of US Core.

{% include img.html img="Must_Support_DocumentReference.jpg" caption="Figure 10: US Core DocumentReference.author" %}

In certain profiles only a single resource reference is present on an element labeled *Must Support*.

For example, the [US Core AllergyIntolerance Profile] patient is labeled *Must Support*. When claiming conformance to the [US Core AllergyIntolerance Profile]:

* US Core Responders **SHALL** be capable of providing an AllergyIntolerance.patient with a valid reference to a US Core Patient Profile.
* US Core Requestors **SHALL** be capable of processing an AllergyIntolerance.patienta with a valid reference to a US Core Patient Profile.

{% include img.html img="Must_Support_AllergyIntolerance.jpg" caption="Figure 11: US Core AllergyIntolerance.patient" %}

#### Must Support - Choice of Data Types

In certain profiles only specific elements are labeled as *Must Support*.

For example, the [US Core Laboratory Result Observation Profile] effectiveDateTime is labeled *Must Support*. When claiming conformance to the [US Core Laboratory Result Observation Profile]:

* US Core Responders **SHALL** be capable of populating Observation.effectiveDateTime.
* US Core Requestors **SHALL** be capable of processing Observation.effectiveDateTime.

Systems can support the other elements, but this is not a requirement of US Core.


{% include img.html img="Must_Support_Observation.effective.jpg" caption="Figure 12: US Core Observation.effectiveDateTime" %}

For the [US Core Laboratory Result Observation Profile] value element, multiple elements are labeled *Must Support*.

When claiming conformance to the [US Core Laboratory Result Observation Profile]:

* US Core Responders **SHALL** be capable of populating Observation.valueQuantity, Observation.valueCodeableConcept, and Observation.valueString.
* US Core Requestors **SHALL** be capable of processing Observation.valueQuantity, Observation.valueCodeableConcept, and Observation.valueString.

Systems can support the other elements, but this is not a requirement of US Core.


{% include img.html img="Must_Support_Observation.value.jpg" caption="Figure 13: US Core Observation.value[x]" %}


#### Must Support - Choice of Profile Elements

There are several instances in this Guide where there is a choice of supporting one or another profile element to meet the must support requirement. For Example:

- [US Core Medication Request Profile] - The MedicationRequest resource can represent that information is from a secondary source using either a boolean flag or reference in `MedicationRequest.reportedBoolean`, or a reference using `MedicationRequest.reportedReference` to Practitioner or other resource.
- [US Core Encounter Profile] - Although both are marked as must support, servers are not required to support both `Encounter.location.location` and `Encounter.serviceProvider`, but they **SHALL** support *at least one* of these elements.

Although both are marked as must support, the server systems are not required to support both a boolean and a reference, but **SHALL** choose to support at least one of these elements. The client application **SHALL** support both elements.  There is no way to define this in a computable way, but these instances are clearly documented.

{% include link-list.md %}
