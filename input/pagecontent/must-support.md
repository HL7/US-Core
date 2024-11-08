

The Profile elements consist of *Mandatory*, *Must Support*, and *Additional USCDI Requirements* elements. The sections below define the server and client expectations for processing these elements and illustrate how they are displayed and documented.



### Mandatory Elements

*Mandatory* elements have a minimum cardinality of 1 (min=1). When an element is Mandatory, the data is expected always to be present. However, very rarely it may be missing, and the [Missing Data] section and the next section provide guidance when the data is missing. The convention in this guide is to mark all min=1 elements as Must Support unless they are nested under an optional element. An example of this is [`CarePlan.status`].

### Must Support Elements

For querying and reading US Core Profiles, *Must Support* on any profile data element **SHALL** be interpreted as follows (see the [Future of US Core] page for writing and updating US Core Profiles):

* US Core Responders **SHALL** be capable of populating all data elements as part of the query results specified by the [US Core Server Capability Statement].
* US Core Requestors **SHALL** be capable of processing resource instances containing the data elements without generating an error or causing the application to fail. In other words, US Core Requestors **SHOULD** be capable of displaying the data elements for human use or storing it for other purposes.
* When information on a particular data element is not present, and the reason for absence is unknown, US Core Responders **SHALL NOT** include the data elements in the resource instance returned as part of the query results.
* When querying US Core Responders, US Core Requestors **SHALL** interpret missing data elements within resource instances as data not present in the US Core Responder's system.
* When information on a particular data element is missing or suppressed, refer to the guidance for [Missing Data] and [Suppressed Data]. In cases where information on a specific data element is missing, *and* the US Core Responder knows the precise reason for the absence of data (other than suppressed data), US Core Responders **SHOULD** send the reason for the missing information. This is done by following the same methodology outlined in the [Missing Data] section but using the appropriate reason code instead of `unknown`.
* US Core Requestors **SHALL** be able to process resource instances containing data elements asserting missing information.

The terms *US Core Responder* Actor and *US Core Requestor Actor* are used throughout the guide and typically refer to a server or a client.

Readers are advised to understand [FHIR Terminology] requirements, [FHIR RESTful API] based on the HTTP protocol, [FHIR Data Types], [FHIR Search], and [FHIR Resource] formats before implementing US Core requirements.

All the profile information for the {{site.data.fhir.ig.title}} is represented in a single CSV or Excel file. This may be useful to testers and analysts to review the *Must Support* and *Mandatory* elements across profiles in a single table.

- [CSV](all-profiles.csv)
- [Excel](all-profiles.xlsx)

This [Observation Summary Table] compares *Must Support* Elements across all the US Core Observation Profiles.


### Additional USCDI Requirements 

The US Core Profiles include requirements from the [U.S. Core Data for Interoperability (USCDI)]. Some US Core Profile elements needed to represent USCDI Data Elements for [ONC Health IT Certification] (g(10) certification) are not *Mandatory* or *Must Support* because many non-certifying implementers do not need them for their use cases. US Core designates these elements *Additional USCDI Requirements*.

<!-- The following table summarizes the difference between USCDI data classes or elements and *Must Support* and *Additional USCDI Requirements* conformance requirements. 
 
|USCDI Data Class or Element?|*Must Support* Element?|*Additional USCDI Requirements*?| Must Support for Certified Systems?|Must Support for Non-Certified Systems?|
|---|---|---|---|---|
|Yes|Yes|No|Yes|Yes|
|No|Yes|No|Yes|Yes|
|Yes|No|Yes|Yes|No|
|No|No|No|No|No|
{ :.grid } -->

Implementers seeking ONC certification **SHALL** interpret *Additional USCDI Requirements* as *Must Support* elements as documented above; otherwise, they are considered optional. All *Mandatory*, *Must Support*, or *Additional USCDI Requirements* are in scope for ONC Health IT Certification.  See the [USCDI] page for more information about the US Core and USCDI relationship and a mapping between US Core Profiles and the USCDI Data Classes and Elements.

The table below lists the *Additional USCDI Requirements* and their corresponding Profiles and FHIR elements.

{% include additional-uscdi-requirements.md %}

#### Communicating Additional USCDI Requirements

To communicate when *Additional USCDI Requirements* elements are in a US Core profile:

1. The profiles page includes an "Additional USCDI Requirements" listing the elements under the "Mandatory and Must Support Data Elements" section. 
2. The computable [US Core USCDI Requirement Extension] is added to each element in the profile's [StructureDefinition].
3. The formal view of the profile content displays "**ADDITIONAL USCDI:**" in the element's short description (see below for examples).


### Presentation of Must Support, Mandatory, and USCDI Requirement Elements in the Formal Profile Views

On each profile page, several different formal views of the US Core Profile contents are displayed in a tree format under tabs labeled "Differential Table", "Snapshot Table", and "Key Elements Table". Several examples below illustrate the presentation of Must Support elements and their rules. For the sake of simplicity, the Additional USCDI Requirements are not considered in these examples.

