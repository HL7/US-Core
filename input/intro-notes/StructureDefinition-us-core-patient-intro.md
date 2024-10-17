
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
3. <span class="bg-success" markdown="1">interpreter required flag*</span><!-- new-content -->
4. a race*
5. an ethnicity*
6. a tribal affiliation
7. sex*
8. <span class="bg-success" markdown="1">sex parameter for clinical use*</span><!-- new-content -->
9. gender identity*
10. <span class="bg-success" markdown="1">personal pronouns</span><!-- new-content -->
11. date of death*
12. <span class="bg-success" markdown="1">address use*</span><!-- new-content -->
12. <span class="bg-success" markdown="1">address period*</span><!-- new-content -->
13. <span class="bg-success" markdown="1">name use*</span><!-- new-content -->
13. <span class="bg-success" markdown="1">name period*</span><!-- new-content -->
14. suffix*

*see guidance below

**Profile Specific Implementation Guidance:**
- Notes for *Race*, *Ethnicity*, *Date of Death*, <span class="bg-success" markdown="1">*Name to Use*</span><!-- new-content -->, *Previous Name*, *Suffix*, *Previous Address*, <span class="bg-success" markdown="1">*Interpreter Needed*</span><!-- new-content -->, and *Preferred Language* USCDI Data Elements: 
  - The Complex Extensions for *Race* and *Ethnicity* allow for one or more codes of which:
    - [Must Support] at least one category code from the OMB Race and Ethnicity Categories
    - **MAY** include additional detailed codes from CDC Race and Ethnicity Codes
    - **SHALL** include a text description
  - *Date of Death* is communicated using the `Patient.deceasedDateTime` element.
    - Although `Patient.deceased[x]` is marked as 𝗔𝗗𝗗𝗜𝗧𝗜𝗢𝗡𝗔𝗟 𝗨𝗦𝗖𝗗𝗜, certifying systems are not required to support both, but **SHALL** support at least `Patient.deceasedDateTime`
  - <span class="bg-success" markdown="1">*Name to Use* is represented by setting `Patient.name.use` to "usual".</span><!-- new-content -->
  - Previous name is represented by setting `Patient.name.use` to "old" or providing an end date in `Patient.name.period` or doing both.
  - *Suffix* is represented using the `Patient.name.suffix` element.
  - *Previous Address* is represented by setting `Patient.address.use` to "old" or providing an end date in `Patient.address.period` or doing both.
  - <span class="bg-success" markdown="1">Servers can use the [US Core Interpreter Required Extension] on the US Core Patient or [US Core Encounter Profiles] to communicate whether a patient needs an interpreter. Although the extension is marked as an *Additional USCDI Requirement* on both US Core Patient and US Core Encounter Profiles, the certifying server system is not required to support the extension on both profiles but **SHALL** support the extension on at least one. The certifying client application **SHALL** support the extension on both profiles.</span><!-- new-content -->
     - <span class="bg-success" markdown="1">When multiple languages are represented, systems **MAY** designate the patient's *Preferred Language* in the `Communication.preferred` element or by using the FHIR standard [Patient Proficiency Extension] and infer a patient's language service needs from it.</span><!-- new-content -->
  - The [Patient example] demonstrates how these elements are represented.

- [Certifying systems] **SHALL** and non-certifying systems **SHOULD** follow the [Project US@ Technical Specification for Patient Addresses Final Version 1.0] as the standard style guide for `Patient.address.line` and  `Patient.address.city` for new and updated records.

   - For certifying systems, this requirement does not apply to historical records or documents that are exposed through FHIR-based APIs.

- \*US Core aligns with the [HL7 Gender Harmony Project] gender and sex information, which includes data elements, value sets, and code systems. Refer to it and the [FHIR R5 Patient Resource Gender and Sex Notes] for additional guidance and background for representing Administrative Gender, Sex Assigned at Birth, Gender Identity, <span class="bg-success" markdown="1"> and Sex Parameter For Clinical Use (SPCU)</span><!-- new-content --> Note that:
  - The [US Core Birth Sex Extension] is no longer a USCDI Requirement.
  - The [US Core Sex Extension] <span class="bg-success" markdown="1">represents</span><!-- new-content --> the [U.S. Core Data for Interoperability (USCDI)] data element "Sex".
  - <span class="bg-success" markdown="1">The FHIR [Patient Sex Parameter For Clinical Use] extension represents the *Sex Parameter for Clinical Use* USCDI Data Element.</span><!-- new-content -->

<div class="stu-note" markdown="1">
<div class="bg-success" markdown="1">
 US Core certified systems are required to support the [Patient Sex Parameter For Clinical Use] extension on US Core Patient to support at least a patient-level context. Systems **SHOULD** also use the extension on other US Core Profiles for specific clinical contexts when appropriate, for example, on US Core Observation when interpreting a laboratory result. However, this extension is not used in contexts such as "Ask at Order Entry" (AOE) questions for laboratory testing orders, typically communicated using Observation. With more implementation experience and user feedback, US Core may provide additional guidance for using this extension with other US Core Profiles.
</div><!-- new-content -->
</div><!-- stu-note -->
- [Provenance] and the FHIR Extension [Target Element] can document how individual patient demographic data was captured. See [Element Level Provenance] on the [Basic Provenance] page for more information.
- The Patient's Social Security Numbers **SHOULD NOT** be used as a patient identifier in `Patient.identifier.value`. There is increasing concern over using Social Security Numbers in healthcare due to the risk of identity theft and related issues. Many payers and providers have purged them from their systems and filtered them out of incoming data.

{% include link-list.md %}
