
#  Welcome to the US Core Implementation Guide Repository

**US Core Implementation Guide (FHIR IG) [Publication (Version) History](http://hl7.org/fhir/us/core/history.html)**

Authors:  Eric Haas, Brett Marquard, Gay Dolin

All issues should be logged using the official [Jira tracker system](http://hl7.org/fhir-issues) so they can be reviewed and voted upon by the  HL7 International Cross Groups Projects Workgroup.

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
      - [Command-Line Options](#command-line-options)
    - [Common Workflows](#common-workflows)
      - [Build IG no changes/updates (just IG Publisher, no SUSHI)](#build-ig-no-changesupdates-just-ig-publisher-no-sushi)
      - [Update IG Publisher, then build](#update-ig-publisher-then-build)
      - [Build IG after changes/updates (Convert YAML to JSON, then run SUSHI, then run IG Publisher removing meta extension and adding versions to canonicicals)](#build-ig-after-changesupdates-convert-yaml-to-json-then-run-sushi-then-run-ig-publisher-removing-meta-extension-and-adding-versions-to-canonicicals)
      - [Delete temp/cache (Run build after deleting an artifacts or example)](#delete-tempcache-run-build-after-deleting-an-artifacts-or-example)
      - [Prepublication Steps](#prepublication-steps)
      - [Troubleshooting ( when you screw up )](#troubleshooting--when-you-screw-up-)
  - [Git](#git)
  - [Overview of US Core publication Process](#overview-of-us-core-publication-process)
    - [Prepublication checklists](#prepublication-checklists)
  - [Misc topics](#misc-topics)



## IG publisher

### What It Does

The FHIR IG Publisher is a tool that takes implementation guide source content and transforms it into a complete published implementation guide, including human-readable HTML files and a machine-processable NPM package (package.tgz). It validates all resources in the IG, generates renderings for each artifact, and produces an HTML QA file with any errors encountered.

The IG Publisher's key dependencies include:

- **Java runtime** - Required to execute the publisher JAR file
- **Jekyll** - Website generation tool for producing final HTML output
- **Ruby** - Ruby requirements for Jekyll
- **SUSHI** - you need this to configure the Implementation Guide resource adn optionally to author implementation guide artifacts using the FSH Domain-Specific Language (DSL).
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

HL7 IG Templates are packages referenced by the IG Publisher that control the visual styling, page structure, and navigation of published FHIR Implementation Guides. They define how FHIR resources are rendered as pages and provide a framework into which authors integrate their narrative content.

### Documentation (including installation)

The HL7 IG Templates is reference in the `ig.ini` with the key-value pair "template = hl7.fhir.template#[version]"  where "[version]" is the template's version:

```ini
 Use a specific version
template = hl7.fhir.template#1.0.0

 Use the current CI build version
template = hl7.fhir.template#current

 If no version specified, defaults to latest release
template = hl7.fhir.template
```

- "#current" refers to the *Continuous Integration Build* (latest in version control) maintained on build.fhir.org.  The "#current" version is useful during development,but **for official HL7 publications use a specific released version** (e.g., "#1.0.0")

These documents provides more details describing how to specify and use templates.

  - https://build.fhir.org/ig/FHIR/ig-guidance/using-templates.html
  - https://build.fhir.org/ig/FHIR/ig-guidance/template.html


## Jekyll

### What It Does

Jekyll serves as the website generation tool that takes the processed FHIR artifacts, templates, and page content produced by the IG Publisher and compiles them into the final static HTML output that forms the publishable Implementation Guide. It also makes IG metadata (version, canonical URL, dependencies, etc.) available through data variables that can be referenced in page templates.

The Jekyll's key dependencies include:

- **Ruby** (version 2.7.0+; 3.1.3+ recommended)
- **RubyGems** - Ruby's package manager including...
  - **liquid** - Templating engine for dynamic content (e.g., `{{ site.data.fhir.version }}`)
  - **kramdown**- - Markdown parser that converts .md files to HTML for pages and include files.*

\*kramdown markdown cannot be used for markdown datatype elements in FHIR resources which "*...requires and uses the [GFM (Github Flavored Markdown)](https://github.github.com/gfm/) extensions on [CommonMark](http://spec.commonmark.org/0.28/) format, with the exception of support for inline HTML which is not supported.*"

###  Documentation (including installation)

For a comprehensive documentation of static website creation using Jekyll and installation instructions.

https://jekyllrb.com/



## Jekyll Include files

A feature that is used extensively in US Core pages is Jekyll Include files.  Jekyll Include files allow reusable content fragments to be defined once and inserted into multiple pages using the {% include filename %} syntax. This promotes consistency across the IG by ensuring common elements (like navigation, boilerplate text, or repeated guidance) remain synchronized, and simplifies maintenance since updates only need to be made in one location rather than across every page that uses the content.

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

Wherever includes are used with parameters the include file's inline comments document whether the parameters are required or optional and what there values are...

For examples,the include file: `input/includes/observation_guidance_1.md` content:

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

Another feature that is used extensively in US Core pages is Jekyll Collections.  Jekyll Collections allow grouping related content (such as profiles metadata) into named sets that can be iterated over and rendered programmatically using liquid scripts (see below). Although US Core's collections are either CSV of YAML files, Jekyll allows CSV,YAML, and JSON files. This enables IG authors to generate consistent pages for similar artifacts automatically, such as creating a summary table listing data, without manually maintaining each entry.

 For documentation on using Collections in Jekyll see: https://jekyllrb.com/docs/collections/

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

The US Core PageContent file or include documents the Collection's contents and whether it is generated by the IG Publisher, manually updated or a uses python scripts to update it (discussed in detail below). The US Core PageContent file or include file and the Collections they use are listed below :


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

\* The publish.sh script adds `input/data/ig.yml` to the input/data directory after running sushi  (for details see the Publish.sh section below).

#### Accessing Collection Data:

Collection data files are stored in `temp/pages/_data`, and are accessed using "site.data.[filename]" as a liquid variable.  For example, to get a list of US Core Profile titles, you would loop through profile_metadata.csv rows using `{% for row in site.data.profile_metadata %}`

### Key Points

- Jekyll collections group related content (like profile metadata) into named sets stored as CSV, YAML, or JSON files in `input/data/`, enabling IG authors to generate consistent pages programmatically without manually maintaining each entry.

- Collections are managed in different ways — some are generated by the IG Publisher, some are manually updated, and some use Python scripts — with the managing approach documented in the associated PageContent or include file.

- Collection data is accessed in Liquid templates via `site.data.[filename]` syntax (e.g., `{% for row in site.data.profile_metadata %}`) from the `temp/pages/_data` directory where both authored and IG Publisher-generated collections reside.


## Jekyll Liquid

### What It Does

Jekyll/Shopify Liquid is a templating language that enables dynamic content generation within static web pages using tags ({% %}) for logic and output ({{ }}) for variables. It allows IG authors to insert dynamic values (like {{ site.data.fhir.version }}), create conditional content, loop through collections, and apply filters to transform data—all at build time rather than runtime. This enables FHIR IGs to maintain consistency across pages, automatically reflect dependency versions, and generate repetitive content programmatically while still producing fast, static HTML output.

Liquid is a Ruby Gem that is installed as a dependency when you install Jekyll.  For documentation on using Liquid with Jekyll see:

https://jekyllrb.com/docs/liquid/

### Documentation

Jekyll Liquid scripts is used extensively in US Core pages to create page content including lists and tables with collections.  As documented above, the US Core PageContent file or include documents the Collection's contents and whether it is generated by the IG Publisher, manually updated or a uses python scripts to update it (discussed in detail below).

#### Creating Tables, Lists, and Examples

 As documented above, US Core create lists and tables and examples in page content by leveraging liquid with collections.  The PageContent or include files document the Collection's contents and source. In General the liquid accesses the collection data stored at `temp/pages/_data` using `site.[collection_name]` syntax and loops through it to create the content from the row data. In most cases, simple markdown or XHTML content is created. However for input/pagecontent/uscdi.md there is extensive styling applied to the XHTML.

General syntax for a Liquid table from a CSV:

assume `my_csv.csv` contains columns with headers "title" and "url"

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

US Core uses Liquid templating to generate a custom "Notes" file for each profile documenting the required and optional FHIR RESTful search APIs for US Core certification. However, explaining this advanced use of Liquid is beyond the scope of this document.

### Key Points

- Jekyll Liquid is a templating language that enables dynamic content generation using tags (`{% %}`) for logic and output (`{{ }}`) for variables, allowing IG authors to insert dynamic values, create conditional content, loop through collections, and apply filters—all at build time to produce static HTML.

- US Core extensively uses Liquid with collections to create tables, lists, and examples by accessing collection data via `site.data.[collection_name]` syntax and looping through rows to generate markdown or XHTML content.

- US Core also uses Liquid templating to generate custom profile notes documenting required and optional FHIR RESTful search APIs for certification, though this advanced usage is beyond the scope of the document.


## "Intro|Notes" Files

Another feature that is used extensively in US Core pages are the "Intro and Notes" files. They are similar to the Jekyll Include files, but these fragments are included into artifact pages (e.g., US Core Patient Profile) by the HL7 templates and not directly includes using Jekyll includes syntax described above.

### Documentation

#### US Core Only Uses Sushi to Produce The FHIR Implementation Guide Resource.

These markdown file use a special naming syntax of "[artifact file name]" + "intro|notes" + ".md". For example, for the introduction to the US Core Patient Profile: `input/intro-notes/StructureDefinition-us-core-patient-intro.md`)

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

Using SUSHI and `sushi-config.yaml` file to create the Implementation Guide resource, the following [Implementation Guide Parameter](https://build.fhir.org/ig/FHIR/fhir-tools-ig/branches/master/CodeSystem-ig-parameters.html) defines relative path that contains these fragments for generating the introductions and notes section on FHIR artifacts

~~~
  path-pages:
    - input/pagecontent   # defines relative path that contains the pagecontent
    - input/intro-notes   # defines relative path that contains the intro|notes fragments
~~~

### Key Points

- "Intro and Notes" files are markdown fragments that get automatically included into artifact pages (like profile pages) by HL7 templates, rather than being manually inserted using Jekyll include syntax.

- These files follow a specific naming convention of `[artifact file name]-intro.md` or `[artifact file name]-notes.md` and are stored in the `input/intro-notes/` directory.

- The `sushi-config.yaml` file's `path-pages` parameter must include `input/intro-notes` to tell the IG Publisher where to find these fragments when generating artifact pages.

## FHIR Liquid

### What It Does

FHIR Liquid is a templating language used to build human-readable narratives for FHIR resources (`text.div`) (it also can transform external data sources like V2 and CDA into FHIR resources).  It uses a very limited subset of the standard Liquid syntax and replaces Liquid expressions and functions with FHIRPath expressions and functions.

### Documentation

US Core uses FHIR Liquid to build custom narratives for:

- All US Core Search Parameters
- US Core Client CapabilityStatement
- US Core Server CapabilityStatement

#### Repository Structure

```├── input
│   ├── liquid
│   │   ├── CapabilityStatement.liquid
│   │   ├── SearchParameter.liquid
│   │   └── expectation_handler.html
```

#### IG Configuration

Using SUSHI and `sushi-config.yaml` file to create the Implementation Guide resource, the following [Implementation Guide Parameter](https://build.fhir.org/ig/FHIR/fhir-tools-ig/branches/master/CodeSystem-ig-parameters.html) defines relative path that contains liquid templates for generating narrative:

~~~
  path-liquid: input/liquid
~~~

#### FHIR Liquid Profile Documentation

For documentation on using Liquid in FHIR see (Note the documented features not fully implemented!):

https://confluence.hl7.org/spaces/FHIR/pages/66938964/FHIR+Liquid+Profile


### Key Points

- Templates execute against a single FHIR resource as the "focus" object.
- Supports `if/else`, `for` loops.
- ⚠️ Documentation is spotty and learning curve steep.


## Sushi

### What It Does

**SUSHI** (which stands for **SUSHI Unshortens ShortHand Inputs**) is a command-line tool used in the HL7 FHIR ecosystem. It's a compiler/translator that converts FHIR Shorthand (FSH), a domain-specific language, into standard FHIR artifacts.

### Documentation

#### US Core Only Uses Sushi to Produce The FHIR Implementation Guide Resource.

US Core Only Uses Sushi to Produce The FHIR Implementation Guide Resource from the `sushi-config.yaml` file.  It is possible generate FHIR artifacts from a `input/fsh/` folder containing `.fsh` files, but US Core does not author in fsh.  Artifact authoring is done manually using text/JSON/YAML editors.


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

1. **Auto-build detects FSH content** by looking for a `input/fsh/` folder containing `.fsh` files

1. **SUSHI runs first** — The build server executes SUSHI to compile all FSH files into FHIR JSON artifacts, placing them in the appropriate output directories (typically `fsh-generated/`)

2. **IG Publisher runs second** — Takes the SUSHI-generated resources plus any hand-authored resources and compiles the full Implementation Guide (HTML pages, validation, narrative generation, etc.)


US Core *only* runs the HL7 IG Publisher in the autobuild since US Core does not contain an `input/fsh/` folder.  In a subsequent section, we document the `push_to_autobuild.sh` bash script that temporarily renames the `input/fsh/` folder that overrides this default behavior as well.

#### Sushi Documentation

For documentation on using Sushi including installation and updates, see:

https://fshschool.org/docs/sushi/installation/

For documentation on populating the the `sushi-config.yaml` file, see:

https://fshschool.org/docs/sushi/installation/

### Key Points

- US Core *only* uses SUSHI and `sushi-config.yaml` file to create the Implementation Guide resource.
- US Core does not use SUSHI to author artifacts

## Sushi Configuration File: Pages
## Sushi Configuration File: Dependencies
## Sushi Configuration File: FHIR Artifacts
## Sushi Configuration File: Parameters
## Sushi Configuration File: Menu

## Jira

### What It Does

The HL7 Jira (hosted at jira.hl7.org) is the official issue tracking and change management system used by Health Level Seven International to manage feedback, bug reports, change requests, and proposals across all HL7 standards—including FHIR. HL7 Jira is tightly integrated into the Implementation Guide development lifecycle, serving as the central hub for feedback, change management, and community collaboration.

### Documentation

The IG Publisher automatically generates "Propose a Change" links on every page of a published IG. In addition, Jira is prepopulated with the ig context (page URL, IG version, etc.) that allows readers to submit feedback without having navigating Jira and manually enter all the data.  This is configured for this and any IG Based on the JIRA-Spec-Artifacts repository. It documentation is at:

https://github.com/HL7/JIRA-Spec-Artifacts

This is typically done *right before* final publication and takes 1 to 2 days for the updates to be applied.

## US Core Python Scripts

### What is Does

US Core uses several Python scripts, written as [Jupyter files](https://jupyter-notebook.readthedocs.io/en/latest/), to update collection data for the Jekyll Collections documented in the next section.  The complex logic to do this make it infeasible to perform with inline Jekyll liquid scripting.

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

The US Core PageContent file or include documents the Collection's contents and whether it is manually updated or a uses python script to update and the location of the Python Scripts that modifies it. Similarly each Python Scripts documents what is does and how to use it.  The Collections that use the scripts are listed below:

PageContent/includes file|US Core Collection|Python Script
---|---|---|
input/includes/ms-target-table-generator.md|input/data/ms_refs.csv|https://github.com/Healthedata1/MyNotebooks/blob/master/CapStatement/target_profile-tabler.ipynb
input/includes/ms-target-table-generator.md|input/data/ms_choice_refs.csv|https://github.com/Healthedata1/MyNotebooks/blob/master/CapStatement/target_profile-tabler.ipynb
input/includes/ms-target-table-generator.md|input/data/addl_uscdi_refs.csv|https://github.com/Healthedata1/MyNotebooks/blob/master/CapStatement/target_profile-tabler.ipynb
input/includes/ms-target-table-generator.md|input/data/addl_uscdi_choice_refs.csv|https://github.com/Healthedata1/MyNotebooks/blob/master/CapStatement/target_profile-tabler.ipynb
input/pagecontent/must-support.md|input/data/additional-uscdi-requirements.csv|https://github.com/Healthedata1/MyNotebooks/blob/master/CapStatement/addl-uscdi-tabler.ipynb

#### Python Installation

For Python Installation see:

https://www.python.org/

For Python package management and installation see:

https://packaging.python.org/en/latest/tutorials/installing-packages/

#### VSCode and Jupyter Installation

For VS Code installation see:

https://code.visualstudio.com/docs/setup/setup-overview

For setting up Jupyter on VSCode see:

https://code.visualstudio.com/docs/datascience/jupyter-notebooks


## Publish.sh Bash Script

### What is Does

This is a bash script for building and publishing **HL7 FHIR Implementation Guides (IGs)**. It automates the process of validating, transforming, and publishing FHIR resources using SUSHI (a FHIR Shorthand compiler) and the HL7 IG Publisher.

Amongs its many functions it:

1. **Validates data files** — Checks that CSV metadata files contain all expected FHIR resources
2. **Transforms YAML to JSON** — Converts YAML resource definitions to JSON format
3. **Runs Sushi** — Executes Sushi to create the Implementation Guide resource from the `sushi-config.yaml` file
4. **Validates JSON** — Checks all JSON files for syntax errors, duplicates, and null values
5. **Runs the IG Publisher** — Executes the Java-based HL7 FHIR IG Publisher tool
6. **Updates artifacts** — Updates artifacts for final publication
7. **Adds ig.yaml collection** Adds the ImplementationGuide resource to the `input/data/ig.yml` folder as a collection

---

### Documentation

This is a build automation script for **HL7 FHIR Implementation Guides**. It wraps the IG Publisher toolchain with pre-processing, validation, and convenience features.

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

Bash is the native to linux and MAC OS terminal language. to install yq, and jq on Mac

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

#### Command-Line Options

| Flag | Purpose | common editor option | prepublication step | use with Caution|
|------|---------| ----- | ---|---|
| `-a` | Copy SearchParameter Excel sheet to data folder as CSV (TODO - unused remove) |||⚠️|
| `-b` | IG publisher option: Enable debug mode (verbose logging)(TODO - check if this already the default) |||⚠️|
| `-c` | Copy CSV files from the `input/data` folder to `/input/images/tables` folder as downloadable CSV/Excel files. This step should be executed after the final edits to all the CSV files the `input/data` folder||✅|
| `-d` | IG publisher option: Output to `docs` folder instead of default `output` folder.  This was orginally used to render on Github pages instead of using the autobuild. (TODO - check if still needed, if not remove) |||
| `-e` | JQ script to append current version to canonical URLs in the `meta.profile" values for examples and `rest.resource.supporterProfiles` and other canonical URLs in CapabilityStatements. This step is done after Sushi processing and before the IG Publisher executes. |✅|✅|
| `-f` | Copy the ig-publisher generated temp/pages/valueset-ref-all-list.csv and temp/pages/codesystem-ref-all-list.csv to `input/data' folder.  This step should be executed after a successful build, and the IG publisher needs to be run again to update the rendered tables at /terminology.html ||✅|
| `-g` | IG publisher option: Turn off narrative generation (speeds up build) (TODO - metrics to see how much it actually speed it up) |||⚠️|
| `-h` | IG publisher option: Turn off validation (speeds up build) (TODO - metrics to see how much it actually speed it up) |||⚠️|
| `-i` | Run the IG Publisher — executes the Java-based HL7 FHIR IG Publisher tool. Execute this after running Sushi and conversion of YAML resource definitions to JSON format ( `-sy` options) (TODO: The default location for the IG publisher is the MAC OS `download` directory  - update to the local directory and add to .gitignore)|✅||
| `-j` | IG publisher option: Enable "rapido" mode (faster build) (TODO - metrics to see how much it actually speed it up or even works- consider removal) |||⚠️|
| `-k` | JQ script to remove `meta.profile` elements from examples (but not from the YAML source files). This step is done after Sushi processing and before the IG Publisher executes. NOT USED IN US CORE |||
| `-l` | The -l flag generates a markdown link reference list that makes it easy to create internal links between pages in your Implementation Guide. It is included in the `input/includes/link_list.md` file that is included at the end of every page. This step should be executed after the addition of pages and artifacts to the `input` folder. ||✅|
| `-n` |  JQ script to remove `meta.extension:instance_name` and `meta.extension.instance_description` extensions from the JSON examples (but not from the YAML source files). This step is done after Sushi processing and before the IG Publisher executes.|✅|✅|
| `-o` | Revert back to the previous/old version of the IG Publisher.  This useful when the latest version of the IG Publisher is buggy and prevents editing. (TODO: The default location for the IG publisher is the MAC OS `download` directory  - update to the local directory and add to .gitignore)||||
| `-p` | Download the latest version of the IG Publisher. Periodically the IG Publisher is updated and needs to be downloaded. (TODO: The default location for the IG publisher is the MAC OS `download` directory  - update to the local directory and add to .gitignore)||||
| `-q` | IG publisher option:  After execution, automatically open the built IG in a browser to the QA report page (`qa.html`) ||||
| `-r` | Remove all generated JSON files (TODO: review this code and consider removing)|||⚠️|
| `-s` | Executes Sushi to create the Implementation Guide resource from the `sushi-config.yaml` file). This is executed before running the ig-publisher and often combined with conversion of YAML resource definitions to JSON format ( `-sy` options) |✅||
| `-t` | IG publisher option:  Run without a terminology server (offline mode). |||⚠️|
| `-v` | IG publisher option:  After execution, automatically open the built IG in a browser to the IG home page (`index.html`) ||||
| `-x` | Remove change highlighting from markdown files. This one-time step is executed after publication of a Ballot version or before publication of a new version to remove all the html highlighting use to identify new an updated text in the ig. A manual review is still needed afterwards to ensure the removal is complete and there are no side effects.  |||⚠️|
| `-y` | Delete all JSON files and regenerate from YAML. This option removes all examples and conformance artifacts types that use YAML as source files prior to regenerating them from the YAML source files. Before converting, the script checks if anyone edited the JSON files directly (instead of editing the YAML source). If the safety check passes, it converts all .yml files to .json files using yq. |✅||
| `-z` | Delete template/temp directories before publishing . Use `-z` when: You've renamed files and stale references might exist in cached build artifacts. You've changed template files and need a fresh copy pulled. The build is behaving unexpectedly due to cached state. You're switching between different IG template versions|
| `-C` | Delete input-cache before publishing. -C does the same thing as `-z` but for the input-cache/ directory, which stores downloaded dependencies (packages, terminology, etc.).|
| `-V` | Update the VSAC name-to-FHIR-URI mapping CSV. This is executed prior to publication of a new version, it downloads the latest VSAC (Value Set Authority Center) metadata from the NLM (National Library of Medicine) and creates a CSV mapping file that links VSAC code system names to their FHIR URIs, and outputs a sorted CSV to `input/data/vsacname-fhiruri-map.csv` ||✅|



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

####  Delete temp/cache (Run build after deleting an artifacts or example)
```bash
./publish.sh -zC
...
./publish.sh -sy
...
./publish.sh -ien
```

####  Prepublication Steps

Updated table and file contents
1. remove meta extensions from examples (`-n` option)
2. Update terminology table (`-f` option)
3. update page link list ((`-l` option)
4. Add Excel and CVS to the images/table folder (`-c` option)
5. Append version to meta. profiles in examples and Capstatements (`-e` option)

####  Troubleshooting ( when you screw up )
  TODO

## Git
    ### Used for
    ### where located
    ### Documentation reference (Bash, Git Bash for Windows installation)
    #### Pushing
        Push_to_autobuild.sh
    ####  Pulling
        PullCheck.sh
## Overview of US Core publication Process
    ### current publication
    ### addition or update to Profile
### Prepublication checklists

- [ ] Apply trackers
- [ ] Review the Application of trackers
- [ ] Copy Editing
  - [ ] typos, grammar -mostly done when applied changes (full Grammerly review when publish)
  - [ ] Screen scrape for open links ([, ]) repeating words etc
  - [ ] read through
- [ ] Observation profile comparison table (part of publisher - review when publish)
- [ ] Version comparison tables (part of publisher - review, will update argo when publish)
- [ ] Technical QA
  - [ ] Terminology (add ignorewarning notes for these )
  - [ ] Open Issues
  - [ ] Variance request for QA Issues: 
  - [ ] Update IgnoreWarnings.txt file
    - [ ] remove unused items
    - [ ] Grammar check IgnoreWarnings comments
- [ ] Review CababilityStatements (when publish)
- [ ] Updated table and file contents
  - [ ] meta stripped (custom bash script when build)
  - [ ] Update terminology table (custom bash script when build)
  - [ ] Update mustsupport target tables (python scripts)
  - [ ] page link list (custom bash script when build)
  - [ ] Add Excel and CVS to the images/table folder (custom bash script when build)
  - [ ] Append version to meta. profiles in examples and Capstatements - - (part of custom bash script when build)
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
    1. argo comparators - see inline instructions
    2. change log creation.
    3. ignoreWarnings.text
    4. version comparisons
