
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
3. Interpreter Needed flag*
4. a race*
5. an ethnicity*
6. a tribal affiliation
7. sex*
8. sex parameter for clinical use*
9. gender identity*
10. personal pronouns
11. date of death*
12. address use*
12. address period*
13. name use*
13. name period*
14. suffix*

*see guidance below

**Profile Specific Implementation Guidance:**
- Notes for *Race*, *Ethnicity*, *Date of Death*, *Name to Use*, *Previous Name*, *Suffix*, *Previous Address*, *Interpreter Needed*, and *Preferred Language* USCDI Data Elements: 
  - The Complex Extensions for *Race* and *Ethnicity* allow for one or more codes of which:
    - [Must Support] at least one category code from the OMB Race and Ethnicity Categories
    - **MAY** include additional detailed codes from CDC Race and Ethnicity Codes
    - **SHALL** include a text description
  - *Date of Death* is communicated using the `Patient.deceasedDateTime` element.
    - Although `Patient.deceased[x]` is marked as 𝗔𝗗𝗗𝗜𝗧𝗜𝗢𝗡𝗔𝗟 𝗨𝗦𝗖𝗗𝗜, Certifying Systems are not required to support both, but **SHALL** support at least `Patient.deceasedDateTime`
  - *Name to Use* is represented by setting `Patient.name.use` to "usual".
  - *Previous name* is represented by setting `Patient.name.use` to "old" or providing an end date in `Patient.name.period` or doing both.
  - *Suffix* is represented using the `Patient.name.suffix` element.
  - *Previous Address* is represented by setting `Patient.address.use` to "old" or providing an end date in `Patient.address.period` or doing both.
  - Servers can use the [US Core Interpreter Needed Extension] on the US Core Patient or [US Core Encounter Profiles] to communicate whether a patient needs an interpreter. Although the extension is marked as an *Additional USCDI Requirement* on both US Core Patient and US Core Encounter Profiles, the certifying Server system is not required to support the extension on both profiles but **SHALL** support the extension on at least one. The certifying Client application **SHALL** support the extension on both profiles.
     - When multiple languages are represented, systems **MAY** designate the patient's *Preferred Language* in the `Communication.preferred` element or by using the FHIR standard [Patient Proficiency Extension] and infer a patient's language service needs from it.
  - The [Patient example] demonstrates how these elements are represented.



- The USCDI Patient Demographics Data Class requires following the [Project US@ Technical Specification for Patient Addresses Final Version 1.0] for patient addresses.  For new and updated records, [Certifying Systems] **SHALL** and non-Certifying Systems **SHOULD** follow it as the standard style guide for Patient addresses.  
 
   -  Consult the style guide for details about the format for the Address datatypes elements, especially `Patient.address.line` and `Patient.address.city`.

   - Note: historical records or documents that are not exposed through FHIR-based APIs may not meet this requirement.




- \*US Core aligns with the [HL7 Gender Harmony Project] gender and sex information, which includes data elements, value sets, and code systems. Refer to it and the [FHIR R5 Patient Resource Gender and Sex Notes] for additional guidance and background for representing Administrative Gender, Sex Assigned at Birth, Gender Identity, and Sex Parameter For Clinical Use (SPCU) Note that:
  - The [US Core Birth Sex Extension] is no longer a USCDI Requirement.
  - The [US Core Sex Extension] represents the [U.S. Core Data for Interoperability (USCDI)] data element "Sex".
  - The FHIR [Patient Sex Parameter For Clinical Use] extension is an acceptable representation of the *Sex Parameter for Clinical Use* USCDI Data Element.
    - This extension's `value` url has the same meaning as the LOINC [99501-9] (Sex parameter for clinical use) and uses the same [Sex Parameter for Clinical Use ValueSet] answer list as the LOINC.


<div class="stu-note" markdown="1">

 US Core certified systems are required to support the [Patient Sex Parameter For Clinical Use] extension on US Core Patient to support at least a patient-level context. Systems **SHOULD** also use the extension on other US Core Profiles for specific clinical contexts when appropriate, for example, on US Core Observation when interpreting a laboratory result. However, this extension is not used in contexts such as "Ask at Order Entry" (AOE) questions for laboratory testing orders, typically communicated using Observation. With more implementation experience and user feedback, US Core may provide additional guidance for using this extension with other US Core Profiles.

</div><!-- stu-note -->
- [Provenance] and the FHIR Extension [Target Element] can document how individual patient demographic data was captured. See [Element Level Provenance] on the [Basic Provenance] page for more information.
- The Patient's Social Security Numbers **SHOULD NOT** be used as a patient identifier in `Patient.identifier.value`. There is increasing concern over using Social Security Numbers in healthcare due to the risk of identity theft and related issues. Many payers and providers have purged them from their systems and filtered them out of incoming data.

{% include link-list.md %}
