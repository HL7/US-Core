#### Summary of the Mandatory Requirements

1.  One status in `DocumentReference.status`
    -   DocumentReference.status is bound to [DocumentReferenceStatus] value set 
1.  One document type code in `DocumentReference.type` which is bound to [Document Type] value set
1.  One reference to a patient in `DocumentReference.subject`
1.  A date and time in `DocumentReference.indexed`
1.  One url of the document in `DocumentReference.content.attachment`
    -   a mime type in `DocumentReference.content.attachment.contentType` which is bound to [MimeType] value set 
    -   a url of the document in `DocumentReference.content.attachment.url`


SHOULD have:

1.  One identifier in `DocumentReference.identifier`
1.  One dateTime value in `DocumentReference.created`
1.  One format code in `DocumentReference.content.format` with an [extensible](http://hl7.org/fhir/terminologies.html#extensible) binding to [DocumentReference format] value set
1.  One reference to an encounter in `DocumentReference.context.encounter`

  [Document Type]: http://hl7.org/fhir/ValueSet-c80-doc-typecodes.html
  [DocumentReferenceStatus]: http://hl7.org/fhir/ValueSet-document-reference-status.html
  [MimeType]: http://www.rfc-editor.org/bcp/bcp13.txt#
  [DocumentReference Format]: http://hl7.org/fhir/ValueSet-formatcodes.html
  [FHIR Binary Resource]: http://hl7.org/fhir/binary.html
