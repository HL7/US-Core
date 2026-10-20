{% include new_page.md %}

### Introduction

The U.S. Core Data for Interoperability (USCDI) *Adverse Events* Data Class comprises two Data Elements, *Adverse Event Condition* and *Adverse Event Outcome*. An adverse event condition is a change to a patient's condition that could be an unintended effect of a clinical intervention, such as a rash or a fever. An adverse event outcome is the resulting patient status or consequence following that change, such as hospitalization, recovery, recovery with sequelae, or death.

US Core does not define an AdverseEvent profile and does not use the FHIR [AdverseEvent] resource. Instead, this page documents how the information the two Data Elements describe is already recorded by existing US Core Profiles, and which profiles to look in.

### Clinical Records and Patient Safety Reporting

The distinction this page draws is between two different activities that the same incident can give rise to:

1. **The clinical record.** A clinician documents what happened to the patient, using the same resources used for any other clinical finding, note, or procedure. This is the information the USCDI Adverse Events Data Class describes, and it is what US Core supports.
2. **Patient safety reporting.** A separate process classifies an incident, investigates its cause, and reports it for safety or regulatory purposes. This typically happens outside the clinical record, in risk management systems.

The USCDI v7 scope is consistent with this distinction. It explicitly excludes the exchange of patient safety analyses, internal risk management documentation, and patient safety work products as defined under the Patient Safety and Quality Improvement Act of 2005 and its implementing regulations, and it excludes Patient Safety Organization investigations, safety reviews, and facility-level reporting activities. US Core follows that boundary: nothing on this page concerns patient safety work product, and no US Core Profile is intended to carry it.

Two consequences follow for implementers:

* **Adverse events are recorded as ordinary clinical events, and are not tagged as adverse events.** A rash following an immunization is recorded as a reaction, a condition, an observation, or a note, in the same way any other rash would be. US Core does not require a flag, category code, or dedicated resource that identifies these clinical records as adverse events. Nor does it require these clinical records to state that the intervention caused the condition or classify the occurrence as an adverse event.
* **A query for adverse events is a query across several profiles.** Because the information is recorded wherever the clinician documented it, there is no single place to look. The profiles below are the candidates.

### Where Adverse Event Information Is Recorded

The US Core Profiles shown in the figure and table below record the information the two Data Elements describe. The profiles overlap: the same incident may be recorded in more than one, and which one a system uses depends on how the clinician documented it.

{% include img-med.html img="ae-venn.svg" caption="Figure 1: Resource Types that Capture Adverse Event Conditions and Outcomes" %}

| US Core profile | Adverse Event Condition | Adverse Event Outcome | Why |
|---|:---:|:---:|---|
| Immunization | ✓ | | `reaction` / referenced Observation ?|
| Procedure | ✓ | | `complication` ?|
| AllergyIntolerance | ✓ | **?**| `reaction.manifestation` ? |
| Condition | ✓ | ✓ | condition/diagnosis can represent the change or resulting status/sequela |
| DocumentReference | ✓ | ✓ | narrative clinical documentation |
| Simple Observation | ✓ | ✓ | clinical finding/status not covered by a more specific profile |
| Encounter | | ✓ | hospitalization; discharge disposition |
| CarePlan | **?** | **?** | primarily follow-up/treatment; not necessarily the AE outcome
{:.grid}

### Overlap with Other USCDI Data Classes

Note the overlap with the USCDI *Allergies and Intolerances* Data Class. `AllergyIntolerance.reaction` records a known patient sensitivity and the manifestations it produces; the Adverse Events Data Class describes an occurrence associated with a specific clinical intervention. The same manifestation can appear in both contexts, recorded in the same element.

### Terminology

USCDI names SNOMED CT as an applicable vocabulary standard for *Adverse Event Condition*. It names no vocabulary standard for *Adverse Event Outcome*. US Core places no additional binding on any element for this Data Class beyond what the profiles above already require, so the terminology for each element is the terminology that profile already specifies.

This guidance page is a draft for this ballot. Further editing and examples are still pending.
{:.note-to-balloters}

{% include link-list.md %}