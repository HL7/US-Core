When referencing a medication, the [MedicationStatement] and [MedicationRequest] resources can either use a code or refer to a [Medication] resource.  This profile sets minimum expectations for the Medication resource to record search and fetch medications associated with a patient. It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.

**Example Usage Scenarios:**

Queries on Medication resource are expected to be within the context of a MedicationStatement or a MedicationRequest resource query. The following are
example usage scenarios for the US Core Medication profile:

-   Query for Medications with a particular code

##### Mandatory Data Elements and Terminology


The following data-elements are mandatory (i.e data MUST be present). These are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [**Formal Profile Definition**](#profile) below provides the  formal summary, definitions, and  terminology requirements.  

**Each Medication must have:**

1.  A medication code


**Profile specific implementation guidance:**

*  Since the binding is [extensible](guidance.html#extensible-binding-for-codeableconcept-datatype), when a code is unavailable just text is allowed.

[MedicationStatement]: {{site.data.fhir.path}}medicationstatement.html
 [MedicationRequest]: {{site.data.fhir.path}}medicationrequest.html
 [Medication]: {{site.data.fhir.path}}medication.html
