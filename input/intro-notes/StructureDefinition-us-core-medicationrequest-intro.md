
**Example Usage Scenarios:**

The following are example usage scenarios for the US Core-MedicationRequest
profile. See the [Medication List] section for guidance on accessing a patient medications:

-   Fetching all medications that have been prescribed to a particular patient
-   Fetching all *active* medications that have been prescribed to  particular patient
-   Fetching all medications that have been prescribed to particular patient during a particular encounter
-  [Record or update]  medications that have been prescribed for a particular
    patient

### Mandatory and Must Support Data Elements


The following data-elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.  

**Each MedicationRequest must have:**

1.  a status
1.  an intent code
1.  a medication*
1.  a patient
1.  a prescriber

\* see guidance below

**Each MedicationRequest must support:**

1. the category  (e.g. Discharge Medication)
1. the `reported` flag  or reference signaling that information is from a secondary source such as a patient
1. the encounters
1. a date for when written
1. the prescription *Sig*

**Profile specific implementation guidance:**

* See the [Medication List] section for guidance on accessing a patient medications including over the counter (OTC) medication and other substances taken for medical and recreational use.
*  \*The MedicationRequest resources can represent a medication using either a code, or reference a [Medication] resource.
    *  When referencing a Medication resource, the resource may be [contained] or an external resource.
    *  The server systems are not required to support both a code and a reference, but **SHALL** support *at least one* of these methods.
    * If an external reference to Medication is used, the server SHALL support the [`_include`] parameter for searching this element.
    *  The client application SHALL support all methods.
* <span class="bg-success" markdown="1">The MedicationRequest resource can represent that information is from a secondary source using either a boolean flag or a reference using `MedicationRequest.reportedReference`</span><!-- new-content --> .
   *  Although both are marked as must support, the server system is not required to support both a boolean and a reference, but **SHALL** support at least one of these elements.
   *  The client application **SHALL** support both elements.
* Source EHR identifiers **SHOULD** be included to support deduplication across MedicationRequest resources. Exposing the EHR identifiers helps client applications identify duplicates.
* Servers **SHALL** follow the [Medication List Guidance] and return all `active` Medications as MedicationRequest. It is always best practice to confirm this list with the Patient or Caregiver.

{% include link-list.md %}
