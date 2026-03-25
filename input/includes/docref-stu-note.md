<div class="stu-note" markdown="1">

The current US Core DocumentReference category value set contains a single concept, "clinical-note", but the FHIR DocumentReference resource covers a broad range of patient-associated content — including structured CDA documents, FHIR Compositions, scanned uploads, insurance cards, and more. The *2026 Argonaut Enhance DocumentReference Access Project* proposed the addition of two new categories:

1. **structured-document**: Documents with predefined schemas, such as CDA or FHIR Composition, that allow for machine-readable headers and/or entries.
1. **unstructured-document**: Unstructured content captured via digital upload or scanning, stored in a document management system, and not natively authored in the EHR.

and updating the "clinical-note" definition. The addition of a complementary set of clinical content categories to enable client access by clinical domain was also discussed.

Further work is planned in the *2026 Argonaut FHIR Write – DocRef Project*.  Based on these efforts, future versions of US Core may expand the DocumentReference category value set.
</div><!-- stu-note -->