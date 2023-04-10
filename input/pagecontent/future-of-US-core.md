
The US Core FHIR profiles are designed to be the base set of requirements for FHIR implementation in the US. All US Realm implementation guides **SHALL** use the US Core profiles or **SHALL** explicitly state why they are unable to use. Throughout the development of US Core, implementers, the government, and the clinical community have brought forward additional requirements for US Core. This section outlines the approach to growth and a place for items that may be added to US Core.

### US Core Yearly Updates

Yearly US Core updates reflect changes to [U.S. Core Data for Interoperability (USCDI)] and requests from the US Realm FHIR community. This approach is outlined in the figure below:

{% include img.html img="yearly-updates.png" caption="Figure 1: US Core Yearly Updates" %}

### Growth Path of US Core

The US Core implementation Guide will grow following these steps:

{% include img.html img="US_Core_Growth_Path.jpg" caption="Figure 1: Growth Path of US Core" %}

1. Declare candidacy - this step can be completed by presenting a Project Proposal to the US Realm Steering Committee.
1. Get published - Develop a formal profile, an implementation guide, or get requirements directly published in  FHIR Core. The initial publication could be an outside consortium or vendor publication.
1. Pilot - coordinate with three or more implementers an in-person or virtual connectathon. Testing and piloting is the way to identify issues with the new proposal.
1. Propose candidate for US Core to US Realm Steering Committee - receive formal approval from the US Realm SC to add.
1. Submit formal STU comments, or propose through a ballot

A new US Regulatory requirement may jump over some of these steps. However, regulators **SHOULD** be encouraged to complete pilot testing. With pilot testing, it is easier to understand how a change will affect real-world implementation.



### Future Candidate Requirements Under Consideration

Past Balloters, STU commenters, and Accelerator Project teams submitted the following items for consideration to add US Core. Additional requirements gathering is required before testing may occur on these items:

- **Additional pilot Testing of UDI elements** - In the January ballot of 2019 we tested this process with the FDA requesting US Core include all the parts of UDI. In prior efforts, the FDA had successfully enhanced the base FHIR specification to include the UDI components.
* [Device] - The US Core Implantable Device Profile is intended to *only* be used for implantable devices. Please submit your successful implementation of a general non-implantable Device Profile (for example, software or crutches) for consideration in a future update of US Core.
* [MedicationAdministration] - The US Core design is based on the assumption that access to the Active Medication List is through searching MedicationRequest. (See: https://build.fhir.org/ig/HL7/US-Core/medication-list-guidance.html)  The orders (MedicationRequest) capture all the medications, whether they have been fulfilled. MedicationAdministration can be used as well, but systems will need to be careful to link to appropriate MedicationRequest.  Future versions of US Core may test and add MedicationAdministration.
* **Searching for Multiple Patients** - Searching for multiple patients has been called out in the ONC Health IT Certification Program.  Defining capabilities for multiple patient access would focus on querying real-time data for a user-facing provider app across patients. Examples of the type of queries that would be addressed include searching for all of a provider's patients:
    - with recent lab results  
    - currently in the Emergency Department
    - with an Allergy to X
* **Timezones and Time Offsets** - Clients currently face challenges displaying the source data's times and timezone regardless of the end user's current timezone.  A solution is to define requirements and best practices for servers to preserve and represent time offsets and time zones.  
>A *timezone* is a geographical region in which residents observe the same standard time. A *time offset* is an amount of time subtracted from or added to Coordinated Universal Time (UTC) time to get the current civil time, whether it is standard time or daylight saving time (DST).[^1]

  Common practice is to preserve the source data time offsets as the original offset or converted to Coordinated Universal Time (UTC) time. Making this a requirement is one consideration.  Another consideration is the addition of server best practices for preserving source timezones using the FHIR standard [timezone extension]. A third consideration is providing a client algorithm for resolving time offsets and time zones.

* **Record or Update** - Very little guidance is provided on recording and updating data in the context of US Core profiles. There are multiple issues that will need to be considered when defining expected behavior by the various actors to support updates and writes to the data, including:

  - Defining the overall approach
    -  direct updates to a particular resource via FHIR RESTful transactions
    - new Profiles to represent the context and issue and request
  - Write failure scenarios (e.g., insufficient data to create)
  - Recording and updating data in the context of the Must Support fields
  - Indicating the source of the update

------------------------------------------------------------------------
Footnotes

[^1]: https://en.wikipedia.org/w/index.php?title=UTC_offset#Time_zones_and_time_offsets


{% include link-list.md %}
