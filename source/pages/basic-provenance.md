---
title: Basic Provenance Guidance
layout: default
topofpage: true
---
​This section provides implementers with important definitions to create and share the Provenance Resource[^1].

{:.no_toc}

<!-- TOC  the css styling for this is \pages\assets\css\project.css under 'markdown-toc'-->

<!--* Do not remove this line (it will not be displayed)
 {:toc} -->

### Basic Provenance

The FHIR [Provenance] Resource provides a foundation for assessing authenticity, enabling trust, and allowing reproducibility. It isn't scoped to a specific use case, nor limits the number of Provenance records associated with a Resource. The basic guidance here, and in the [US Core Provenance Profile] focuses on a key subset of elements, the 'last hop', and specific use cases. The guidance here doesn't preclude more advanced use cases or additional elements.

Full Provenance of a Resource requires details from the original creator of a Resource and all intermediary actors that updated the Resource. Members of the Argonaut community and the HL7 security working group discussed the current sharing approaches, and display to end user, and agreed the most important information is the last organization making a meaningful clinical update to the data, and the prior system providing the data, the 'last hop'.  Participants didn't dispute the potential need to recreate the full chain, but didn't see this as relevant to the immediate end-user.

#### Key Provenance Elements

The guidance for Provenance in US Core focuses on 6 key elements: Timestamp, the Target Resource, Author, Author Organization, Transmitter, and Transmitter Organization. The timestamp is the date and time the author created, updated, or deleted the data. The target is the Resource the Provenance record supports. The Author represents the person(s) responsible for the information. The Author Organization represents the organization the author is associated when they created, updated, or deleted the data. The Transmitter represents the system responsible for transmitting the information. The Transmitter Organization represents the organization responsible for the transmission.

**Key Provenance elements:**

Element | Required | Must Support |Optional| FHIR Element|
---|---|---|---|---
Target | Resource Provenance <br>record supports | | | Provenance.target
Timestamp | Date | | Time with timezone offset | Provenance.recorded
Author | | Name<br>Identifier | NPI recommended, additional identifiers allowed| Provenance.agent.who
Author Organization | | Name<br>Identifier  | NPI recommended, additional identifiers allowed |Provenance.agent.onBehalfOf
Transmitter | | Name<br>Identifier | NPI recommended, additional identifiers allowed| Provenance.agent.who
Transmitter Organization | | Name<br>Identifier  | NPI recommended, additional identifiers allowed |Provenance.agent.onBehalfOf
{: .grid}

### Use Cases

The HL7 Basic Provenance Informative implementation guide outlines four use cases: Fax, Health Information Exchange (HIE) redistribution, HIE transformation, and Clinical Information Reconciliation and Incorporation (CIRI). While these use cases may have FHIR implications in the future, CIRI and HIE are the key use cases and are covered in detail here.

#### Clinical Information Reconciliation and Incorporation

Clinical Information Reconciliation and Incorporation (CIRI) is a process where a user reviews and updates, or accepts, information into their system. The information could come from a Health Information Exchange (HIE), a 3rd-party FHIR server, or a patient providing information. Figure 1 represents information being provided from two different sources, Good Health organization and Sunshine Health Organization. Dr. Reconciled reviews the information in Figure 2, updates the reaction to hives, and stores into the Future Health Organization system. When a mobile app requests the information they receive Dr. Reconciled as the Author and Future Health as the organization.  

The Figure below represents information from two different organizations to a clinician for reconciliation:

{% include img.html img="Provenance_Recon_Workflow_Step2.svg" caption="Figure 1: Clinical Information Reconciliation and Incorporation (CIRI) from two Organizations" %}

 Dr. Reconciled is the latest author after updating the reaction on 5/15/2019 and accepting to the local data store. The acceptance of the information is them taking over the responsibility.

 `GET /AllergyIntolerance?patient=[ID]&_revinclude=Provenance:target`

Good Health Organization Provenance
{% include examplebutton_default.html example="get-all-allergy-provenance-good-health" b_title = "Click Here to See 'Get Allergy Information for a Patient at Good Health' Example" %}

Sunshine Health Organization Provenance
{% include examplebutton_default.html example="get-all-allergy-provenance-sunshine-health" b_title = "Click Here to See 'Get Allergy Information for a Patient at Sunshine Health' Example" %}

After reconciliation, the Future Health Organization Provenance contains the latest information.
{% include examplebutton_default.html example="get-all-allergy-provenance-future-health" b_title = "Click Here to See 'Get Allergy Information for a Patient at Future Health' Example" %}

#### Accepting information from a single site

The Figure below represents information after a provider accepted information from a single site:

{% include img.html img="Provenance_Recon_Single_Organization.svg" caption="Figure 2: CIRI After Accepting Reconciliation, No Changes" %}

Dr. Accepted is the latest author after verifying the problem on 5/2018 and accepting the problem data into their local data store, since it went through an interactive reconciliation process. This type of authorship change is only relevant for data fit for reconciliation, such as medications, allergies, problems. If Dr. Accepted had saved other clinical content into his EHR that aren't reconciled but simply stored, such as clinical notes, that content must retain its original author.

#### HIE Redistribution

A Health Information Exchange (HIE) is an organization and a technology to facilitate exchange from one to many partners. In certain HIE scenarios they only redistribute information, while in others they store, transform, and redistribute information. The HIE must keep fidelity of the clinical content, (original author, author organization, and timestamp). The HIE must keep track of who sent them the information for auditing, however, they are not required to include the original transmitter when redistributing content.

{% include img.html img="Provenance_HIE_Single_Org_Device.svg" caption="Figure 3: HIE Redistribution - No clinical content transformation" %}

Since no clinical content is changed in the HIE redistribution the best scenario is a Provenance Record with:
- Provenance.agent.type = author
  - Provenance.agent.who set to the practitioner who authored the content (i.e. not the HIE)
  - Provenance.agent.onBehalfOf set to the organization that author acted on behalf of before sharing with the HIE
- Provenance.agent.type = transmitter
  - Provenance.agent.who set to the HIE organization

 The timestamp and pointer (i.e. target) to the appropriate Resource is required in all cases and must be included. This IG would note these as **SHALL** constraints if systems always had the Author and Author Organizations available. Participants in the development of this guide reported Author information provided to HIEs is inconsistent and unreliable.  


#### HIE Transformation

Different from Use Case 3 - HIE Redistribution, Use Case 4 includes transformation of data. Information is received (e.g. v2 lab, other CDs) and transformed by a HIE, stored, and then passed in a new format (e.g. CCD or FHIR). 

{% include img.html img="Provenance_HIE_Multi_Org_Device.svg" caption="Figure 4: HIE Transformation - Clinical content is transformed" %}

Transformation of data from one format to another **MAY** change the authorship of the information, where the HIE is the author/author organization. The original data source must be maintained by the HIE. An `agent.type=assembler`, `agent.type=transmitter`, or other agents from [Provenance Agent Type] value set **MAY** also be included. Due to insufficient implementer guidance the Basic Provenance guidance here doesn’t specify how to assign authorship for this use case. HL7 plans to gather additional input and include in the HL7 Basic Provenance Informative guide for C-CDA and FHIR.

<br />

---

[^1]: This Basic Provenance guidance and [US Core Provenance Profile] is provisional and may change in future releases. Although, it is based on feedback from the HL7 and Argonaut communities, there was incomplete testing of this approach prior to publication.

{% include link-list.md %}
