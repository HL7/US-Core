---
title: Future of US Core
layout: default
---

This section outlines the approach to adding new content to US Core.

---

<!-- TOC  the css styling for this is \pages\assets\css\project.css under 'markdown-toc'-->
**Contents**

* Do not remove this line (it will not be displayed)
{:toc}

---

<!-- end TOC -->

### Future of US Core

The US Core FHIR profiles are designed to be the base set of requirements for FHIR implementation in the US. All US Realm implementation guides **SHALL** use the US Core profiles or **SHALL** explicitly state why they are unable to use. Throughout the development of US Core, implementers, government, and clinical community have brought forward additional requirements for US Core. This section outlines the approach to growth, and is holding place for items that with additional profiling and testing will be added to US Core.

#### Growth Path of US Core

The US Core implementation Guide will grow following these steps:

{% include img.html img="US_Core_Growth_Path.jpg" caption="Figure 1: Growth Path of US Core" %}

1. Declare candidacy - this step can be completed by presenting to the US Realm Steering Committee through a Project Scope Statement.
1. Get published - development a formal profile, implementation guide, or get requirements directly published in  FHIR Core. The initial publication could be an outside consortium, or vendor publication.
1. Pilot - coordinate with 3 or more implementers an in-person or virtual connectathon. This is the time to identify issues with the new proposal.
1. Propose candidate for US Core to US Realm Steering Committee - receive formal approval from the US Realm SC to add.
1. Submit formal STU comment, or propose through a ballot

A new US Regulatory requirement may jump over some of these steps, however, regulators should be discouraged from skipping pilot testing. Without pilot testing it's difficult to understand how a change will affect real-world implementation.

In the January ballot of 2019 we tested this process with the FDA requesting US Core include all the component parts of UDI. In prior efforts, the FDA had successfully enhanced the base FHIR specification to include the UDI components, reaching step 3. In the summer of 2019 FDA plans to pilot these proposed new requirements within the Argonaut community the results of which will inform updates to the planned fall 2019 STU release.

#### Future Requirements Under Considerations

**Update and Create Expectations**

At the time of publication this guide does not cover writing and updating data in context of US Core profiles. Specific issues that we need consider when define expected behavior and full write support include:

- Write failure scenarios (insufficient data to create)
- Writing and updating data in the context of the Must Support fields
- Pilot Testing


**Pilot Testing**

Additional pilot Testing of UDI elements in a US Core Implantable Device Profile

#### Candidates under consideration

The following items were submitted during a US Core ballot, Argonaut review and testing, and STU comment. Additional requirements gathering is required before testing may occur on these items:

- Additional pilot Testing of UDI elements in a US Core Implantable Device Profile
* [ServiceRequest] - The CDS hooks community, and other implementers are gathering requirements for the ServiceRequest Resource.
* {: .note-to-balloters}[Coverage] - Several US implementation guides including Da Vinci CRD, Argonaut Scheduling, and QI Core have defined requirements for the Coverage Resource.
* {: .note-to-balloters}Searching for multiple patients has been called out in the ONC Health IT Certification Program.  Defining capabilities for multiple patient access would focus on querying real time data for a user facing provider app across patients. Examples of the type of queries that would be addressed include searching for all of a provider's patients:
    - with recent lab results  
    - currently in the Emergency Department
    - with an Allergy to X
* {: .note-to-balloters}Clients currently face challenges displaying the source data's times and timezone regardless of the end user's current timezone.  A solution is to define requirements and/or best practices for servers to preserve and represent time offsets and timezones.  
>A *timezone* is a geographical region in which residents observe the same standard time. A *time offset* is an amount of time subtracted from or added to Coordinated Universal Time (UTC) time to get the current civil time, whether it is standard time or daylight saving time (DST).[^1]

  Common practice is to preserve the source data time offsets either as the original offset or converted to Coordinated Universal Time (UTC) time. Making this a requirement is one consideration.  Another consideration is the addition of server best practices for preserving source timezones using the FHIR standard [timezone extension]. A third consideration is providing a client algorithm for resolving time offsets and timezones.

* At the time of publication this guide provides very little guidance on writing and updating data in context of US Core profiles. There are multiple issues that will need to be considered when defining expected behavior by the various actors to support updates and writes to the data including:

  - Defining the overall approach
    -  direct updates to a particular resource via FHIR RESTful transactions
    - new Profiles to represent the context and issue and request
  - Write failure scenarios (e.g., insufficient data to create)
  - Writing and updating data in the context of the Must Support fields
  - Indicating the source of update

------------------------------------------------------------------------
[^1]: https://en.wikipedia.org/w/index.php?title=UTC_offset#Time_zones_and_time_offsets


{% include link-list.md %}
