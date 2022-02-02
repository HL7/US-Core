
#### Mandatory Write Capability:

1. **SHALL** support writing a new note to a Patient's Chart:

   `POST [base]/DocumentReference`

   {% include examplebutton_default.html example="documentreference-clinical-note-post" b_title = "Click Here To See Example" %}

#### Mandatory Operation:

1. **SHALL** support fetching documents using the $docref operation.

    This [$docref operation] is used to request a server *generate* a document based on the specified parameters.  If no parameters are specified, the server SHALL return a DocumentReference to the patient's most current CCD.  See the $docref operation definition for details on how this operation differs from a FHIR RESTful search.  This operation returns a DocumentReference resources. The document itself is retrieved using the link provided in the `DocumentReference.content.attachment.url` element.

    `GET [base]/DocumentReference/$docref?patient=[id]`

   {% include examplebutton_default.html example="docref-example" b_title = "Click Here To See Example" %}

{% include link-list.md %}
