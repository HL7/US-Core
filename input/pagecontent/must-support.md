
The Profile elements consist of both *Mandatory* and *Must Support* elements.  *Mandatory* elements are elements with an minimum cardinality of 1 (min=1). The base [FHIR Must Support] guidance requires specifications to define exactly the support expected for profile elements labeled *Must Support*.  The sections below illustrate how these elements are displayed and define the rules for interpreting profile elements and subelements labeled *Mandatory* and *Must Support* for requesters and responders.

### Presentation of Must Support and Mandatory Elements in the Formal Profile Views

Each profile provides several different formal views of all the must support elements in a tree format under tabs labeled "Differential Table",  "Snapshot Table", and "Snapshot Table (Must Support)".

The elements labeled *Must Support* in the "Differential Table" view are flagged with an <span style="padding-left: 3px; padding-right: 3px; color: white; background-color: red" title="This element must be supported">S</span>. An example of this is illustrated in Figure 1.

  {% include img.html img="Must_Support_Differential_View.png" caption="Figure 1: Differential Table View" %}

In the "Snapshot Table" view in Figure 2, all the must support elements defined for the profile, and any mandatory or must support elements inherited from a base profile (e.g. [US Core Body Height Profile] based on [Vital Signs Profile]), are flagged with an <span style="padding-left: 3px; padding-right: 3px; color: white; background-color: red" title="This element must be supported">S</span>. An example of the "Snapshot Table" is shown in Figure 2.

  {% include img.html img="Must_Support_Snapshot_View.png" caption="Figure 2: Snapshot Table View" %}

 In the "Snapshot Table (Must Support)" view, all the elements presented in the view are either mandatory or must support elements for conformance to the profile. These elements are defined in the US Core Profile, mandatory elements inherited from the base specification and, for the US Core Vital Signs profiles, any mandatory or must support elements inherited from the FHIR base Vital Signs profile. An example of the "Snapshot Table (Must Support)" is shown in Figure  3.

  {% include img.html img="Must_Support_MS_View.png" caption="Figure 3: Snapshot Table (Must Support) View" %}

### Mandatory Elements

When an element is mandatory (min=1), the data is expected to always be present. Very rarely it may not be and guidance for when data is missing is provided in the [Missing Data] section and in the next section.  The convention in this guide is to mark all min=1 elements as must support unless the are nested under optional element. An example of this is [`CarePlan.status`].

### Must Support Elements

For querying and reading US Core Profiles, *Must Support* on any profile data element **SHALL** be interpreted as follows (see the [Future of US Core] page for writing and updating US Core Profiles):

* US Core Responders **SHALL** be capable of populating all data elements as part of the query results as specified by the [US Core Server Capability Statement].
* US Core Requestors **SHALL** be capable of processing resource instances containing the data elements without generating an error or causing the application to fail. In other words US Core Requestors **SHOULD** be capable of displaying the data elements for human use or storing it for other purposes.
* In situations where information on a particular data element is not present and the reason for absence is unknown, US Core Responders **SHALL NOT** include the data elements in the resource instance returned as part of the query results.
* When querying US Core Responders, US Core Requestors **SHALL** interpret missing data elements within resource instances as data not present in the US Core Responder's system.
* In situations where information on a particular data element is missing or suppressed refer to the guidance for [Missing Data] and [Suppressed Data].  In situations where information on a particular data element is missing *and* the US Core Responder knows the precise reason for the absence of data (other than suppressed data), US Core Responders **SHOULD** send the reason for the missing information.  This is done by following the same methodology outlined in the [Missing Data] section, but using the appropriate reason code instead ofs `unknown`.
* US Core Requestors **SHALL** be able to process resource instances containing data elements asserting missing information.

The terms *US Core Responder* Actor *US Core Requestor Actor* are used throughout the guide and typically refer to a server or a client.

Readers are advised to understand [FHIR Terminology] requirements, [FHIR RESTful API] based on the HTTP protocol, along with [FHIR Data Types], [FHIR Search] and [FHIR Resource] formats before implementing US Core requirements.

All the profile information for the {{site.data.fhir.ig.title}} is represented in a single CSV or Excel file.  This may be useful to testers and analysts to review the must support and mandatory elements across profiles in a single table.

- [CSV](uscore_profiles.csv)
- [Excel](all_profiles.xlsx)

A table to compare all the observation profiles in US Core is also provided:

- [CSV(compressed folder)](argo-obs-compare-csv.zip)
- [Excel(compressed folder)](argo-obs-compare-excel.zip)

##### Defined Pattern Elements

The StructureDefinitions define the US Core Profiles and the [ElementDefinition.pattern] which is used almost exclusively for the CodeableConcept and Coding  datatypes. If the element is marked as must support and defined by a pattern then the pattern defines the elements *and* element values that the server **SHALL** be capable of providing.

For example the [US Core DiagnosticReport Profile for Laboratory Results Reporting] category element is defined with a pattern requiring fixed values in `DiagnosticReport.category.coding.system`  and `DiagnosticReport.category.coding.code` for a Coding element. When claiming conformance to this profile:

- US Core Responders **SHALL** provide these values in a `DiagnosticReport.category`
- US Core Requestors **SHALL** be capable of processing these values in `DiagnosticReport.category`

  {% include img.html img="Must_Support_DiagnosticReport_category.png" caption="Figure 7: US Core DiagnosticReport.category" %}

#### Must Support - Primitive Element

Primitive elements are are single elements with a primitive value. If they are marked as must support, then the server **SHALL** be capable of providing the element value to meet the must support requirement.

For example, the [US Core DiagnosticReport Profile for Laboratory Results Reporting] issued element is a primitive `instant` datatype. When claiming conformance to this profile:

