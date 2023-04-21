
<div class="bg-success" markdown="1">

The Profile elements consist of *Mandatory*, *Must Support*, and *USCDI Requirements* elements. The sections below defines the server and client expectations for processing these elements and illustrates how they are displayed and documented.

</div><!-- new-content -->


### Mandatory Elements

<span class="bg-success" markdown="1">*Mandatory* elements are elements with a minimum cardinality of 1 (min=1).</span><!-- new-content --> When an element is Mandatory, the data is expected to always be present. Very rarely, it may not be, and guidance for when data is missing is provided in the [Missing Data] section and the next section. The convention in this guide is to mark all min=1 elements as Must Support unless they are nested under an optional element. An example of this is [`CarePlan.status`].

### Must Support Elements

For querying and reading US Core Profiles, *Must Support* on any profile data element **SHALL** be interpreted as follows (see the [Future of US Core] page for writing and updating US Core Profiles):

* US Core Responders **SHALL** be capable of populating all data elements as part of the query results as specified by the [US Core Server Capability Statement].
* US Core Requestors **SHALL** be capable of processing resource instances containing the data elements without generating an error or causing the application to fail. In other words, US Core Requestors **SHOULD** be capable of displaying the data elements for human use or storing it for other purposes.
* In situations where information on a particular data element is not present, and the reason for absence is unknown, US Core Responders **SHALL NOT** include the data elements in the resource instance returned as part of the query results.
* When querying US Core Responders, US Core Requestors **SHALL** interpret missing data elements within resource instances as data not present in the US Core Responder's system.
* In situations where information on a particular data element is missing or suppressed, refer to the guidance for [Missing Data] and [Suppressed Data]. In cases where information on a specific data element is missing *and* the US Core Responder knows the precise reason for the absence of data (other than suppressed data), US Core Responders **SHOULD** send the reason for the missing information. This is done by following the same methodology outlined in the [Missing Data] section but using the appropriate reason code instead of `unknown`.
* US Core Requestors **SHALL** be able to process resource instances containing data elements asserting missing information.

The terms *US Core Responder* Actor *US Core Requestor Actor* are used throughout the guide and typically refer to a server or a client.

Readers are advised to understand [FHIR Terminology] requirements, [FHIR RESTful API] based on the HTTP protocol, along with [FHIR Data Types], [FHIR Search], and [FHIR Resource] formats before implementing US Core requirements.

All the profile information for the {{site.data.fhir.ig.title}} is represented in a single CSV or Excel file. This may be useful to testers and analysts to review the Must Support and Mandatory elements across profiles in a single table.

- [CSV](uscore_profiles.csv)
- [Excel](all_profiles.xlsx)

This [Observation Summary Table] compares *Must Support* Elements across all the US Core Observation Profiles.

<div class="bg-success" markdown="1">

### USCDI Requirements

Most US Core Profiles represent requirements for a [U.S. Core Data for Interoperability (USCDI) v3] Data Class. For those US Core Profiles, all *Mandatory* and *Must Support* elements are *USCDI Requirements*. However, the following US Core Profiles do not represent USCDI data classes, and their *Mandatory* and *Must Support* elements are not *USCDI Requirements*:

{% include non-uscdi-profiles.md %}

#### Additional USCDI Requirements 

*Additional USCDI Requirements* elements are needed for [ONC Health IT Certification] but are not *Mandatory* or *Must Support* elements because they may not be required in every use case. Implementers seeking ONC certification **SHALL** interpret them as *Must Support*  elements documented above, otherwise they are considered optional. The following table lists the Additional USCDI Requirements and their corresponding FHIR resources:

{% include additional-uscdi-requirements.md %}

#### Communicating USCDI Requirements

Understanding the Additional USCDI Requirements is essential for API developers and business analysts working with FHIR US Core. The profiles pages list Additional USCDI Requirements under the "Mandatory and Must Support Data Elements" sections to alert users. In addition, "(USCDI)" is prepended to the element's short description, and the computable [US Core USCDI Requirement Extension] is added to each element definition.
</div><!-- new-content -->

<div class="bg-success" markdown="1">

### Presentation of Must Support, Mandatory, and USCDI Requirement Elements in the Formal Profile Views

<span class="bg-success" markdown="1">On each profile page, several different formal views of the US Core Profile contents are displayed in a tree format under tabs labeled "Differential Table", "Snapshot Table", and "Key Elements Table".</span><!-- new-content -->

#### Differential Table View

