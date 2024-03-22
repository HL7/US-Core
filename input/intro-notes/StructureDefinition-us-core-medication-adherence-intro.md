{% include new_page.md %}

**Profile Specific Implementation Guidance:**

* The `informationSource` subextension lists several profile references. {%- include no-ms-refs.md element="informationSource" %}
<div class="bg-success" markdown="1">
  
* The [Medication Adherence ValueSet] comprises a "starter" set of medication compliance SNOMED CT and NullValue codes. Its binding is [extensible], and other concepts from SNOMED CT or another code system, including local codes, can be used. The table below illustrates basic scenarios of how an implementer can use them:

    Example Scenario|Medication Adherence Code (SCT ID)\|Preferred Term
    ---|---
    The medication is being taken as directed.|1156699004\|Complies with drug therapy (finding)
    The medication is being taken, but not as directed. For example, the patient occasionally forgets or takes two pills instead of three.|702565001\|Non-compliance of drug therapy (finding)
    The medication is not being taken. For example, patient did not pick up prescription.|715036001\|Does not take medication (finding)
    {:.grid}
</div><!-- new-content -->

{% include link-list.md %}