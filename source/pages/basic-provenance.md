---
title: Basic Provenance
layout: default
topofpage: true
---
​This section provides implementers with important definitions to create and share the Provenance Resource.

{:.no_toc}

<!-- TOC  the css styling for this is \pages\assets\css\project.css under 'markdown-toc'-->

<!--* Do not remove this line (it will not be displayed)
 {:toc} -->

### BASIC PROVENANCE - UNDER DEVELOPMENT

The FHIR [Provenance] Resource provides a foundation for assessing authenticity, enabling trust, and allowing reproducibility. The base FHIR Provenance resource isn't scoped to a specific use case, nor limits the number of Provenance records associated with a Resource. The guidance here focuses on key subset of elements (Author Organization, Author, Timestamp), specific use cases, and the 'last hop'. The guidance here doesn't preclude more advanced use cases or additional elements.

#### Key Provenance Elements

Add definition of 3 key elements (Author Organization, Author, Timestamp)
Add table mapping to high level elements

#### Use Cases

Clinical Information Reconciliation and Incorporation (CIRI) is a process where a user reviews and updates, or accepts, information into their system. The information could come from a Health Information Exchange (HIE), a 3rd-party FHIR server, or a patient providing informaiton. Figure XX represents informaiton beint provided from two different soruces, Good Health organizaiotn and Sunshine Health Organization. Dr. Reconciled reviews the information in Figure XX, updates the reaction to hives, and stores into the Future Health Organiztion system. When a mobile app requests the information they receive Dr. Reconciled as the Author and Future Health as the organization.  


This is some text to describe the image in step 1:

{% include img.html img="Provenance_Recon_Workflow_Step1.jpg" caption="Figure 1: Clinical Information Reconciliation and Incorporation (CIRI) from two Organizations " %}

Good Health Organization Provenance
**insert example**

Sunshine Health Organization Provenance
**insert example**

This is some text to describe the image in step 2:

{% include img.html img="Provenance_Recon_Workflow_Step2.jpg" caption="Figure 1: CIRI After Addition Information during Reconciliation" %}

Future Health Organization Provenance
**insert example**

#### 'Last Hop'

Add definition of Last hop

add principles
add images.




{% include link-list.md %}
