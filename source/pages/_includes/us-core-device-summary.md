**Device**

#### Summary of the Mandatory Requirements
1.  A  CodeableConcept  in `Device.type`
with an [extensible](http://hl7.org/fhir/R4/terminologies.html#extensible)
 binding to [FHIR Device Types](http://hl7.org/fhir/ValueSet/device-kind)
1.  A Patient Reference  in `Device.patient`

#### Summary of the Must Support Requirements
1.  A  Udicarrier  in `Device.udiCarrier`
   - which should have a  base64Binary value  in `Device.udiCarrier.carrierAIDC`
   - which should have a  string value  in `Device.udiCarrier.carrierHRF`