#### Differential Table View

Elements with a cardinality starting with "1"  under the column header, "Card." (e.g., 1..1) are *Mandatory* elements. Elements labeled *Must Support* in the "Differential Table" view are flagged with an <span style="padding-left: 3px; padding-right: 3px; color: white; background-color: red" title="This element must be supported">S</span>. Elements with the label "**ADDITIONAL USCDI:**" under the header "Description and Constraints" are *Additional USCDI Requirements*. Figure 1 illustrates an example of this:

  {% include img.html img="Must_Support_Differential_View.png" caption="Figure 1: Differential Table View" %}

#### Key Elements Table View
 
The "Key Elements Table" view consists of:
1. All the *Mandatory*, *Must Support*, and *Additional USCDI Requirements* elements in the differential view
2. Any *Mandatory*, *Must Support*, and *Additional USCDI Requirements* elements inherited from a US Core Profile or other profile from which it is derived. (e.g., the [US Core Body Height Profile] is based on the [US Core Vital Signs Profile], and the [US Core QuestionnaireResponse Profile] is based on the [Structured Data Capture (SDC) Questionnaire Response Profile])
3. any *Mandatory* or [modifier elements] not in 1. or 2.

This view includes the same flags and labels described in Differential Table View:

{% include img.html img="Must_Support_Key_View.png" caption="Figure 2: Snapshot Table (Must Support) View" %}

#### Snapshot Table View

The "Snapshot Table" view in Figure 3 view consists of:
1.  all the *Mandatory*, *Must Support*, and *Additional USCDI Requirements* elements in the differential view
2. any inherited *Mandatory*, *Must Support*, and *Additional USCDI Requirements* elements from a US Core or other profile upon which it is based. (e.g.,  [US Core Body Height Profile] based on [Vital Signs Profile] or [US Core QuestionnaireResponse Profile] based on [Structured Data Capture (SDC) Questionnaire Response Profile])
3. any base FHIR elements not in 1. or 2.

This view includes the same flags and labels as described in Differential Table View:

{% include img.html img="Must_Support_Snapshot_View.png" caption="Figure 3: Snapshot Table View" %}

#### Defined Pattern Elements

The StructureDefinitions define the US Core Profiles and the [ElementDefinition.pattern], used almost exclusively for the CodeableConcept and Coding datatypes. If an element is marked as Must Support and defined by a pattern, then the pattern defines the elements *and* element values that the server **SHALL** be capable of providing.

For example, the [US Core DiagnosticReport Profile for Laboratory Results Reporting] category element is defined with a pattern requiring fixed values in `DiagnosticReport.category.coding.system`  and `DiagnosticReport.category.coding.code` for a Coding element. When claiming conformance to this profile:

- US Core Responders **SHALL** provide these values in a `DiagnosticReport.category`
- US Core Requestors **SHALL** be capable of processing these values in `DiagnosticReport.category`

{% include img.html img="Must_Support_DiagnosticReport_category.png" caption="Figure 4: US Core DiagnosticReport.category" %}

#### Must Support - Primitive Element

Primitive elements are single elements with a primitive value. If they are marked as Must Support, then the server **SHALL** be capable of providing the element value to meet the Must Support requirement.

For example, the [US Core DiagnosticReport Profile for Laboratory Results Reporting] issued element is a primitive `instant` datatype. Therefore, when claiming conformance to this profile:

- US Core Responders **SHALL** be capable of providing a value in a `DiagnosticReport.issued`
- US Core Requestors **SHALL** be capable of processing the value in `DiagnosticReport.issued`

{% include img.html img="Must_Support_DiagnosticReport_issued.png" caption="Figure 5: US Core DiagnosticReport.issued" %}

#### Must Support - Complex Elements

Complex elements are composed of primitive and other complex elements.   Note that coded elements (`CodeableConcept`, `Coding`, and `code` datatypes) also have additional binding rules documented in the [Coded Elements] section.

For any complex element marked as Must Support, the server **SHALL** be capable of providing at least one of the sub-element values. If any sub-element is marked as Must Support, it must also meet the Must Support requirements and satisfy the Must Support requirements for the parent element.

For example, the [US Core DiagnosticReport Profile for Report and Note exchange] `presentedForm` element is labeled Must Support and has no Must Support sub-elements. When claiming conformance to this profile:

- US Core Responders **SHALL** be capable of providing a value in `DiagnosticReport.presentedForm` sub-element.
- US Core Requestors **SHALL** be capable of processing the value in `DiagnosticReport.presentedForm`.

{% include img.html img="Must_Support_DiagnosticReport_presentedForm.png" caption="Figure 6: US Core DiagnosticReport.presentedForm" %}

