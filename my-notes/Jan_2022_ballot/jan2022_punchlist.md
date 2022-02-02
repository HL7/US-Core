<div markdown="1" class="bg-info">

**punch list**:

- [X] [Resolve Trackers](https://jira.hl7.org/secure/Dashboard.jspa?selectPageId=12001)
- [X] Apply Trackers

  for profile/element updates:
  - [X] update profile/create artifact
  - [X] optionally create ValueSet/Search parameter artifact (update and highlight new content in terminology page)
  - [X] update uscdi table here: input/includes/uscdi_table.md
  - [X] update intro here: input/intro-notes (highlight new content with new-content class)
  - [X] update notes/search - using python script (excel soure here:input/resources_spreadsheets) and upload here: input/intro-notes) (mark as new content in spreadsheet to highlight new content)
  - [X] optionally update SPs and SP page
  - [X] update/create Examples - (highlight new content with new-content class)
  - [X] update change log
  <!--- [ ] updated Provenance to include all the new resources created a liquid script as include file to update this dynamically. -->
  - [X] update Conformance - using python script (excel soure here:input/resources_spreadsheets) and upload here: input/resources  *NOTE do this at end and remember to update Client spreadsheet from Server spreadsheet*

  for narrative updates
  - [X] update Narratives
  - [X] update change log
  - [X] list open issues in package-list