- US Core Responders **SHALL** be capable of providing a value in a `DiagnosticReport.issued`
- US Core Requestors **SHALL** be capable of processing the value in `DiagnosticReport.issued`

  {% include img.html img="Must_Support_DiagnosticReport_issued.png" caption="Figure 8: US Core DiagnosticReport.issued" %}

#### Must Support - Complex Elements

Complex element are composed of primitive and/or other complex elements.   Note that coded elements (`CodeableConcept`, `Coding`, and `code` datatypes) also have additional binding rules which are documented in the [Coded Elements] section.

For any complex element marked as must support, the server **SHALL** be capable of providing at least one of the sub-element values. If any sub-element is marked as must support it must meet the must support requirements as well and satisfy the must support requirement for the parent element.

For example, the [US Core DiagnosticReport Profile for Report and Note exchange] presentedForm element is labeled must support and has no must support sub-elements. When claiming conformance to this profile:

- US Core Responders **SHALL** be capable of providing a value in `DiagnosticReport.presentedForm` sub-element.
- US Core Requestors **SHALL** be capable of processing the value in `DiagnosticReport.presentedForm`.

  {% include img.html img="Must_Support_DiagnosticReport_presentedForm.png" caption="Figure 9: US Core DiagnosticReport.presentedForm" %}

For example, the [US Core Patient Profile] name element is labeled must support and has must support sub-elements "family" and "given". When claiming conformance to this profile:

- US Core Responders **SHALL** be capable of providing a value in `Patient.name.family` and `Patient.name.given`.
- US Core Requestors **SHALL** be capable of processing the value in value in `Patient.name.family` and `Patient.name.given`.

  {% include img.html img="Must_Support_Patient_name.png" caption="Figure 10: US Core Patient.name" %}

On the other hand, if any sub-element is marked as must support and the parent element is not, there is *no expectation* that you must support the parent. However, if the parent element is represented in the structure you must support the sub-element(s) marked as must support. There are no examples of US Core profiles that have this structure defined.

Systems can support the other elements, but this is not a requirement of US Core. The [U.S. Core Data for Interoperability (USCDI)] may require other elements, for example `suffix`.

#### Must Support - Resource References

This section documents additional must support requirements for the `Reference` element.

In certain profiles only specific resource references are labeled as *Must Support*.

For example, the [US Core DocumentReference Profile] author US Core Practitioner Profile is labeled *Must Support*. When claiming conformance to the [US Core DocumentReference Profile]:

* US Core Responders **SHALL** be capable of providing a DocumentReference.author with a valid reference to a US Core Practitioner Profile.
* US Core Requestors **SHALL** be capable of processing a DocumentReference.author with a valid reference to a US Core Practitioner Profile.

Systems can support other references but this is not a requirement of US Core.

{% include img.html img="Must_Support_DocumentReference.jpg" caption="Figure 11: US Core DocumentReference.author" %}

In certain profiles only a single resource reference is present on an element labeled *Must Support*.

For example, the [US Core AllergyIntolerance Profile] patient is labeled *Must Support*. When claiming conformance to the [US Core AllergyIntolerance Profile]:

* US Core Responders **SHALL** be capable of providing an `AllergyIntolerance.patient` with a valid reference to a US Core Patient Profile.
* US Core Requestors **SHALL** be capable of processing an `AllergyIntolerance.patient` with a valid reference to a US Core Patient Profile.

{% include img.html img="Must_Support_AllergyIntolerance.jpg" caption="Figure 12: US Core AllergyIntolerance.patient" %}

#### Must Support - Choice of Data Types

Some elements allow different data types (e.g. Observation.effective[x]) for their content. In these situations, only specific data type choice elements are labeled as *Must Support*.

For example, the [US Core Laboratory Result Observation Profile] effectiveDateTime is labeled *Must Support*. When claiming conformance to the [US Core Laboratory Result Observation Profile]:

* US Core Responders **SHALL** be capable of populating `Observation.effectiveDateTime`.
* US Core Requestors **SHALL** be capable of processing `Observation.effectiveDateTime`.

Systems **MAY** support populating and processing other choice elements (such as, Observation.effectivePeriod) but this is not a requirement of US Core.

{% include img.html img="Must_Support_Observation.effective.jpg" caption="Figure 13: US Core Observation.effectiveDateTime" %}

For the [US Core Laboratory Result Observation Profile] value element, multiple elements are labeled *Must Support*.

When claiming conformance to the [US Core Laboratory Result Observation Profile]:

* US Core Responders **SHALL** be capable of populating `Observation.valueQuantity`, `Observation.valueCodeableConcept`, and `Observation.valueString`.
* US Core Requestors **SHALL** be capable of processing `Observation.valueQuantity`, `Observation.valueCodeableConcept`, and `Observation.valueString`.

Systems can support the other elements, but this is not a requirement of US Core.


{% include img.html img="Must_Support_Observation.value.jpg" caption="Figure 14: US Core Observation.value[x]" %}


#### Must Support - Choice of Profile Elements

There are several instances in this Guide where there is a choice of supporting one or another profile element to meet the must support requirement.  In such instances, the server **SHALL** support at least one such element, and the client application **SHALL** support all such elements. There is no way to define this in a computable way, but these instances are clearly documented in the *Profile specific implementation guidance* sections.

For example:

[US Core Medication Request Profile] - The MedicationRequest resource can represent that information is from a secondary source using either a boolean flag or reference in `MedicationRequest.reportedBoolean`, or a reference using `MedicationRequest.reportedReference` to Practitioner or another resource type. Although both are marked as must support, servers are not required to support both a boolean and a reference, but **SHALL** choose to support at least one of these elements.

{% include link-list.md %}
