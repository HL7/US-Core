{% include grayed-out.html %}
**Example Usage Scenarios:**

The following are example usage scenarios for the US Core AllergyIntolerance
 profile:

-   Query for Allergies belonging to a Patient
-   [Record or update]  a Patient Allergy

### Mandatory and Must Support Data Elements

The following data-elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation.  Profile specific guidance and examples are provided as well.  The [Formal Views] below provides the  formal summary, definitions, and  terminology requirements.

**Each AllergyIntolerance Must Have:**

1.  a clinical status of the allergy (e.g., active or resolved)*
1.  a code which tells you what the patient is allergic to
1.  a patient

\*This element has the following constraints: **SHALL** be present if verification status is not "entered-in-error" and **SHALL NOT** be present if verification Status is "entered-in-error".

**Each AllergyIntolerance Must Support:**

1. a verification status
1. a reaction manifestation

**Profile Specific Implementation Guidance:**

* *No Known Allergies* may be represented using the US Core-AllergyIntolerance profile with appropriate negation code in `AllergyIntolerence.code` and the appropriate verification status in `AllergyIntolerance.verificationStatus`.

  If a patient has not been asked about their allergies, this would be represented as:

    * `AllergyIntolerance.code` = “1631000175102" (Patient not asked (contextual qualifier) (qualifier value))

    * `AllergyIntolerance.verificationStatus` = "unconfirmed" or empty (in other words, then element omitted)

  If a patient has been asked, but has indicated they have no known allergies, this would be represented as:

  * `AllergyIntolerance.code` = "716186003" (No known allergy (situation))

  * `AllergyIntolerance.verificationStatus` = "confirmed"

{% include link-list.md %}

</div><!-- grayed-out -->