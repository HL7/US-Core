Both the [MedicationRequest] and [MedicationStatement] resources can be used to record a patient's medication.  For more information about the context for their usages, refer to the medication domain [boundaries section].  This profile sets minimum expectations for the MedicationStatement resource to record, search and fetch medications associated with a patient. It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.

**Example Usage Scenarios:**

The following are example usage scenarios for the
US Core-MedicationStatement profile:

-   Query active medications being taken by a patient
-   Record or update active medications being taken by a patient

##### Mandatory Data Elements and Terminology


The following data-elements are mandatory (i.e data MUST be present). These are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [**Formal Profile Definition**](#profile) below provides the  formal summary, definitions, and  terminology requirements.  

**Each MedicationStatement must have:**

1.  a status
1.  a medication
1.  an assertion date
1.  a patient
1.  a code indicating whether the medication was taken

Additionally your system [Must Support]:

1. the time medication was taken
2. whether the MedicatoinStatement was derived from another resource

**Profile specific implementation guidance:**

*  The MedicationStatement and MedicationRequest resources can represent a medication using either a code, or reference to a [Medication] resource.
    *  When referencing a Medication resource,  the resource may be [contained] or an external resource.
    *  The server application MAY choose any combination of these methods, but if an external reference to Medication is used, the server SHALL support the [include] parameter for searching this element.
    *  The client application SHALL support all methods.  
    *  Additional guidance is provided below in the Search section and in the [CapabilityStatement] section.

#### Examples

- [MedicationStatement-uscore-ms1](MedicationStatement-uscore-ms1.html) Inline medication code to represent the medication.
- [MedicationStatement-uscore-ms2](MedicationStatement-uscore-ms2.html) Reference to a [contained]({{site.data.fhir.path}}references.html#contained) Medication resource.
- [MedicationStatement-uscore-ms3](Bundle-uscore-ms3.html) A search [Bundle]({{site.data.fhir.path}}bundle.html) with a MedicationStatement and an included Medication resource in the Bundle.

  [Medication Clinical Drug (RxNorm)]: ValueSet-us-core-medication-codes.html
  [MedicationRequestStatus]: {{site.data.fhir.path}}us/daf/ValueSet-medication-request-status.html
[MedicationStatementStatus]: {{site.data.fhir.path}}us/daf/ValueSet-medication-statement-status.html
[MedicationStatement]:{{site.data.fhir.path}}medicationstatement.html
 [MedicationRequest]: {{site.data.fhir.path}}medicationrequest.html
 [Medication]:{{site.data.fhir.path}}medication.html
 [CapabilityStatement]: capstmnts.html
 [boundaries section]: {{site.data.fhir.path}}medicationrequest.html#bnr
[include]: {{site.data.fhir.path}}search.html#include
[contained]: {{site.data.fhir.path}}references.html#contained
[Must Support]: guidance.html#must-support
