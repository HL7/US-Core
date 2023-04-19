{% include new_page.md %}

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
2. coverage start and/or end date
3. health insurance group and/or plan


**Profile Specific Implementation Guidance:**

- `Coverage.status` alone may not indicate whether an individual is covered. The `Coverage.period` needs to be considered as well. For example, the coverage may be expired with a status of "active", or conversely, it may be "canceled" but still have covered claims.
<div class="bg-success" markdown="1">
- The hierarchical nature of the `Coverage.type` code system "Payer" (also known as the US Public Health Data Consortium Source of Payment Codes) may be unclear in the expansion, and some of the codes may be inappropriate for the use case.  Implementers should refer to the [PHDSC Payer Type Committee User's Guide] for the Source of Payment Typology when selecting codes.
- If Insurers issue unique member Ids for dependents, then the *memberId* `Coverage.identifier` should be used instead of `Coverage.dependent` to to uniquely refer to the dependent with respect to their insurance.
</div><!-- new-content -->

{% include link-list.md %}
