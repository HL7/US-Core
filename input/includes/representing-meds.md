* \*This Profile can represent a medication using a code or reference a [Medication] resource.
    *  When using a code, RXNorm concepts are used. They are defined as an [extensible] binding to `.medicationCodeableConcept`. USCDI recommends the [National Drug Codes (NDC)] as an *optional* terminology. They can be supplied as an additional coding element.
       * Systems that primarily rely on NDC codes instead of RxNorm to represent medications can use the National Library of Medicine's (NLM) [NDC to RxNorm mappings] to aid in translations.
    *  When referencing a Medication resource in `.medicationReference`, the resource may be [contained] or an external resource.
    *  The server systems are not required to support both a code and a reference, but **SHALL** support *at least one* of these methods.
    * If an external reference to a Medication resource is used, the server **SHALL** support the [`_include`] parameter for searching this element.
    *  The client application **SHALL** support all methods.

[Medication]: {{site.data.fhir.path}}medication.html
[`_include`]: {{site.data.fhir.path}}search.html#include
[contained]: {{site.data.fhir.path}}references.html#contained
[National Drug Codes (NDC)]: https://www.fda.gov/drugs/drug-approvals-and-databases/national-drug-code-directory
[extensible]: {{site.data.fhir.path}}terminologies.html#extensible


