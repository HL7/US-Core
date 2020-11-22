
This section outlines important definitions, interpretations, and requirements common to all US Core actors used in this guide.
The conformance verbs - **SHALL**, **SHOULD**, **MAY** - used in this guide are defined in [FHIR Conformance Rules].

The base [FHIR Must Support] guidance requires specifications define exactly the support expected for elements labeled *Must Support*.  

This page defines the rules for interpreting profile elements and subelements labeled *Must Support* for requesters and responders.

<!-- end TOC -->

### Claiming Conformance to a US Core Profile

To claim conformance to a US Core Profile US Core Servers **SHALL**:

  - Be able to populate all profile data elements that mandatory - in other words, have a minimum cardinality >= 1 -  and/or flagged as *Must Support* as defined by that profile’s StructureDefinition.
  - Conform to the [US Core Server Capability Statement] expectations for that profile’s type.

### The Must Support View

  Each profile provide a formal view of all the Must Support Elements in a tree under the awkwardly named "Snapshot Table (Must Support)". All the elements presented in the view are mandatory and must support elements for conformance to the profile and include the US Core Profile and any inherited must support elements.

### Mandatory Elements

  When an element is mandatory (min=1), the data is expected to always be present. Very rarely it may not be and we have provided [specific guidance] when the data is missing.  The convention in this guide is to mark all min=1 elements as must support unless the are nested under optional element.

### Must Support Elements

For querying and reading US Core Profiles, *Must Support* on any profile data element **SHALL** be interpreted as follows (see the [Future of US Core] page for writing and updating US Core Profiles.) :

* US Core Responders **SHALL** be capable of populating all data elements as part of the query results as specified by the [US Core Server Capability Statement].
* US Core Requestors **SHALL** be capable of processing resource instances containing the data elements without generating an error or causing the application to fail. In other words US Core Requestors **SHOULD** be capable of displaying the data elements for human use or storing it for other purposes.
* In situations where information on a particular data element is not present and the reason for absence is unknown, US Core Responders **SHALL NOT** include the data elements in the resource instance returned as part of the query results.
* When querying US Core Responders, US Core Requestors **SHALL** interpret missing data elements within resource instances as data not present in the US Core Responder's system.
* In situations where information on a particular data element is missing and the US Core Responder knows the precise reason for the absence of data, US Core Responders **SHALL** send the reason for the missing information using values (such as nullFlavors) from the value set where they exist or using the dataAbsentReason extension.
* US Core Requestors **SHALL** be able to process resource instances containing data elements asserting missing information.

* NOTE: Typically *US Core Responder* Actor = Server and *US Core Requestor Actor* = Client
* NOTE: The above definition of *Must Support* is derived from HL7v2 concept "Required but may be empty - RE" described in HL7v2 V28_CH02B_Conformance.doc.
* NOTE: Readers are advised to understand [FHIR Terminology] requirements, [FHIR RESTful API] based on the HTTP protocol, along with [FHIR Data Types], [FHIR Search] and [FHIR Resource] formats before implementing US Core requirements.


 (example)
#### Must Support - Coded Elements
Coded elements (CodeableConcept, Coding, and code datatypes) marked as Must Support following the rules for their respective bindings.

(example)

##### Required binding for CodeableConcept Datatype

Required binding to a value set definition means that one of the codes from the specified value set **SHALL** be used and using only text is not valid. Multiple codings (translations) are permitted as is discussed below.

##### Extensible binding for CodeableConcept Datatype

Extensible binding to a value set definition for this IG means that if the data type is CodeableConcept, then one of the coding values **SHALL** be from the specified value set if a code applies, but if no suitable
 code exists in the value set, alternate code(s) may be provided in its place. If only text available, then just text may be used.

##### Defined Pattern Elements

