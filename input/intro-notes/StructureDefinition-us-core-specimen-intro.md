**Example Usage Scenarios:**

The following are example usage scenarios for the US Core Specimen profile:

<div class="bg-success" markdown="1">
-  Query for a patient’s specimen
-  [Record or update] a specimen for a patient
</div><!-- new-content -->

### Mandatory and Must Support Data Elements

The following data elements must always be present ([Mandatory] definition) or must be supported if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well. The [Formal Views] below provides the formal summary, definitions, and terminology requirements.  

**Each Specimen Must Have:**

1. <span class="bg-success" markdown="1">a patient</span><!-- new-content -->
1. a specimen code

**Profile Specific Implementation Guidance:**

*  Since the binding is [extensible] when a code is unavailable, just text is allowed.
*  <span class="bg-success" markdown="1">in addition to Specimen search criteria, clients may request Specimen resources be included with Observation or DiagnosticReport resource query. An example query is provided in the [Notes](#notes) section below.</span><!-- new-content -->

{% include link-list.md %}
