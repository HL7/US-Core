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

The FHIR [Provenance] Resource provides a foundation for assessing authenticity, enabling trust, and allowing reproducibility. It isn't scoped to a specific use case, nor limits the number of Provenance records associated with a Resource. The basic guidance here focuses on a key subset of elements, the 'last hop', and specific use cases. The guidance here doesn't preclude more advanced use cases or additional elements.

#### Key Provenance Elements

The guidance for Provenance in US Core focuses on 4 key elements: Author, Author Organization, Timestamp, and the Target Resource. The Author represents the person(s) responsible for the information. The Author Organization represents the organization the author is associated when they created, updated, or deleted the data. The timestamp is the date and time the author created, updated, or deleted the data. The target is the Resource the Provenance record supports.

**Key Provenance elements:**

Element | Required |Optional| FHIR Element|
---|---|---|---|---
Author | Name<br>Identifier | NPI recommended, additional identifiers allowed| Provenance.agent.who
Author Organization | Name<br>Identifier  | NPI recommended, additional identifiers allowed |Provenance.agent.onBehalfOf 
Timestamp | Date and time with timezone offset | | Provenance.recorded
Target | Resource Provenance record supports | | Provenance.target
{: .grid}

#### 'Last Hop'

Full Provenance of a Resource requires details from the original creator of a Resource and all intermediary actors that updated the Resource. Members of the Argonaut community and the HL7 security working group discussed the current sharing approaches, and display to end user, and agreed the most important information is the prior system providing the data, the 'last hop'.  Participants didn't dispute the potential need to recreate the full chain, but didn't see this as relevant to the immediate end-user. 


### Use Cases

#### Clinical Information Reconciliation and Incorporation 

Clinical Information Reconciliation and Incorporation (CIRI) is a process where a user reviews and updates, or accepts, information into their system. The information could come from a Health Information Exchange (HIE), a 3rd-party FHIR server, or a patient providing information. Figure 1 represents information being provided from two different sources, Good Health organization and Sunshine Health Organization. Dr. Reconciled reviews the information in Figure 2, updates the reaction to hives, and stores into the Future Health Organization system. When a mobile app requests the information they receive Dr. Reconciled as the Author and Future Health as the organization.  


This is some text to describe the image in step 1:

{% include img.html img="Provenance_Recon_Workflow_Step1.svg" caption="Figure 1: Clinical Information Reconciliation and Incorporation (CIRI) from two Organizations " %}

Good Health Organization Provenance
 
 `GET /AllergyIntolerance?patient=[ID]&_revinclude=Provenance:target`

      {% include examplebutton_default.html example="get-all-allergy-provenance-good-health" b_title = "Click Here to See 'Get Allergy Information for a Patient at Good Health' Example" %}

Sunshine Health Organization Provenance
**insert example**

This is some text to describe the image in step 2:

{% include img.html img="Provenance_Recon_Workflow_Step2.svg" caption="Figure 2: CIRI After Addition Information during Reconciliation" %}

Future Health Organization Provenance
**insert example**

#### Clinical Information Reconciliation and Incorporation 



{% include link-list.md %}
