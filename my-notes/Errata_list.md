1. Add guidance for representing patient name suffix and previous patient name to the [US Core Patient Profile](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-patient.html#mandatory-and-must-support-data-elements) ([FHIR-28129](https://jira.hl7.org/browse/FHIR-28129))

1. Correct copy/paste error in [Goal Profile](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-goal-definitions.html#Goal.lifecycleStatus) ([FHIR-28109](https://jira.hl7.org/browse/FHIR-28109))

1. Correct [US Core Provider Speciality (NUCC) ValueSet ](http://hl7.org/fhir/us/core/STU3.1.1/ValueSet-us-core-provider-specialty.html) to hide abstract grouping codes ([FHIR-27975](https://jira.hl7.org/browse/FHIR-27975))

1. Added example of US Core Direct Extension to [Practitioner-2 Example](http://hl7.org/fhir/us/core/STU3.1.1/Practitioner-practitioner-2.html) ([FHIR-27947](https://jira.hl7.org/browse/FHIR-27947))

1. Corrected technical errors in [pediatric profiles StructureDefinitions](http://hl7.org/fhir/us/core/STU3.1.1/profiles.html#profiles) ([FHIR-27946](https://jira.hl7.org/browse/FHIR-27946))

1. Corrected errors in [DiagnosticReport Cardiology Example](http://hl7.org/fhir/us/core/STU3.1.1/DiagnosticReport-cardiology-report.html) ([FHIR-27913](https://jira.hl7.org/browse/FHIR-27913))

1. Update [Federal Register link](http://hl7.org/fhir/us/core/STU3.1.1/ValueSet-omb-race-category.html) for OMB race and ethnicity category classifications. ([FHIR-27907](https://jira.hl7.org/browse/FHIR-27907))

1. Clarified [token search syntax](http://hl7.org/fhir/us/core/STU3.1.1/general-guidance.html#search-syntax) ([FHIR-27897](https://jira.hl7.org/browse/FHIR-27897)).

1. Corrected [US Core DocumentReference Profile](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-documentreference-definitions.html#DocumentReference.content) to support multiple attachments ([FHIR-25778](https://jira.hl7.org/browse/FHIR-25778)).

1. Fix FHIRPath Expression in [USCoreGoalTargetDate](http://hl7.org/fhir/us/core/STU3.1.1/SearchParameter-us-core-goal-target-date.html) ([FHIR-27892](https://jira.hl7.org/browse/FHIR-27892)).

1. Fix FHIRPath Expression in [USCoreProcedureDate](http://hl7.org/fhir/us/core/STU3.1.1/SearchParameter-us-core-procedure-date.html)([FHIR-27887](https://jira.hl7.org/browse/FHIR-27887)).

1. Add omitted ["ge" comparators to SearchParameters](http://hl7.org/fhir/us/core/STU3.1.1/SearchParameter-us-core-goal-target-date.html) ([FHIR-27893](https://jira.hl7.org/browse/FHIR-27893)).

1. [Remove Must Support References](http://hl7.org/fhir/us/core/STU3.1.1/general-guidance.html#referencing-us-core-profiles) to non US Core Profiles ([FHIR-27876](https://jira.hl7.org/browse/FHIR-27876))

1. Add missing [reaction](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-allergyintolerance-definitions.html#AllergyIntolerance.reaction) to the US Core AllergyIntolerance Profile ([FHIR-27867](https://jira.hl7.org/browse/FHIR-27867)).

1. Clarify [reference to US Core Patient](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-pediatric-bmi-for-age.html#mandatory-and-must-support-data-elements) in Vitals Signs Profiles ([FHIR-27857](https://jira.hl7.org/browse/FHIR-27857)).

1. Corrected [US Core Pulse Oximetry Profile](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-pulse-oximetry.html#formal-views-of-profile-content) component.valueQuantity.code and component.valueQuantity.unit
min from 0 to 1 to be consistent with the valueQuantity constraints within US Core ([FHIR-27846](https://jira.hl7.org/browse/FHIR-27846))

1. Correct UCUM Unit in [US Core Pulse Oximetry Profile Text Summary](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-pulse-oximetry.html#summary-of-the-must-support-requirements) ([FHIR-27845](https://jira.hl7.org/browse/FHIR-27845))

1. Update [Procedure Codes Value Set](http://hl7.org/fhir/us/core/STU3.1.1/ValueSet-us-core-procedure-code.html) to include ICD-10 PCS codes ([FHIR-27836](https://jira.hl7.org/browse/FHIR-27836))

1. Update [Procedure Codes Value Set](http://hl7.org/fhir/us/core/STU3.1.1/ValueSet-us-core-procedure-code.html) to include CDT codes ([FHIR-27737](https://jira.hl7.org/browse/FHIR-27737))

1. Clarify that pediatric vital sign percentile Observations should [reference growth chart](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-pediatric-bmi-for-age.html#mandatory-and-must-support-data-elements) ([FHIR-27549](https://jira.hl7.org/browse/FHIR-27549)),

1. Added Missing [US core Head Occipital-frontal Circumference Percentile Profile](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-head-occipital-frontal-circumference-percentile.html) ([FHIR-27542](https://jira.hl7.org/browse/FHIR-27542)).

1. Correct requirements for supporting [CLIA identifiers](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-organization.html#mandatory-and-must-support-data-elements) ([FHIR-27158](https://jira.hl7.org/browse/FHIR-27158))

1. Change Description of [ICD-10-PCS Value Set](http://hl7.org/fhir/us/core/STU3.1.1/ValueSet-us-core-procedure-icd10pcs.html) ([FHIR-27116](https://jira.hl7.org/browse/FHIR-27116))

1. Correct [AllergyIntolerance guidance](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-allergyintolerance.html#mandatory-and-must-support-data-elements) for verificationStatus ([FHIR-27096](https://jira.hl7.org/browse/FHIR-27096))

1. Fix example [US Core heart-rate example](http://hl7.org/fhir/us/core/STU3.1.1/Observation-heart-rate.html) ([FHIR-27086](https://jira.hl7.org/browse/FHIR-27086))

1. **review period comments** Update [smoking status codes](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-smokingstatus-definitions.html#Observation.valueCodeableConcept) to align with USCDI ([FHIR-27082](https://jira.hl7.org/browse/FHIR-27082)).

1. Fix invariant [provenance-1](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-provenance-definitions.html#who) ([FHIR-27065](https://jira.hl7.org/browse/FHIR-27065))

1. Fix invalid [json snippet](http://hl7.org/fhir/us/core/STU3.1.1/general-guidance.html#missing-data) ([FHIR-27001](https://jira.hl7.org/browse/FHIR-27001))

1. **review period comments** Remove Provenance requirement from Medication, Location, Practitioner, PractitionerRole, and Organization and correct copy and paste error to Medication and Provenance searchType support in [CapabilityStatement](http://hl7.org/fhir/us/core/STU3.1.1/CapabilityStatement-us-core-server.html#resource--details) ([FHIR-26840](https://jira.hl7.org/browse/FHIR-26840), [FHIR-28161](https://jira.hl7.org/browse/FHIR-28161)).

1. Correction on [USCDI Table](http://hl7.org/fhir/us/core/STU3.1.1/general-guidance.html#us-core-data-for-interoperability-and-2015-edition-common-clinical-data-set) change 'MedicationStatement' to 'MedicationRequest' and remove references to MedicationStatement in the Medication Profile and CapabilityStatements ([FHIR-26840](https://jira.hl7.org/browse/FHIR-26840)).

1. Clarify that US Core Location/PractitionerRole are [not being referenced](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-encounter.html#mandatory-and-must-support-data-elements) by other resources ([FHIR-26840](https://jira.hl7.org/browse/FHIR-26840)).

1. Correct editing error restoring Write and Operation capability guidance into [DocumentReference QuickStart](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-documentreference.html#quick-start) ([FHIR-26840](https://jira.hl7.org/browse/FHIR-26840)).

1. Clarify [guidance](http://hl7.org/fhir/us/core/STU3.1.1/general-guidance.html#search-for-servers-requiring-status) that servers SHALL support search with status if status required ([FHIR-26840](https://jira.hl7.org/browse/FHIR-26840)).

1. Correct canonical url for ImplementationGuide ([FHIR-26686](https://jira.hl7.org/browse/FHIR-26686)).

1. Correct system URI for [ICD-10 procedure codes](http://hl7.org/fhir/us/core/STU3.1.1/ValueSet-us-core-procedure-icd10pcs.html) ([FHIR-26679](https://jira.hl7.org/browse/FHIR-26679)).

1. Fix invariant [us-core-1](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-condition-definitions.html#Condition) ([FHIR-26605](https://jira.hl7.org/browse/FHIR-26605)).

1. Change valueCode min from 0 to 1 for [US Core Birth Sex Extension](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-birthsex-definitions.html#Extension.valueCode) and valueBoolean min from 0 to 1 for[US Core Direct email Extension](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-direct-definitions.html#Extension.valueBoolean) ([FHIR-26459](https://jira.hl7.org/browse/FHIR-26459)).

1. Change valueQuantity min from 1 to 0 for [US Core Pediatric BMI for Age Observation Profile](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-pediatric-bmi-for-age-definitions.html#Observation.valueQuantity) and [US Core Pediatric Weight for Height Observation Profile](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-pediatric-weight-for-height-definitions.html#Observation.valueQuantity) ([FHIR-26363](https://jira.hl7.org/browse/FHIR-26363)).

1. Add page contents to [Clinical Notes](http://hl7.org/fhir/us/core/STU3.1.1/clinical-notes-guidance.html) and [Basic Provenance](basic-provenance.html) pages ([FHIR-25785](https://jira.hl7.org/browse/FHIR-25785)).

1. Fix duplicate URL causing validation failure. ([FHIR-25536](https://jira.hl7.org/browse/FHIR-25536)).

1. Fix Invariant [us-core-8](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-patient-definitions.html#Patient.name) ([FHIR-25459](https://jira.hl7.org/browse/FHIR-25459)).

1. Corrected the wording "should support" to "shall support" in [Clinical Notes Guidance](http://hl7.org/fhir/us/core/STU3.1.1/clinical-notes-guidance.html#clinical-notes) ([FHIR-25455](https://jira.hl7.org/browse/FHIR-25455)).

1. Fix Invariant [us-core-8](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-patient-definitions.html#Patient.name) to allow for Data Absent Reason Extension on Patient name.([FHIR-25249](https://jira.hl7.org/browse/FHIR-25249)).

1. Fix Link to LOINC LP29708-2 ([FHIR-25213](https://jira.hl7.org/browse/FHIR-25213)).

1. Corrected [guidance](http://hl7.org/fhir/us/core/STU3.1.1/all-meds.html#fetching-all-medications-active-medications-and-all-medications-for-an-encounter) for conveying "Patient-Reported medications" ([FHIR-25035](https://jira.hl7.org/browse/FHIR-25035)).
</div>
