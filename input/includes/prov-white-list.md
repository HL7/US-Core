
{: #prov-white-list}
- The US Core Provenance resource **SHALL** be supported for these US Core resources:
   - US Core AllergyIntolerance Profile
   - US Core CarePlan Profile
   - US Core CareTeam Profile
   - US Core Condition Profile
   - US Core DiagnosticReport Profile for Laboratory Results Reporting
   - US Core DiagnosticReport Profile for Report and Note exchange
   - US Core DocumentReference Profile
   - US Core Encounter Profile
   - US Core Goal Profile
   - US Core Immunization Profile
   - US Core Implantable Device Profile
   - US Core Laboratory Result Observation Profile
   - US Core MedicationRequest Profile
   - US Core Patient Profile
   - US Core Pediatric BMI for Age Observation Profile
   - US Core Pediatric Weight  for Height Observation Profile
   - US Core Procedure Profile
   - US Core Pulse Oximetry Profile
   - US Core Smoking Status Observation Profile
   - The Vital Signs Profile from the FHIR Specification

{% assign black_list = "Extension,Provenance,Medication,Organization,Practitioner,PractitionerRole,Location" | split:"," %}

{% for s in site.data.structuredefinitions %}
  {%- unless black_list contains r.type -%}
    {%- for r in site.data.resources -%}
      {%- if r.name == s.basename -%}
- {{r.title}}
      {%- endif -%}
    {%- endfor -%}
  {%- endunless -%}
{%- endfor %}