- [ ] QA
     - [X] review applied trackers
     - [ ] errors and warnings
       FMG list:
         - [X] "fix nucc code or suppress with comment that not intending it to come from NUCC - may not be a valid code - reason for suppression does not make sense": Updated reason for suppression in ignoreWarnings.txt
         - [X] "CPT issue - suppress": added these *and NUBC Code warnings* to ignoreWarnings.txt (see below)
         - [ ] "LG41752-2. loinc issue - okay": This causes 4 Errors, 3 Warnings and 3 Information Messages. Pending addition of LOINC Group Codes to the terminology server. Will add Balloters notes to Value sets for manual expansions if not ready prior to ballot.  Do we leave as error or suppress?  (see below)
         - [X] "goal.description - nlm value set - VSAC": Goal.description is no longer a VSAC Value set.  However suppressed one INFORMATION message for text only value (see below)
         - [X] NDC display names - still outstanding issue with Grahame:  Added to ignoreWarnings.txt (see below)  (see below)
         - [X] "procedure.code - ICD10-pc - not ICD10 - server doesn't know codes - confirm URL and suppress": Confirmed and Added to ignoreWarnings.txt (see below)
         - [X] "Fix slicing issues": See this [Zulip Chat](https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/slicing.20question.20for.20patterns.20on.20bindings) add text to explain when required really means extensible in this context.
         - [X] "observation profiles - suppress with approval from CGP": Added to ignoreWarnings.txt (see below)
         - [X] "US Core Vital signs - illegal attempt to change the binding - from required to extensible - related to vital signs - either a code bug or have a problem that needs to be fixed - should point to Git issue or Zulip if this is a tooling issue - ADD WARNING TO SPECIFICATION TO SAY NOT CONFORMANT TO R4 - NEEDS TO STAY AS REQUIRED.":  Tracker to change core in FHIR R4b note to balloters already done
         - [X] "CapabilityStatement - smart-app-launch - does not resolve - needs to be fixed.  If can't fix - raise a Zulip issue": fixed - see this [Zulip](https://chat.fhir.org/#narrow/stream/179252-IG-creation/topic/Canonical.20URL.20of.20SMART.20Applaunch) thread
         - [X] "Suppress capabilitystatement info messages with reason" - done
         - [X] "SearchParameter - Grahame to look into this": Added to ignoreWarnings.txt (see below)
         - [ ] "VSAC issues":  Unable to find value set in VSAC for race, ethnicity, birthsex, genderIdentity 21 Errors and 5 Warnings.  Do we leave as error or suppress? Will add Balloters notes to Value sets for manual expansions if not ready prior to ballot. (see below).
         - [X] "ValueSet - simple-language - can not be expanded - okay- can't be suppressed - tooling": OK
         - [X] "ICD9cm will be fixed next release":  OK
         - [ ] "resuppress warnings - syntax has changed": What does this mean?
         - [X] "LOCAL CODE SYTEM - URL NEEDS TO HAVE EXAMPLE IN IT OR USE A REAL ONE": OK done but still needs to be suppressed
         - [X] "Should not suppress JIra Spec File warning - Can not be suppressed": OK no errors

    Summary and Categorization of QA Errors (29), Warnings (30) and Information (8) Messages by Issue

    **Unable to find value set in VSAC for race, ethnicity, birthsex, genderIdentity**

     *ERROR (21)*

     1. ERROR: Patient/child-example: Patient.extension[2].value.ofType(code): The value provided ('M') is not in the value set 'Birth Sex' (http://hl7.org/fhir/us/core/ValueSet/birthsex), and a code is required from this value set) (error message = Error from server: Unable to find value set http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1021.103)
     1. ERROR: Patient/example: Patient.extension[2].value.ofType(code): The value provided ('F') is not in the value set 'Birth Sex' (http://hl7.org/fhir/us/core/ValueSet/birthsex), and a code is required from this value set) (error message = Error from server: Unable to find value set http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1021.103)
     1. ERROR: Patient/infant-example: Patient.extension[2].value.ofType(code): The value provided ('M') is not in the value set 'Birth Sex' (http://hl7.org/fhir/us/core/ValueSet/birthsex), and a code is required from this value set) (error message = Error from server: Unable to find value set http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1021.103)
     1. ERROR: ValueSet.where(id = 'detailed-ethnicity'): Error from server: Unable to find value set "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1021.103"
     1. ERROR: ValueSet.where(id = 'detailed-race'): Error from server: Unable to find value set "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1021.103"
     1. ERROR: ValueSet.where(id = 'omb-ethnicity-category'): Error from server: Unable to find value set "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1021.102"
     1. ERROR: ValueSet.where(id = 'omb-race-category'): Error from server: Unable to find value set "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1021.103"
     1. ERROR: ValueSet.where(id = 'birthsex'): Error from server: Unable to find value set "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1021.103"
     1. ERROR: Patient/child-example: Patient.extension[0].extension[0].value.ofType(Coding): The Coding provided (urn:oid:2.16.840.1.113883.6.238#2028-9) is not in the value set http://hl7.org/fhir/us/core/ValueSet/omb-race-category, and a code is required from this value set.  (error message = Not in value set http://hl7.org/fhir/us/core/ValueSet/omb-race-category)
     1. ERROR: Patient/child-example: Patient.extension[1].extension[0].value.ofType(Coding): The Coding provided (urn:oid:2.16.840.1.113883.6.238#2186-5) is not in the value set http://hl7.org/fhir/us/core/ValueSet/omb-ethnicity-category, and a code is required from this value set.  (error message = Not in value set http://hl7.org/fhir/us/core/ValueSet/omb-ethnicity-category)
     1. ERROR: Patient/example: Patient.extension[0].extension[0].value.ofType(Coding): The Coding provided (urn:oid:2.16.840.1.113883.6.238#2106-3) is not in the value set http://hl7.org/fhir/us/core/ValueSet/omb-race-category, and a code is required from this value set.  (error message = Not in value set http://hl7.org/fhir/us/core/ValueSet/omb-race-category)
     1. ERROR: Patient/example: Patient.extension[0].extension[1].value.ofType(Coding): The Coding provided (urn:oid:2.16.840.1.113883.6.238#1002-5) is not in the value set http://hl7.org/fhir/us/core/ValueSet/omb-race-category, and a code is required from this value set.  (error message = Not in value set http://hl7.org/fhir/us/core/ValueSet/omb-race-category)
     1. ERROR: Patient/example: Patient.extension[0].extension[2].value.ofType(Coding): The Coding provided (urn:oid:2.16.840.1.113883.6.238#2028-9) is not in the value set http://hl7.org/fhir/us/core/ValueSet/omb-race-category, and a code is required from this value set.  (error message = Not in value set http://hl7.org/fhir/us/core/ValueSet/omb-race-category)
     1. ERROR: Patient/example: Patient.extension[0].extension[3].value.ofType(Coding): The Coding provided (urn:oid:2.16.840.1.113883.6.238#1586-7) is not in the value set http://hl7.org/fhir/us/core/ValueSet/detailed-race, and a code is required from this value set.  (error message = Not in value set http://hl7.org/fhir/us/core/ValueSet/detailed-race)
     1. ERROR: Patient/example: Patient.extension[0].extension[4].value.ofType(Coding): The Coding provided (urn:oid:2.16.840.1.113883.6.238#2036-2) is not in the value set http://hl7.org/fhir/us/core/ValueSet/detailed-race, and a code is required from this value set.  (error message = Not in value set http://hl7.org/fhir/us/core/ValueSet/detailed-race)
     1. ERROR: Patient/example: Patient.extension[1].extension[0].value.ofType(Coding): The Coding provided (urn:oid:2.16.840.1.113883.6.238#2135-2) is not in the value set http://hl7.org/fhir/us/core/ValueSet/omb-ethnicity-category, and a code is required from this value set.  (error message = Not in value set http://hl7.org/fhir/us/core/ValueSet/omb-ethnicity-category)
     1. ERROR: Patient/example: Patient.extension[1].extension[1].value.ofType(Coding): The Coding provided (urn:oid:2.16.840.1.113883.6.238#2184-0) is not in the value set http://hl7.org/fhir/us/core/ValueSet/detailed-ethnicity, and a code is required from this value set.  (error message = Not in value set http://hl7.org/fhir/us/core/ValueSet/detailed-ethnicity)
     1. ERROR: Patient/example: Patient.extension[1].extension[2].value.ofType(Coding): The Coding provided (urn:oid:2.16.840.1.113883.6.238#2148-5) is not in the value set http://hl7.org/fhir/us/core/ValueSet/detailed-ethnicity, and a code is required from this value set.  (error message = Not in value set http://hl7.org/fhir/us/core/ValueSet/detailed-ethnicity)
     1. ERROR: Patient/example: Patient.extension[3].value.ofType(CodeableConcept): None of the codings provided are in the value set 'Gender Identity' (http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1021.32), and a coding from this value set is required) (codes = http://terminology.hl7.org/CodeSystem/v3-NullFlavor#ASKU)
     1. ERROR: Patient/infant-example: Patient.extension[0].extension[0].value.ofType(Coding): The Coding provided (urn:oid:2.16.840.1.113883.6.238#2028-9) is not in the value set http://hl7.org/fhir/us/core/ValueSet/omb-race-category, and a code is required from this value set.  (error message = Not in value set http://hl7.org/fhir/us/core/ValueSet/omb-race-category)
     1. ERROR: Patient/infant-example: Patient.extension[1].extension[0].value.ofType(Coding): The Coding provided (urn:oid:2.16.840.1.113883.6.238#2186-5) is not in the value set http://hl7.org/fhir/us/core/ValueSet/omb-ethnicity-category, and a code is required from this value set.  (error message = Not in value set http://hl7.org/fhir/us/core/ValueSet/omb-ethnicity-category)

     *WARNING (5)*

     1. WARNING: ValueSet/detailed-ethnicity: ValueSet.compose[0].include[1].valueSet[0]: The value set import http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1021.103 could not be found so cannot be checked
     1. WARNING: ValueSet/detailed-race: ValueSet.compose[0].include[1].valueSet[0]: The value set import http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1021.103 could not be found so cannot be checked
     1. WARNING: ValueSet/omb-ethnicity-category: ValueSet.compose[0].include[1].valueSet[0]: The value set import http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1021.102 could not be found so cannot be checked
     1. WARNING: ValueSet/omb-race-category: ValueSet.compose[0].include[1].valueSet[0]: The value set import http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1021.103 could not be found so cannot be checked
     1. WARNING: ValueSet/birthsex: ValueSet.compose[0].include[1].valueSet[0]: The value set import http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1021.103 could not be found so cannot be checked

    **LOINC Group code  LG41762-2 “Social Determinants Of Health” not supported by terminology server. **

    Action: This causes 4 Errors, 3 Warnings and 3 Information Messages. Pending addition of LOINC Group Codes to the terminology server. Will add Balloters notes to Value sets for manual expansions if not ready prior to ballot.

     *ERRORs (4)*

     1. ERROR: Condition/condition-SDOH-example: Condition.category[0].coding[0]: The code "LG41762-2" is not valid in the system http://loinc.org; The code provided (http://loinc.org#LG41762-2) is not valid in the value set 'All codes known to the system' (from http://tx.fhir.org/r4) for 'http://loinc.org#LG41762-2'
     1. ERROR: ServiceRequest/foodpantry-referral: ServiceRequest.category[0].coding[0]: The code "LG41762-2" is not valid in the system http://loinc.org; The code provided (http://loinc.org#LG41762-2) is not valid in the value set 'All codes known to the system' (from http://tx.fhir.org/r4) for 'http://loinc.org#LG41762-2'
     1. ERROR: Observation/hunger-question-example: Observation.category[0].coding[0]: The code "LG41762-2" is not valid in the system http://loinc.org; The code provided (http://loinc.org#LG41762-2) is not valid in the value set 'All codes known to the system' (from http://tx.fhir.org/r4) for 'http://loinc.org#LG41762-2'
     1. ERROR: Observation/prapare-multiselect-example: Observation.category[0].coding[0]: The code "LG41762-2" is not valid in the system http://loinc.org; The code provided (http://loinc.org#LG41762-2) is not valid in the value set 'All codes known to the system' (from http://tx.fhir.org/r4) for 'http://loinc.org#LG41762-2'

     *WARNING (3)*

     1. WARNING: ValueSet/us-core-condition-category: ValueSet.compose[0].include[3].concept[0]: The code LG41762-2 is not valid in the system http://loinc.org
     1. WARNING: ValueSet/us-core-observation-category: ValueSet.compose[0].include[0].concept[0]: The code LG41762-2 is not valid in the system http://loinc.org
     1. WARNING: ValueSet/us-core-servicerequest-category: ValueSet.compose[0].include[0].concept[0]: The code LG41762-2 is not valid in the system http://loinc.org

     *INFORMATION (3)*

     1. INFORMATION: Condition/condition-SDOH-example: Condition.category[0]: This element does not match any known slice defined in the profile http://hl7.org/fhir/us/core/StructureDefinition/us-core-condition
     1. INFORMATION: ServiceRequest/foodpantry-referral: ServiceRequest.category[0]: This element does not match any known slice defined in the profile http://hl7.org/fhir/us/core/StructureDefinition/us-core-servicerequest

     **valueset-simple-language.xml QA Error FHIR-30107 See Change Here - Coordination with IG publishing team to Correct - Note To Balloters present (1)**

     1. ERROR: ValueSet.where(id = 'simple-language'): Error from server: Language valuesets cannot be expanded as they are based on a grammar

     **US Core Pulse Oximetry Profile noncomformant UCUM Unit for Oxygen Concentration FHIR-27845 - Awaiting FHIR-4b updates to update base FHIR Vitals Profile, STU Note Present (2)**

     1. ERROR: US Core Vital Signs Profile.Observation.component.value[x]: illegal attempt to change the binding on Observation.component.value[x] from required to extensible
     1. ERROR: StructureDefinition/us-core-vital-signs: StructureDefinition: illegal attempt to change the binding on Observation.component.value[x] from required to extensible

     **Require that all profiles on Observation derive from one of the base US profiles (5 Warnings)**

     Action: Suppressed in ignoreWarnings.txt

     1. WARNING: StructureDefinition.where(url = 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-clinical-test').baseDefinition: US FHIR Usage rules require that all profiles on Observation derive from one of the base US profiles
     1. WARNING: StructureDefinition.where(url = 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-imaging').baseDefinition: US FHIR Usage rules require that all profiles on Observation derive from one of the base US profiles
     1. WARNING: StructureDefinition.where(url = 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-screening-response').baseDefinition: US FHIR Usage rules require that all profiles on Observation derive from one of the base US profiles
     1. WARNING: StructureDefinition.where(url = 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-sexual-orientation').baseDefinition: US FHIR Usage rules require that all profiles on Observation derive from one of the base US profiles
     1. WARNING: StructureDefinition.where(url = 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-social-history-assessment').baseDefinition: US FHIR Usage rules require that all profiles on Observation derive from one of the base US profiles

     **CPT Not Supported Due to IP Issues (3 Warnings)**

     Action: Suppressed in ignoreWarnings.txt

     1. WARNING: Procedure/defib-implant: Procedure.code: [Unable to determine whether the provided codes are in the value set http://hl7.org/fhir/us/core/ValueSet/us-core-procedure-code because the value set or a code system it depends on is not known to the validator, Code System URI 'http://www.ama-assn.org/go/cpt' is unknown so the code cannot be validated]
     1. WARNING: Encounter/example-1: Encounter.type[0]: [Unable to determine whether the provided codes are in the value set http://hl7.org/fhir/us/core/ValueSet/us-core-encounter-type because the value set or a code system it depends on is not known to the validator, Code System URI 'http://www.ama-assn.org/go/cpt' is unknown so the code cannot be validated]
     1. WARNING: ValueSet.where(id = 'us-core-encounter-type'): Error from server: Unable to provide support for code system http://www.ama-assn.org/go/cpt

     **NUBC Non Supported Due to IP Issues (2 Warnings):**

     Action: Suppressed in ignoreWarnings.txt

     1. WARNING: Encounter/1036: Encounter.hospitalization.dischargeDisposition: [Unable to determine whether the provided codes are in the value set http://hl7.org/fhir/us/core/ValueSet/us-core-discharge-disposition because the value set or a code system it depends on is not known to the validator, Code System URI 'http://www.nubc.org/patient-discharge' is unknown so the code cannot be validated]
     1. WARNING: ValueSet.where(id = 'us-core-discharge-disposition'): Error from server: Unable to provide support for code system http://www.nubc.org/patient-discharge

     **SearchParameter [Type.id] not Compatible with Derived SearchParameter [Resource.id] (6 Warnings):**

     Action: Suppressed in ignoreWarnings.txt

     1. WARNING: SearchParameter/us-core-practitioner-id: SearchParameter: The expression 'Practitioner.id' is not compatible with the expression 'Resource.id' in the derivedFrom SearchParameter http://hl7.org/fhir/SearchParameter/Resource-id, and this likely indicates that the derivation relationship is not valid
     1. WARNING: SearchParameter/us-core-relatedperson-id: SearchParameter: The expression 'RelatedPerson.id' is not compatible with the expression 'Resource.id' in the derivedFrom SearchParameter http://hl7.org/fhir/SearchParameter/Resource-id, and this likely indicates that the derivation relationship is not valid
     1. WARNING: SearchParameter/us-core-servicerequest-id: SearchParameter: The expression 'ServiceRequest.id' is not compatible with the expression 'Resource.id' in the derivedFrom SearchParameter http://hl7.org/fhir/SearchParameter/Resource-id, and this likely indicates that the derivation relationship is not valid

     **Us Core Goal Description Binding Is Extensible Which Allow For Text Only And Is Explicitly Encouraged In The Us Core Goal Implementation Guidance  (1 Warning)**

     Action: Suppressed in ignoreWarnings.txt

     1. WARNING: Goal/goal-1: Goal.description: No code provided, and a code should be provided from the value set 'US Core Goal Codes' (http://hl7.org/fhir/us/core/ValueSet/us-core-goal-description)

     **Unresolved NDC Code Display Issues (1 Warning)**

      Action: Suppressed in ignoreWarnings.txt

     1. WARNING: Immunization/imm-1: Immunization.vaccineCode.coding[1]: The display "FLUZONE High-Dose Quadrivalent Northern Hemisphere" is not a valid display for the code {http://hl7.org/fhir/sid/ndc}49281012165 - should be one of ['FLUZONE High-Dose Quadrivalent Northern Hemisphere, 10 SYRINGE, GLASS in 1 PACKAGE (49281-121-65)  > .7 mL in 1 SYRINGE, GLASS (49281-121-88)  (package)'] (from http://tx.fhir.org/r4) for 'http://hl7.org/fhir/sid/ndc#49281012165'

     **Unresolved ICD10CPS Code System Issue (1 Warning)**

     Action: Suppressed in ignoreWarnings.txt

     1. WARNING: Procedure/rehab: Procedure.code: The code system "http://www.cms.gov/Medicare/Coding/ICD10" in the include in "http://hl7.org/fhir/us/core/ValueSet/us-core-procedure-code" is not known; The code system 'http://www.cms.gov/Medicare/Coding/ICD10' is not known (encountered paired with code = 'HZ30ZZZ') (from http://tx.fhir.org/r4)

- [ ] update ignoreWarnings.txt (see above)
- [X] update to latest ig publisher and review address any new validation checks
- [ ] final read through
- [X] update title and version to 4.1.0 STU5
- [X] update package-list.yml (convert to json !)
- [ ] remove this blue info box from home page
- [ ] update Jira tracker file
</div>
