
This profile sets minimum expectations for searching and fetching Diagnostic Reports and Notes using the [DiagnosticReport] resource. This profile identifies the mandatory core elements, extensions, vocabularies and value sets which **SHALL** be present in the DiagnosticReport when using this profile.

**Example Usage Scenarios:**

The following are example usage scenarios for the Diagnostic Report profile:

-   Query for a specific Radiology note (e.g. 84178-3 Interventional Radiology Note)
-   Query for category of reports (e.g. all Cardiology reports)


### Mandatory and Must Support Data Elements

The following data-elements are mandatory (i.e data MUST be present) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.  

**Each Diagnostic Report must have:**

1.  a status
1.  a category
1.  a code describing the type of report
1.  a patient
1.  date and time the report was created
1.  an author (actor) producing the report

**Each Diagnostic Report must support:**

1.  the encounter the report occurred within
1.  instant the report was released
1.  an image
1.  a reference to the full report (presentedForm)

**Profile specific implementation guidance:**

- The `DiagnosticReport.category` binding must support at a minimum the [US Core DiagnosticReport Category Codes] of Cardiology, Radiology, and Pathology. Other categories may be supported.
- A server will return how a customer has categorized their reports at a particular site. Categorization of reports is not consistent across sites. (e.g. a system may categorize an orthopedic note as a cardiology.)

#### Examples

- [Cardiology Report](DiagnosticReport-cardiology-report.html)
- [Radiology Report](DiagnosticReport-chest-xray-report.html)

{% include link-list.md %}
