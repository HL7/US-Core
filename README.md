
#  Welcome to the US Core Implementation Guide Repository

**US Core Implementation Guide (FHIR IG) [Publication (Version) History](http://hl7.org/fhir/us/core/history.html)**

Authors:  Eric Haas, Brett Marquard, Gay Dolin

Log all issues in the official [Jira tracker system](http://hl7.org/fhir-issues) so the HL7 International Cross Groups Projects Workgroup can review and vote on them.

## US Core Publication Documentation

This documentation provides a comprehensive guide to the technical stack and workflows used to publish the HL7 FHIR US Core Implementation Guide. It covers the essential tools—including the IG Publisher, Jekyll, Sushi, and supporting scripts—along with step-by-step processes for building, updating, and troubleshooting the publication.

- [Welcome to the US Core Implementation Guide Repository](#welcome-to-the-us-core-implementation-guide-repository)
  - [US Core Publication Documentation](#us-core-publication-documentation)
  - [IG publisher](#ig-publisher)
    - [What It Does](#what-it-does)
    - [Documentation](#documentation)
      - [IG Publisher CLI (including installation)](#ig-publisher-cli-including-installation)
      - [IG Publisher Documentation](#ig-publisher-documentation)
  - [HL7 Templates](#hl7-templates)
    - [What It Does](#what-it-does-1)
    - [Documentation (including installation)](#documentation-including-installation)
  - [Jekyll](#jekyll)
    - [What It Does](#what-it-does-2)
    - [Documentation (including installation)](#documentation-including-installation-1)
  - [Jekyll Include files](#jekyll-include-files)
    - [Documentation](#documentation-1)
      - [Repository Structure](#repository-structure)
      - [Syntax](#syntax)
    - [Key Points](#key-points)
  - [Jekyll Collections](#jekyll-collections)
    - [Documentation](#documentation-2)
      - [Repository Structure](#repository-structure-1)
      - [Managing Collections](#managing-collections)
      - [Accessing Collection Data:](#accessing-collection-data)
    - [Key Points](#key-points-1)
  - [Jekyll Liquid](#jekyll-liquid)
    - [What It Does](#what-it-does-3)
    - [Documentation](#documentation-3)
      - [Creating Tables, Lists, and Examples](#creating-tables-lists-and-examples)
      - [Creating Page Contents](#creating-page-contents)
    - [Key Points](#key-points-2)
  - ["Intro|Notes" Files](#intronotes-files)
    - [Documentation](#documentation-4)
      - [US Core Only Uses Sushi to Produce The FHIR Implementation Guide Resource.](#us-core-only-uses-sushi-to-produce-the-fhir-implementation-guide-resource)
      - [Repository Structure](#repository-structure-2)
      - [IG Configuration](#ig-configuration)
    - [Key Points](#key-points-3)
  - [FHIR Liquid](#fhir-liquid)
    - [What It Does](#what-it-does-4)
    - [Documentation](#documentation-5)
      - [Repository Structure](#repository-structure-3)
      - [IG Configuration](#ig-configuration-1)
      - [FHIR Liquid Profile Documentation](#fhir-liquid-profile-documentation)
    - [Key Points](#key-points-4)
  - [Sushi](#sushi)
    - [What It Does](#what-it-does-5)
    - [Documentation](#documentation-6)
      - [US Core Only Uses Sushi to Produce The FHIR Implementation Guide Resource.](#us-core-only-uses-sushi-to-produce-the-fhir-implementation-guide-resource-1)
      - [Repository Structure](#repository-structure-4)
      - [FHIR IG Auto-Build Process with SUSHI](#fhir-ig-auto-build-process-with-sushi)
        - [The Pipeline](#the-pipeline)
      - [Sushi Documentation](#sushi-documentation)
    - [Key Points](#key-points-5)
  - [Sushi Configuration File: Pages](#sushi-configuration-file-pages)
  - [Sushi Configuration File: Dependencies](#sushi-configuration-file-dependencies)
  - [Sushi Configuration File: FHIR Artifacts](#sushi-configuration-file-fhir-artifacts)
  - [Sushi Configuration File: Parameters](#sushi-configuration-file-parameters)
  - [Sushi Configuration File: Menu](#sushi-configuration-file-menu)
  - [Jira](#jira)
    - [What It Does](#what-it-does-6)
    - [Documentation](#documentation-7)
  - [US Core Python Scripts](#us-core-python-scripts)
    - [What is Does](#what-is-does)
      - [US Core Python Scripts' Key Dependencies](#us-core-python-scripts-key-dependencies)
    - [Documentation](#documentation-8)
      - [How to update the files Using The US Core Python Scripts](#how-to-update-the-files-using-the-us-core-python-scripts)
      - [Python Installation](#python-installation)
      - [VSCode and Jupyter Installation](#vscode-and-jupyter-installation)
  - [Publish.sh Bash Script](#publishsh-bash-script)
    - [What is Does](#what-is-does-1)
    - [Documentation](#documentation-9)
      - [Key Tools It Uses](#key-tools-it-uses)
      - [Bash Installation](#bash-installation)
        - [Mac](#mac)
        - [Git Bash for Windows](#git-bash-for-windows)
      - [High-Level Flow](#high-level-flow)
      - [Basic Syntax](#basic-syntax)
      - [Configuration](#configuration)
      - [Command-Line Options](#command-line-options)
    - [Common Workflows](#common-workflows)
      - [Build IG no changes/updates (just IG Publisher, no SUSHI)](#build-ig-no-changesupdates-just-ig-publisher-no-sushi)
      - [Update IG Publisher, then build](#update-ig-publisher-then-build)
      - [Build IG after changes/updates (Convert YAML to JSON, then run SUSHI, then run IG Publisher removing meta extension and adding versions to canonicicals)](#build-ig-after-changesupdates-convert-yaml-to-json-then-run-sushi-then-run-ig-publisher-removing-meta-extension-and-adding-versions-to-canonicicals)
      - [Delete temp/cache (Run build after deleting an artifacts or example)](#delete-tempcache-run-build-after-deleting-an-artifacts-or-example)
      - [Update the requirements resource (run after updating the us\_core\_reqs.csv file)](#update-the-requirements-resource-run-after-updating-the-us_core_reqscsv-file)
      - [Prepublication Steps](#prepublication-steps)
      - [Troubleshooting ( when you screw up )](#troubleshooting--when-you-screw-up-)
  - [Git](#git)
  - [Overview of US Core publication Process](#overview-of-us-core-publication-process)
    - [Prepare IG for new version:](#prepare-ig-for-new-version)
    - [Prepublication checklists](#prepublication-checklists)
  - [Misc topics](#misc-topics)
    - [Updating the Change Log](#updating-the-change-log)
    - [New content highlighting](#new-content-highlighting)
    - [QA tricks and tips](#qa-tricks-and-tips)
    - [Version comparisons](#version-comparisons)
    - [Update the History Page Introducion](#update-the-history-page-introducion)



## IG publisher

### What It Does

The FHIR IG Publisher takes implementation guide source content and transforms it into a complete published implementation guide, including human-readable HTML files and a machine-processable NPM package (package.tgz). It validates all resources in the IG, generates renderings for each artifact, and produces an HTML QA file with any errors encountered.

The IG Publisher's key dependencies include:

- **Java runtime** - Required to execute the publisher JAR file
- **Jekyll** - Website generation tool for producing final HTML output
- **Ruby** - Ruby requirements for Jekyll
- **SUSHI** - You need this to configure the Implementation Guide resource and optionally to author implementation guide artifacts using the FSH Domain-Specific Language (DSL).
- **HL7 IG Templates** -  Packages referenced by the IG Publisher that control the visual styling, page structure, and navigation of published FHIR Implementation Guides.
- **FHIRPath** - Path-based navigation and extraction language that IG authors use to define constraints, invariants, search parameters, and slicing logic.
- **Terminology Server** (tx.fhir.org) - Handles terminology operations with local caching
- **FHIR core specification** - The base FHIR version being targeted
- **IG source content** - Created manually using text/JSON/YAML editors like VSCode or optionally via SUSHI.
<!-- - **Dependent IGs** - Other implementation guides referenced via `dependsOn` (e.g., US Core) -->


### Documentation

#### IG Publisher CLI (including installation)

This document describes specific options available for running the FHIR IG Publisher command-line tool and installation instructions.

https://confluence.hl7.org/spaces/FHIR/pages/175618322/IG+Publisher+CLI

#### IG Publisher Documentation

Other details of the publishing process are also available in the IG Publisher Documentation page.

https://confluence.hl7.org/spaces/FHIR/pages/35718627/IG+Publisher+Documentation

## HL7 Templates

### What It Does

HL7 IG Templates are packages referenced by the IG Publisher that control the visual styling, page structure, and navigation of published FHIR Implementation Guides. They define how FHIR resources render as pages and provide a framework for authors to integrate narrative content.

### Documentation (including installation)

The HL7 IG Templates are referenced in the `ig.ini` with the key-value pair "template = hl7.fhir.template#[version]"  where "[version]" is the template's version:

```ini
 Use a specific version
template = hl7.fhir.template#1.0.0

 Use the current CI build version
template = hl7.fhir.template#current

 If no version is specified, it defaults to the latest release
template = hl7.fhir.template
```

- "#current" refers to the *Continuous Integration Build* (latest in version control) maintained on build.fhir.org.  The "#current" version is useful during development,but **for official HL7 publications use a specific released version** (e.g., "#1.0.0")

These documents provide more details describing how to specify and use templates.

  - https://build.fhir.org/ig/FHIR/ig-guidance/using-templates.html
  - https://build.fhir.org/ig/FHIR/ig-guidance/template.html


## Jekyll

### What It Does

Jekyll serves as the website generation tool that takes the processed FHIR artifacts, templates, and page content produced by the IG Publisher and compiles them into the final static HTML output that forms the publishable Implementation Guide. It also makes IG metadata (version, canonical URL, dependencies, etc.) available through data variables that can be referenced in page templates.

Jekyll's key dependencies include:

- **Ruby** (version 2.7.0+; 3.1.3+ recommended)
- **RubyGems** - Ruby's package manager, including...
  - **liquid** - Templating engine for dynamic content (e.g., `{{ site.data.fhir.version }}`)
  - **kramdown** - Markdown parser that converts .md files to HTML for pages and include files.*

\*kramdown markdown cannot be used for markdown datatype elements in FHIR resources which "*...requires and uses the [GFM (Github Flavored Markdown)](https://github.github.com/gfm/) extensions on [CommonMark](http://spec.commonmark.org/0.28/) format, with the exception of support for inline HTML which is not supported.*"

###  Documentation (including installation)

For comprehensive documentation on static website creation using Jekyll and installation instructions.

https://jekyllrb.com/



## Jekyll Include files

Jekyll include files are used extensively in US Core pages.  Jekyll include files let you define reusable content fragments once and insert them into multiple pages using the {% include filename %} syntax. This promotes consistency across the IG by keeping common elements (like navigation, boilerplate text, or repeated guidance) synchronized, and simplifies maintenance because updates only need to be made in one place rather than across every page that uses the content.

###  Documentation

#### Repository Structure

The `input/includes/` directory is the standard location for Jekyll include files

~~~
├── input
│   ├── includes
│   │   ├── DAR-exception.md
│   │   ├── SDOH_search_transaction.md
│   │   ├── additional-codings.md
│   │   ├── additional-requirements-intro.md
│   │   ├── boilerplate-clia-warning.md
...
│   │   ├── should-project-us.md
│   │   ├── uscdi-uscore-version-table.md
│   │   ├── vitals-guidance.md
│   │   └── whats-new
~~~

#### Syntax

Basic include:
```liquid
{% include common-note.md %}
```

Include with parameters:
```liquid
{% include fragment.md name="Patient" status="active" %}
```

Accessing parameters within the include file:
```liquid
This profile is for {{ include.name }} with status {{ include.status }}.
```

Wherever includes are used with parameters, the include file's inline comments document whether the parameters are required or optional and what their values are...

For example,the include file: `input/includes/observation_guidance_1.md` content:

~~~
<!--
include parameters:
category (optional)
example1 (optional)
example2 (optional)
recommendation (optional - extra recommendation inserted after first sentence in obs_cat_guidance.md)
example usage:
{% raw %}
{% include observation_guidance_1.md category="laboratory" example1=" such as 'chemistry'" example2=" (for example, a 24-Hour Urine Collection test)" recommendation="Server **SHOULD** use [Observation Category Codes] if applicable." %}
{% endraw %} -->

{% include obs_cat_guidance.md -%}
{% include additional-codings.md %}
* Systems **SHOULD** support `Observation.effectivePeriod` to accurately represent measurements over time {{include.example2}}.
{% include DAR-exception.md %}
* See the [General Guidance] page for further guidance on SNOMED and UCUM.
* See the [LOINC scale type to FHIR data type mapping] for guidance on which `Observation.value[x]` data type to use based on the LOINC Type of Scale.

{% include link-list.md %}
~~~
###  Key Points

- Jekyll include files allow reusable content fragments to be defined once in `input/includes/` and inserted into multiple pages using `{% include filename %}` syntax, ensuring consistency and simplifying maintenance across the IG.
- Includes can accept parameters using `{% include fragment.md name="value" %}` syntax, which are accessed within the include file via `{{ include.name }}`.
- Include files that use parameters document whether each parameter is required or optional and provide example usage in inline comments at the top of the file.

## Jekyll Collections

Another feature that is used extensively in US Core pages is Jekyll Collections.  Jekyll Collections allow grouping related content (such as profile metadata) into named sets that can be iterated over and rendered programmatically using Liquid scripts (see below). Although US Core's collections are either CSV of YAML files, Jekyll allows CSV, YAML, and JSON files. This lets IG authors automatically generate consistent pages for similar artifacts, such as a summary table listing data, without manually maintaining each entry.

 For documentation on using Collections in Jekyll, see: https://jekyllrb.com/docs/collections/

###  Documentation

#### Repository Structure

The `input/data/` directory is the standard location to *add and edit* US Core authored collections. The IG Publisher also generates collections and these and the US Core authored collections are *accessed* in the `temp/pages/_data` directory.

~~~
├── input
│   ├── data
│   │   ├── README.md
│   │   ├── additional-uscdi-requirements.csv
│   │   ├── addl_uscdi_choice_refs.csv
│   │   ├── addl_uscdi_refs.csv
│   │   ├── assessments-valuesets.csv
│   │   ├── codesystem-ref-all-list.csv
│   │   ├── ig.yml
│   │   ├── ms_choice_refs.csv
│   │   ├── ms_refs.csv
│   │   ├── new_stuff.yml
│   │   ├── profile_metadata.csv
│   │   ├── provenance-elements.csv
│   │   ├── search_requirements.csv
│   │   ├── uscdi-examples.yml
│   │   ├── uscdi-table.csv
│   │   ├── uscore-sps.csv
│   │   ├── valueset-ref-all-list.csv
│   │   └── vsacname-fhiruri-map.csv
~~~

####  Managing Collections

The US Core PageContent file or include documents the Collection's contents and whether the IG Publisher generates it, editors manually update it, or a user uses Python scripts to update it (discussed in detail below). The US Core PageContent file or include file and the Collections they use are listed below :


PageContent/includes file|US Core Collection|IG Publisher-Generated Collection
---|---|---
input/includes/ms-target-table-generator.md|input/data/ms_refs.csv
input/includes/ms-target-table-generator.md|input/data/ms_choice_refs.csv
input/includes/ms-target-table-generator.md|input/data/addl_uscdi_refs.csv
input/includes/ms-target-table-generator.md|input/data/addl_uscdi_choice_refs.csv
input/pagecontent/must-support.md|input/data/additional-uscdi-requirements.csv
input/pagecontent/vsacname-fhiruri-map.md|input/data/vsacname-fhiruri-map.csv
input/includes/provenance-author-bullet-generator.md|input/data/provenance-elements.csv
input/includes/quickstart-intro.md|input/data/profile_metadata.csv
input/includes/quickstart-search.md|input/data/search_requirements.csv
input/includes/res-list-generator.md|input/data/new_stuff|temp/pages/_data/resources.json
input/includes/sd_link.html||temp/pages/_data/structuredefinitions.json
input/includes/sd-list-generator.md|input/data/profile-metadata.csv|temp/pages/_data/structuredefinitions.json
input/pagecontent/basic-provenance.md|nput/data/provenance-elements.csv
input/pagecontent/changes-between-versions.md|input/data/profile-metadata.csv
input/pagecontent/examples.md|*input/data/ig.yml
input/pagecontent/profiles-and-extensions.md|input/data/profile-metadata.csv|temp/pages/_data/structuredefinitions.json
input/pagecontent/relationship-with-other-igs.md|input/data/profile_metadata.csv
input/pagecontent/scopes.md|input/data/profile_metadata.csv
input/pagecontent/screening-and-assessments.md|input/data/assessments-valuesets.csv
input/pagecontent/screening-and-assessments.md|input/data/uscdi-examples.yml
input/pagecontent/search-parameters-and-operations.md||temp/pages/_data/structuredefinitions.json,<br />temp/pages/_data/resources.json
input/pagecontent/terminology.md|temp/pages/valueset-ref-all-list.csv
input/pagecontent/terminology.md|temp/pages/codesystem-ref-all-list.csv.
input/pagecontent/uscdi.md|input/data/uscdi-table.csv
input/pagecontent/requirements.md|input/data/us_core_reqs.csv

\* The publish.sh script adds `input/data/ig.yml` to the input/data directory after running sushi  (for details see the Publish.sh section below).

#### Accessing Collection Data:

Collection data files are stored in `temp/pages/_data`, and are accessed using "site.data.[filename]" as a liquid variable.  For example, to get a list of US Core Profile titles, you would loop through profile_metadata.csv rows using `{% for row in site.data.profile_metadata %}`

### Key Points

- Jekyll collections group related content (like profile metadata) into named sets stored as CSV, YAML, or JSON files in `input/data/`, enabling IG authors to generate consistent pages programmatically without manually maintaining each entry.

- Collections are managed in different ways — some are generated by the IG Publisher, some are manually updated, and some use Python scripts — the approach for each table is documented in the associated PageContent or include file.

- Collection data is accessed in Liquid templates via `site.data.[filename]` syntax (e.g., `{% for row in site.data.profile_metadata %}`) from the `temp/pages/_data` directory where both authored and IG Publisher-generated collections reside.


## Jekyll Liquid

### What It Does

Jekyll/Shopify Liquid is a templating language that enables dynamic content generation within static web pages using tags ({% %}) for logic and output ({{ }}) for variables. It allows IG authors to insert dynamic values (like {{ site.data.fhir.version }}), create conditional content, loop through collections, and apply filters to transform data—all at build time rather than runtime. This enables FHIR IGs to maintain consistency across pages, automatically reflect dependency versions, and generate repetitive content programmatically while still producing fast, static HTML output.

Liquid is a Ruby gem installed as a dependency when you install Jekyll.  For documentation on using Liquid with Jekyll, see:

https://jekyllrb.com/docs/liquid/

### Documentation

Jekyll Liquid scripts are used extensively in US Core pages to create page content, including lists and tables with collections.  As documented above, the US Core PageContent file or include documents the Collection's contents and whether it is generated by the IG Publisher, manually updated, or updated using Python scripts (discussed in detail below).

#### Creating Tables, Lists, and Examples

 As documented above, US Core creates lists, tables, and examples in page content by leveraging Liquid with collections.  The PageContent or include files document the Collection's contents and source. In general, Liquid accesses the collection data stored at `temp/pages/_data` using `site.[collection_name]` syntax and loops through it to create the content from the row data. In most cases, it creates simple Markdown or XHTML content. However, for input/pagecontent/uscdi..md, extensive styling is applied to the XHTML.

General syntax for a Liquid table from a CSV:

Assume `my_csv.csv` contains columns with headers "title" and "url"

~~~xhtml
<table class="grid">
<thead>
<tr>
<th>Title</th>
<th>url</th>
</tr>
</thead>
<tbody>
{% assign rows = site.data.my_csv | sort: "title" %}
{% for item in rows %}
<tr>
<td>{{item.title}}</td>
<td>{{item.url}}</td>
</tr>
{% endfor %}
</tbody>
</table>
~~~

#### Creating Page Contents

US Core uses Liquid templating to generate a custom "Notes" file for each profile documenting the required and optional FHIR RESTful search APIs for US Core certification. However, explaining this advanced use of Liquid is beyond this document's scope.

### Key Points

- Jekyll Liquid is a templating language that enables dynamic content generation using tags (`{% %}`) for logic and output (`{{ }}`) for variables, allowing IG authors to insert dynamic values, create conditional content, loop through collections, and apply filters—all at build time to produce static HTML.

- US Core extensively uses Liquid with collections to create tables, lists, and examples by accessing collection data via `site.data.[collection_name]` syntax and looping through rows to generate Markdown or XHTML content.

- US Core also uses Liquid templating to generate custom profile notes documenting required and optional FHIR RESTful search APIs for certification, though this advanced usage is beyond the scope of the document.


## "Intro|Notes" Files

Another feature that is used extensively in US Core pages is the "Intro and Notes" files. They are similar to the Jekyll Include files, but these fragments are included into artifact pages (e.g., US Core Patient Profile) by the HL7 templates and not directly included using Jekyll includes syntax described above.

### Documentation

#### US Core Only Uses Sushi to Produce The FHIR Implementation Guide Resource.

These Markdown files use a special naming syntax of "[artifact file name]" + "intro|notes" + ".md". For example, for the introduction to the US Core Patient Profile: `input/intro-notes/StructureDefinition-us-core-patient-intro.md`)

#### Repository Structure

They are defined in the `input/intro-notes/` directory

~~~
├── input
│   ├── intro-notes
│   │   ├── DiagnosticReport-cbc-intro.md
│   │   ├── DiagnosticReport-metabolic-panel-intro.md
│   │   ├── Observation-cbc-erythrocytes-intro.md
...
│   │   ├── ValueSet-detailed-ethnicity-intro.md
│   │   ├── ValueSet-detailed-race-intro.md
│   │   ├── ValueSet-simple-language-intro.md
│   │   ├── ValueSet-us-core-location-type-intro.md
│   │   └── ValueSet-us-core-pregnancy-intent-intro.md
~~~

#### IG Configuration

Using SUSHI and the `sushi-config.yaml` file to create the Implementation Guide resource, the following [Implementation Guide Parameter](https://build.fhir.org/ig/FHIR/fhir-tools-ig/branches/master/CodeSystem-ig-parameters.html) defines the relative path that contains these fragments for generating the introductions and notes section on FHIR artifacts

~~~
  path-pages:
    - input/pagecontent   # defines relative path that contains the pagecontent
    - input/intro-notes   # defines relative path that contains the intro|notes fragments
~~~

### Key Points

- "Intro and Notes" files are Markdown fragments that get automatically included into artifact pages (like profile pages) by HL7 templates, rather than being manually inserted using Jekyll include syntax.

- These files follow a specific naming convention of `[artifact file name]-intro.md` or `[artifact file name]-notes.md` and are stored in the `input/intro-notes/` directory.

- The `sushi-config.yaml` file's `path-pages` parameter must include `input/intro-notes` to tell the IG Publisher where to find these fragments when generating artifact pages.

## FHIR Liquid

### What It Does

FHIR Liquid is a templating language used to build human-readable narratives for FHIR resources (`text.div`) (it can also transform external data sources like V2 and CDA into FHIR resources).  It uses a very limited subset of the standard Liquid syntax and replaces Liquid expressions and functions with FHIRPath expressions and functions.

### Documentation

US Core uses FHIR Liquid to build custom narratives for:

- All US Core Search Parameters
- US Core Client CapabilityStatement
- US Core Server CapabilityStatement
- US Core Client Requirements
- US Core Server Requirements
- US Core Certifying System Requirements


#### Repository Structure

```├── input
│   ├── liquid
│   │   ├── CapabilityStatement.liquid
│   │   ├── Requirements.liquid
│   │   ├── SearchParameter.liquid
│   │   └── expectation_handler.html
```

#### IG Configuration

Using SUSHI and the `sushi-config.yaml` file to create the Implementation Guide resource, the following [Implementation Guide Parameter](https://build.fhir.org/ig/FHIR/fhir-tools-ig/branches/master/CodeSystem-ig-parameters.html) defines the relative path that contains Liquid templates for generating narrative:

~~~
  path-liquid: input/liquid
~~~

#### FHIR Liquid Profile Documentation

For documentation on using Liquid in FHIR.

https://confluence.hl7.org/spaces/FHIR/pages/66938964/FHIR+Liquid+Profile


### Key Points

- Templates execute against a single FHIR resource as the "focus" object.
- Supports `if/else` and `for` loops.
- ⚠️ Documentation is spotty, and the learning curve is steep.


## Sushi

### What It Does

**SUSHI** (which stands for **SUSHI Unshortens ShortHand Inputs**) is a command-line tool used in the HL7 FHIR ecosystem. It's a compiler/translator that converts FHIR Shorthand (FSH), a domain-specific language, into standard FHIR artifacts.

### Documentation

#### US Core Only Uses Sushi to Produce The FHIR Implementation Guide Resource.

US Core Only Uses Sushi to Produce The FHIR Implementation Guide Resource from the `sushi-config.yaml` file.  It is possible generate FHIR artifacts from a `input/fsh/` folder containing `.fsh` files, but US Core does not author in fsh.  Authors create artifacts manually using text/JSON/YAML editors.


#### Repository Structure

```
my-ig/
├── sushi-config.yaml      # SUSHI configuration file edited by author
├── input/
│   └── fsh/  # NOT IN US CORE
│       ├── profiles.fsh
│       ├── extensions.fsh
│       └── valuesets.fsh
├── ig.ini                  # IG Publisher config
├── fsh-generated           # content created by SUSHI
│   ├── data
│   │   └── fsh-index.json
│   ├── fsh-index.txt
│   ├── includes
│   │   ├── fsh-link-references.md
│   │   └── menu.xml  # menu bar created from config.yaml
│   └── resources
│       ├── ImplementationGuide-hl7.fhir.us.core.json # Implementation Guide  created from config.yaml
│       └── oids.ini
```

#### FHIR IG Auto-Build Process with SUSHI

SUSHI is typically used alongside the HL7 IG Publisher to produce FHIR Implementation Guides.

The IG Auto-Build is a continuous integration service provided by HL7 that automatically builds FHIR Implementation Guides whenever changes are pushed to a GitHub repository. Here's how SUSHI fits into that workflow:

##### The Pipeline

1. **Auto-build detects FSH content** by looking for an `input/fsh/` folder containing `.fsh` files

1. **SUSHI runs first** — The build server executes SUSHI to compile all FSH files into FHIR JSON artifacts, placing them in the appropriate output directories (typically `fsh-generated/`)

2. **IG Publisher runs second** — Takes the SUSHI-generated resources plus any hand-authored resources and compiles the full Implementation Guide (HTML pages, validation, narrative generation, etc.)


US Core *only* runs the HL7 IG Publisher in the autobuild because it does not contain an `input/fsh/` folder.  In a subsequent section, we document the `push_to_autobuild.sh` bash script that temporarily renames the `input/fsh/` folder, which overrides this default behavior as well.

#### Sushi Documentation

For documentation on using Sushi, including installation and updates, see:

https://fshschool.org/docs/sushi/installation/

For documentation on populating the `sushi-config.yaml` file, see:

https://fshschool.org/docs/sushi/installation/

### Key Points

- US Core *only* uses SUSHI and the `sushi-config.yaml` file to create the Implementation Guide resource.
- US Core does not use SUSHI to author artifacts

## Sushi Configuration File: Pages
## Sushi Configuration File: Dependencies
## Sushi Configuration File: FHIR Artifacts
## Sushi Configuration File: Parameters
## Sushi Configuration File: Menu

## Jira

### What It Does

The HL7 Jira (hosted at jira.hl7.org) is the official issue-tracking and change-management system Health Level Seven International uses to manage feedback, bug reports, change requests, and proposals across all HL7 standards, including FHIR. HL7 Jira is tightly integrated into the Implementation Guide development lifecycle and serves as the central hub for feedback, change management, and community collaboration.

### Documentation

The IG Publisher automatically generates "Propose a Change" links on every page of a published IG. In addition, Jira is prepopulated with the IG context (page URL, IG version, etc.), allowing readers to submit feedback without navigating Jira and manually entering all the data.  This is configured for this and any IG based on the JIRA-Spec-Artifacts repository. Its documentation is at:

https://github.com/HL7/JIRA-Spec-Artifacts

This is typically done *right before* final publication and takes 1 to 2 days for the updates to be applied.

## US Core Python Scripts

### What it Does

US Core uses several Python scripts, written as [Jupyter files](https://jupyter-notebook.readthedocs.io/en/latest/), to update collection data for the Jekyll Collections documented in the next section.  This complex logic makes it infeasible to do with inline Jekyll Liquid scripting.

#### US Core Python Scripts' Key Dependencies

1. Python Installation
   - Python 3.7+ installed on your system
   - Added to your system PATH
   - Python packages:
     - `pip`: package manager
     - `jupyter`: Core Jupyter functionality
     - `ipykernel`: Python kernel for executing notebook cells
     - `PyYAML`: to process YAML files
     - others 🤔
2. VS Code Installation and Extensions
   - Python extension (by Microsoft) — provides Python language support
   - Jupyter extension (by Microsoft) — provides notebook support, often installed automatically with the Python extension

### Documentation

#### How to update the files Using The US Core Python Scripts

The US Core PageContent file or include documents the Collection's contents and whether it is manually updated or uses a Python script to update it, and the location of the Python Scripts that modify it. Similarly, each Python script documents what it does and how to use it.  The Collections that use the scripts are listed below:

PageContent/includes file|US Core Collection|Python Script
---|---|---|
input/includes/ms-target-table-generator.md|input/data/ms_refs.csv|https://github.com/Healthedata1/MyNotebooks/blob/master/CapStatement/target_profile-tabler.ipynb
input/includes/ms-target-table-generator.md|input/data/ms_choice_refs.csv|https://github.com/Healthedata1/MyNotebooks/blob/master/CapStatement/target_profile-tabler.ipynb
input/includes/ms-target-table-generator.md|input/data/addl_uscdi_refs.csv|https://github.com/Healthedata1/MyNotebooks/blob/master/CapStatement/target_profile-tabler.ipynb
input/includes/ms-target-table-generator.md|input/data/addl_uscdi_choice_refs.csv|https://github.com/Healthedata1/MyNotebooks/blob/master/CapStatement/target_profile-tabler.ipynb
input/pagecontent/must-support.md|input/data/additional-uscdi-requirements.csv|https://github.com/Healthedata1/MyNotebooks/blob/master/CapStatement/addl-uscdi-tabler.ipynb

#### Python Installation

For Python installation, see:

https://www.python.org/

For Python package management and installation, see:

https://packaging.python.org/en/latest/tutorials/installing-packages/

#### VSCode and Jupyter Installation

For VS Code installation, see:

https://code.visualstudio.com/docs/setup/setup-overview

For setting up Jupyter on VS Code, see:

https://code.visualstudio.com/docs/datascience/jupyter-notebooks


## Publishsh Bash Script

### What it does

This is a bash script for building and publishing **HL7 FHIR Implementation Guides (IGs)**. It automates the process of validating, transforming, and publishing FHIR resources using SUSHI (a FHIR Shorthand compiler) and the HL7 IG Publisher.

Among its many functions, it:

1. **Validates data files** — Checks that CSV metadata files contain all expected FHIR resources
2. **Transforms YAML to JSON** — Converts YAML resource definitions to JSON format
3. **Runs Sushi** — Executes Sushi to create the Implementation Guide resource from the `sushi-config.yaml` file
4. **Validates JSON** — Checks all JSON files for syntax errors, duplicates, and null values
5. **Runs the IG Publisher** — Executes the Java-based HL7 FHIR IG Publisher tool
6. **Updates artifacts** — Updates and creates artifacts for final publication
7. **Adds ig.yaml collection** Adds the ImplementationGuide resource to the `input/data/ig.yml` folder as a collection

---

### Documentation

This build automation script supports **HL7 FHIR Implementation Guides**. It wraps the IG Publisher toolchain with pre-processing, validation, and convenience features.

#### Key Tools It Uses

| Tool | Purpose |
|------|---------|
| `jq` | JSON processing and validation |
| `yq` | YAML → JSON conversion |
| `sushi` | FSH (FHIR Shorthand) compiler |
| `java -jar publisher.jar` | HL7 IG Publisher |
| `curl` | Download updates (publisher, VSAC metadata) |

#### Bash Installation

##### Mac

Bash is the native terminal language on Linux and macOS. To install yq and jq on Mac

Using Homebrew (recommended)

```bash
# Install Homebrew first (if not already installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install jq
brew install yq
```
Verify Installation

```bash
jq --version
yq --version
```
##### Git Bash for Windows

1. Download and run the installer:

    https://git-scm.com/downloads/win

    Accept the defaults, or customize as needed.

2. jq

    **Manual download**
    1. Download from: https://github.com/jqlang/jq/releases/latest
    2. Get `jq-win64.exe`
    3. Rename to `jq.exe`
    4. Move to `C:\Program Files\Git\usr\bin\`

3. yq

    **Manual download**
    1. Download from: https://github.com/mikefarah/yq/releases/latest
    2. Get `yq_windows_amd64.exe`
    3. Rename to `yq.exe`
    4. Move to `C:\Program Files\Git\usr\bin\`

Verify Installation

```bash
git --version
jq --version
yq --version
```


#### High-Level Flow

```
1. Parse command-line flags (-a, -b, -c, etc.)
           ↓
2. Clean up (.DS_Store files)
           ↓
3. Validate CSV metadata files (check for missing resources)
           ↓
4. Pre-processing (depending on flags):
   • Convert YAML → JSON (-y)
   • Update version numbers in canonicals (-e)
   • Remove meta elements from examples (-k, -n)
   • Remove change highlighting from markdown (-x)
   • Delete cached directories (-z, -C)
           ↓
5. Run SUSHI (FSH → FHIR) if -s flag
           ↓
6. Validate JSON files (syntax, duplicates, nulls)
           ↓
7. Run IG Publisher (Java) if -i flag
           ↓
8. Post-processing (depending on flags):
   • Copy terminology tables (-f)
   • Generate page link list (-l)
   • Open output in browser (-v, -q)
```



#### Basic Syntax

```bash
./publish.sh [options]
```

#### Configuration

1. The location of `org.hl7.fhir.igpublisher.jar` needs to be configured for your local install.
Update line 41 in the `publish.sh` script:
~~~
41   ig_path="<ig publisher location>" # **THE LOCATION OF `org.hl7.fhir.igpublisher.jar` NEEDS TO BE CONFIGURED FOR YOUR LOCAL INSTALL **  ====
~~~

For example:
1. local ig folder:`ig_path="$PWD"
2. for mac OS' Downloads folder: `ig_path="$HOME/Downloads"`


#### Command-Line Options

| Flag | Purpose | common editor option | prepublication step | use with Caution|
|------|---------| ----- | ---|---|
| `-b` | IG publisher option: Enable debug mode (verbose logging) - may slow down build |||⚠️|
| `-c` | Copy CSV files from the `input/data` folder to `/input/images/tables` folder as downloadable CSV/Excel files. Run this step after you finish editing all CSV files in the `input/data` folder. Everything in `input/images/tables` is generated by this step to provide the user-facing download links. It is never a source of truth: do not hand-edit it, and do not treat a stale value there as a separate occurrence to correct. Edit `input/data` and let `-c` regenerate. | | ✅|
| `-d` | IG publisher option: Output to `docs` folder instead of default `output` folder.  This was originally used to render on GitHub Pages instead of using the autobuild. (TODO - check if still needed; if not, remove) |||
| `-e` | JQ script to append current version to canonical URLs in the `meta.profile" values for examples and `rest.resource.supporterProfiles` and other canonical URLs in CapabilityStatements. This step is done after Sushi processing and before the IG Publisher executes. |✅|✅|
| `-f` | Copy the ig-publisher generated temp/pages/valueset-ref-all-list.csv and temp/pages/codesystem-ref-all-list.csv to `input/data' folder.  This step should be executed after a successful build, and the IG publisher needs to be run again to update the rendered tables at /terminology.html ||✅|
| `-g` | IG publisher option: Turn off narrative generation (speeds up build) (TODO - metrics to see how much it actually speeds it up) |||⚠️|
| `-h` | IG publisher option: Turn off validation (speeds up build) (TODO - metrics to see how much it actually speeds it up) |||⚠️|
| `-i` | Run the IG Publisher — executes the Java-based HL7 FHIR IG Publisher tool. Execute this after running Sushi and converting YAML resource definitions to JSON format ( `-sy` options). ** NOTE: ** The location of `org.hl7.fhir.igpublisher.jar` needs to be configured for your local install.|✅||
| `-j` | IG publisher option: Enable "rapido" mode (faster build) (TODO - metrics to see how much it actually speeds it up or even works- consider removal) |||⚠️|
| `-k` | JQ script to remove `meta.profile` elements from examples (but not from the YAML source files). This step is done after Sushi processing and before the IG Publisher executes. NOT USED IN US CORE |||⚠️|
| `-l` | The -l flag generates a markdown link reference list that makes it easy to create internal links between pages in your Implementation Guide. It is included in the `input/includes/link_list.md` file that is included at the end of every page. This step should be executed after the addition of pages and artifacts to the `input` folder and can be postponed until right before the QA process ||✅|
| `-n` |  JQ script to remove `meta.extension:instance_name` and `meta.extension.instance_description` extensions from the JSON examples (but not from the YAML source files). This step is done after Sushi processing and before the IG Publisher executes.|✅|✅|
| `-o` | Revert back to the previous/old version of the IG Publisher.  This is useful when the latest version of the IG Publisher is buggy and prevents editing. **NOTE** The location of `org.hl7.fhir.igpublisher.jar` needs to be configured for your local install.||||
| `-p` | Download the latest version of the IG Publisher. The IG Publisher is updated periodically and needs to be downloaded. **NOTE** The location of `org.hl7.fhir.igpublisher.jar` needs to be configured for your local install.||||
| `-q` | IG publisher option:  After execution, automatically open the built IG in a browser to the QA report page (`qa.html`) ||||
| `-r` | Remove all generated JSON files (TODO: review this code and consider removing)|||⚠️|
| `-s` | Executes Sushi to create the Implementation Guide resource from the `sushi-config.yaml` file). This runs before ig-publisher and is often combined with converting YAML resource definitions to JSON (the `-sy` option). |✅||
| `-t` | IG publisher option:  Run without a terminology server (offline mode). |||⚠️|
| `-v` | IG publisher option:  After execution, automatically open the built IG in a browser to the IG home page (`index.html`) ||||
| `-x` | Remove change highlighting from markdown files, comment out all items in `input/data/new_stuff.yml`, and remove all `Is_New` column data from `input/data/additional-uscdi-requirements.csv`, `input/data/profile_metadata.csv`, `input/data/provenance-elements.csv`, and `input/data/search_requirements.csv`. This one-time step is executed after publication of a Ballot version or before publication of a new version to remove all the html highlighting used to identify new and updated text in the ig. A manual review is still needed afterward to ensure the removal is complete and there are no side effects.  |||⚠️|
| `-y` | Delete all JSON files and regenerate from YAML. This option removes all examples and conformance artifact types that use YAML as source files prior to regenerating them from the YAML source files. Before converting, the script checks if anyone edited the JSON files directly (instead of editing the YAML source). If the safety check passes, it converts all .yml files to .json files using yq. |✅||
| `-z` | Delete template/temp directories before publishing. Use `-z` when: You've renamed files and stale references might exist in cached build artifacts. You've changed template files and need a fresh copy pulled. The build behaves unexpectedly because of cached state. You're switching between different IG template versions.
| `-C` | Delete input-cache before publishing. -C does the same thing as `-z` but for the input-cache/ directory, which stores downloaded dependencies (packages, terminology, etc.).|
| `-V` | Update the VSAC name-to-FHIR-URI mapping CSV. This is executed prior to publication of a new version; it downloads the latest VSAC (Value Set Authority Center) metadata from the NLM (National Library of Medicine) and creates a CSV mapping file that links VSAC code system names to their FHIR URIs, and outputs a sorted CSV to `input/data/vsacname-fhiruri-map.csv` ||✅|
| `-R` | Create Requirements Resources from the us_core_reqs.csv file. This runs after updates to the CSV file. The CSV file is manually updated using the Excel file input/images-source/~$hl7.fhir.us.core_8.0.0_reqs.xlsx, which is derived from the US Core Server v8.0.0 Specification Requirements, created by Inferno and its open-source testing framework to support the ONC Health IT Certification Program. The goal is to share this data with the Inferno team in future releases.



### Common Workflows

Flags can be combined in any order:

#### Build IG no changes/updates (just IG Publisher, no SUSHI)

```bash
./publish.sh -i
```

#### Update IG Publisher, then build

```bash
./publish.sh -pi
```

#### Build IG after changes/updates (Convert YAML to JSON, then run SUSHI, then run IG Publisher removing meta extension and adding versions to canonicicals)

```bash
./publish.sh -sy
...
./publish.sh -ien
```

####  Delete temp/cache (Run build after deleting artifacts or examples)
```bash
./publish.sh -zC
...
./publish.sh -sy
...

./publish.sh -ien
```

#### Update the requirements resource (run after updating the us_core_reqs.csv file)

```bash
./publish.sh -R
```

####  Prepublication Steps

Updated table and file contents
1. Remove meta extensions from examples (`-n` option)
2. Update terminology table (`-f` option)
3. update page link list ((`-l` option)
4. Add Excel and CVS to the images/table folder (`-c` option)
5. Append version to meta. profiles in examples and Capstatements (`-e` option)

####  Troubleshooting ( when you screw up )
  TODO

## Git
    ### Used for
    ### Where located
    ### Documentation reference (Bash, Git Bash for Windows installation)
    #### Pushing
        Push_to_autobuild.sh
    ####  Pulling
        PullCheck.sh
## Overview of US Core publication Process

### Prepare IG for new version:

- [ ] Run IG with the latest publisher to get a baseline qa report
- [ ] Update `sushi-config.yaml` (For information on using this file for IG Configuration, see: https://fshschool.org/docs/sushi/configuration/)
  - [ ] Add latest versions of US Core to `definition.extension` list (for example
     ~~~
      - url: http://hl7.org/fhir/tools/StructureDefinition/ig-link-dependency
        valueCode: hl7.fhir.us.core#8.0.1
     ~~~
     These are to inform the publisher link checker that links to this IG in the change log are valid
  - [ ] Update the `date` (e.g., "2026-01-21") to the current date
  - [ ] Change `version` element to new version
      - This IG follows the [FHIR Releases and Versioning](https://hl7.org/fhir/versions.html#versions)versioning identification.
        - If updating to a new ballot version, the version will be "N.0.0-ballot" where "N" is the new *major* release (e.g. "9.0.0-ballot")
        - If updating to a new publication post-ballot, the version will be "N.0.0" where "N" is the new major release (e.g. "9.0.0")
        - If updating to a new [STU Update](https://confluence.hl7.org/pages/viewpage.action?pageId=107217093) publication post-ballot, the version will be "N.M.0" where "N" is the major release, and "M" is the new *minor* release (e.g. "9.1.0")
        - If updating to a new [Technical Correction](https://confluence.hl7.org/spaces/ARB/pages/76164490/Definition+Errata+Technical+Correction) publication post-ballot, the version will be "N.M.T" where "N" is the major release, and "M" is the minor release, and  "T" is the technical correction release  (e.g. "9.0.1")
  - [ ] Update the dependencies to the latest version as needed ( TODO: document the dependencies topic)
  - [ ] Update the `version-comparison-master` to the last published version: (e.g., "8.0.1")
  - [ ] Add the last published version to the `version-comparison` list : (e.g., "- 8.0.1")
  - [ ] Update the `releaselabel`
        - "CI Build": default release label that refers to a non-stable release that changes with each commit.
        - "STU <N> Ballot: (e.g., "STU 9 Ballot") - a frozen release used in the ballot process
        - "STU <N>: (e.g., "STU 9") - a frozen release used for
  - [ ] Update the `copyrightyear`: (e.g., '2025+') to the latest year

- [ ] Update the change log markdown inline relative links to absolute references. Scope the replacement to the **previous version's section only**. Every section below it was absolutized in an earlier cycle and must not be touched, and each section takes a different `<lastversion>` path, so a whole-file run is always wrong.
   1. Select the previous version's section: from its `### Version = ` heading down to the line before the next `### Version = ` heading.
   2. In VS Code open Find/Replace (`Cmd+Alt+F` / `Ctrl+H`), turn on regex (the `.*` button) **and** Find in Selection (`Alt+L`), then run:

      ~~~
      find: \]\((?!http|#)([^)]*)\)

      replace: ](https://hl7.org/fhir/us/core/<lastversion>/$1)
      ~~~

      `<lastversion>` is the previous version's own published path: `STU<N>` when that version was a publication (e.g. `STU9`), or the ballot cycle `yyyymmm` when it was a ballot (e.g. `2026Jan`).
   3. Confirm the replacement count equals the number of relative links in the section, then check that the section has no relative links left, no `/<lastversion>/#)`, and no `/<lastversion>/https`.

   Use the character class `[^)]*`, not `.*`: most lines carry two or more links, and a greedy `.*` matches from the first `](` to the last `)` and merges them into one broken link. The `|#` alternation protects the `](#)` placeholders in the "Tracker Status" header line.

   e.g.,
    ```
    from

    "...See Changes [Here](StructureDefinition-us-core-adi-documentreference.html)"
    to

      "...See Changes [Here](https://hl7.org/fhir/us/core/2026Jan/StructureDefinition-us-core-adi-documentreference.html)")
    ```
- [ ] Update the `publication-request.json` file: for more information about this file, see: https://confluence.hl7.org/spaces/FHIR/pages/144970227/IG+Publication+Request+Documentation
  - [ ] update the `version` to the updated version (e.g., "9.0.0")   (see the discussion of versioning in updating the `sushi-config.yaml` checkbox above)
  - [ ] update the `path` to the updated path:
    -  For ballot publications, this is "http://hl7.org/fhir/us/core/yyyymmm" where "yyyymmm" is the ballot cycle (e.g., "2026Jan")
    -  For published versions, this is "http://hl7.org/fhir/us/core/STU<N[.M.T]>" where "N" is the major version and "[.M.T]" is stu and technical update only if present (e.g., "STU9", "STU6.1, and "STU8.0.1")
  - [ ] Update the `mode`
       -  For ballot change to  "working"
       -  For publication, change to  "milestone"
       -  For technical correction, change to "technical-correction"
  - [ ] Update the `status`
       -  For ballot change to  "ballot"
       -  For publication, change to "trial-use"
  - [ ] Update the `sequence`
        -  Should be the same as in the ReleaseLabel in `sushi-config.yaml` **without** a space (US Core only) (e.g., "STU9" )
  - [ ] Update both `desc` and `descmd` with the same content using Markdown formatting for `descmd`; refer to previous versions at https://hl7.org/fhir/us/core/history.html for suggested content.
- [ ] Update the Home page (`input\pagencontent\index.html`)
  -  Replace the includes what's new section with a new page (usually a template stub) from the `input/includes/whats-new` folder
- [ ] Update the Change Log page (`input\pagencontent\changes.html`)
  - [ ] Add the introductory text for the latest version after the how-to-read-the-page section  at the top of the page:
     -  copy and paste the most recent ballot or publication introduction sections

        e.g.:
        ~~~
        ### Version = 9.0.0  (Meets USCDI v6 Requirements)
        - url: <https://hl7.org/fhir/us/core/STU9/>
        - Based on FHIR version: 4.0.1

        The public reviewed and commented on the changes in this annual update to US Core through the January 2025 HL7 balloting process. The HL7 International Cross-Group Projects work group members have agreed to and voted on the resolution of the community comments.
        #### What's new in Version 9.0.0 of US Core:

        Each update to a new version of US Core changes the US Core Profiles and conformance expectations. Implementers can find detailed comparisons between the FHIR artifacts in this 9.0.0 version of US Core and each previous major release on the [Changes Between Versions] page. Below is an overview of significant changes between Version 9.0.0 and Version 9.0.0-ballot of US Core.

        {% include whats-new/v9.md %}

        #### Changes:

        The ballot-related comments resulted in over 100 changes to this specification, which are listed below:

        **Tracker Status**: **Change Impact** **(Change Category)** **Change Summary** **Jira Issue [Link](#)** **Updated Content [Link](#)**
        ~~~
        -  update the version
        -  update the USCDI version if applicable
        -  Replace the includes what's new section with a new page (usually a template stub) from `input/includes/whats-new` folder
  - [ ] Add the tracker items for the new version
     - Use Jira Search `https://jira.hl7.org/issues/?filter=23999#`
     -  Export Search as a ";" separated CSV file using Jira's "exporter" function
     -  Use the following VS Code find and replace regex to create the markdown text in VS Code (or an equivalent regex in another text editor):
        ~~~
        find: "(.*?)";"(.*?)";"(.*?)";"(.*?)";"(.*?)";"(.*?)";.*

        replace: 1. **$1:** $2 ($3) $4 [$5](https://jira.hl7.org/browse/$5) See Changes [Here]($6)
        ~~~
     -  For a **Technical Correction** export, use a different replace string. Jira's rules do not allow `Change Impact` to be populated on a Technical Correction, so `$2` exports as an empty field and leaves a gap in the entry. A technical correction is by definition non-substantive, so hard-code the value and ignore `$2`:
        ~~~
        replace: 1. **$1:** Non-substantive ($3) $4 [$5](https://jira.hl7.org/browse/$5) See Changes [Here]($6)
        ~~~
        Keep the same six-column export and the same `find` pattern either way, so the capture positions never shift. Do not hand-type the value into the generated list instead; several v9 entries still read `**Applied:**  Non-substantive` with a doubled space, which is the gap an empty `$2` left behind.
     -  Review the markdown in a markdown viewer like
     -  Copy and paste this markdown text into the change log under the "Changes" header
     -  Note that the change log is updated as trackers are applied, see the  *Updating the Change Log* item below.
- [ ] Update the USCDI-to-US Core version table (`input/includes/uscdi-uscore-version-table.md`). This hand-maintained table is included by `uscdi.md` and is not generated, so it does not pick up the version bump on its own.
  - [ ] Add a row for the USCDI version this release meets, above the `{:.grid}` line: `| [vN] | <new US Core version> |`
     -  Use the **next publication version**, without the `-ballot` suffix, even when scaffolding a ballot. For example, the v10 ballot cycle meets USCDI v7, so the row is `| [v7] | 10.0.0 |`, not `10.0.0-ballot`. The row is the USCDI-to-US Core mapping, and the ballot and its publication map the same USCDI version.
  - [ ] Add the matching `[vN]:` reference-style link definition at the bottom of the file, pointing to the ONC Standards Bulletin that announces that USCDI version. Look the URL up rather than extrapolating it: recent entries use `https://www.healthit.gov/topic/standardsbulletin_<yy>-<n>`, but earlier ones are direct PDF links on other paths.
  - [ ] Revisit the row at publication. Rows are corrected after the fact (the USCDI v5 row moved from `8.0.0` to `8.0.1` for the technical correction, and `[v3]` was later refined to `[v3.1]`).
-  [ ]  Remove change highlighting if prior build is Ballot
   -  [ ]  using the publish.sh `-x` option to remove the new-content highlighting from all markdown files
   -  [ ]  Manually clear all the "Is_New" column data from:
         - `input/data/additional-uscdi-requirements.csv`
         - `input/data/profile_metadata.csv`
         - `input/data/provenance-elements.csv`
         - `input/data/search_requirements.csv`
   -  [ ]  manually clear the is_new columns in `input/data/provenance-elements.csv`:
      -  Target_Resource_1_is_new
      -  Target_Resource_2_is_new
      -  Target_Resource_3_is_new
      -  Target_Resource_4_is_new
      -  Target_Resource_5_is_new
      -  Target_Resource_6_is_new
      -  Target_Resource_7_is_new
      -  Target_Resource_8_is_new
   -  [ ]  Manually confirm the highlighting is removed and there are no formatting issues (whitespace errors)
-  [ ]  Review the QA log and debug errors, warnings, and bad links.  (see debugging QA errors)







    ### Current publication
### IG Updates

#### New USCDI Data Element

##### Existing US Core element
    - [ ] Update USCDI Mapping Table
    - [ ] Add to the "What's new" file
    - [ ] Update Implementation Specific Guidance if the design team decides guidance is needed.

##### New US Core element in existing US Core profile
    - [ ] Update USCDI Mapping Table
    - [ ] Add to the "What's new" file
    - [ ] Update US Core Profile
        - [ ] Update Profile Introduction
        - [ ] Update Implementation Specific Guidance if the design team decides guidance is needed.
        - [ ] New or Updated Example(s)
        - [ ] Update Additional USCDI table if the design team decides element is Additional USCDI
    - [ ] New ValueSet if the design team decides it is needed for codeable elements ( typically in VSAC )        
    - [ ] New Search if the design team decides it is needed
         - [ ] Update the Search API table
         - [ ] Update the Profile Notes page
         - [ ] Update the CapabilityStatement
##### New US Core profile
    - [ ] Update USCDI Mapping Table
    - [ ] Add to the "What's new" file
    - [ ] Create US Core Profile
        - [ ] Create Profile Introduction
        - [ ] Add Implementation-Specific Guidance if the design team decides guidance is needed.
        - [ ] New Example(s)
        - [ ] Update Additional USCDI table if the design team decides elements are Additional USCDI
    - [ ] New ValueSet if the design team decides it is needed for codeable elements ( typically in VSAC )        
    - [ ] New Search
         - [ ] Update the Search API table
         - [ ] Update the Profile Notes page
    - [ ] Update the Profile table
        - [ ] add scopes
        - [ ] year added
     - [ ] Update the CapabilityStatement
        
    
### Prepublication checklists

- [ ] Apply trackers
- [ ] Review the Application of trackers
- [ ] Copy Editing
  - [ ] Typos, grammar -mostly done when applying changes (full Grammarly review when publish)
  - [ ] Screen scrape for open links ([, ]) repeating words, etc
  - [ ] read through
- [ ] Observation profile comparison table (part of publisher - review when publish)
- [ ] Version comparison tables (part of publisher - review, will update argo when published)
- [ ] Technical QA
  - [ ] Terminology (add ignorewarning notes for these )
  - [ ] Open Issues
  - [ ] Variance request for QA Issues: 
  - [ ] Update IgnoreWarnings.txt file
    - [ ] Remove unused items
    - [ ] Grammar check IgnoreWarnings comments
- [ ] Review CapabilityStatements (when publishing)
- [ ] Updated table and file contents
  - [ ] meta stripped (custom bash script when build)
  - [ ] Update terminology table (custom bash script when build)
  - [ ] Update mustsupport target tables (python scripts)
  - [ ] Page link list (custom bash script when building)
  - [ ] Add Excel and CVS to the images/table folder (custom bash script when build)
  - [ ] Append version to meta. profiles in examples and Capstatements (part of custom bash script when building)
- [ ] Confirm change log links for the last cycle updated to the published version  (needs us core 8.0.1 to be published first)
- [ ] Update the Jira file
- [ ] Update US Core History Page Introduction (The master for the US core introduction is at https://hl7.org/fhir/us/core/package-list-introduction.md send GG changes to that file directly)
- [ ] CGP Review
- [ ] Publication Request ( not needed for ballot)
- [ ] CGP Approval for ballot
- [ ] Attend FMG review calls
- [ ] FMG Approval for ballot
- [ ] TCS Vote
- [ ] Publication checklist:  
- [ ] download.pdf 


## Misc topics

### Updating the Change Log
   - For a discussion on adding a change log section for a new version. See "Update the Change Log page" item in the *Prepare IG for new version* above
   - The change log is updated as trackers are applied
      - The `Tracker Status` is updated from "Triaged" to "Resolved-Change Required" to "Applied", etc
        - The Change log is updated to "Applied" ***before*** tracker QA
        - Jira is updated to "Applied" ***after*** tracker QA.
      - The `Change Impact` and `Change Category` are updated if missing or incorrect (usually when updating the status from "Triaged" to "Resolved-Change Required").
      - The `Change Summary` is edited to reflect what changes we actually made vs the tracker summary.
      - The `Updated Content [Link](#)` is edited to link to the relevant section(s) that have been updated
        - These are *relative* links so they point to the current version (As documented above, they are updated to absolute links *before* adding a new section to the change log)
 - Before publication, group and reorder the list by change impact using an AI chat tool.
### New content highlighting

New and updated content is highlighted green while a version is in development and the highlighting is removed before publication. There are three independent mechanisms, and all three are maintained by hand as each artifact or change is applied.

   - Markdown files
     - Wrap new or updated narrative in `<span class="bg-success" markdown="1">...</span>` (or a `<div>` for block content) and close it with a `<!-- new-content -->` marker. The marker is what `publish.sh -x` keys on when stripping highlighting.
     - VS Code snippets are available for the span and div forms.
   - CSV files
     - Set `Is_New = TRUE` on the affected row as each artifact is applied, in `input/data/additional-uscdi-requirements.csv`, `profile_metadata.csv`, `search_requirements.csv`, `us_core_reqs.csv`, and `provenance-elements.csv`.
     - The value is compared in Liquid with `{% if item.Is_New == "TRUE" %}`, which is case-sensitive. It must be `TRUE`. `True`, `Y`, or any other value fails silently and highlights nothing. The column comment in `must-support.md` is the authoritative description: default `FALSE`, set to `TRUE` for new or updated content, and set back to `FALSE` before publishing a new version.
     - `!` in an `Is_New` cell is a separate convention meaning *ignore this row*, not a highlight value. The Liquid loops do not filter on it, so a row marked `!` still renders unhighlighted; the marker is read by the Python notebook that regenerates the table.
     - In `provenance-elements.csv` the `Target_Resource_<N>_is_new` columns carry an explicit `TRUE` or `FALSE` on every row rather than being left blank. Set the relevant column to `TRUE` and leave the others `FALSE`.
     - These columns drive the `bg-success` conditionals already present in `input/pagecontent/` and `input/includes/`. Those conditionals are build machinery, not leftover highlighting, and are dormant while the columns are empty. Do not strip them.
   - YAML files
     - Add the artifact *name* to `input/data/new_stuff.yml` as each new artifact is applied. The generated artifact lists match on name (`p.name == new_stuff`) to highlight new entries on the Examples, Terminology, Search Parameters and Operations, and profile list pages.
   - removal of new content highlighting
     - `publish.sh -x` strips the markdown spans and divs and comments out every line of `new_stuff.yml`.
     - The CSV `Is_New` columns are not cleared by `-x`. Clear them by hand, per the version-bump checklist above.
### QA tricks and tips
   - ignoreWarnings.text
     - To suppress a QA message, copy the entire message line from `output/qa-eslintcompact.txt` into `input/ignoreWarnings.txt`, omitting only the trailing classification in parentheses (e.g. `(EXCEPTION)`, `(INFORMATIONAL)`, `(BUSINESSRULE)`, `(NOTFOUND)`, `(CODEINVALID)`, `(STRUCTURE)`).
     - The IG Publisher matches each entry as a prefix of the validator message, so copy the whole message from the start. Do not truncate the beginning; for example, terminology value set expansion errors begin with `Error from https://tx.fhir.org/r4: Error:` and that prefix must be included or the entry will not match.
     - Group related suppressions under a numbered `# NN. === explanation ===` comment that documents why the message is safe to ignore.
     - Version-pinned messages (those ending in `...|N.0.0`) must be updated to the current version each publication cycle.
### Version comparisons
    - Argo DSTU2 Comparisons - see inline instructions
### Update the History Page Introduction
  1. The master for the US core introduction is now here: https://hl7.org/fhir/us/core/package-list-introduction.md  ( not in local - autobuild only )
  2. Send Grahame Grieve changes to that file directly
