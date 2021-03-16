
﻿This profile sets minimum expectations for the [Device] resource to record, search, and fetch UDI information associated with a patient's implantable device(s). It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.  The profile is intended to *only* be used for implantable devices.  For non-implantable devices (for example, software or crutches) use the base FHIR Device resource or other use case specific Device profile.
{:.new-content #FHIR-27810}

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core Implantable Device profile:

-   Query for a Patient's Implantable Devices
-  [Record or update]  a Patient Implantable Device

### Mandatory and Must Support Data Elements

The following data-elements are mandatory (i.e data MUST be present) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.

**Each Device must have:**

1.  a code identifying the type of device
1.  a patient

In addition, the following data-elements must be supported if the data is present in the sending system ([Must Support] definition):

**Each Device must support:**

1. The Device Identifier (UDI-DI)
1. A Unique Device Identifier (UDI) numeric or alphanumeric code
   - either as the Human Readable Form (HRF) string representation of the barcode
   - or the Automatic Identification and Data Capture (AIDC) representation.
<div class='new-content' markdown='1'>
1. the manufacture date
1. the expiration date
1. the lot number
1. the serial number
1. the distinct identifier (i.e., the distinct identification code)
</div>

**Profile specific implementation guidance:**

- This profile supports the requirement to retrieve an 170.315(a)(14) [Implantable device list](https://www.healthit.gov/test-method/implantable-device-list). Implementers are encouraged to use the FDA Global UDI Database (GUDID) and associated APIs to parse and validate the UDI:
  - The [AccessGUDID API](https://www.fda.gov/medical-devices/global-unique-device-identification-database-gudid/accessgudid-public) provides access to device records in GUDID including safety information and UDI. It includes APIs to query and download a complete list of implantable devices registered in GUDID.
  - The Parse UDI API allows users to pass a UDI and return each part of the UDI in a structured format (specifically the serialNumber, lotNumber, expirationDate, distinctIdentifier (returned as donation_id) or manufactureDate).
- {:.new-content #FHIR-28942}Implantable medical devices that have UDI information **SHALL** represent this information in either `carrierAIDC` or `carrierHRF`.
     - Although both are marked as must support, the server systems are not required to support both `carrierAIDC` and `carrierHRF`, but **SHALL** support at least one of these elements.
     - The client application **SHALL** support both elements.
     - UDI may not be present in all scenarios such as historical implantable devices, patient reported implant information, payer reported devices, or improperly documented implants. If UDI is not present and the manufacturer (`manufacturer`) model number (`model`) information is available, they **SHOULD** be included to support historical reports of implantable medical devices
- {:.new-content #FHIR-28942}For Implantable medical devices that have UDI information, *all* of the following five UDI-PI elements that are present **SHALL** be represented in the corresponding US Core Implantable Device Profile element:

  |UDI-PI element|US Core Implantable Device Profile element|
  |---|--|
  |manufacture date|Device.manufactureDate|
  |expiration date|Device.expirationDate|
  |lot number|Device.lotNumber|
  |serial number|Device.serialNumber|
  |distinct identifier|Device.distinctIdentifier|
  {:.grid}

- Servers **SHOULD** support query by Device.type to allow clients to request the patient's devices by a specific type. Note: The Device.type is too granular to differentiate implantable vs. non-implantable devices.  
- In the [Quick Start] section below, searching for all devices is described. Records of implanted devices **MAY** be queried against UDI data including:

    - UDI HRF string (`udi-carrier`)
    - UDI Device Identifier (`udi-di`)
    - Manufacturer (`manufacturer`)
    - Model number (`model`)

  Implementers **MAY** also adopt custom SearchParameters for searching by:

    - lot numbers
    - serial number
    - expiration date
    - manufacture date
    - distinct identifier

### Examples

- [Device-UDI-1](Device-udi-1.html)
- [Device-UDI-2](Device-udi-2.html)
- [Device-UDI-3](Device-udi-3.html)


{% include link-list.md %}
