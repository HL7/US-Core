
~~~
{
  "resourceType": "CapabilityStatement",
  ...
  "instantiates": [
    "http://hl7.org/fhir/us/core/CapabilityStatement/us-core-Server"
  ],
  ...
  "rest": [
    {
      "mode": "Server",
      ...
      "resource": [
        ...
        {
          [
            {
              "extension": [
                  {
                    "url": "required",
                    "valueString": "birthdate"
                  },
                  {
                    "url": "required",
                    "valueString": "name"
                  }
                  ],
                  "url": "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
                },
                {
                  "extension": [
                    {
                      "url": "required",
                      "valueString": "family"
                    },
                    {
                      "url": "required",
                      "valueString": "gender"
                    }
                  ],
                  "url": "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
                },
                {
                    {
                      "url": "required",
                      "valueString": "birthdate"
                    },
                    {
                      "url": "required",
                      "valueString": "family"
                    }
                  ],
                  "url": "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
                },
                {
                  "extension": [
                    {
                      "url": "required",
                      "valueString": "gender"
                    },
                    {
                      "url": "required",
                      "valueString": "name"
                    }
                  ],
                  "url": "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
                }
              ]
            }
          ]
          "type": "Patient",
          "supportedProfile": [
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"
          ],
          "interaction": [
            {
              "code": "create"
            },
            {
              "code": "search-type"
            },
            {
              "code": "read"
            }
          ],
          "referencePolicy": [
            "resolves"
          ],
          "searchRevInclude": [
            "Provenance:target"
          ],
          "searchParam": [
            {
              "name": "_id",
              "definition": "http://hl7.org/fhir/us/core/SearchParameter/us-core-patient-id",
              "type": "token"
            },
            {
              "name": "identifier",
              "definition": "http://hl7.org/fhir/us/core/SearchParameter/us-core-patient-identifier",
              "type": "token",
              "documentation": "The Client **SHALL** provide at least a code value and **MAY** provide both the system and code values.\n\nThe Server **SHALL** support both."
            },
            {
              "name": "name",
              "definition": "http://hl7.org/fhir/us/core/SearchParameter/us-core-patient-name",
              "type": "string"
            }

          ],
          ...
        }
      ]
    }
  ]
}
~~~
