This profile sets minimum expectations for the [AllergyIntolerance] resource to record, search and fetch allergies/adverse reactions associated with a patient.  It identifies the mandatory core elements, extensions, vocabularies and value sets which **SHALL** be present in the AllergyIntolerance resource when using this profile.

**Example Usage Scenarios:**



The following are example usage scenarios for the US Core AllergyIntolerance
 profile:

-   Query for Allergies belonging to a Patient
-   Record or update a Patient Allergy

##### Mandatory Data Elements and Terminology


The following data-elements are mandatory (i.e data MUST be present). These are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [**Formal Profile Definition**](#summary) below provides the  formal summary, definitions, and  terminology requirements.  

**Each AllergyIntolerance must have:**

1.  a status of the allergy
1.  a verification status
1.  a code which tells you what the patient is allergic to
1.  a patient

**Profile specific implementation guidance:**

* No Known Allergies may be represented using the US Core-AllergyIntolerance profile with appropriate negation code in AllergyIntolerence.code.

#### Examples

- [AllergyIntolerance-example](AllergyIntolerance-example.html)

[AllergyIntolerance]: {{site.data.fhir.path}}allergyintolerance.html
