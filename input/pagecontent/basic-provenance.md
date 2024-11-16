
​This section provides implementers with important definitions to create and share the Provenance Resource[^1].

### Basic Provenance

The FHIR [Provenance] Resource provides a foundation for assessing authenticity, enabling trust, and allowing reproducibility. It is not scoped to a specific use case nor limits the number of Provenance records associated with a Resource. The primary guidance here, and in the [US Core Provenance Profile], focuses on a key subset of elements, the 'last hop', and specific use cases. The guidance here does not preclude more advanced use cases or additional elements.

Full Provenance of a Resource requires details from the original resource creator and all intermediary actors that updated the Resource. Members of the Argonaut community and the HL7 security working group discussed the current sharing approaches and end-user display.  They agreed the most important information is the last organization making a meaningful clinical update to the data and the prior system providing it - the 'last hop'.  Participants didn't dispute the potential need to recreate the entire chain but didn't see this as relevant to the immediate end-user.

#### Key Provenance Elements

The guidance for Provenance in US Core focuses on six key elements: Timestamp, the Target Resource, Author, Author Organization, Transmitter, and Transmitter Organization. The Timestamp is the date and time the author created, updated, or deleted the data. The Target Resource is the Resource the Provenance record supports. The Author represents the person(s) responsible for the information. The Author Organization defines the organization the author is associated with when they created, updated, or deleted the data. The Transmitter represents the system responsible for transmitting the information. Finally, the Transmitter Organization defines the organization responsible for the transmission.

**Key Provenance elements:**

Element | Required | Must Support |Optional| FHIR Element|
---|---|---|---|---
Target | Resource Provenance <br>record supports | | | `Provenance.target`
Timestamp | Date | | Time with timezone offset | `Provenance.recorded`
Author | | Name<br>Identifier | NPI recommended, additional identifiers allowed| `Provenance.agent.who`
Author Organization | | Name<br>Identifier  | NPI recommended, additional identifiers allowed |`Provenance.agent.onBehalfOf`
Transmitter | | Name<br>Identifier | NPI recommended, additional identifiers allowed| `Provenance.agent.who`
Transmitter Organization | | Name<br>Identifier  | NPI recommended, additional identifiers allowed |`Provenance.agent.onBehalfOf`
{: .grid}

### Use Cases

The HL7 Basic Provenance Informative implementation guide outlines four use cases: Fax, Health Information Exchange (HIE) redistribution, HIE transformation, and Clinical Information Reconciliation and Incorporation (CIRI). While these use cases may have FHIR implications in the future, CIRI and HIE are the key use cases and are covered in detail here.

#### Clinical Information Reconciliation and Incorporation

