* The following US Core Profiles *indirectly* reference the location/facility through references to US Core Encounter:
    - [US Core DiagnosticReport Profile for Laboratory Results Reporting]
    - [US Core Immunization Profile]
    - [US Core MedicationDispense Profile]
    - [US Core Laboratory Result Observation Profile]
    - [US Core Procedure Profile]
    - [US Core ServiceRequest Profile]

  If the event facility/location differs from the Encounter.location, systems **SHOULD** reference it directly using the resource's `.location` element or standard [FHIR Extension].