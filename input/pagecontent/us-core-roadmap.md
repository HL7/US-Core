
The US Core FHIR Profiles are designed to be the base set of requirements for FHIR implementation in the US. All US Realm implementation guides **SHALL** use the US Core Profiles or **SHALL** explicitly state why they are unable to use them. Throughout the development of US Core, implementers, the government, and the clinical community have brought forward additional requirements. This section outlines the approach to growth and a place for items that may be added to US Core.

### US Core Yearly Updates



Yearly US Core updates reflect [U.S. Core Data for Interoperability (USCDI)] changes and requests from the US Realm FHIR community.

The following table shows the relationship between each USCDI and US Core Version.
The USCDI version links to its respective ASTP/ONC Standards Bulletin, which provides background and the new data classes and elements for the version.

{% include uscdi-uscore-version-table.md %}

Our yearly road map is outlined in the figure below:

{% include img.html img="yearly-updates.png" caption="Figure 1: US Core Yearly Updates" %}

### FHIR Version Support

US Core has been based on [FHIR Version R4] since US Core version 3.0.0. FHIR Version R4 was released on Dec 27, 2018, and was the first version with [Normative] content. HL7's [US Realm Steering Committee (USRSC)] directs US Realm activities, including this guide. In January 2024, the USRSC decided that the next version of FHIR that US Core will be based on will be the upcoming FHIR Version R6. As of the publication date, there is no timeline for this update. When we update to FHIR Version R6, these breaking updates to US Core are under consideration.

- Addition of MedicationStatement
- Mandate supporting PractitionerRole


### Growth Path of US Core

The US Core Implementation Guide will grow following these steps:

{% include img.html img="US_Core_Growth_Path.jpg" caption="Figure 1: Growth Path of US Core" %}

1. Declare candidacy - this step can be completed by presenting a Project Proposal to the US Realm Steering Committee.
1. Get published - Develop a formal profile, an implementation guide, or get requirements directly published in  FHIR Core. The initial publication could be an outside consortium or vendor publication.
1. Pilot—Coordinate an in-person or virtual connectathon with three or more implementers. Testing and piloting are ways to identify issues with the new proposal.
1. Propose candidate for US Core to US Realm Steering Committee - receive formal approval from the US Realm SC to add.
1. Submit formal STU comments or propose through a ballot

A new US Regulatory requirement may skip some of these steps. However, regulators SHOULD be encouraged to complete pilot testing. Pilot testing makes it easier to understand how a change will affect real-world implementation.


### Future Candidate Requirements Under Consideration

Past Balloters, STU commenters, and Accelerator Project teams submitted the following items for consideration for adding US Core. Additional requirements gathering is required before testing may occur on these items:

#### Additional pilot Testing of UDI elements
In the January ballot 2019, we tested this process with the FDA, requesting that US Core include all the parts of UDI. In prior efforts, the FDA had successfully enhanced the base FHIR specification to include the UDI components.

#### [Device]
The US Core Implantable Device Profile is intended only for implantable devices. Please submit your successful implementation of a general non-implantable Device Profile (for example, software or crutches) for consideration in a future update of US Core.

#### [MedicationAdministration]
The US Core design assumes that access to the Active Medication List is through searching MedicationRequest. (See: https://build.fhir.org/ig/HL7/US-Core/medication-list-guidance.html.)  The orders (MedicationRequest) capture all the medications and whether they have been fulfilled. Medication Administration can be used as well, but systems will need to be careful to link to the appropriate MedicationRequest. Future versions of US Core may test and add MedicationAdministration.

#### Searching for Multiple Patients
Searching for multiple patients has been called out in the ASTP Health IT Certification Program. Defining capabilities for multiple patient access would focus on querying real-time data for a user-facing provider app across patients. Examples of the type of queries that would be addressed include searching for all of a provider's patients:

- with recent lab results  
- currently in the Emergency Department
- with an Allergy to X
- being seen by a provider for the day

#### Timezones and Time Offsets
Clients face challenges displaying the source data's times and timezone regardless of the end user's current timezone. A solution is to define requirements and best practices for servers to preserve and represent time offsets and time zones.  

>A *timezone* is a geographical region in which residents observe the same standard time. A *time offset* is an amount of time subtracted from or added to Coordinated Universal Time (UTC) time to get the current civil time, whether it is standard time or daylight saving time (DST).[^1]

A common practice is to preserve the source data time offsets as the original offset or convert them to Coordinated Universal Time (UTC) time. Making this a requirement is one consideration. Another is adding server best practices for preserving source timezones using the FHIR standard [timezone extension]. A third is providing a Client algorithm for resolving time offsets and time zones.

#### Record or Update Data


Systems may use operations that create and update resources for any of the profiles in this IG. However, more guidance is needed on writing and updating data in the context of US Core Profiles to support consistency between implementations. Multiple issues will need to be considered when defining expected behavior by the various actors to support updates and writes to the data, including:

  - Defining the overall approach
    -  direct updates to a particular resource via FHIR RESTful transactions
    - new Profiles to represent the context and issue and request
  - Write failure scenarios (e.g., insufficient data to create)
  - Recording and updating data in the context of the Must Support fields
  - Indicating the source of the update


The Argonaut project has defined [Writing Vital Signs] for creating and updating vital sign Observations resources from patient-facing and provider-facing applications and expects to develop similar guidance for other Observation categories and resource types. After adequate testing by implementers, we will assess the feasibility of incorporating this guidance into the US Core API.

#### Subscriptions

FHIR Subscriptions enable real-time data exchange by allowing systems to subscribe to patient-specific or population-level updates, ensuring timely access to critical healthcare information. As US Core continues to evolve, Subscriptions will play a key role in supporting event-driven workflows, such as notifications for lab results, medication changes, or care plan updates. This functionality aligns with the push toward interoperable, proactive care delivery across the US healthcare ecosystem. Future US Core implementations may expand Subscription use cases, improving integration between EHRs, payer systems, and public health platforms.

The Argonaut project has defined the [Patient Data Feed] as an optional feature for servers implementing US Core. It allows clients to receive FHIR Subscription Notifications when events occur related to US Core content.


------------------------------------------------------------------------
Footnotes

[^1]: https://en.wikipedia.org/w/index.php?title=UTC_offset#Time_zones_and_time_offsets


{% include link-list.md %}
