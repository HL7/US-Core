
<div class="note-to-balloters" markdown="1">
USCDI's Assessment and Plan of Treatment is defined as a "Health professional's conclusions and working assumptions that will guide treatment of the patient." Because the Assessment & Plan is typically a clinical note, there is an open question whether the US Core CarePlan Profile and specifically the required `CarePlan.text` can communicate it effectively. The decision to use `CarePlan.text` predates US Core's current guidance, which supports the use of DocumentReference to communicate clinical notes. In addition, The `.text` element is not used by the US HIT Vendors in many exchange contexts. Therefore its contents may be a pro forma summary of the CarePlan elements instead of the intended Assessment and Plan of Treatment. On the other hand, the US Core CarePlan has been widely implemented. It has strong support in specific sectors of the community.

We have discussed several options for consideration and are seeking balloter's to comment on them:

1. Keep the current state (implementers choose what they send in CarePlan.text)
2. Update the guidance to require sending A&P notes in CarePlan.text (requiring the content to include the Assessment and Plan of Care content)
3. Retire the US Core CarePlan Profile, and following the US Core Clinical Notes guidance, use DocumentReference to communicate the Assessment and Plan of Care content.
4. Keep the US Core CarePlan Profile, but remove the requirement for CarePlan.text and define a way to communicate the Assessment and Plan of Care content within it (specific reference is TBD e.g., in  CarePlan,supportingInfo, CarePlan.CarePlan.note, or CarePlan.activity.detail.reasonReference).
</div><!-- note-to-balloters -->

**Example Usage Scenarios:**

The following are example usage scenarios for the this profile:

-   Query for a care plan belonging to a Patient
-   [Record or update] an existing care plan


### Mandatory and Must Support Data Elements


The following data-elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Views] below provides the  formal summary, definitions, and  terminology requirements.  

**Each CarePlan must have:**

1.  a narrative summary of the patient assessment and plan of treatment
1.  a status
1.  an intent
1.  a category code of “assess-plan”
1.  a patient

**Profile specific implementation guidance:**

* Additional considerations for systems aligning with [HL7 Consolidated (C-CDA)](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=492) Care Plan requirements:
    - US Core Goal **SHOULD** be present in CarePlan.goal
    - US Core Condition **SHOULD** be present in CarePlan.addresses
    - Assement and Plan **MAY** be included as narrative text

{% include link-list.md %}
