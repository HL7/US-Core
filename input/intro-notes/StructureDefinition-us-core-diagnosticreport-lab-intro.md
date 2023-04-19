
**Example Usage Scenarios:**

The following are example usage scenarios for the US Core DiagnosticReport Profile for Laboratory Results Reporting:

-   Query for lab reports belonging to a Patient
-  [Record or update]  a lab report for a specific Patient

### Mandatory and Must Support Data Elements

The following data-elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Views] below provides the  formal summary, definitions, and  terminology requirements.  

**Each DiagnosticReport Must Have:**

1.  a status
1.  a category code of 'LAB'
1.  a code (preferably a LOINC code) which tells you what is being measured
1.  a patient
1.  the diagnostically relevant time (known as the "effective time" and typically the time of specimen collection)*
1.  when the report was released*

\*These elements have the following constraints: **SHALL** be present if status is
'partial', 'preliminary', 'final', 'amended', 'corrected' or 'appended'.

**Each DiagnosticReport Must Support:**

1.   who issues the report
1.   a result

**Profile Specific Implementation Guidance:**

* Additional codes that translate or map to the DiagnosticReport codes or category codes are allowed.  For example:
   -  providing both a local system codes and a LOINC code that it map to
   -  providing a more specific category codes to the “LAB” category code, such as “CH” (chemistry), in an additional coding element.
* Results that are free text or report form are represented using the 'presentedForm' element in DiagnosticReport.

{% include link-list.md %}
