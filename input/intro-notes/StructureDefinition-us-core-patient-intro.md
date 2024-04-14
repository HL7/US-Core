
**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-   Query for Patient demographic information using Medical Record
    Number (MRN), which is a type of identifier. The MRN is identifiable
    by `identifier.system` and may be location specific.
-   Query for Patient demographic information using first name, last
    name, birthdate, and gender.

### Mandatory and Must Support Data Elements


The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.  

**Each Patient Must Have:**

1. a patient identifier (e.g., MRN)
1. a patient name
1. a gender*

**Each Patient Must Support:**

1. a birth date
1. an address*

{% include additional-requirements-intro.md type="Patient" plural="true" %}

1. contact detail (e.g., a telephone number or an email address)
2. a communication language*
3. a race*
4. an ethnicity*
5. a tribal affiliation
6. sex*
7. gender identity*
8. date of death*
9. previous address*
10. previous name*
11. suffix*

*see guidance below

**Profile Specific Implementation Guidance:**
- Notes for *Race*, *Ethnicity*, *Date of Death*, *Previous Name*, *Suffix*, *Previous address*, and *Preferred Language* USCDI Data Elements: 
  - The Complex Extensions for Race and Ethnicity allow for one or more codes of which:
    - [Must Support] at least one category code from the OMB Race and Ethnicity Categories
    - **MAY** include additional detailed codes from CDC Race and Ethnicity Codes
    - **SHALL** include a text description
  - Date of Death is communicated using the `Patient.deceasedDateTime` element.
    - Although `Patient.deceased[x]` is marked as 𝗔𝗗𝗗𝗜𝗧𝗜𝗢𝗡𝗔𝗟 𝗨𝗦𝗖𝗗𝗜, certifying systems are not required to support both, but **SHALL** support at least `Patient.deceasedDateTime`
  - Previous name is represented by setting `Patient.name.use` to "old" or providing an end date in `Patient.name.period` or doing both.
  - Suffix is represented using the `Patient.name.suffix` element.
  - Previous address is represented by setting `Patient.address.use` to "old" or providing an end date in `Patient.address.period` or doing both.
  - `Communication.preferred` **MAY** designate a preferred language when multiple languages are represented. 
  - The [Patient example] demonstrates how these elements are represented.

- [Certifying systems] **SHALL** and non-certifying systems **SHOULD** follow the [Project US@ Technical Specification for Patient Addresses Final Version 1.0] as the standard style guide for `Patient.address.line` and  `Patient.address.city` for new and updated records.

   - For certifying systems, this requirement does not apply to historical records or documents that are exposed through FHIR-based APIs.

- \*US Core aligns with the [HL7 Gender Harmony Project] gender and sex information, which includes data elements, value sets, and code systems. Refer to it and the [FHIR R5 Patient Resource Gender and Sex Notes] for additional guidance and background for representing Administrative Gender, Sex Assigned at Birth, and Gender Identity. Note that:
  - The US Core Sex Extension meets the [U.S. Core Data for Interoperability (USCDI)] data element "sex".
  - The US Core Birth Sex Extension is no longer a USCDI Requirement.

- [Provenance] and the FHIR Extension [Target Element] can document how individual patient demographic data was captured. See [Element Level Provenance] on the [Basic Provenance] page for more information.
- The Patient's Social Security Numbers **SHOULD NOT** be used as a patient identifier in `Patient.identifier.value`. There is increasing concern over using Social Security Numbers in healthcare due to the risk of identity theft and related issues. Many payers and providers have purged them from their systems and filtered them out of incoming data.

{% include link-list.md %}
