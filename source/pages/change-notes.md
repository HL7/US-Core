---
title: US Core Change Notes
layout: default
active: changenotes
---
US Core was developed under the [Data Access Framework (DAF)](http://wiki.siframework.org/Data+Access+Framework+Homepage) initiative. DAF was a US initiative sponsored by the Office of the National Coordinator (ONC) which aimed to create FHIR profiles for access to discrete Meaningful Use Stage 2 data (Common MU Data Set) and key research data elements as FHIR resource instances. The initial HL7 DAF Implementation guide was published with the FHIR DSTU2 specification in October of 2015.  The [The Argonaut Project](http://argonautwiki.hl7.org/index.php?title=Main_Page) formed in December 2014 to accelerate the market readiness of open industry FHIR-based APIs for patient- and provider-driven interoperability use cases. Several Argonaut sprints were held based upon the DAF DSTU2 profiles. In 2015, ONC introduced a new rule which updated the required set of data elements to the [Common Clinical Data Set (CCDS)](https://www.healthit.gov/sites/default/files/2015Ed_CCG_CCDS.pdf).

Based upon these activities and HL7 sponsored connectathons it was recognized that the original DAF requirements were overly broad. Therefore, for FHIR STU3 (Version 3.0.0), the original DSTU2 DAF content was split into the US Core and [DAF Research](http://hl7.org/fhir/us/daf-research/) Implementation guides based on their main use cases:

- **US Core** : The US Core Implementation Guide covers the 2015 Meaningful Use Common Clinical Data Set (CCDS) and defines the *minimum* mandatory conformance requirements needed for accessing patient data based on the Argonaut pilot implementations. The US Core artifacts are consistent with the [Argonaut DSTU2-based Data Query IG](http://www.fhir.org/guides/argonaut/r2/) and [Argonaut STU3 based Provider Directory IG](http://www.fhir.org/guides/argonaut/pd/). This implementation guide forms the foundation to build future US Realm FHIR implementation guides and its content will continue to grow to meet the needs of US implementers.

- **DAF-Research** The DAF-Research Implementation Guide enables researchers to access data from multiple organizations in the context of Learning Health System (LHS). The capabilities created as part of DAF-Research are intended to be leveraged to build our nation’s data infrastructure for a Learning Health System. The DAF-Research IG leverages the work that has been completed and tested as part of the US-Core IG.

##### Version 1.1.0

|GForge reference|Description of Change|
|---|---|
|Jan 2018 Ballot|Add US-Core-Encounter Profile based on DSTU2 DAF Encounter profile|
|Jan 2018 Ballot|Add US-Core-PractitionerRole Profile based on Argonaut Provider Directory PractitionerRole profile|
|Jan 2018 Ballot|Add US-Core-DocumentReference Profile based on Argonaut Data Access DocumentReference profile|

##### Version 1.0.1

|GForge reference|Description of Change|
|---|---|
|[GF#12597](https://gforge.hl7.org/gf/project/fhir/tracker/?action=TrackerItemEdit&tracker_item_id=11597)|Remove cda OID for valueset|
|[GF#12830](https://gforge.hl7.org/gf/project/fhir/tracker/?action=TrackerItemEdit&tracker_item_id=12830)|Update extensible bindings definitions|
|[GF#12912](https://gforge.hl7.org/gf/project/fhir/tracker/?action=TrackerItemEdit&tracker_item_id=12912)|Update guidance in US-Core Birth Sex extension|
|[GF#13204](https://gforge.hl7.org/gf/project/fhir/tracker/?action=TrackerItemEdit&tracker_item_id=13204)|Technical correction to fix the validation artifacts|
|[GF#13510](https://gforge.hl7.org/gf/project/fhir/tracker/?action=TrackerItemEdit&tracker_item_id=13510)|Corrected URL in CarePlan Summary|
|[GF#13574](https://gforge.hl7.org/gf/project/fhir/tracker/?action=TrackerItemEdit&tracker_item_id=13574)|Corrected reference to US-Core-Patient in US Core Procedure|
|[GF#13596](https://gforge.hl7.org/gf/project/fhir/tracker/?action=TrackerItemEdit&tracker_item_id=13596)|Updated to reference FHIR 3.0.1 specification instead of 3.0.0|
|[GF#13605](https://gforge.hl7.org/gf/project/fhir/tracker/?action=TrackerItemEdit&tracker_item_id=13605)|Added fhirpath expressions to Search Parameters|
|[GF#13642](https://gforge.hl7.org/gf/project/fhir/tracker/?action=TrackerItemEdit&tracker_item_id=13642)|Change references to US-Core-Profiles in US Core CareTeam profile|
|[GF#13709](https://gforge.hl7.org/gf/project/fhir/tracker/?action=TrackerItemEdit&tracker_item_id=13709)|Fix CVX code expansion|
|[GF#13799](https://gforge.hl7.org/gf/project/fhir/tracker/?action=TrackerItemEdit&tracker_item_id=13799)|Correct typo in US Core Ethnicity Extension Introduction|


|Github Publishing Issue|Description of Change|
|---|---|
|[#19](https://github.com/HL7/US-Core/issues/19)|Remove all root slice names from spreadsheet generated StructureDefinitions|