The StructureDefinitions define the US Core Profiles and the [ElementDefinition.pattern[x]] which is used almost exclusively for the CodeableConcept and Coding  datatypes. It specifies "a value that the value in the instance SHALL follow - that is, any value in the pattern must be found in the instance. Other additional values may be found too. This is effectively constraint by example."  If the element is marked as must support and defined by a pattern then the pattern defines the elements *and* values that shall be present.

(example)

#### Must Support - Primitive Element

Primitive elements are are single elements with a primitive value. If they are marked as must support, the either the value or an extension meets this requirement.

#### Must Support - Complex Elements

Complex element are composed of primitive and/or other complex elements.  There are specific interpretations for must support for:

- CodeableConcept
- Coding
- Reference

which are discused separately.  In general for any complex element the must support is met if any of the sub-elements (including extensions) are present.
If any sub-element is mark as must support it must meet the must support requirements as well and satisfies the must support requirement for the parent element.

(example where no sub elements are MS)
(example where have MS sub Elements)

#### Must Support - Resource References

In certain profiles only specific resource references are labeled as *Must Support*.

For example, the [US Core DocumentReference Profile] author US Core Practitioner Profile is labeled *Must Support*. When claiming conformance to the [US Core DocumentReference Profile]:

* US Core Responders **SHALL** be capable of providing a DocumentReference.author with a valid reference to a US Core Practitioner Profile.
* US Core Requestors **SHALL** be capable of processing a DocumentReference.author with a valid reference to a US Core Practitioner Profile.

Systems can support other references but this is not a requirement of US Core.

{% include img.html img="Must_Support_DocumentReference.jpg" caption="Figure 1: US Core DocumentReference.author" %}

In certain profiles only a single resource reference is present on an element labeled *Must Support*.

For example, the [US Core AllergyIntolerance Profile] patient is labeled *Must Support*. When claiming conformance to the [US Core AllergyIntolerance Profile]:

* US Core Responders **SHALL** be capable of providing an AllergyIntolerance.patient with a valid reference to a US Core Patient Profile.
* US Core Requestors **SHALL** be capable of processing an AllergyIntolerance.patienta with a valid reference to a US Core Patient Profile.

{% include img.html img="Must_Support_AllergyIntolerance.jpg" caption="Figure 2: US Core AllergyIntolerance.patient" %}

#### Must Support - Choice of Data Types

In certain profiles only specific elements are labeled as *Must Support*.

For example, the [US Core Laboratory Result Observation Profile] effectiveDateTime is labeled *Must Support*. When claiming conformance to the [US Core Laboratory Result Observation Profile]:

* US Core Responders **SHALL** be capable of populating Observation.effectiveDateTime.
* US Core Requestors **SHALL** be capable of processing Observation.effectiveDateTime.

Systems can support the other elements, but this is not a requirement of US Core.


{% include img.html img="Must_Support_Observation.effective.jpg" caption="Figure 3: US Core Observation.effectiveDateTime" %}

For the [US Core Laboratory Result Observation Profile] value element, multiple elements are labeled *Must Support*.

When claiming conformance to the [US Core Laboratory Result Observation Profile]:

* US Core Responders **SHALL** be capable of populating Observation.valueQuantity, Observation.valueCodeableConcept, and Observation.valueString.
* US Core Requestors **SHALL** be capable of processing Observation.valueQuantity, Observation.valueCodeableConcept, and Observation.valueString.

Systems can support the other elements, but this is not a requirement of US Core.


{% include img.html img="Must_Support_Observation.value.jpg" caption="Figure 4: US Core Observation.value[x]" %}


#### Must Support - Choice of elements

There are several instances in this Guide where there is a choice of supporting one or another element to meet the must support requirement. These are:

- here...
- here...
- here...

Although both are marked as must support, the server systems are not required to support both a boolean and a reference, but SHALL choose to support at least one of these elements. The client application SHALL support both elements.  There is no way to define this in a computable way, but these instances are clearly documented.

(example)


{% include link-list.md %}
