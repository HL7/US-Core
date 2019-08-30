
#### Mandatory Write Capability:

1. **SHALL** support writing a new note to a Patient's Chart:

`POST [base]/DocumentReference`

{% include examplebutton_default.html example="documentreference-clinical-note-post" b_title = "Click Here To See Example" %}

#### Mandatory Operations

**SHALL** support fetching documents using the $docref operation.

**`GET [base]/DocumentReference/$docref?patient=[id]`**

{% include examplebutton_default.html example="docref-example" b_title = "Click Here To See Example" %}

*Implementation Notes:* This operation is used to request a server *generate* a document based on the specified parameters.  If no parameters are specified, the server SHALL return a DocumentReference to the patient's most current CCD.  See the [$docref operation] definition for details on how this operation differs from a FHIR RESTful search.  This operation returns a DocumentReference resources. The document itself is retrieved using the link provided in the `DocumentReference.content.attachment.url` element.

{% include link-list.md %}
