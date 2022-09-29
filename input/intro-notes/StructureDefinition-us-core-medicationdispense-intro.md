
**Example Usage Scenarios:**

The following are example usage scenarios for the US Core-MedicationDispense
profile.:

-  Fetching dispense statuses for medications that have been prescribed to a particular patient
-  [Record or update] dispense statuses for medications that have been prescribed for a particular
    patient

### Mandatory and Must Support Data Elements


The following data-elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.  

**Each MedicationDispense must have:**

1.  a status (e.g., dispensed, not dispensed)
2.  a medication*
3.  a patient
4.  a date for when dispensed to the patient

\* see guidance below

**Each MedicationDispense must support:**

1. who dispensed the medication
2. type of dispense (e.g., partially dispensed)


**Profile specific implementation guidance:**

*  The Fill status is often captured at the pharmacy and not communicated back to EHR/HIT. However, to meet ONC’s USCDI requirements, the HIT/EHR system must support this profile.
*  \*The MedicationDispense resources can represent a medication using either a code, or reference a [Medication] resource.
    *  When referencing a Medication resource, the resource may be [contained] or an external resource.
    *  The server systems are not required to support both a code and a reference, but **SHALL** support *at least one* of these methods.
    * If an external reference to Medication is used, the server **SHALL** support the [`_include`] parameter for searching this element.
    *  The client application **SHALL** support all methods.

{% include link-list.md %}