Elements with a cardinality starting with "1" (e.g., 1..1) under the "Card" header are *Mandatory* elements. Elements labeled *Must Support* in the "Differential Table" view are flagged with an <span style="padding-left: 3px; padding-right: 3px; color: white; background-color: red" title="This element must be supported">S</span>. Elements with the label "(USCDI)" under the header "Description and Constraints" are *USCDI requirements*. Figure 1 illustrates an example of this:

  {% include img.html img="Must_Support_Differential_View.png" caption="Figure 1: Differential Table View" %}

#### Key Elements Table View
 
The "Key Elements Table" view consists of:
1. all the *Mandatory*, *Must Support*, and *USCDI requirements* elements in the differential view
2. any *Mandatory*, *Must Support*, and *USCDI requirements* elements inherited from a US Core Profile or other profile from which it is derived. (e.g.,  [US Core Body Height Profile] is based on the [US Core Vital Signs Profile] or [US Core QuestionnaireResponse Profile] is based on the [Structured Data Capture (SDC) Questionnaire Response Profile])
3. any *Mandatory* or [modifier elements] not in 1. or 2.

This view includes the same flags and labels described in Differential Table View:.

  {% include img.html img="Must_Support_Key_View.png" caption="Figure 2: Snapshot Table (Must Support) View" %}

#### Snapshot Table View

The "Snapshot Table" view in Figure 3 view consists of:
1.  all the *Mandatory*, *Must Support*, and *USCDI requirements* elements in the differential view
2. any inherited *Mandatory*, *Must Support*, and *USCDI requirements* elements from a US Core or other profile upon which it is based. (e.g.,  [US Core Body Height Profile] based on [Vital Signs Profile] or [US Core QuestionnaireResponse Profile] based on [Structured Data Capture (SDC) Questionnaire Response Profile])
3. any base FHIR elements not in 1. or 2.

This view includes the same flags and labels as described in Differential Table View:

  {% include img.html img="Must_Support_Snapshot_View.png" caption="Figure 3: Snapshot Table View" %}

#### Defined Pattern Elements

The StructureDefinitions define the US Core Profiles and the [ElementDefinition.pattern], which is used almost exclusively for the CodeableConcept and Coding datatypes. If the element is marked as Must Support and defined by a pattern, then the pattern defines the elements *and* element values that the server **SHALL** be capable of providing.

For example, the [US Core DiagnosticReport Profile for Laboratory Results Reporting] category element is defined with a pattern requiring fixed values in `DiagnosticReport.category.coding.system`  and `DiagnosticReport.category.coding.code` for a Coding element. When claiming conformance to this profile:

- US Core Responders **SHALL** provide these values in a `DiagnosticReport.category`
- US Core Requestors **SHALL** be capable of processing these values in `DiagnosticReport.category`

  {% include img.html img="Must_Support_DiagnosticReport_category.png" caption="Figure 7: US Core DiagnosticReport.category" %}

#### Must Support - Primitive Element

Primitive elements are single elements with a primitive value. If they are marked as Must Support, then the server **SHALL** be capable of providing the element value to meet the Must Support requirement.

For example, the [US Core DiagnosticReport Profile for Laboratory Results Reporting] issued element is a primitive `instant` datatype. Therefore, when claiming conformance to this profile:

- US Core Responders **SHALL** be capable of providing a value in a `DiagnosticReport.issued`
- US Core Requestors **SHALL** be capable of processing the value in `DiagnosticReport.issued`

  {% include img.html img="Must_Support_DiagnosticReport_issued.png" caption="Figure 8: US Core DiagnosticReport.issued" %}

#### Must Support - Complex Elements

Complex elements are composed of primitive and/or other complex elements.   Note that coded elements (`CodeableConcept`, `Coding`, and `code` datatypes) also have additional binding rules, which are documented in the [Coded Elements] section.

For any complex element marked as Must Support, the server **SHALL** be capable of providing at least one of the sub-element values. If any sub-element is marked as Must Support, it must meet the Must Support requirements as well and satisfy the Must Support requirement for the parent element.

For example, the [US Core DiagnosticReport Profile for Report and Note exchange] `presentedForm` element is labeled Must Support and has no Must Support sub-elements. When claiming conformance to this profile:

- US Core Responders **SHALL** be capable of providing a value in `DiagnosticReport.presentedForm` sub-element.
- US Core Requestors **SHALL** be capable of processing the value in `DiagnosticReport.presentedForm`.

  {% include img.html img="Must_Support_DiagnosticReport_presentedForm.png" caption="Figure 9: US Core DiagnosticReport.presentedForm" %}

