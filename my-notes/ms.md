### Claiming Conformance to a US Core Profile

To claim conformance to a US Core Profile US Core Servers **SHALL**:

  - Be able to populate all profile data elements that have a minimum cardinality >= 1 and/or flagged as *Must Support* as defined by that profile’s StructureDefinition.
  - Conform to the [US Core Server Capability Statement] expectations for that profile’s type.


### Must Support

For querying and reading US Core Profiles, *Must Support* on any profile data element **SHALL** be interpreted as follows (see the [Future of US Core] page for writing and updating US Core Profiles.) :

* US Core Responders **SHALL** be capable of populating all data elements as part of the query results as specified by the [US Core Server Capability Statement].
* US Core Requestors **SHALL** be capable of processing resource instances containing the data elements without generating an error or causing the application to fail. In other words US Core Requestors **SHOULD** be capable of displaying the data elements for human use or storing it for other purposes.
* In situations where information on a particular data element is not present and the reason for absence is unknown, US Core Responders **SHALL NOT** include the data elements in the resource instance returned as part of the query results.
* When querying US Core Responders, US Core Requestors **SHALL** interpret missing data elements within resource instances as data not present in the US Core Responder's system.
* In situations where information on a particular data element is missing and the US Core Responder knows the precise reason for the absence of data, US Core Responders **SHALL** send the reason for the missing information using values (such as nullFlavors) from the value set where they exist or using the dataAbsentReason extension.
* US Core Requestors **SHALL** be able to process resource instances containing data elements asserting missing information.

* NOTE: Typically *US Core Responder* Actor = Server and *US Core Requestor Actor* = Client
* NOTE: The above definition of *Must Support* is derived from HL7v2 concept "Required but may be empty - RE" described in HL7v2 V28_CH02B_Conformance.doc.
* NOTE: Readers are advised to understand [FHIR Terminology] requirements, [FHIR RESTful API] based on the HTTP protocol, along with [FHIR Data Types], [FHIR Search] and [FHIR Resource] formats before implementing US Core requirements.
