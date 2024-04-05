* The following US Core Profiles *indirectly* reference the location/facility through references to US Core Encounter:
    - [US Core DiagnosticReport Profile for Laboratory Results Reporting]
    - [US Core Immunization Profile]
    - [US Core MedicationDispense Profile]
    - [US Core Observation Clinical Result Profile]
    - [US Core Procedure Profile]
    - [US Core ServiceRequest Profile]

  If the event facility/location differs from the `Encounter.location`, systems **SHOULD** reference it directly:
    - Systems **SHALL** use the `location` element for all resources where the element is available.
    - Systems **MAY** use the standard [Event Location Extension] for US Core DiagnosticReport Profile for Laboratory Results Reporting and US Core Observation Clinical Result Profile.