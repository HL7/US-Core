##### Complete Summary of the Mandatory Requirements

1.  A narrative summary in `CarePlan.text`
    -   [CarePlan.text.status] is either “generated” or “additional”
1.  One status in `CarePlan.status`
    -   CarePlan.status is bound to [CarePlanStatus] Value set
1.  One intent in `CarePlan.intent`
    -   CarePlan.intent is bound to [CarePlanIntent] Value set
1.  A category in `Careplan.category` which must have:
    -   a fixed `Careplan.category.coding.system`= "http://hl7.org/fhir/us/core-r4/CodeSystem/careplan-category"
    -   a fixed `Careplan.category.coding.code`=“assess-plan”
1.  One reference to a patient in `CarePlan.subject`


  [CarePlan.text.status]: {{site.data.fhir.path}}valueset-narrative-status.html
  [CarePlanStatus]: http://hl7.org/fhir/request-status

  [CarePlanIntent]: {{site.data.fhir.path}}valueset-care-plan-intent.html
 [http://hl7.org/fhir/us/daf/CodeSystemCarePlan-category]: CodeSystem-careplan-category.html
