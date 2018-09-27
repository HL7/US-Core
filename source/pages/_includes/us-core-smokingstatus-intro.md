



This profile sets minimum expectations for the [Observation] resource to record, search and fetch smoking status data associated with a patient. It identifies which core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile.

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core-SmokingStatus
profile:

- Query for the Smoking Status of a patient
- Record or update the Smoking Status of a patient

##### Mandatory Data Elements and Terminology


The following data-elements are mandatory (i.e data MUST be present). These are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [**Formal Profile Definition**](#profile) below provides the  formal summary, definitions, and  terminology requirements.  

**Each Observation must have:**

1.  a status
1.  a fixed code for smoking observation
1.  a patient
1.  a date representing when the smoking status was recorded
1.  a result value code for smoking status


**Profile specific implementation guidance:**

 - Smoking observation LOINC = 72166-2 *Tobacco smoking status NHIS*
 - This profile may be referenced by different capability statements, such as the [Conformance requirements for the US Core Server].

#### Examples

 - [observation-some-day-smoker](Observation-some-day-smoker.html)

[Observation]: {{site.data.fhir.path}}observation.html
[Conformance requirements for the US Core Server]: CapabilityStatement-server.html
