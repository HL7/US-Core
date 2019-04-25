This profile sets minimum expectations for the [Device] resource to record, search and fetch UDI information associated with a patient. It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core-Device profile:

-   Query for a Patient's Devices
-   Record a Patient Device

### Mandatory and Must Support Data Elements

The following data-elements are mandatory (i.e data MUST be present) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition](#formal-views-of-profile-content) below provides the  formal summary, definitions, and  terminology requirements.

**Each Device must have:**

1.  a code identifying the type of resource
1.  a patient

In addition, the following data-elements must be supported if the data is present in the sending system ([Must Support] definition):

**Each Device must support:**

1. A Unique Device Identifier (UDI) numeric or alphanumeric code
   - either as the Human Readable Form (HRF) string representation of the barcode
   - or the Automatic Identification and Data Capture (AIDC) representation.

**Profile specific implementation guidance:**

* none

### Examples

- [Device-udi-1](Device-udi-1.html)

{% include link-list.md %}
