
**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-   Query for a Patient demographic information using Medical Record
    Number (MRN), which is a type of identifier. The MRN is identifiable
    by `identifier.system` and may be location specific.
-   Query for a Patient demographic information using first name, last
    name, birthdate, and gender.

### Mandatory and Must Support Data Elements


The following data-elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Views] below provides the  formal summary, definitions, and  terminology requirements.  

**Each Patient Must Have:**

1. a patient identifier (e.g. MRN)
1. a patient name
1. a gender*

**Each Patient Must Support:**

1. a birth date
1. an address

**Additional USCDI Requirements**

{% include additional-requirements-intro.md type="Patient" plural="true" %}

1. contact detail (e.g. a telephone number or an email address)
2. a communication language
3. a race
4. an ethnicity
5. a tribal affiliation
6. <span class="bg-success" markdown="1">sex*</span><!-- new-content -->
7. gender identity*
8. date of death
9. previous address
10. previous name
11. suffix

*see guidance below

**Profile Specific Implementation Guidance:**
- Note that *Date of Death*, *Previous Name*, *Suffix*,and *Previous address* are listed in the U.S. Core Data for Interoperability.
  - Date of Death is communicated using the `Patient.deceasedDateTime` element.
  - Suffix is represented using the `Patient.name.suffix` element.
  - Previous name is represented by setting `Patient.name.use` to "old" or providing an end date in P`atient.name.period` or doing both.
  - Previous address is represented by setting `Patient.address.use` to "old" or providing an end date in `Patient.address.period` or doing both.
  - The [Patient example] demonstrates how these elements are represented.
- \*US Core has reviewed and updated value sets based on input from the [HL7 Gender Harmony Project] which is modeling gender and sex information which includes data elements, value sets, code systems.  When their work is complete, US Core will align with their recommendations.  <span class="bg-success" markdown="1"> The [US Core Birth Sex Extension] is no longer a USCDI requirement with the introduction of the [US Core Sex Extension] to meet the [U.S. Core Data for Interoperability (USCDI) v3] data element "sex". The [FHIR specification]({{site.data.fhir.path}}patient.html#gender) provides additional guidance and background for representing Administrative Gender, Sex assigned at Birth, and Gender Identity.</span><!-- new-content -->
- [Provenance] and the FHIR Extension [Target Element] can be use to document how individual patient demographic data was captured. See [Element Level Provenance] on the [Basic Provenance] page for more information.
- The Patient's Social Security Numbers **SHOULD NOT** be used as a patient identifier in `Patient.identifier.value`. There is increasing concern over the use of Social Security Numbers in healthcare due to the risk of identity theft and related issues. Many payers and providers have actively purged them from their systems and filter them out of incoming data.

{% include link-list.md %}
