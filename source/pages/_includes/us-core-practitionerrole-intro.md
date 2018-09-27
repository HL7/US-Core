
##### Scope and Usage

This profile sets minimum expectations for the [PractitionerRole]({{ site.data.fhir.path }}practitionerrole.html) resource to record, search and fetch the practitioner role for a practitioner.  It identifies the mandatory core elements, extensions, vocabularies and value sets which **SHALL** be present in the PractitionerRole resource when using this profile.  The requirements for the US Core Practitioner were drawn from the [Argonaut Provider Directory](http://www.fhir.org/guides/argonaut/pd//release1/index.html), [IHE Healthcare Provider Directory](http://ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_HPD.pdf) and the [ONC Provider Directory Workshop](https://confluence.oncprojectracking.org/display/PDW/Workshop+Documents).


##### Mandatory Data Elements and Terminology


The following data-elements are mandatory (i.e data MUST be present). These are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [**Formal Profile Definition**](#summary) below provides the  formal summary, definitions, and  terminology requirements.  

**Each PractitionerRole must have:**

1. An associated practitioner
1. An associated organization
1. A list of roles
1. A list of specialties
1. An associated location
1. Contact information

**Profile specific implementation guidance:**

* The Practitioner resource SHALL be included when returning the PractitionerRole resource.
* The Endpoint resource SHALL be included when returning the PractitionerRole resource.
* The PractitionerRole.endpoint is where the [Direct address](https://www.healthit.gov/sites/default/files/directbasicsforprovidersqa_05092014.pdf) is included.


##### Examples

- [Bundle-PractitionerRole-with-Practitioner-Endpoint](Bundle-66c8856b-ba11-4876-8aa8-467aad8c11a2.xml.html)
