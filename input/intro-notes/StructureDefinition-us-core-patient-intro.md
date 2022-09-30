
**Example Usage Scenarios:**

The following are example usage scenarios for the this profile:

-   Query for a Patient demographic information using Medical Record
    Number (MRN), which is a type of identifier. The MRN is identifiable
    by identifier.system and may be location specific.
-   Query for a Patient demographic information using first name, last
    name, birthdate, and gender.

### Mandatory and Must Support Data Elements


The following data-elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and  terminology requirements.  

**Each Patient must have:**

1. a patient identifier (e.g. MRN)
1. a patient name
1. a gender*

**Each Patient must support:**

1. a birth date
1. an address

**Additional USCDI Requirements**

For ONC's USCDI requirements, each Patient must support the following additional elements. These elements are included in the formal definition of the profile. The patient examples include all of these elements.

1. contact detail (e.g. a telephone number or an email address)
1. a communication language
1. a race
1. an ethnicity
2. <span class="bg-success" markdown="1">a tribal affiliation</span><!-- new-content -->
3. a birth sex*
4. gender identity*
5. <span class="bg-success" markdown="1">date of death</span><!-- new-content -->
6. previous address
7. previous name
8. suffix

*see guidance below

**Profile specific implementation guidance:**
- Note that <span class="bg-success" markdown="1">*Date of Death*</span><!-- new-content -->  *Previous Name*, *Suffix*,and *Previous address* are listed in the U.S. Core Data for Interoperability.
  - <span class="bg-success" markdown="1">Date of Death is communicated using the `Patient.deceasedDateTime` element.</span><!-- new-content -->
  - Suffix is represented using the `Patient.name.suffix` element.
  - Previous name is represented by setting `Patient.name.use` to "old" and providing an end date in Patient.name.period element if known
  - Previous address is represented by setting `Patient.address.use` to "old" and providing an end date in Patient.address.period element if known.
  - The patient example below demonstrates the usage of both of these elements.
- \*US Core has reviewed and updated value sets based on input from the [HL7 Gender Harmony Project] which is modeling gender and sex information which includes data elements, value sets, code systems.  When their work is complete, US Core will align with their recommendations. In the interim, the [FHIR specification]({{site.data.fhir.path}}patient.html#gender) provides guidance and background for representing Administrative Gender, Sex assigned at Birth, and Gender Identity.
- The Patient's Social Security Numbers **SHOULD NOT** be used as a patient identifier in `Patient.identifier.value`. There is increasing concern over the use of Social Security Numbers in healthcare due to the risk of identity theft and related issues. Many payers and providers have actively purged them from their systems and filter them out of incoming data.

{% include link-list.md %}