For example, the [US Core Patient Profile] `name` element is labeled Must Support and has Must Support sub-elements "family" and "given". When claiming conformance to this profile:

- US Core Responders **SHALL** be capable of providing a value in `Patient.name.family` and `Patient.name.given`.
- US Core Requestors **SHALL** be capable of processing the value in value in `Patient.name.family` and `Patient.name.given`.

  {% include img.html img="Must_Support_Patient_name.png" caption="Figure 10: US Core Patient.name" %}

On the other hand, if any sub-element is marked as Must Support and the parent element is not, there is *no expectation* that you must support the parent. However, if the parent element is represented in the structure, you must support the sub-element (s) marked as Must Support. There are no examples of US Core profiles that have this structure defined.

Systems can support the other elements, but this is not a requirement of US Core. The [U.S. Core Data for Interoperability (USCDI)] may require additional elements, for example, `suffix`.

#### Must Support - Resource References

This section documents additional Must Support requirements for the `Reference` element.

In certain profiles, only specific resource references are labeled as *Must Support*.

For example, the [US Core DocumentReference Profile] author US Core Practitioner Profile is labeled *Must Support*. When claiming conformance to the [US Core DocumentReference Profile]:

* US Core Responders **SHALL** be capable of providing a DocumentReference.author with a valid reference to a US Core Practitioner Profile.
* US Core Requestors **SHALL** be capable of processing a DocumentReference.author with a valid reference to a US Core Practitioner Profile.

Systems can support other references, but this is not a requirement of US Core.

{% include img.html img="Must_Support_DocumentReference.png" caption="Figure 11: US Core DocumentReference.author" %}

In specific profiles, only a single resource reference is present on an element labeled *Must Support*.

For example, the [US Core AllergyIntolerance Profile] patient is labeled *Must Support*. When claiming conformance to the [US Core AllergyIntolerance Profile]:

* US Core Responders **SHALL** be capable of providing an `AllergyIntolerance.patient` with a valid reference to a US Core Patient Profile.
* US Core Requestors **SHALL** be capable of processing an `AllergyIntolerance.patient` with a valid reference to a US Core Patient Profile.

{% include img.html img="Must_Support_AllergyIntolerance.png" caption="Figure 12: US Core AllergyIntolerance.patient" %}

#### Must Support - Choice of Data Types

Some elements allow different data types (e.g., Observation.effective[x]) for their content. Only specific data type choice elements are labeled as *Must Support*in these situations.

For example, the [US Core Laboratory Result Observation Profile] effectiveDateTime is labeled *Must Support*. When claiming conformance to the [US Core Laboratory Result Observation Profile]:

* US Core Responders **SHALL** be capable of populating `Observation.effectiveDateTime`.
* US Core Requestors **SHALL** be capable of processing `Observation.effectiveDateTime`.

Systems **MAY** support populating and processing other choice elements (such as Observation.effectivePeriod), but this is not a requirement of US Core.

{% include img.html img="Must_Support_Observation.effective.png" caption="Figure 13: US Core `Observation.effectiveDateTime`" %}

For the [US Core Laboratory Result Observation Profile] value element, multiple elements are labeled *Must Support*.

When claiming conformance to the [US Core Laboratory Result Observation Profile]:

* US Core Responders **SHALL** be capable of populating `Observation.valueQuantity`, `Observation.valueCodeableConcept`, and `Observation.valueString`.
* US Core Requestors **SHALL** be capable of processing `Observation.valueQuantity`, `Observation.valueCodeableConcept`, and `Observation.valueString`.

Systems can support the other elements, but this is not a requirement of US Core.


{% include img.html img="Must_Support_Observation.value.png" caption="Figure 14: US Core `Observation.value[x]`" %}


#### Must Support - Choice of Profile Elements

There are several instances in this Guide where there is a choice of supporting one or another profile element to meet the Must Support requirement. In such cases, the server **SHALL** support at least one element, and the client application **SHALL** support all elements. Unfortunately, there is no way to define this in a computable way, but these instances are clearly documented in the *Profile specific implementation guidance* sections.

For example:

[US Core MedicationRequest Profile] - The MedicationRequest resource can represent that information is from a secondary source using either a boolean flag or reference in `MedicationRequest.reportedBoolean`, or a reference using `MedicationRequest.reportedReference` to Practitioner or another resource type. Although both are marked as Must Support, servers are not required to support a boolean and a reference but **SHALL** choose to support at least one of these elements.

{% include link-list.md %}
