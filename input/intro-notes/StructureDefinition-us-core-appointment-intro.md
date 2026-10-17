**Example Usage Scenarios:**

The following are example usage scenarios for the US Core Appointment Profile:

-   Query for Appointment resources belonging to a Patient
-   Query for a Patient's Appointment resources by date or status
-   [Record or update] a Patient Appointment

### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.

**Each Appointment Must Have:**

1. a status
1. a participant
1. who or what is participating in the appointment (a patient, a practitioner, or a location)
1. the participation status of that participant

**Each Appointment Must Support:**

1. an appointment identifier
1. the specific service to be performed during the appointment<sup>1</sup>
1. when the appointment starts<sup>2</sup>
1. when the appointment ends<sup>2</sup>
1. the role of the participant in the appointment

<sup>1,2</sup> see guidance below

### Profile Specific Implementation Guidance

This section provides detailed implementation guidance for the US Core Profile to support implementation and certification.

* This profile represents a healthcare event scheduled for a past, current, or future date and time. An Encounter represents the event itself once it takes place. When an appointment results in an encounter, the encounter records the link back to the appointment in `Encounter.appointment`, an [Additional USCDI Requirements] element on the [US Core Encounter Profile].

* `Appointment.participant.actor` references the [US Core Patient Profile], the [US Core Practitioner Profile], and the [US Core Location Profile] as *Must Support* targets. The US Core Location Profile target also conveys the facility where the appointment is scheduled to take place, so it meets the USCDI *Facility Information* Data Class requirements for a scheduled event.

* <sup>1</sup>The `Appointment.serviceType` binding is [example] because appointment service types are typically drawn from a local service catalog, and mapping those local concepts to a standard vocabulary cannot be expected. Any code system that identifies the service to be performed can be used, and `Appointment.serviceType.text` conveys the service when no suitable code is available.

* <sup>2</sup>`Appointment.start` and `Appointment.end` are each optional, but the base FHIR invariant `app-2` requires that either both are present or neither is. When a system knows when the appointment starts but does not know when it ends, omitting `Appointment.end` breaks `app-2`. Follow the [Missing Data] guidance instead and supply `Appointment.end` with the [DataAbsentReason Extension] using the code `unknown`:

  ~~~
  {
    "resourceType" : "Appointment",
         ...
         "start" : "2026-09-15T14:00:00Z",
         "_end" : {
           "extension" : [
             {
               "url" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason",
               "valueCode" : "unknown"
             }
           ]
         }
         ...
  }
  ~~~

{% include link-list.md %}
