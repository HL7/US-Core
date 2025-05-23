
The guidance below addresses how a patient or a provider can access a patient's active, historical, and future (planned) medications list. This use case adopts the use cases defined as part of the Argonaut Project and US Core, specifically within the scope of accessing medication information prescribed in the ASTP U.S. Core Data for Interoperability (USCDI).
This section provides specific guidance on accessing "all medications" and "all active medications" for a patient using a query on *MedicationRequest*. Note that a query on *MedicationStatement* was required in prior versions of this guide. Because of underlying changes in the FHIR Release 4 pharmacy resources, this guide doesn't require the use of *MedicationStatement* since an "active" medication list can be obtained using only MedicationRequest.[^1]

### Background on the FHIR Medications resources

#### Pharmacy FHIR Resources
{:.no_toc}

The FHIR specification defines five FHIR pharmacy resources concerned with the ordering, dispensing, administering, and recording of medications. This guide documents accessing a patient's medications using the following three resources:

  - [Medication]\:  Represents the medication itself
  - [MedicationRequest]\: An order or request for the supply of the medication and the instructions for administration of the medication to a patient, and patient reported medications.
  - [MedicationDispense]\: Provision a medication with regards to dispensing in response to a prescription

The following two medication resources are not profiled by US Core, and systems that support US Core are permitted to use them.   They are introduced here to provide background and define the relationships between the pharmacy resources. **However, as documented in the section below, the US Core Guidance for accessing a patient's medications does not use them:** 

  - [MedicationAdministration]
  - [MedicationStatement]

The FHIR specification details each resource. The FHIR [Medications Module] and the [Guide to Resources] Sections describe the interaction between these resources in general.

#### Relationships Between the Pharmacy FHIR Resources
{:.no_toc}

This IG focuses on access to a patient's medications. Therefore, it is essential to understand the relationships between these resources. Figure 1 illustrates the workflow relationship between the medication order and the fulfillment represented by the FHIR medication resources. Note that in the outpatient setting, the patient does the administration.

{% include img.html img="ArgoR4Meds_1.svg" caption="Figure 1: FHIR Medication Order and Fulfillment" %}

#### Sources of a MedicationRequest

 Several sources may be used to create a MedicationRequest, as is shown in Figure 2 below. The information may be captured directly by a system's medication order or reported by a provider. A patient or related person may also report the information (or provide some record), including "self-prescribed" orders. For example, the patient is often the *only* source of information when the patient reports Cannabis or OTC medication use.

{% include img.html img="ArgoR4Meds_3.svg" caption="Figure 2: MedicationRequest Information Sources" %}

#### Options for Representing Medication

 This guide supports representing a medication using a code or a reference to a Medication resource. Typically, a code will be for a branded (for example, Crestor 10mg tablet) or a generic (for example, Rosuvastatin 10mg tablet) medication. When using a code, the code  **SHALL** follow the [extensible] binding rules to [Medication Clinical Drug (RxNorm)] - i.e., unless RxNorm does not cover the concept, the RxNorm code **SHALL** be used. USCDI recommends the [National Drug Codes (NDC)] as an optional medication terminology. They can be supplied as an additional coding element. More information about using codes can be found in the [General Guidance] and the [FHIR Terminology] sections. A medication resource is typically used when information not included in the RxNorm code is required. For example, the Medication resource is the only way to represent compounded correctly or extemporaneously prepared medication. When referencing the Medication resource, the resource may be included in the returned bundle, as an external resource, or as a [contained] resource if it can't stand alone. These options are shown in Figure 3 below. The Server application **MAY** choose any combination of these methods, but if an external reference to Medication is used, the Server **SHALL** support the [`_include`] parameter for searching this element. The Client application **MUST** support all methods. The [MedicationRequest examples] show these different methods. Additional guidance is provided below and in the [US Core Server CapabilityStatement] section.

{% include img.html img="ArgoR4Meds_4.svg" caption="Figure 3: Ways to Represent the Medication" %}

### Fetching All Medications, Active Medications, and All Medications for an Encounter

**Definitions**

