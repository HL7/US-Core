An example to demonstrate writing a note to the server.

##### Clinical Note

~~~

POST [base]/DocumentReference
Request Headers:
 content-type: "application/json"
 prefer: "return=REPRESENTATION"
 accept: "application/fhir+json"
Request Body:
 {
   "resourceType": "DocumentReference",
   "type": {
       "coding": [
           {
               "system": "http://loinc.org",
               "code": "18842-5",
               "display": "Discharge Summary"
           }
       ],
       "text": "Discharge Summary"
   },
   "subject": {
       "reference": "[base]/Patient/eso2MXsmcJloTEUEls5DzbA3"
   },
   "content": [{"attachment": {
       "contentType": "text/plain",
       "data": "Tm8gYWN0aXZpdHkgcmVzdHJpY3Rpb24sIHJlZ3VsYXIgZGlldCwgZm9sbG93IHVwIGluIHR3byB0byB0aHJlZSB3ZWVrcyB3aXRoIHByaW1hcnkgY2FyZSBwcm92aWRlci4="
   } }],
   "context": {"encounter": {"reference": "[base]/Encounter/eIOY6XJQw0hvmvCqTtkg6vQ3"} }
 }

~~~~

## Note Content

The content is Base64 encoded and states:
 "No activity restriction, regular diet, follow up in two to three weeks with primary care provider."