### Package File

The following package file includes an NPM package file used by many of the FHIR tools.  It contains all the value sets, profiles, extensions, list of pages and urls in the IG, etc defined as part of this version of the Implementation Guides. This file should be the first choice whenever generating any implementation artifacts since it contains all of the rules about what makes the profiles valid. Implementers will still need to be familiar with the content of the specification and profiles that apply in order to make a conformant implementation. For more information, see the [validating profiles and resources] documentation in FHIR.

- [Package(compressed folder)](package.tgz){::download="true"}

### Downloadable Copy of Entire Specification

A downloadable version of this IG is available so it can be hosted locally:

- [Downloadable Copy(compressed folder)](full-ig.zip)

### Examples

All the examples that are used in this Implementation Guide available for download:

- [XML(compressed folder)](examples.xml.zip)
- [JSON(compressed folder)](examples.json.zip)

### Consolidated CSV and Excel File Representations of Profiles

All the profile information for the {{site.data.fhir.ig.title}} is represented in a single CSV or Excel file.  This may be useful to testers and analysts to review elements properties across profiles in a single table:

- [CSV](all_profiles.csv)
- [Excel](all_profiles.xlsx)

A table to compare all the observation profiles in US Core is also provided:

- [Excel](observations-summary.xlsx)

### Schematrons

Schematrons are also available for download and listed below:

- [Schematrons(compressed folder)](schematrons.zip)

### Implementation Guide Details

Technical details about the [ImplementationGuide] resource that define this specification, including dependencies and implementation guide publishing parameter settings.

- [US Core ImplementationGuide Resource]

{% include link-list.md %}