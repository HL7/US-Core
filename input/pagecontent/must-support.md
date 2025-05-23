

The Profile elements consist of *Mandatory*, *Must Support*, and *Additional USCDI Requirements* elements. The sections below define the Server and Client expectations for processing these elements and illustrate how they are displayed and documented.



### Mandatory Elements

*Mandatory* elements have a minimum cardinality of 1 (min=1). When an element is Mandatory, the data is expected always to be present. However, very rarely it may be missing, and the [Missing Data] section and the next section provide guidance when the data is missing. The convention in this guide is to mark all min=1 elements as Must Support unless they are nested under an optional element. An example of this is [`CarePlan.status`].

### Must Support Elements

For querying and reading US Core Profiles, *Must Support* on any profile data element **SHALL** be interpreted as follows (see the [US Core Roadmap] page for writing and updating US Core Profiles):

* US Core Responders **SHALL** be capable of populating all data elements as part of the query results specified by the [US Core Server CapabilityStatement].
* US Core Requestors **SHALL** be capable of processing resource instances containing the data elements without generating an error or causing the application to fail. This processing may result in a determination not to use the resource if the resource content does not meet business requirements.
* When information on a particular data element is not present, and the reason for absence is unknown, US Core Responders **SHALL NOT** include the data elements in the resource instance returned as part of the query results.
* When querying US Core Responders, US Core Requestors **SHALL** interpret missing data elements within resource instances as data not present in the US Core Responder's system.
* When information on a particular data element is missing or suppressed, refer to the guidance for [Missing Data] and [Suppressed Data]. In cases where information on a specific data element is missing, *and* the US Core Responder knows the precise reason for the absence of data (other than suppressed data), US Core Responders **SHOULD** send the reason for the missing information. This is done by following the same methodology outlined in the [Missing Data] section but using the appropriate reason code instead of `unknown`.
* US Core Requestors **SHALL** be able to process resource instances containing data elements asserting missing information.

The terms *US Core Responder* Actor and *US Core Requestor Actor* are used throughout the guide and typically refer to a Server or a Client.

Readers are advised to understand [FHIR Terminology] requirements, [FHIR RESTful API] based on the HTTP protocol, [FHIR Data Types], [FHIR Search], and [FHIR Resource] formats before implementing US Core requirements.


#### US Core Must Support Summaries

The following summary tables  may be useful to testers and analysts to review the *Must Support* and *Mandatory* elements across profiles.

- All the profile information for the {{site.data.fhir.ig.title}} is represented in a single CSV or Excel file. 
  - [CSV](all-profiles.csv)
  - [Excel](all-profiles.xlsx)
