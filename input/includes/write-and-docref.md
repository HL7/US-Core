
#### Mandatory Write Capability:

1. **SHALL** support writing a new note to a Patient's Chart:

   `POST [base]/DocumentReference`

   {% include examplebutton_default.html example="documentreference-clinical-note-post" b_title = "Click Here To See Example" %}



#### Mandatory Operation:

1. **SHALL** support fetching documents using the $docref operation.

   This [$docref operation] is used to request a Server *generate* a document based on the specified parameters. This operation is invoked on a FHIR Server's DocumentReference endpoint (e.g., `[base]/DocumentReference/$docref`) and operates across all DocumentReference instances returning a Bundle of DocumentReference resources. See the [$docref operation] definition for detailed documentation.

   - The operation can be invoked using the GET Syntax if the complex type parameter is omitted:

      `GET [base]/DocumentReference/$docref?{parameters}`

   - Otherwise the POST transaction with used as follows:

      `POST [base]/DocumentReference/$docref`

       The body of the POST contains the [Parameters] resource with the [$docref operation] input parameters.

**Example 1: Request the latest CCD**

   {% include examplebutton_default.html example="docref-example1" b_title = "Click Here To See Example" %}

**Example 2: Request Procedure Notes and Discharge Summaries for 2019**

   {% include examplebutton_default.html example="docref-example2" b_title = "Click Here To See Example" %}



{% include link-list.md %}
