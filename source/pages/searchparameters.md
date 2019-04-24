---
title: Operations and Search Parameters
layout: default
topofpage: true
sectionnumbering: true
---

The following operations and search parameters have been defined for the US Core Implementation Guide.  For more information on the [FHIR RESTful operations ]({{site.data.fhir.path}}operations.html), [FHIR RESTful search api]({{site.data.fhir.path}}search.html) and the standard [Search Param Registry]({{site.data.fhir.path}}searchparameter-registry.html) see the FHIR specification.

### Operations


{% include list-simple-operationdefinitions.xhtml %}




### Search Parameters


**Patient**
  - [_id](SearchParameter-None.html)
  - [identifier](SearchParameter-us-core-patient-identifier.html)
  - [name](SearchParameter-us-core-patient-name.html)
  - [birthdate](SearchParameter-us-core-patient-birthdate.html)
  - [gender](SearchParameter-us-core-patient-gender.html)
  - [family](SearchParameter-us-core-patient-family.html)
  - [given](SearchParameter-us-core-patient-given.html)
  - [address](SearchParameter-us-core-patient-address.html)
  - [telecom](SearchParameter-us-core-patient-telecom.html)

**Questionnaire**  ========== *NOT PART of US CORE - For Testing Purposes only* ========
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

**AllergyIntolerance**
  - [_id](SearchParameter-None.html)

{% include link-list.md %}
