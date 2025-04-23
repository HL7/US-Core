<!-- Using Provenance To Target Resource Elements input/pagecontent/element-level-provenence.md-->

<div class="stu-note" markdown="1">
This section is informative and not a requirement for systems conforming to the US Core Provenance Profile.
</div><!-- stu-note -->

Provenance typically communicates a single activity about one or more target resources identified via `Provenance.target`. However, it can focus on one or more resource *elements* using the FHIR [Target Element] extension on `Provenance.target` and identifying the target elements using [element ids]. For example, to document how and who supplied patient demographic data such as race, ethnicity, etc.

Example:

In the following [US Core Patient Profile] example, the patient demographic data such as race have *individual element ids* within a resource for internal and external referencing:

<!-- {% raw %} {% include examplebutton_default.html example="Patient-example-targeted-provenance.json" b_title = "Click Here to See Individual Element Ids Within a Patient Resource Example" %} {% endraw %} The ig-publisher does not render version specific examples see chat: https://chat.fhir.org/#narrow/channel/179252-IG-creation/topic/Version-specific.20examples -->

~~~
{
    "resourceType": "Patient",
    "id": "example-targeted-provenance/_history/1",
    "meta": {
        "versionId": "1",
        "profile": [
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"
        ]
    },
    "extension": [
        {
            "id": "race",
            "extension": [
                {
                    "url": "ombCategory",
                    "valueCoding": {
                        "system": "urn:oid:2.16.840.1.113883.6.238",
                        "code": "2106-3",
                        "display": "White"
                    }
                },
                {
                    "url": "text",
                    "valueString": "Mixed"
                }
            ],
            "url": "http://hl7.org/fhir/us/core/StructureDefinition/us-core-race"
        },
        {
            "id": "ethnicity",
            "extension": [
                {
                    "url": "ombCategory",
                    "valueCoding": {
                        "system": "urn:oid:2.16.840.1.113883.6.238",
                        "code": "2135-2",
                        "display": "Hispanic or Latino"
                    }
                },
                {
                    "url": "text",
                    "valueString": "Hispanic or Latino"
                }
            ],
            "url": "http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity"
        },
        {
            "id": "sex",
            "url": "http://hl7.org/fhir/us/core/StructureDefinition/us-core-sex",
            "valueCoding": {
                "system": "http://snomed.info/sct",
                "version": "http://snomed.info/sct/731000124108",
                "code": "248152002",
                "display": "Female (finding)"
            }
        }
    ],
    "identifier": [
        {
            "system": "http://hospital.smarthealthit.org",
            "value": "1032702"
        }
    ],
    "active": true,
    "name": [
        {
            "family": "Shaw",
            "given": [
                "Amy",
                "V."
            ]
        }
    ],
    "telecom": [
        {
            "system": "phone",
            "value": "555-555-5555"
        }
    ],
    "birthDate": "1987-02-20",
    "address": [
        {
            "line": [
                "183 MOUNTAIN VIEW ST"
            ],
            "city": "MOUNDS",
            "state": "OK",
            "postalCode": "74048"
        }
    ]
}

~~~

The following  [US Core Provenance Profile] resource communicates who, how, and when elements such as Race and Ethnicity (R/E), sex, etc., were collected. Note that the [Target Element] Extension references the element id "race" within the Patient resource:

<!-- {% raw %} {% include examplebutton_default.html example="Provenance-example-targeted-provenance.json" b_title = "Click Here to See an Element Level Provenance Example" %} {% endraw %}
The ig-publisher does not render version specific examples see chat: https://chat.fhir.org/#narrow/channel/179252-IG-creation/topic/Version-specific.20examples 
-->

~~~
{
    "resourceType": "Provenance",
    "id": "example-targeted-provenance",
    "meta": {
        "versionId": "1",
        "profile": [
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-provenance"
        ]
    },
    "target": [
        {
            "reference": "Patient/example-targeted-provenance/_history/1",
            "extension": [
                {
                    "url": "http://hl7.org/fhir/StructureDefinition/targetElement",
                    "valueUri": "race"
                }
            ]
        }
    ],
    "recorded": "2023-02-28T15:26:23.217+00:00",
    "agent": [
        {
            "type": {
                "coding": [
                    {
                        "system": "http://terminology.hl7.org/CodeSystem/provenance-participant-type",
                        "code": "informant",
                        "display": "Informant"
                    }
                ]
            },
            "who": {
                "reference": "Patient/example-targeted-provenance"
            }
        }
    ],
    "entity": [
        {
            "role": "source",
            "what": {
                "display": "admission form"
            }
        }
    ]
}
~~~

{% include link-list.md %}