- "Medication" is defined in this IG to include all prescribed and "self-prescribed" medications directly ordered by a provider or reported by the provider, patient, or related person. It includes ethical drugs, over-the-counter (OTC) medication, and other substances taken for medical and recreational use.
- "All medications" is defined in this IG to include all historical, active, and future prescribed medications and medications entered in error and whose status is unknown.
- "Active medications" is defined in this IG as including all medications with an active status. Active medications do not include past, future, unknown status, and entered-in-error medications.

*Note that these definitions do not convey compliance  -  i.e., the list is a statement of what is prescribed (or self-prescribed) and not what is consumed by the patient.*

**Requirements to access "all medications" and "all *active* medications" for a patient:**



1. A MedicationRequest resource query **SHALL** be all that is required to access "all medications" or "all active medications" for a patient. (In other words, no other medication resource type needs to be fetched)
1. The query result **SHALL** include all MedicationRequest resources with a `MedicationRequest.intent` = "order" representing authorized medication orders directly derived from the system's orders.
1. The query result **SHALL** include all prescribed and "self-prescribed" MedicationRequest resources with a `MedicationRequest.intent` = "plan" representing reported medications.
1. Servers **SHALL** use the `MedicationRequest.reported[x]` element to indicate that the MedicationRequest record was captured as a secondary "reported" record rather than an original primary source-of-truth record. It may also indicate the source of the report.
1. When recording "self-prescribed" medication, Servers **SHOULD** use the `MedicationRequest.requester` element to indicate the Patient or RelatedPerson is the prescriber.
1. Servers **SHOULD** support the encounter search parameter. Searching by encounter will return all medications ordered during that encounter, including medications administered in the hospital and prescribed or discharge medications intended to be taken at home.
1. Servers **MAY** support the search parameters `category` and `encounter`. This search will return all medications ordered during an encounter for a given `MedicationRequest.category` such as "inpatient".


#### Get All Medications

1. Get all medications for a patient by querying MedicationRequest using the `patient` search parameter and `intent` search parameter = "order,plan". See [MedicationRequest Quick Start] for further details.

   `GET /MedicationRequest?patient=[id]&intent=order,plan{&_include=MedicationRequest:medication}`

      {% include examplebutton_default.html example="get-all-meds" b_title = "Click Here to See 'Get All Medications' Example" %}

#### Get All *Active* Medications

1. Get all *active* medications for a patient by querying MedicationRequest using the `patient`,  and `intent` = "order,plan" `status` = "active" search parameters. See [MedicationRequest Quick Start] for further details. Note that the Client should also consider MedicationRequests with a status of "unknown" and whether to query those as well.

   `GET /MedicationRequest?patient=[id]&intent=order,plan&status=active{&_include=MedicationRequest:medication}`

     {% include examplebutton_default.html example="get-all-active-meds" b_title = "Click Here to See 'Get All *Active* Medications' Example" %}

#### Get All Medications for an Encounter

1. Get "all medications" for an encounter by querying MedicationRequest using the `patient`, `encounter`, `intent` = "order,plan" search parameters. See [MedicationRequest Quick Start] for further details.

   `GET /MedicationRequest?patient=[id]&intent=order,plan&encounter=[id]{&_include=MedicationRequest:medication}`

      {% include examplebutton_default.html example="get-all-enc-meds" b_title = "Click Here to See 'Get All Medications for an Encounter' Example" %}

See the [US Core Server CapabilityStatement] for a complete list of supported RESTful operations and search parameters for this IG.

#### De-duplication of Data

Medications may be duplicated in a medication list when multiple sources of data are used to generate the list. To provide a list of a patient's medications, it may be necessary to "de-duplicate" them. The de-duplication activity **MAY** be supplied by the Server, but **SHOULD** be provided by the Client.

This specification does not specify de-duplication best practices; however, systems can consider the following approaches:

* Compare the` MedicationRequest.identifier`. The `identifier` element is an external business identifier systems include to help indicate that the resources are related.
* Compare the generic or brand name included in the medication resource. The system will require access to terminology capabilities to identify equivalence.
* Finally, in the de-duplication process, systems must exercise caution in marking things as equivalent only if they are certain.

---

Footnotes

[^1]: Future versions of FHIR are anticipated to include further changes to the medication resources, which may lead to changes in our guidance for fetching patient medications in future versions of this guide.

{% include link-list.md %}
