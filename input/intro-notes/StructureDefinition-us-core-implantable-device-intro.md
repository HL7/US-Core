
**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-   Query for a Patient's Implantable Devices
-  [Record or update]  a Patient Implantable Device

### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.

**Each Implantable Device Must Have:**

1. a code identifying the type of device
1. a patient

In addition, the following data elements must be supported if the data is present in the sending system ([Must Support] definition):

**Each Implantable Device Must Support:**

1. A Unique Device Identifier (UDI) numeric or alphanumeric code as the Human Readable Form (HRF) string representation of the barcode
1. The Device Identifier (UDI-DI)
1. the manufacture date
1. the expiration date
1. the lot number
1. the serial number
1. the distinct identifier (i.e., the distinct identification code)

**Profile Specific Implementation Guidance:**
- For non-implantable devices (for example, software or crutches), use the base FHIR Device resource or other use case-specific Device profiles.
- This profile supports the requirement to retrieve a 170.315(a)(14) [Implantable device list](https://www.healthit.gov/test-method/implantable-device-list). It follows the [HL7 Cross Paradigm Implementation Guide: UDI Pattern] guidelines for exchanging information about the use and implantation of medical devices in patients.
  - A unique device identifier (UDI) is a unique numeric or alphanumeric code. There is a machine-readable version (AIDC - the Automatic Identification and Data Capture) and a human-readable version of the UDI (HRF - Human Readable Form string). This profile specifies that only the HRF must be supported. Considering the complexity of parsing AIDCs, there is *no expectation* at this time that one converts an AIDC to HRF upon receipt from a FHIR source that is not conformant to this profile or is using another interchange standard (e.g., C-CDA, HL7 v2, etc.). The UDI generally consists of a mandatory Device Identifier (DI) and a conditional Production identifier (PI) that identifies one or more of the five UDI-PI elements. The UDI and its components are mapped to the US Core Implantable Device Profile elements in the table below:

    |UDI component|US Core Implantable Device Profile element|
    |---|---|
    |UDI HRF string|`Device.udiCarrier.carrierHRF`|
    |DI|`Device.udiCarrier.deviceIdentifier`|
    |manufacture date (UDI-PI element)|`Device.manufactureDate`|
    |expiration date (UDI-PI elemente|`Device.expirationDate`|
    |lot number (UDI-PI element)|`Device.lotNumber`|
    |serial number (UDI-PI element)|`Device.serialNumber`|
    |distinct identifier (UDI-PI element)|`Device.distinctIdentifier`|
    {:.grid}

  -  Implementers are encouraged to use the FDA Global UDI Database (GUDID) and associated APIs to parse and validate the UDI:
      - The [AccessGUDID API](https://www.fda.gov/medical-devices/global-unique-device-identification-database-gudid/accessgudid-public) provides access to device records in GUDID, including safety information and UDI. It includes APIs to query and download a complete list of implantable devices registered in GUDID.
      - The [Parse UDI API](https://accessgudid.nlm.nih.gov/resources/developers/parse_udi_api) allows users to pass a UDI and return each part of the UDI in a structured format (specifically the serialNumber, lotNumber, expirationDate, distinctIdentifier (returned as donation_id) or manufactureDate).

- Implantable medical devices with UDI information **SHALL** represent the UDI code in `Device.udiCarrier.carrierHRF`. All five UDI-PI elements defined in the UDI code may not always be present in every UDI instance. However, those UDI-PI elements present **SHALL** be represented in the corresponding US Core Implantable Device Profile elements.

   UDI may not be present in all scenarios, such as historical implantable devices, patient-reported implant information, payer-reported devices, or improperly documented implants. If UDI is not present and the manufacturer or model number information is available, they **SHOULD** be included to support historical reports of implantable medical devices as follows:

   |data element|US Core Implantable Device Profile element|
   |---|---|
   |manufacturer|`Device.manufacturer`|
   |model|`Device.model`|
   {:.grid}

- Servers **SHOULD** support query by `Device.type` to allow Clients to request the patient's devices by a specific type. Note: `Device.type` is too granular to differentiate implantable vs. non-implantable devices.  
- The [Quick Start] section below describes searching for all devices. Records of implanted devices **MAY** be queried against UDI data, including:

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

{% include link-list.md %}
