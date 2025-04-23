

**Profile Specific Implementation Guidance:**


This Complex Extension is made up of three sub-extensions:

1. A required Medication Adherence Code, which is bound to the [Medication Adherence ValueSet] -  a "starter" set of medication compliance SNOMED CT and NullValue codes. Its binding is [extensible], and other concepts from SNOMED CT or another code system, including local codes, can be used. The table below illustrates basic scenarios of how an implementer can use them:

    Example Scenario|Medication Adherence Code (SCT ID)\|Preferred Term
    ---|---
    The medication is being taken as directed.|1156699004\|Complies with drug therapy (finding)
    The medication is being taken, but not as directed. For example, the patient occasionally forgets or takes two pills instead of three.|702565001\|Non-compliance of drug therapy (finding)
    The medication is not being taken. For example, the patient did not pick up a prescription.|715036001\|Does not take medication (finding)
    {:.grid}

2. A required date asserting when the information was provided
3. A Must Support information source code with an [example binding] to the *Medication Adherence ValueSet* - a "starter" set of informant role codes.


{% include link-list.md %}