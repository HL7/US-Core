
**Example Usage Scenarios:**

The following are example usage scenarios for the US Core-MedicationDispense
profile:

-  Fetching dispense statuses for medications that have been prescribed to a particular patient
-  [Record or update] dispense statuses for medications that have been prescribed for a particular
    patient

### Mandatory and Must Support Data Elements


The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.  

**Each MedicationDispense Must Have:**

1. a status (e.g., dispensed, not dispensed)
2. a medication*
3. a patient


\* see guidance below

**Each MedicationDispense Must Support:**

1. the encounter associated with the dispense
2. who dispensed the medication*
3. the authorizing prescription
4. type of dispense (e.g., partially dispensed)
5. the quantity dispensed
6. a date for when medication was dispensed to the patient
7. free text dosage instructions (the *SIG*)
8. when medication should be administered
9. the route of administration
10. the dose and rate

*see guidance below

**Profile Specific Implementation Guidance:**

* The MedicationDispense resource is used to represent the USCDI medication fill status.
{% include representing-meds.md %}
{% include provenance-author-bullet-generator.md %}

{% include link-list.md %}
