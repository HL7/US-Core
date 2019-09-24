The [MedicationRequest] resource can be used to record a patient's medication prescription or order.  This profile sets minimum expectations for the MedicationRequest resource to record, search and fetch medications associated with a patient. It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core-MedicationRequest
profile. See the [Medication List Guidance] section for guidance on accessing a patient medications:

-   Fetching all medications that have been prescribed to a particular patient
-   Fetching all *active* medications that have been prescribed to  particular patient
-   Fetching all medications that have been prescribed to particular patient during a particular encounter
-  [Record or update]  medications that have been prescribed for a particular
    patient

### Mandatory and Must Support Data Elements


The following data-elements are mandatory (i.e data MUST be present) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.  

**Each MedicationRequest must have:**

1.  a status
1.  {: .note-to-balloters}an intent code
1.  a medication
1.  a patient
1.  a date for when written
1.  a prescriber

**Each MedicationRequest must support:**

1. {: .note-to-balloters}the `reported` flag signaling that information is from a secondary source such as a patient.
1. {: .note-to-balloters}the encounter
1. the prescription *Sig*
**Profile specific implementation guidance:**

* {: .note-to-balloters}See the [Medication List Guidance] section for guidance on accessing a patient medications including over the counter (OTC) medication and other substances taken for medical and recreational use.
*  The MedicationRequest resources can represent a medication using either a code, or reference a [Medication] resource.
    *  When referencing a Medication resource,  the resource may be [contained] or an external resource.
    *  The server application MAY choose any combination of these methods, but if an external reference to Medication is used, the server SHALL support the [`_include`] parameter for searching this element.
    *  The client application SHALL support all methods.  
*  Source EHR identifiers **SHOULD** be included to support deduplication across MedicationRequest resources. Exposing the EHR identifiers helps client applications identify duplicates.

### Examples

- [MedicationRequest-uscore-mo1](MedicationRequest-uscore-mo1.html) Inline medication code to represent the medication.
- [MedicationRequest-uscore-mo2](MedicationRequest-uscore-mo2.html) Reference to a [contained]({{site.data.fhir.path}}references.html#contained) Medication resource.
- [MedicationRequest-uscore-mo3](Bundle-uscore-mo3.html) A search [Bundle]({{site.data.fhir.path}}bundle.html) with a MedicationRequest and an included Medication resource in the Bundle.
- [Self-prescribed Tylenol](MedicationRequest-self-tylenol.html) Representation of a reported self-prescribed OTC medication.

{% include link-list.md %}