[<span class="bg-success" markdown="1">[Clinical Information Reconciliation and
Incorporation (CIRI)] allows clinicians to reconcile and incorporate patient
health information sent in from external sources to maintain a more accurate
and up-to-date patient records. Consolidated Clinical Document Architecture
(C-CDA) documents are often used to share clinical information with clinicians
from external sources like hospitals, Health Information Exchanges (HIEs), or
other clinicians, and allows the clinician to import and reconcile health care
information into their own patient record.</span><!-- new-content --> Figure 1
represents information from Good Health and Sunshine Health Organization. Dr.
Reconciled reviews the data in Figure 1, updates the reaction to hives, and
stores it in the Future Health Organization system. When a mobile app requests
the information, it receives Dr. Reconciled as the Author and Future Health as
the organization. This type of authorship change is only relevant for data
suitable for reconciliation, such as medications, allergies, and problems. If
Dr. Accepted had saved other clinical content into his EHR that is not
reconciled but stored, such as clinical notes, that content must retain its
original author.

The Figure below represents information from two different organizations to a clinician for reconciliation:

{% include img.html img="Provenance_Recon_Workflow_Step2.svg" caption="Figure 1: Clinical Information Reconciliation and Incorporation (CIRI) from two Organizations" %}

 Dr. Reconciled is the latest author after updating the reaction on 5/15/2019 and accepting it to the local data store. By accepting the information, Dr. Reconciled is taking over the responsibility.

 `GET /AllergyIntolerance?patient=[ID]&_revinclude=Provenance:target`

Good Health Organization Provenance
{% include examplebutton_default.html example="get-all-allergy-provenance-good-health" b_title = "Click Here to See 'Get Allergy Information for a Patient at Good Health' Example" %}

Sunshine Health Organization Provenance
{% include examplebutton_default.html example="get-all-allergy-provenance-sunshine-health" b_title = "Click Here to See 'Get Allergy Information for a Patient at Sunshine Health' Example" %}

After reconciliation, the Future Health Organization Provenance contains the latest information.
{% include examplebutton_default.html example="get-all-allergy-provenance-future-health" b_title = "Click Here to See 'Get Allergy Information for a Patient at Future Health' Example" %}

#### Accepting information from a single site

The Figure below represents information after a provider accepted data from a single site:

{% include img.html img="Provenance_Recon_Single_Organization.svg" caption="Figure 2: CIRI After Accepting Reconciliation, No Changes" %}

Dr. Accepted is the latest author after verifying the problem on 5/2018 and accepting the problem data into their local data store since it went through an interactive reconciliation process.

#### HIE Redistribution

A Health Information Exchange (HIE) is an organization and technology that facilitates information exchange between one and many partners. In specific HIE scenarios, they only redistribute information, while in others, they store, transform, and redistribute information. The HIE must maintain the clinical content fidelity (original author, author organization, and timestamp). In addition, the HIE must keep track of who sent them the information for auditing; however, they are not required to include the original transmitter when redistributing content.

{% include img.html img="Provenance_HIE_Single_Org_Device.svg" caption="Figure 3: HIE Redistribution - No clinical content transformation" %}

Since no clinical content is changed in the HIE redistribution, the best scenario is a Provenance Record with:
- `Provenance.agent.type` = author
  - `Provenance.agent.who` set to the practitioner who authored the content (i.e., not the HIE)
  - `Provenance.agent.onBehalfOf` set to the organization that the author acted on behalf of before sharing with the HIE
- `Provenance.agent.type` = transmitter
  - `Provenance.agent.who` set to the HIE organization

 The timestamp and pointer (i.e., target) to the appropriate Resource are required in all cases and must be included. This IG would note these as **SHALL** constraints if systems always had the Author and Author Organizations available. Participants in the development of this guide reported that the Author information provided to HIEs needs to be more consistent and reliable.  


#### HIE Transformation

Unlike Use Case 3 - HIE Redistribution, Use Case 4 includes data transformation. Information is received (e.g., v2 lab, other CDs), transformed by a HIE, stored, and passed in a new format (e.g., CCD or FHIR).

{% include img.html img="Provenance_HIE_Multi_Org_Device.svg" caption="Figure 4: HIE Transformation - Clinical content is transformed" %}

Transformation of data from one format to another **MAY** change the authorship of the information, where the HIE is the author/author organization. The HIE must maintain the original data source. An `agent.type`="assembler", `agent.type`="transmitter", or other agents from [Provenance Agent Type] value set **MAY** also be included. Due to insufficient implementer guidance, the Basic Provenance guidance here does not specify how to assign authorship for this use case. HL7 plans to gather additional input and include it in the HL7 Basic Provenance Informative guide for C-CDA and FHIR.


### Element Level Provenance

<div class="stu-note" markdown="1">
This section is informative and not a requirement for systems conforming to the US Core Provenance Profile.
</div><!-- stu-note -->

 Using the FHIR Extension [Target Element], Provenance can target a particular element or set of elements. For example, to document how and who supplied patient demographic data such as Race and Ethnicity (R/E), gender identity, and sexual orientation.

Example:

In this [US Core Patient Profile] example, the patient demographic data such as Race and Ethnicity (R/E), gender identity, etc., have *individual element ids* within a resource for internal and external referencing:

{% include examplebutton_default.html example="Patient-example-targeted-provenance.json" b_title = "Click Here to See Individual Element Ids Within a Patient Resource Example" %}

This [US Core Provenance Profile] resource communicates who, how, and when elements such as Race and Ethnicity (R/E), gender identity, etc., were collected. Note that the [Target Element] Extension references the element ids within the Patient resource:

{% include examplebutton_default.html example="Provenance-example-targeted-provenance.json" b_title = "Click Here to See an Element Level Provenance Example" %}

<br />

---
Footnotes

[^1]: This Basic Provenance guidance and [US Core Provenance Profile] are provisional and may change in future releases. Although it is based on feedback from the HL7 and Argonaut communities, there was only preliminary testing of this approach before publication.

{% include link-list.md %}
