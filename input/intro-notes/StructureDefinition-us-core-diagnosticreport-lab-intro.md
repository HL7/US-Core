
**Example Usage Scenarios:**

The following are example usage scenarios for the US Core DiagnosticReport Profile for Laboratory Results Reporting:

-   Query for lab reports belonging to a Patient
-  [Record or update]  a lab report for a specific Patient

### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.  

**Each DiagnosticReport Must Have:**

1. a status
1. a category code of 'LAB'
1. a code (preferably a LOINC code) which tells you what is being measured
1. a patient
1. the diagnostically relevant time (known as the "effective time" and typically the time of specimen collection)*
1. when the report was released*

\*These elements have the following constraints: **SHALL** be present if status is
'partial', 'preliminary', 'final', 'amended', 'corrected', or 'appended'.

**Each DiagnosticReport Must Support:**

1. a timestamp when the resource last changed*
1. encounter associated with DiagnosticReport
2. who issues the report*
3. a results interpreter*
4. a result

\* see guidance below

**Profile Specific Implementation Guidance:**

- The [CLIA/USCDI/HL7 Elements Crossmapping Table] provides a crosswalk of [Clinical Laboratory Improvement Amendments (CLIA)] data elements to corresponding FHIR fields, terminology standards, and naming conventions used in HL7 CDA and HL7 V2 standards. Implementers can use this mapping to help comply with CLIA requirements when using the US Core Laboratory Result Observation Profile.
* Additional codes that translate or map to the DiagnosticReport codes or category codes are allowed. For example:
   -  providing both a local system code and a LOINC code that it maps to
   -  providing a more specific category code to the "LAB" category code, such as "CH" (chemistry), in an additional coding element.
{% include provenance-author-bullet-generator.md %}
* Results that are free text or report form are represented using the `DiagnosticReport.presentedForm` element.
- \* See the US Core General Guidance page for [Searching Using lastUpdated]. Updates to `.meta.lastUpdated` **SHOULD** reflect:
  - New laboratory reports
  - Changes in the status of laboratory reports, including events that trigger the same status (e.g., amended → amended).
- The `DiagnosticRequest.basedOn` element connects the DiagnosticReport to the originating order in the EHR. Systems that initiate the lab order **SHOULD** use this element when reporting the results.



{% include link-list.md %}
