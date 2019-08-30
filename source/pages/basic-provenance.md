---
title: Basic Provenance Guidance
layout: default
topofpage: true
---
​This section provides implementers with important definitions to create and share the Provenance Resource.

{:.no_toc}

<!-- TOC  the css styling for this is \pages\assets\css\project.css under 'markdown-toc'-->

<!--* Do not remove this line (it will not be displayed)
 {:toc} -->

### Basic Provenance

The FHIR [Provenance] Resource provides a foundation for assessing authenticity, enabling trust, and allowing reproducibility. It isn't scoped to a specific use case, nor limits the number of Provenance records associated with a Resource. The basic guidance here, and in the [US Core Provenance Profile] focuses on a key subset of elements, the 'last hop', and specific use cases. The guidance here doesn't preclude more advanced use cases or additional elements.

Full Provenance of a Resource requires details from the original creator of a Resource and all intermediary actors that updated the Resource. Members of the Argonaut community and the HL7 security working group discussed the current sharing approaches, and display to end user, and agreed the most important information is the prior system providing the data, the 'last hop'.  Participants didn't dispute the potential need to recreate the full chain, but didn't see this as relevant to the immediate end-user.

#### Key Provenance Elements

The guidance for Provenance in US Core focuses on 4 key elements: Author, Author Organization, Timestamp, and the Target Resource. The Author represents the person(s) responsible for the information. The Author Organization represents the organization the author is associated when they created, updated, or deleted the data. The timestamp is the date and time the author created, updated, or deleted the data. The target is the Resource the Provenance record supports.

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

The HL7 Basic Provenance Informative implementation guide outlines four use cases: Fax, Health Information Exchange (HIE) redistribution, HIE transformation, and Clinical Information Reconciliation and Incorporation (CIRI). While these use cases may have FHIR implications in the future, CIRI is the key use case and is covered in detail here.

#### Clinical Information Reconciliation and Incorporation 

Clinical Information Reconciliation and Incorporation (CIRI) is a process where a user reviews and updates, or accepts, information into their system. The information could come from a Health Information Exchange (HIE), a 3rd-party FHIR server, or a patient providing information. Figure 1 represents information being provided from two different sources, Good Health organization and Sunshine Health Organization. Dr. Reconciled reviews the information in Figure 2, updates the reaction to hives, and stores into the Future Health Organization system. When a mobile app requests the information they receive Dr. Reconciled as the Author and Future Health as the organization.  

The Figure below represents information from two different organizations to a clinician for reconciliation:

{% include img.html img="Provenance_Recon_Workflow_Step2.svg" caption="Figure 1: Clinical Information Reconciliation and Incorporation (CIRI) from two Organizations" %}

 Dr. Reconciled is the latest author after updating the reaction on 5/15/2019 and accepting to the local data store. The acceptance of the information is them taking over the responsibility.
 
 `GET /AllergyIntolerance?patient=[ID]&us-core-includeprovenance`

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


### Development of `us-core-includeprovenance` parameter
The original design in this guide required support for the `_revinclude` parameter (see [Including other resources in result]({{site.data.fhir.path}}search.html#revinclude)) to retrieve a Provenance Record. After discussing this approach at length with the Argonaut community, and client developers, the US Core guidance shifted to the custom parameter `us-core-includeprovenance`. 

Functionally, the searches

`GET /AllergyIntolerance?patient=[ID]&_revinclude=Provenance:target` and `GET /AllergyIntolerance?patient=[ID]&us-core-includeprovenance` are equivalent.

Implementers found the name `_revinclude` non-intuitive, and were concerned clients would assume if FHIR servers supported this for Provenance, they would be adding support for other use cases. None of the servers that participated in the development of this guide have `_revinclude` in their current development roadmap.




{% include link-list.md %}
