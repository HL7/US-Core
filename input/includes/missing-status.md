
**Storyboard for this example**

This example is based upon the following scenario:

Patient 1137192 uses an App to request all his encounters from the provider. The provider system requires status and rejects the request returning a `400` and an OperationOutcome specifying that a status parameter is required for this search.

**Request:**

Get “all encounters” for a patient 1137192 by querying Encounter using the patient search parameter.

    GET [base]/Encounter?patient=1137192

**Response:**

Instead of returning a search Bundle resource containing all the Encounter for the patient, the Server return a `400 Not Found` and an OperationOutcome detailing that a status parameter is required for this search.

    HTTP/1.1 400 Not Found
    [other headers]
    {
      "resourceType": "OperationOutcome",
      "id": "no-status",
      "issue": [
        {
          "severity": "error",
          "code": "business-rule",
          "details": {
            "text": "A \"status\" search parameter is required for this search"
          },
          "diagnostics": "valid statuses for Encounter include planned | arrived | triaged | in-progress | onleave | finished | cancelled | entered-in-error | unknown"
        }
      ]
    }
