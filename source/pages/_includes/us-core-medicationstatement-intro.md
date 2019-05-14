Both the [MedicationRequest] and [MedicationStatement] resources can be used to record a patient's medication.  For more information about the context for their usages, refer to the medication domain [boundaries section].  This profile sets minimum expectations for the MedicationStatement resource to record, search and fetch medications associated with a patient. It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.

**Example Usage Scenarios:**

The following are example usage scenarios for the
US Core-MedicationStatement profile:

-   Query active medications being taken by a patient
-   Record or update active medications being taken by a patient

### Mandatory and Must Support Data Elements


The following data-elements are mandatory (i.e data MUST be present) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.  

**Each MedicationStatement must have:**

1.  a status
1.  a medication
1.  an assertion date
1.  a patient
1.  a code indicating whether the medication was taken

**Each MedicationStatement must support:**

1. the time medication was taken
2. whether the MedicationStatement was derived from another resource

**Profile specific implementation guidance:**

*  The MedicationStatement and MedicationRequest resources can represent a medication using either a code, or reference to a [Medication] resource.
    *  When referencing a Medication resource,  the resource may be [contained] or an external resource.
    *  The server application MAY choose any combination of these methods, but if an external reference to Medication is used, the server SHALL support the [include] parameter for searching this element.
    *  The client application SHALL support all methods.  
    *  Additional guidance is provided below in the Search section and in the [CapabilityStatement] section.
*  Source EHR identifiers **SHOULD** be included to support deduplication across MedicationStatement and MedicationRequest resources. A patient medication may appear when a prescription is present as a MedicationRequest or MedicationStatement even though the EHR stores as a single instance. Exposing the EHR identifiers helps client applications identify duplicates.

### Examples

- [MedicationStatement-uscore-ms1](MedicationStatement-uscore-ms1.html) Inline medication code to represent the medication.
- [MedicationStatement-uscore-ms2](MedicationStatement-uscore-ms2.html) Reference to a [contained]({{site.data.fhir.path}}references.html#contained) Medication resource.
- [MedicationStatement-uscore-ms3](Bundle-uscore-ms3.html) A search [Bundle]({{site.data.fhir.path}}bundle.html) with a MedicationStatement and an included Medication resource in the Bundle.

{% include link-list.md %}
