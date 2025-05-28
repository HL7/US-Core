
**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

-   Query for a specific procedure or test request, such as an electrocardiogram (ECG) order or a referral to a support program.
-   Query for a specific service offered to a patient, such as a referral to a support program.
-   Query for a category of service request (e.g., all cardiology requests)


### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.

**Each Service Request Must Have:**

1. a status
1. an intent code indicating whether the request is a proposal, plan, or order.
3. a code defining what is being requested
4. a patient

**Each Service Request Must Support:**

1. a category
2. the encounter in which the request was created
3. when requested service should happen
4. when the request was made
5. the requester*

{% include additional-requirements-intro.md type="ServiceRequest" %}

1. the code for the test, procedure, or service to be performed
1. a reason or indication for referral or consultation*

\*see guidance below

**Profile Specific Implementation Guidance:**

- For more information on exchanging Social Determinants of Health (SDOH) service requests, See the [Screening and Assessments] guidance page.
- The Must Support `ServiceRequest.category` is bound, *at a minimum*, to the [US Core ServiceRequest Category Codes], and other category codes can be used. API consumers can query by category when accessing patient information. For the USCDI *Laboratory Order*, *Imaging Order*, *Clinical Test Order*, and *Procedure Order* Data Elements, implementers **SHOULD** use the corresponding category codes listed in the table below. For example, laboratory orders would have the category code "108252007" (Laboratory procedure).

  |USCDI Order Data Element|Category Codes|
  |---|---|
  |Laboratory Order| [108252007 Laboratory procedure (procedure)]|
  |Imaging Order|[363679005 Imaging (procedure)]|
  |Clinical Test Order|[386053000 Evaluation procedure (procedure)],<br />[410606002 Social service procedure (procedure)], or<br />[387713003 Surgical procedure (procedure)]|
  |Procedure Order|[386053000 Evaluation procedure (procedure)],<br />[410606002 Social service procedure (procedure)], or<br />[387713003 Surgical procedure (procedure)]| 
  {:.grid #servicerequest-categorycodes}

- The `ServiceRequest.code` is bound to US Core Procedure Codes, a broadly defined value set that accommodates many healthcare domains. However, implementers **SHOULD** constrain the value set to a subset for a particular domain. The table below identifies additional value set bindings for the USCDI Laboratory Order, Imaging Order, and Clinical Test Order Data Elements. Implementers **SHOULD** conform to the binding strengths listed for each USCDI Order context. For example, laboratory orders are [extensibly] bound to the [LOINC Common Laboratory Orders Value Set]. Note that the USCDI Class Procedure Order Data Element has no additional binding.

  |USCDI Order Data Element|Additional Binding|[Additional Binding Purpose](https://hl7.org/fhir/R5/valueset-additional-binding-purpose.html)|Comments|
  |---|---|---|---|
  |Laboratory Order|[LOINC Common Laboratory Orders Value Set]|"extensible"|The LOINC Common Laboratory Orders Value Set is a ‘starter set’ for mapping commonly used laboratory orders. It does not attempt to include all possible laboratory order codes. For additional information on LOINC Common Laboratory Orders Value Set, refer to [www.loinc.org/usage/orders].|
  |Imaging Order|[LOINC Radiology Codes]|"preferred"|The LOINC Radiology Codes include all imaging codes minus concepts that are deprecated or discouraged.|
  |Clinical Test Order|[LOINC Clinical Test Codes]|"candidate"|LOINC Clinical Test Codes include non-laboratory and non-imaging clinical test codes that represent clinical tests.|
  {: #myTable .grid}

- *Servers and Clients **SHALL** support both US Core ServiceRequest and US Core Procedure Profiles for communicating the reason or justification for a referral as Additional USCDI Requirements. Typically, the reason or justification for a referral or consultation is communicated through `Procedure.basedOn` linking the Procedure to the US Core ServiceRequest Profile that includes either `ServiceRequest.reasonCode` or `ServiceRequest.reasonReference`. When the Procedure does not have an associated ServiceRequest, it is communicated through the US Core Procedure Profile's `Procedure.reasonCode` or `Procedure.reasonReference`. Depending on the procedure being documented, a Server will select the appropriate Profile to use.
   - Although both `ServiceRequest.reasonCode` and `ServiceRequest.reasonReference` are marked as Additional USCDI Requirements, the certifying Server system is not required to support both, but **SHALL** support at least one of these elements. The certifying Client application **SHALL** support both elements.
     - when using  `ServiceRequest.reasonReference`:
       - Servers **SHALL** support *at least one* target resource in `ServiceRequest.reasonReference`. Clients **SHALL** support all target resources.
       - The referenced resources **SHOULD** be a US Core Profile as documented in [Referencing US Core Profiles].
{% include provenance-author-bullet-generator.md %}



{% include link-list.md %}
