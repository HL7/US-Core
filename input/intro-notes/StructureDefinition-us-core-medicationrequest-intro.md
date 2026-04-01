
**Example Usage Scenarios:**

The following are example usage scenarios for the US Core-MedicationRequest
profile. See the [Medication List] section for guidance on accessing a patient's medications:

-   Fetching all medications that have been prescribed to a patient
-   Fetching all *active* medications that have been prescribed to a patient
-   Fetching all medications that have been prescribed to a patient during a particular encounter
-  [Record or update]  medications that have been prescribed for a patient

### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.

**Each MedicationRequest Must Have:**

1. a status
1. an intent code
1. a medication<sup>1</sup>
1. a patient

**Each MedicationRequest Must Support:**

1. the category  (e.g., Discharge Medication)
2. the `reported` flag  or reference signaling that information is from a secondary source such as a patient<sup>2</sup>
3. the encounters
4. a prescriber<sup>3</sup>
5. a date for when written
6. free text dosage instructions (the *SIG*)
7. when medication should be administered
8. the route of administration
9. the dose and rate
10. the amount dispensed and number of refills

{% include additional-requirements-intro.md type="MedicationRequest" plural="true" %}

1. the reason or indication for the prescription<sup>4</sup>
2. reported adherence to prescribed medication instructions<sup>5</sup>

<sup>1,2,3,4,5</sup> see guidance below

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the US Core Profile to support implementation and certification.

- See the [Medication List] section for guidance on accessing a patient's medications, including over-the-counter (OTC) medications and other substances taken for medical and recreational use.
  - Servers **SHALL** return all active medications following the [Get All Active Medications](medication-list.html#get-all-active-medications) guidance.<sup>[§][CONF-0842]</sup> It is always best practice to confirm this list with the patient or caregiver.
  - When recording "self-prescribed" medication, `requester` **SHOULD** be used to indicate the Patient or RelatedPerson as the prescriber.<sup>[§][CONF-0407]</sup>

{% include representing-meds.md %}
{% include provenance-author-bullet-generator.md footnote-symbol='<sup>3</sup>' %}
- <sup>2</sup>The MedicationRequest resource can represent that information is from a secondary source using either the flag `MedicationRequest.reportedBoolean` or a reference using `MedicationRequest.reportedReference`.
   -  Although both are marked as Must Support, the Server system is not required to support both, but **SHALL** support at least one of these elements.<sup>[§][CONF-0408]</sup>
   -  The Client application **SHALL** support both elements.<sup>[§][CONF-0409],[§][CONF-0410]</sup>
- <sup>4</sup>The MedicationRequest resource can communicate the reason or indication for treatment using either a code in `MedicationRequest.reasonCode` or a reference using `MedicationRequest.reasonReference`.
    - Although both `MedicationRequest.reasonCode` and `MedicationRequest.reasonReference` are marked as Additional USCDI Requirements. The certifying Server system is not required to support both, but **SHALL** support at least one of these elements.<sup>[§][CONF-0411]</sup> The certifying Client application **SHALL** support both elements.<sup>[§][CONF-0412],[§][CONF-0413]</sup>
       - when using  `MedicationRequest.reasonReference`:
         - Servers **SHALL** support *at least one* target resource in `MedicationRequest.reasonReference`.<sup>[§][CONF-0414]</sup> Clients SHALL support all target resources in `MedicationRequest.reasonReference`.<sup>[§][CONF-0415]</sup>
         - The referenced resources **SHOULD** be a US Core Profile as documented in [Referencing US Core Profiles].<sup>[§][CONF-0416]</sup>
- Source EHR identifiers **SHOULD** be included to support deduplication across MedicationRequest resources.<sup>[§][CONF-0417]</sup> Exposing the EHR identifiers helps Client applications identify duplicates.
- <sup>5</sup>This profile uses the [US Core Medication Adherence Extension] to report medication adherence. This extension communicates whether a medication has been consumed according to instructions.<sup>[§][CONF-0406]</sup>

{% include link-list.md %}