For example, the [US Core Patient Profile] `name` element is labeled Must Support and has Must Support sub-elements "family" and "given". When claiming conformance to this profile:

- US Core Responders **SHALL** be capable of providing a value in `Patient.name.family` and `Patient.name.given`.
- US Core Requestors **SHALL** be capable of processing the value in `Patient.name.family` and `Patient.name.given`.

{% include img.html img="Must_Support_Patient_name.png" caption="Figure 7: US Core Patient.name" %}

On the other hand, if any sub-element is marked as Must Support and the parent element is not, there is *no expectation* that you must support the parent. However, if the parent element is represented in the structure, you must support the sub-element (s) marked as Must Support.


For example, the [US Core Patient Profile] `telecom` element is not labeled Must Support, but `telecom.system`, `telecom.value`, `telecom.use` are. When claiming conformance to this profile:

- *If* US Core Responders support `Patient.telecom`, they **SHALL** be capable of providing values in `Patient.telecom.system` , `Patient.telecom.value`, and `Patient.telecom.use`.
- US Core Requestors **SHALL** be capable of processing the values in `Patient.telecom`.

{% include img.html img="Must_Support_Patient_telecom.png" caption="Figure 8: US Core Patient.telecom" %}


Systems can support the other elements, but this is not a requirement of US Core. The [U.S. Core Data for Interoperability (USCDI)] may require additional elements such as `Patient.suffix`.

#### Must Support - Resource References

This section documents additional Must Support requirements for the `Reference` element.

<div class="bg-success" markdown="1">

In most cases, a `Reference` element labeled as *Must Support* has multiple target profiles referenced, but only specific ones are labeled as *Must Support*.

For example, the US Core DocumentReference Profile `DocumentReference.author` is a *Must Support* element, and six target profiles are displayed with only the US Core Practitioner Profile labeled *Must Support*. When claiming conformance to this profile:
</div><!-- new-content -->

* US Core Responders **SHALL** be capable of providing a DocumentReference.author with a valid reference to a US Core Practitioner Profile.
* US Core Requestors **SHALL** be capable of processing a DocumentReference.author with a valid reference to a US Core Practitioner Profile.

Systems can support other references, but this is not a requirement of US Core.

{% include img.html img="Must_Support_DocumentReference.png" caption="Figure 9: US Core DocumentReference.author" %}

In some profiles, only a single resource reference is present on an element labeled *Must Support*.

For example, the [US Core AllergyIntolerance Profile] patient is labeled *Must Support*. When claiming conformance to this profile:

* US Core Responders **SHALL** be capable of providing an `AllergyIntolerance.patient` with a valid reference to a US Core Patient Profile.
* US Core Requestors **SHALL** be capable of processing an `AllergyIntolerance.patient` with a valid reference to a US Core Patient Profile.

{% include img.html img="Must_Support_AllergyIntolerance.png" caption="Figure 10: US Core AllergyIntolerance.patient" %}

<div class="bg-success" markdown="1">

In rare situations, a `Reference` element labeled as *Must Support* or *Additional USCDI Requirement* has multiple target profiles referenced, but none are labeled as *Must Support*.
When no referenced profile is marked as *Must Support*, *at least one* target profile **SHALL** be supported.

For example, the US Core Simple Observation Profile `Observation.derivedFrom` is an *Additional USCDI Requirement* element, and there are six target profiles displayed with none labeled as *Must Support*. When claiming conformance to this profile:

* US Core Responders **SHALL** be capable of supporting `Observation.derivedFrom` with a valid reference to *at least one* target profile.
* US Core Requestors **SHALL** be capable of processing `Observation.derivedFrom` with a valid reference to *any* target profile.

{% include img.html img="Must_Support_Simple_Observation.derivedFrom.png" caption="Figure 11: US Core Simple Observation Profile `Observation.derivedFrom`" %}

</div><!-- new-content -->

#### Must Support - Choice of Data Types

Some elements allow different data types (e.g., Observation.effective[x]) for their content. Only specific data type choice elements are labeled  *Must Support* in these situations.

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

There are several instances in this Guide where there is a choice of supporting one or another profile element to meet the Must Support requirement. In such cases, the server **SHALL** support at least one element, and the client application **SHALL** support all elements. Unfortunately, there is no way to define this in a computable way, but these instances are documented in the *Profile specific implementation guidance* sections.

For example:
<div class="bg-success" markdown="1">

* [US Core MedicationRequest Profile] can represent that information is from a secondary source using a boolean flag in `MedicationRequest.reportedBoolean` or a reference using `MedicationRequest.reportedReference`. 
   *  Although both are marked as Must Support, the server system is not required to support both, but **SHALL** support at least one of these elements.
   *  The client application **SHALL** support both elements.

{% include img.html img="Must_Support_MedicationRequest.reported.png" caption="Figure 13: US Core `MedicationRequest.reported[x]`" %}

</div><!-- new-content -->

{% include link-list.md %}