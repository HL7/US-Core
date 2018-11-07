
This profile sets minimum expectations for searching and fetching Diagnostic Reports and Notes using the [DiagnosticReport] resource. It is built independent of the [US Core DiagnosticReport] lab profile for initial testing. When US Core is balloted for R4 it may be merged into the existing profile. This profile identifies the mandatory core elements, extensions, vocabularies and value sets which **SHALL** be present in the DiagnosticReport when using this profile.

**Example Usage Scenarios:**

The following are example usage scenarios for the Diagnostic Report profile:

-   Query for a specific Radiology note (e.g. 84178-3 Interventional Radiology Note)
-   Query for category of reports (e.g. all Cardiology reports)


###### Mandatory Data Elements and Terminology

The following data-elements are mandatory (i.e data MUST be present). These are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [**Formal Profile Definition**](#profile) below provides the  formal summary, definitions, and  terminology requirements.  

**Each Diagnostic Report must have:**

1.  a status
1.  a category of the DiagnosticReport
1.  a code describing the type of report
1.  a patient
1.  date and time the report was created
1.  an author (actor) producing the report

In addition it should have (if available):

1.  the encounter the report occurred within
1.  instant the report was released
1.  an image
1.  a referene to the full report (presentedForm)


**Profile specific implementation guidance:**

The `DiagnosticReport.category` binding must support at a minimum the [3 concepts](http://hl7.org/fhir/us/core-r4/ValueSet/us-core-diagnosticreport-category) of Cardiology, Radiology, and Pathology. Other categories may be supported.


###### Examples

- TBD

{% include link-list.md %}
