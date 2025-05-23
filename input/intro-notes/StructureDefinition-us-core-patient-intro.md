

**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-   Query for Patient demographic information using Medical Record
    Number (MRN), which is a type of identifier. The MRN is identifiable
    by `identifier.system` and may be location specific.
-   Query for Patient demographic information using first name, last
    name, and birthdate.

### Mandatory and Must Support Data Elements


The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.  

**Each Patient Must Have:**

1. a patient identifier (e.g., MRN)
1. a patient name

**Each Patient Must Support:**

1. a birth date
2. an address*

{% include additional-requirements-intro.md type="Patient" plural="true" %}

1. contact detail (e.g., a telephone number or an email address)
2. a communication language*
3. Interpreter Needed flag*
4. a race*
5. an ethnicity*
6. a tribal affiliation
7. sex*
8. date of death*
9. address use*
10. address period*
11. name use*
12. name period*
13. suffix*

*see guidance below

**Profile Specific Implementation Guidance:**
- Notes for *Race*, *Ethnicity*, *Date of Death*, *Name to Use*, *Previous Name*, *Suffix*, *Previous Address*, *Interpreter Needed*, and *Preferred Language* USCDI Data Elements: 
  - The Complex Extensions for Race and Ethnicity allow for one or more codes of which: [Must Support] at least one category code from the OMB Race and Ethnicity Category Value Sets that draw from the [Race & Ethnicity - CDC (CDCREC)] code system.
    - **MAY** include additional codes from the detailed ethnicity and detailed race value sets drawn from the [Race & Ethnicity - CDC (CDCREC)] code system
    - **SHALL** include a text description
  - *Date of Death* is communicated using the `Patient.deceasedDateTime` element.
    - Although `Patient.deceased[x]` is marked as 𝗔𝗗𝗗𝗜𝗧𝗜𝗢𝗡𝗔𝗟 𝗨𝗦𝗖𝗗𝗜, Certifying Systems are not required to support both, but **SHALL** support at least `Patient.deceasedDateTime`
  - *Previous name* is represented by setting `Patient.name.use` to "old" or providing an end date in `Patient.name.period` or doing both.
  - *Suffix* is represented using the `Patient.name.suffix` element.
  - *Previous Address* is represented by setting `Patient.address.use` to "old" or providing an end date in `Patient.address.period` or doing both.
  - Servers can use the [US Core Interpreter Needed Extension] on this profile or the [US Core Encounter Profile] to communicate whether a patient needs an interpreter. Although the extension is marked as an *Additional USCDI Requirement* on both US Core Patient and US Core Encounter Profiles, the certifying Server system is not required to support the extension on both profiles but **SHALL** support the extension on at least one. The certifying Client application **SHALL** support the extension on both profiles.
     - Systems **SHOULD** designate the patient's preferred language in the `Patient.communication.preferred` element.
  - The [Patient example] demonstrates how these elements are represented
- The USCDI Patient Demographics Data Class requires following the [Project US@ Technical Specification for Patient Addresses Final Version 1.0] for patient addresses.  For new and updated records, [Certifying Systems] **SHALL** and non-Certifying Systems **SHOULD** follow it as the standard style guide for Patient addresses.  
   - Consult the style guide for details about the format for the Address datatypes elements, especially `Patient.address.line` and `Patient.address.city`.
   - Note: historical records or documents that are not exposed through FHIR-based APIs may not meet this requirement.
- *The [US Core Sex Extension] represents the [U.S. Core Data for Interoperability (USCDI)] data element "Sex". Refer to the FHIR R5 [Patient] Resource for other interoperability considerations with regards to patient sex
- [Provenance] and the FHIR Extension [Target Element] can document how individual patient demographic data was captured. See [Element Level Provenance] on the [Basic Provenance] page for more information.
- The Patient's Social Security Numbers **SHOULD NOT** be used as a patient identifier in `Patient.identifier.value`. There is increasing concern over using Social Security Numbers in healthcare due to the risk of identity theft and related issues. Many payers and providers have purged them from their systems and filtered them out of incoming data.

{% include link-list.md %}
