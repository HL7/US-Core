**DocumentReference**

#### Summary of the Mandatory Requirements
1.  A  code  in `DocumentReference.status`
with a [required](http://hl7.org/fhir/R4/terminologies.html#required)
 binding to [DocumentReferenceStatus](http://hl7.org/fhir/ValueSet/document-reference-status)
1.  A  CodeableConcept  in `DocumentReference.type`
with a [required](http://hl7.org/fhir/R4/terminologies.html#required)
 binding to [US Core DocumentReference Type](ValueSet-us-core-documentreference-type.html)
1. One or more  CodeableConcepts  in `DocumentReference.category`
with an [extensible](http://hl7.org/fhir/R4/terminologies.html#extensible)
 binding to [US Core DocumentReference Category](ValueSet-us-core-documentreference-category.html)
1.  A Patient Reference  in `DocumentReference.subject`
1.  A  Content  in `DocumentReference.content`
      - which must have a  Attachment value  in `DocumentReference.content.attachment`
         - which must have a  code value  in `DocumentReference.content.attachment.contentType`
with a [required](http://hl7.org/fhir/R4/terminologies.html#required)
 binding to [MimeType](http://hl7.org/fhir/ValueSet/mimetypes|4.0.0)
         - which should have a  base64Binary value  in `DocumentReference.content.attachment.data`
         - which should have an  url value  in `DocumentReference.content.attachment.url`
      - which should have a  Coding value  in `DocumentReference.content.format`
with an [extensible](http://hl7.org/fhir/R4/terminologies.html#extensible)
 binding to [DocumentReference Format Code Set](http://hl7.org/fhir/ValueSet/formatcodes)

#### Summary of the Must Support Requirements
1. {: note-to-balloters)One or more  Identifiers  in `DocumentReference.identifier`
1.  An  instant  in `DocumentReference.date`
1. One or more Author References  in `DocumentReference.author`
1.  A Custodian Reference  in `DocumentReference.custodian`
1.  A  Context  in `DocumentReference.context`
   - which should have a Encounter Reference value  in `DocumentReference.context.encounter`
   - which should have a  Period value  in `DocumentReference.context.period`

#### Summary of Constraints
1. DocumentReference.content.attachment.url or  DocumentReference.content.attachment.data or both SHALL be present.
