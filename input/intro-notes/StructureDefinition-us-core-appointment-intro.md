{% include new_page.md %}

{% include us-core-maturity.md id="us-core-appointment" %}

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

* <sup>1</sup>Service type codes are typically drawn from a local service catalog, and instances are not expected to draw from a specified value set.  Therefore, `Appointment.serviceType` uses an [example binding].

* <sup>2</sup>The base FHIR invariant `app-2` requires that either both the start and end time or neither are supplied. When a system knows only when an appointment starts, follow the [Missing Data] guidance and supply the end time with the [DataAbsentReason Extension] using the code "unknown":

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
