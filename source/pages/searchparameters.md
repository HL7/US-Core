---
title: Operations and Search Parameters
layout: default
topofpage: true
sectionnumbering: true
---

The following operations and search parameters have been defined for the US Core Implementation Guide.  For more information on the [FHIR RESTful operations ]({{site.data.fhir.path}}operations.html), [FHIR RESTful search api]({{site.data.fhir.path}}search.html) and the standard [Search Param Registry]({{site.data.fhir.path}}searchparameter-registry.html) see the FHIR specification.

This page is not a list of search requirements for the client or server. These search parameters definitions are used within the Capability Statement to define the search capabilities of the server. 

The search parameters **SHALL NOT** be interpreted on their own as requirements for servers.


### Operations


  {% include list-simple-operationdefinitions.xhtml %}


<br />

### Search Parameters


**AllergyIntolerance**
  - [_id](SearchParameter-None.html)

**Patient**
  - [_id](SearchParameter-None.html)
  - [identifier](SearchParameter-us-core-patient-identifier.html)
  - [name](SearchParameter-us-core-patient-name.html)
  - [birthdate](SearchParameter-us-core-patient-birthdate.html)
  - [gender](SearchParameter-us-core-patient-gender.html)
  - [family](SearchParameter-us-core-patient-family.html)
  - [given](SearchParameter-us-core-patient-given.html)

**Questionnaire**
  - [_id](SearchParameter-None.html)
  - [url](SearchParameter-us-core-questionnaire-url.html)
  - [status](SearchParameter-us-core-questionnaire-status.html)
  - [title](SearchParameter-us-core-questionnaire-title.html)
  - [publisher](SearchParameter-us-core-questionnaire-publisher.html)
  - [version](SearchParameter-us-core-questionnaire-version.html)
  - [context-type-value](SearchParameter-us-core-questionnaire-context-type-value.html)

**Encounter**
  - [_id](SearchParameter-None.html)
  - [patient](SearchParameter-us-core-encounter-patient.html)
  - [date](SearchParameter-us-core-encounter-date.html)
  - [identifier](SearchParameter-us-core-encounter-identifier.html)
  - [status](SearchParameter-us-core-encounter-status.html)
  - [class](SearchParameter-us-core-encounter-class.html)
  - [type](SearchParameter-us-core-encounter-type.html)


{% include link-list.md %}