- The [Observation Summary Table] compares *Must Support* Elements across all the US Core Observation Profiles. 
- the [Must Support - Resource References](#must-support---resource-references) section below lists all the *Must Support* references to other US Core Profiles and FHIR resources for each US Core Profile.



### Additional USCDI Requirements 


The US Core Profiles include requirements from the [U.S. Core Data for Interoperability (USCDI)]. See the [USCDI] page for more information about the US Core and USCDI relationship and a mapping between US Core Profiles and the USCDI Data Classes and Elements. Some US Core Profile elements needed to represent USCDI Data Elements for [ASTP Health IT Certification] (g(10) certification) are not *Mandatory* or *Must Support* because many non-certifying implementers do not need them for their use cases. US Core designates these elements as *Additional USCDI Requirements*.

Implementers seeking ASTP certification **SHALL** interpret *Additional USCDI Requirements* as *Must Support* elements as documented above and below; otherwise, they are considered optional. All *Mandatory*, *Must Support*, or *Additional USCDI Requirements* are within the scope of ASTP Health IT Certification. Only simple and complex data elements are defined as *Additional USCDI Requirements*. The *Must Support* sections below document how the conformance rules are displayed and applied.

The table below lists the *Additional USCDI Requirements* and their corresponding Profiles and FHIR elements.

{% include additional-uscdi-tabler.md %}

#### Communicating Additional USCDI Requirements for Certifying Systems

 Throughout the rest of the specification, the term "Certifying System" will be used consistently to refer to such systems seeking ASTP certification, distinguishing them from other implementers (e.g., non-certifying systems) that may treat Additional USCDI Requirements as optional.  To communicate when *Additional USCDI Requirements* elements are in a US Core profile:

1. The profiles page includes an "Additional USCDI Requirements" listing the elements under the "Mandatory and *Must Support* Data Elements" section. 
2. The computable [US Core USCDI Requirement Extension] is added to each element in the profile's [StructureDefinition].
3. The formal view of the profile content displays "**ADDITIONAL USCDI:**" in the element's short description (see below for examples).



### Presentation of Must Support, Mandatory, and USCDI Requirement Elements in the Formal Profile Views

On each profile page, several different formal views of the US Core Profile contents are displayed in a tree format under tabs labeled "Differential Table", "Snapshot Table", and "Key Elements Table". Several examples below illustrate the presentation of *Must Support* elements and their rules. 
Except where noted, the same rules apply for the *Additional USCDI Requirements* for Certifying Systems.


#### Differential Table View

Elements with a cardinality starting with "1"  under the column header, "Card." (e.g., 1..1) are *Mandatory* elements. Elements labeled *Must Support* in the "Differential Table" view are flagged with an <span style="padding-left: 3px; padding-right: 3px; color: white; background-color: red" title="This element must be supported">S</span>. Elements with the label "**ADDITIONAL USCDI:**" under the header "Description and Constraints" are *Additional USCDI Requirements*. Figure 1 illustrates an example of this:

  {% include img.html img="Must_Support_Differential_View.png" caption="Figure 1: Differential Table View" %}

#### Key Elements Table View
 
The "Key Elements Table" view consists of:
1. All the *Mandatory*, *Must Support*, and *Additional USCDI Requirements* elements in the differential view
2. Any *Mandatory*, *Must Support*, and *Additional USCDI Requirements* elements inherited from a US Core Profile or other profile from which it is derived. (e.g., the [US Core Body Height Profile] is based on the [US Core Vital Signs Profile], and the [US Core QuestionnaireResponse Profile] is based on the [Structured Data Capture (SDC) Questionnaire Response Profile])
3. any *Mandatory* or [modifier elements] not in 1. or 2.

This view includes the same flags and labels described in Differential Table View:

{% include img.html img="Must_Support_Key_View.png" caption="Figure 2: Key Elements Table View" %}

#### Snapshot Table View

The "Snapshot Table" view in Figure 3 view consists of:
1.  all the *Mandatory*, *Must Support*, and *Additional USCDI Requirements* elements in the differential view
2. any inherited *Mandatory*, *Must Support*, and *Additional USCDI Requirements* elements from a US Core or other profile upon which it is based. (e.g.,  [US Core Body Height Profile] based on [Vital Signs Profile] or [US Core QuestionnaireResponse Profile] based on [Structured Data Capture (SDC) Questionnaire Response Profile])
3. any base FHIR elements not in 1. or 2.

This view includes the same flags and labels as described in Differential Table View:

{% include img.html img="Must_Support_Snapshot_View.png" caption="Figure 3: Snapshot Table View" %}

#### Defined Pattern Elements

The StructureDefinitions define the US Core Profiles and the [ElementDefinition.pattern], used almost exclusively for the CodeableConcept and Coding datatypes. If an element is marked as *Must Support* and defined by a pattern, then the pattern defines the elements *and* element values that the Server **SHALL** be capable of providing. If an element is marked as *Additional USCDI* and defined by a pattern, then the pattern defines the elements *and* element values that the Certifying System **SHALL** be capable of providing.


For example, the [US Core DiagnosticReport Profile for Laboratory Results Reporting] category element is defined with a pattern requiring fixed values in `DiagnosticReport.category.coding.system`  and `DiagnosticReport.category.coding.code` for a Coding element. When claiming conformance to this profile:

- US Core Responders **SHALL** provide these values in a `DiagnosticReport.category`
- US Core Requestors **SHALL** be capable of processing these values in `DiagnosticReport.category`

{% include img.html img="Must_Support_DiagnosticReport_category.png" caption="Figure 4: US Core DiagnosticReport.category" %}

#### Must Support - Primitive Element

Primitive elements are single elements with a primitive value. If they are marked as *Must Support*, then the Server **SHALL** be capable of providing the element value to meet the *Must Support* requirement. If they are marked as *Additional USCDI*, then the Certifying System **SHALL** be capable of providing the element value to meet the *Additional USCDI* requirement.

For example, the [US Core DiagnosticReport Profile for Laboratory Results Reporting] issued element is a primitive `instant` datatype. Therefore, when claiming conformance to this profile:

- US Core Responders **SHALL** be capable of providing a value in a `DiagnosticReport.issued`
- US Core Requestors **SHALL** be capable of processing the value in `DiagnosticReport.issued`

{% include img.html img="Must_Support_DiagnosticReport_issued.png" caption="Figure 5: US Core DiagnosticReport.issued" %}

#### Must Support - Complex Elements

Complex elements are composed of primitive and other complex elements.   Note that coded elements (`CodeableConcept`, `Coding`, and `code` datatypes) also have additional binding rules documented in the [Coded Elements] section.

For any complex element marked as *Must Support*, the Server **SHALL** be capable of providing at least one of the sub-element values. If any sub-element is marked as *Must Support*, it must also meet the *Must Support* requirements and satisfy the *Must Support* requirements for the parent element.


For any complex element marked as *Additional USCDI*, the Certifying System **SHALL** be capable of providing at least one of the sub-element values. If any sub-element is marked as *Additional USCDI*, it must also meet the *Additional USCDI* requirements and satisfy the *Additional USCDI* requirements for the parent element.


For example, the [US Core DiagnosticReport Profile for Report and Note exchange] `presentedForm` element is labeled *Must Support* and has no *Must Support* sub-elements. When claiming conformance to this profile:

- US Core Responders **SHALL** be capable of providing a value in `DiagnosticReport.presentedForm` sub-element.
- US Core Requestors **SHALL** be capable of processing the value in `DiagnosticReport.presentedForm`.

{% include img.html img="Must_Support_DiagnosticReport_presentedForm.png" caption="Figure 6: US Core DiagnosticReport.presentedForm" %}

For example, the [US Core Patient Profile] `name` element is labeled *Must Support* and has *Must Support* sub-elements "family" and "given". When claiming conformance to this profile:

- US Core Responders **SHALL** be capable of providing a value in `Patient.name.family` and `Patient.name.given`.
- US Core Requestors **SHALL** be capable of processing the value in `Patient.name.family` and `Patient.name.given`.

{% include img.html img="Must_Support_Patient_name.png" caption="Figure 7: US Core Patient.name" %}

On the other hand, if any sub-element is marked as *Must Support* or  *Additional USCDI* and the parent element is not, there is *no expectation* that you must support the parent. However, if the parent element is represented in the structure, Servers **SHALL** support the sub-element(s) marked as *Must Support* and Certifying System  **SHALL** support the sub-elements labeled as *Additional USCDI*.


For example, the [US Core Patient Profile] `telecom` element is not labeled *Must Support*, but `telecom.system`, `telecom.value`, `telecom.use` are. When claiming conformance to this profile:

- *If* US Core Responders support `Patient.telecom`, they **SHALL** be capable of providing values in `Patient.telecom.system` , `Patient.telecom.value`, and `Patient.telecom.use`.
- US Core Requestors **SHALL** be capable of processing the values in `Patient.telecom`.

{% include img.html img="Must_Support_Patient_telecom.png" caption="Figure 8: US Core Patient.telecom" %}


Systems can support the other elements, but this is not a requirement of US Core. The [U.S. Core Data for Interoperability (USCDI)] may require additional elements such as `Patient.suffix`.

#### Must Support - Resource References

This section documents additional *Must Support* requirements for the [Reference] type element.



##### Must Support Targets for US Core Profiles

When a Reference type element is labeled as *Must Support* and has a single target profile referenced, the target profile **SHALL** be supported. When a Reference type element is labeled as *Additional USCDI* and has a single target profile referenced, the target profile **SHALL** be supported for Certifying Systems.

For example, the [US Core AllergyIntolerance Profile] patient is labeled *Must Support*. When claiming conformance to this profile:

* US Core Responders **SHALL** be capable of providing an `AllergyIntolerance.patient` with a valid reference to a US Core Patient Profile.
* US Core Requestors **SHALL** be capable of processing an `AllergyIntolerance.patient` with a valid reference to a US Core Patient Profile.

{% include img.html img="Must_Support_AllergyIntolerance.png" caption="Figure 9: US Core AllergyIntolerance.patient" %}

When a Reference type element is labeled as *Must Support*, has multiple target profiles referenced, and specific targets are labeled as *Must Support*, the *Must Support* target profile(s) **SHALL** be supported. When a Reference type element labeled as *Additional USCDI*, has multiple target profiles referenced, and specific targets are labeled as *Must Support*, the *Must Support* target profile(s) **SHALL** be supported by Certifying Systems.

For example, the US Core DocumentReference Profile `DocumentReference.author` is a *Must Support* element, and six target profiles are displayed with only the US Core Practitioner Profile labeled *Must Support*. When claiming conformance to this profile:

* US Core Responders **SHALL** be capable of providing a DocumentReference.author with a valid reference to a US Core Practitioner Profile.
* US Core Requestors **SHALL** be capable of processing a DocumentReference.author with a valid reference to a US Core Practitioner Profile.

Systems can support other references, but this is not a requirement of US Core.

{% include img.html img="Must_Support_DocumentReference.png" caption="Figure 10: US Core DocumentReference.author" %}

The tables below list the *Must Support* target US Core Profiles and FHIR Resources for each US Core Profile.

*Must Support* Targets for *Must Support* US Core Elements

{% include ms-target-table-generator.md file="ms_refs" %}

Additional *Must Support* Targets for Certifying Systems supporting *Additional USCDI* US Core Elements as *Must Support* (see [Additional USCDI Requirements](#additional-uscdi-requirements) above).

{% include ms-target-table-generator.md file="addl_uscdi_refs" %}

##### Choice of At Least One Targets for US Core Profiles

When a Reference element is labeled as *Must Support* has multiple target profiles referenced, but none are labeled as *Must Support*, *at least one* target profile **SHALL** be supported. When a Reference element is labeled as *Additional USCDI* has multiple target profiles referenced, but none are labeled as *Must Support*, *at least one* target profile **SHALL** be supported by Certifying Systems.

For example, the US Core Vital Signs Profile  `Observation.performer` is a *Must Support* element, and there are six target profiles displayed with none labeled as *Must Support*. When claiming conformance to this profile:

* US Core Responders **SHALL** be capable of supporting `Observation.performer` with a valid reference to *at least one* target profile.
* US Core Requestors **SHALL** be capable of processing `Observation.performer` with a valid reference to *any* target profile.

{% include img.html img="Must_Support_vital_signs.performer.png" caption="Figure 11: US Core Vital Signs Profile `Observation.performer`" %}

The tables below list the *at least one* candidate target US Core Profiles and FHIR Resources for each US Core Profile.  Note that these targets may overlap with the *Must Support* Targets listed above.

Choice of Targets for *Must Support* US Core Elements

{% include ms-target-table-generator.md file="ms_choice_refs" %}

Choice of Targets for *Additional USCDI* US Core Elements

{% include ms-target-table-generator.md file="addl_uscdi_choice_refs" %}

{% include link-list.md %}



#### Must Support - Choice of Data Types

If a *Must Support* element has a choice of datatypes for its content, the datatypes the Server **SHALL** support are labeled as *Must Support*.  If an *Additional USCDI* element has a choice of datatypes for its content, the datatypes the Certifying System **SHALL** support are labeled as *Must Support*.

For example, the [US Core Observation Clinical Result Profile] effectiveDateTime is labeled *Must Support*. When claiming conformance to this profile:

* US Core Responders **SHALL** be capable of populating `Observation.effectiveDateTime`.
* US Core Requestors **SHALL** be capable of processing `Observation.effectiveDateTime`.

Systems **MAY** support populating and processing other choice elements (such as Observation.effectivePeriod), but this is not a requirement of US Core.

{% include img.html img="Must_Support_Observation.effective.png" caption="Figure : US Core Observation.effectiveDateTime" %}

For the [US Core Observation Clinical Result Profile] value element, multiple elements are labeled *Must Support*. When claiming conformance to this profile:

* US Core Responders **SHALL** be capable of populating `Observation.valueQuantity`, `Observation.valueCodeableConcept`, and `Observation.valueString`.
* US Core Requestors **SHALL** be capable of processing `Observation.valueQuantity`, `Observation.valueCodeableConcept`, and `Observation.valueString`.

Systems can support the other elements, but this is not a requirement of US Core.

{% include img.html img="Must_Support_Observation.value.png" caption="Figure 12: US Core `Observation.value[x]`" %}


#### Must Support - Choice of Profile Elements

There are several instances in this Guide where there is a choice of supporting one or another profile element to meet the *Must Support* or *Additional USCDI* requirements. In such cases, the Server or Certifying System **SHALL** support at least one element, and the Client application **SHALL** support all elements. Unfortunately, there is no way to define this in a computable way, but these instances are documented in the *Profile specific implementation guidance* sections.

For example:


* [US Core MedicationRequest Profile] can represent that information is from a secondary source using a boolean flag in `MedicationRequest.reportedBoolean` or a reference using `MedicationRequest.reportedReference`. 
   *  Although both are marked as *Must Support*, the Server system is not required to support both, but **SHALL** support at least one of these elements.
   *  The Client application **SHALL** support both elements.
7
{% include img.html img="Must_Support_MedicationRequest.reported.png" caption="Figure 13: US Core `MedicationRequest.reported[x]`" %}



#### Must Support - Slices

FHIR profiles use [slicing] to define repeating elements (elements that may occur more than once in an instance) by putting constraints on one or more of the repeating elements ("slices"). See Figure 14 below for how that is represented in the guide.

The element that defines the slicing discriminator ("slicer") may define constraints that apply across all slices for the following element properties: max, type (code, profile, targetProfile, aggregation, and versioning), fixed[x], pattern[x], minValue[x], maxValue[x], maxLength, constraints, required and extensible bindings (including additional bindings), mustHaveValue, and valueAlternatives. However, the slicer's Must Support property *only* defines the element level *Must Support/Additional USCDI* property. In other words, the slicer's *Must Support/Additional USCDI* is not inherited by the slices, and each slice must be explicitly tagged with the *Must Support/Additional USCDI* property to define that slice's conformance strength. If no *Must Support/Additional USCDI* property is defined for the slice, then support for that slice's definition is optional. 

For example, the [US Core Organization Profile] `Organization.identifier` element is a Must Support slicer element and defines three slices, "NPI", "CLIA", and "NAIC". Only the "NPI" slice is labeled as a Must Support element. When claiming conformance to this profile:

- US Core Responders **SHALL** be capable of providing an `Organization.identifier` that conforms to the slicer constraints and the "NPI" slice's constraints. (note that in this case, these conformance requirements are the same -  by conforming to the "NPI" slice's constraints, the slicer constraints are met as well).
- US Core Requestors **SHALL** be capable of processing an `Organization.identifier` that conforms to slicer constraints and the "NPI" slice's constraints.
- Systems **MAY** support the "CLIA" and "NAIC" slices, but this is not a requirement for US Core.
{% include img.html img="Must_Support_Organization_identifier.png" caption="Figure 14: US Core Organization.identifier" %}

Note that if a slice is labeled as *Must Support/Additional USCDI* and the slicer element is not labeled as *Must Support/Additional USCDI*, then if the server/certifying system supports the element, it must support the slice's definition. There are no examples of this structure in US Core.


{% include link-list.md %}