This profile sets minimum expectations for the [Device] resource to record, search and fetch UDI information associated with a patient. It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core-Device profile:

-   Query for a Patient's Devices
-   Record a Patient Device

### Mandatory and Must Support Data Elements

The following data-elements are mandatory (i.e data MUST be present) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.

**Each Device must have:**

1.  a code identifying the type of resource
1.  a patient

In addition, the following data-elements must be supported if the data is present in the sending system ([Must Support] definition):

**Each Device must support:**

1. A Unique Device Identifier (UDI) numeric or alphanumeric code
   - either as the Human Readable Form (HRF) string representation of the barcode
   - or the Automatic Identification and Data Capture (AIDC) representation.
1. The following parsed content from the UDI
   - the Device Identifier (DI)
   - the manufacture date
   - the expiration date
   - the lot number
   - the serial number

**Profile specific implementation guidance:**

- This profile supports the requirement to retrieve an 170.315(a)(14) [Implantable device list](https://www.healthit.gov/test-method/implantable-device-list).
- Implantable medical devices that have UDI information **SHALL** represent this information in either `carrierAIDC` or `carrierHRF`.
-  Servers **SHOULD** support query by Device.type to allow clients to request only implantable devices.
- In the [Quick Start] section below, searching for all devices is described. Records of implanted devices **MAY** be queried against UDI data including:

    - UDI Carrier string (`udi-carrier`)
    - UDI Device Identifier (`udi-di`)
    - Manufacturer (`manufacturer`)
    - Model number (`model`)

  Implementers **MAY** also adopt custom SearchParameters for searching by:

    - specific lot numbers
    - serial numbers

### Examples

- [Device-UDI-1](Device-udi-1.html)
- [Device-UDI-2](Device-udi-2.html)


{% include link-list.md %}
