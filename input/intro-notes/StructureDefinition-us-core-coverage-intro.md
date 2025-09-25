

**Example Usage Scenarios:**

The following are example usage scenarios for this profile:

- Query for a patient's insurance coverage
- [Record or update] a past or present insurance coverage

### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile-specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.

**Each Coverage Must Have:**

1. health insurance member identifier or subscriber id
2. a status
3. the health insurance beneficiary (patient)
4. beneficiary's relationship to the subscriber
5. the health insurance issuer (payer)

**Each Coverage Must Support:**

1. health insurance coverage type (e.g., Medicare)
2. coverage start or end date
3. health insurance group
4. health insurance plan


**Profile Specific Implementation Guidance:**



- There is no single way to indicate that the patient has no coverage using the Coverage resource:
  - `Coverage.status` alone may not indicate whether an individual is covered. The `Coverage.period` needs to be considered as well. For example, the coverage may be expired with a status of "active", or conversely, it may be "canceled" but still have covered claims.
  - The absence of a Coverage resource instance may mean the patient has no coverage or the healthcare provider may not know it.
  - A `coverage.type` of "81" (Self-pay) **MAY** be used to imply that the patient has no coverage or that an individual or organization other than an insurer is taking responsibility for payment for a portion of the health care costs.
  
<div class="bg-success" markdown="1">

- The `Coverage.type` value set includes high-level categories of health care payers from the Centers for Disease Control and Prevention (CDC) National Center for Health Statistics (NCHS) Source of Payment Typology (SOPT) code system.

  - To differentiate between Medicare Parts A, B, C, and D systems can use the following codes.

    Medicare Plan | SOP Code (Description)| Comment
    |---|---|---|
    Part A and B |121 (Medicare Fee For Service)| Part A alone cannot be represented and systems **SHOULD** use the X12 concept for Medicare Part A *as a code translation* to the SOP code "121" (see [Using multiple codes with CodeableConcept Datatype]).<br/> Part B alone does not need to be represented because Part B enrollment requires enrollment in Part A
    Part C (Medicare Advantage Plan)|111 (Medicare HMO)<br />112 (Medicare PPO)<br />113 (Medicare POS) | These are the most common types of Medicare Advantage Plans 
    Part D|122 (Medicare Drug Benefit)|
    {: .grid}
</div><!-- new-content -->

- If Insurers issue unique member IDs for dependents, then the *memberId* `Coverage.identifier` should be used instead of `Coverage.dependent` to uniquely refer to the dependent with respect to their insurance.

{% include link-list.md %}
