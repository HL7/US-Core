{% include new_page.md %}

{% include us-core-maturity.md id="us-core-medicationadministration" %}

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core MedicationAdministration Profile:

-   Query for MedicationAdministration resources belonging to a Patient
-   Query for a Patient's MedicationAdministration resources by status or administration time
-   [Record or update] a Patient MedicationAdministration

### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.

**Each MedicationAdministration Must Have:**

1. a status (e.g., completed, in progress, not done)
1. a medication<sup>1</sup>
1. a patient
1. when the medication was administered<sup>4</sup>

**Each MedicationAdministration Must Support:**

1. a reason the administration was not performed<sup>3</sup>
1. who administered the medication<sup>2</sup>
1. the authorizing prescription
1. free text dosage instructions (the *SIG*)
1. the route of administration
1. the dose

<sup>1,2,3,4</sup> see guidance below

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the US Core Profile to support implementation and certification.

* The MedicationAdministration resource represents the USCDI Medication Administration data element. The [Medication List] guidance remains based on MedicationRequest; a MedicationAdministration query is not a substitute for it.
* A status code of "not-done" is used when a medication was *not* administered.
   * <sup>3</sup>`MedicationAdministration.statusReason` communicates why the medication was not administered, such as patient refusal.
* <sup>4</sup>`MedicationAdministration.effective[x]` is mandatory and records when the administration took place, or when it was to have taken place when `MedicationAdministration.status` is "not-done". Use `effectiveDateTime` for an essentially instantaneous administration, such as swallowing a tablet or giving an injection, and `effectivePeriod` for an administration with a duration, such as an infusion. An `effectivePeriod` with no end time records an administration that is still under way.
{% include representing-meds.md %}
{% include provenance-author-bullet-generator.md footnote-symbol='<sup>2</sup>' %}

{% include link-list.md %}
