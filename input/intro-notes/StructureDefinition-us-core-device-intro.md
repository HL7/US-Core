
**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-   Query for a Patient's <span class="bg-success" markdown="1">Devices</span><!-- new-content -->
-  [Record or update]  a Patient <span class="bg-success" markdown="1">Device</span><!-- new-content -->

### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.

**Each Device Must Have:**

1. a code identifying the type of device

In addition, the following data elements must be supported if the data is present in the sending system ([Must Support] definition):

**Each Device Must Support:**

1. <span class="bg-success" markdown="1">a patient*</span><!-- new-content -->

<div class="bg-success" markdown="1">

{% include additional-requirements-intro.md type="Condition" plural="true" %}

1. UDI Unique Device Identifier (UDI) Barcode string.*
   - Unique Device Identifier (UDI) numeric or alphanumeric code as the Human Readable Form (HRF) string representation of the barcode
   - The Device Identifier (UDI-DI)
2. the manufacture date
3. the expiration date
4. the lot number
5. the serial number
6. the distinct identification number (e.g., Donation
Identification Number(DIN))
</div><!-- new-content -->

*see guidance below

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the US Core Profile to support implementation and certification.
<div class="bg-success" markdown="1">

- Because this profile aligns with the USCDI Medical Devices Data Class, it supports the exchange of UDI information when available (for example, implantable devices or non-implantable devices, such as ventilators). However, systems are not expected to record UDI data for every use case or device.
- \*`Device.patient`'s minimum cardinality of zero supports use cases where devices may be tracked independently of a patient.

#### UDI  Specific Implementation Guidance
</div><!-- new-content -->

- This profile supports the requirement to retrieve a 170.315(a)(14) [Medical device list](https://www.healthit.gov/test-method/medical-device-list). It follows the [HL7 Cross Paradigm Implementation Guide: UDI Pattern] guidelines for exchanging information about the use and implantation of medical devices in patients.
  - A unique device identifier (UDI) is a unique numeric or alphanumeric code. There is a machine-readable version (AIDC - the Automatic Identification and Data Capture) and a human-readable version of the UDI (HRF - Human Readable Form string). This profile specifies that only the HRF must be supported. Considering the complexity of parsing AIDCs, there is *no expectation* at this time that one converts an AIDC to HRF upon receipt from a FHIR source that is not conformant to this profile or is using another interchange standard (e.g., C-CDA, HL7 v2, etc.). The UDI generally consists of a mandatory Device Identifier (DI) and a conditional Production identifier (PI) that identifies one or more of the five UDI-PI elements. The UDI and its components are mapped to the *US Core Device Profile elements in the table below:

    |UDI component|*US Core Device Profile element|
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
      - The [AccessGUDID API](https://www.fda.gov/medical-devices/global-unique-device-identification-database-gudid/accessgudid-public) provides access to device records in GUDID, including safety information and UDI. It includes APIs to query and download a complete list of medical devices registered in GUDID.
      - The [Parse UDI API](https://accessgudid.nlm.nih.gov/resources/developers/parse_udi_api) allows users to pass a UDI and return each part of the UDI in a structured format (specifically the serialNumber, lotNumber, expirationDate, distinctIdentifier (returned as donation_id) or manufactureDate).

- <span class="bg-success" markdown="1">Medical devices</span><!-- new-content --> with UDI information **SHALL** represent the UDI code in `Device.udiCarrier.carrierHRF`. All five UDI-PI elements defined in the UDI code may not always be present in every UDI instance. However, those UDI-PI elements present **SHALL** be represented in the corresponding *US Core Device Profile elements.

   UDI may not be present in all scenarios, such as historical <span class="bg-success" markdown="1">medical devices</span><!-- new-content -->, patient-reported implant information, payer-reported devices, or improperly documented implants. If UDI is not present and the manufacturer or model number information is available, they **SHOULD** be included to support historical reports of medical <span class="bg-success" markdown="1">medical devices</span><!-- new-content --> as follows:

   |data element|*US Core Device Profile element|
   |---|---|
   |manufacturer|`Device.manufacturer`|
   |model|`Device.model`|
   {:.grid}

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
