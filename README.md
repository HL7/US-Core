
#  Welcome to the US Core Implementation Guide Repository

**US Core Implementation Guide (FHIR IG) [Publication (Version) History](http://hl7.org/fhir/us/core/history.html)**

Authors:  Eric Haas, Brett Marquard, Gay Dolin

All issues should be logged using the official [Jira tracker system](http://hl7.org/fhir-issues) so they can be reviewed and voted upon by the  HL7 International Cross Groups Projects Workgroup.

## US Core Publication Documentation

This documentation provides a comprehensive guide to the technical stack and workflows used to publish the HL7 FHIR US Core Implementation Guide. It covers the essential tools—including the IG Publisher, Jekyll, Sushi, and supporting scripts—along with step-by-step processes for building, updating, and troubleshooting the publication.


1. Overview of US Core publication stack
   1. ig-publisher
      1. Used for
      1. Documentation reference
            1. including installation
   2. HL7 templates
         1. Used for
         2. Where located
   3. Jekyll
      1. Used for
      2. Documentation reference
            1. including installation

      3. Include files
         1. Used for
         2. Where located
      4. Collections
         1. Used for
         2. Where located
   4. Liquid
      1. Used for
      2. Documentation reference(s)
   5. Sushi
      1. Used for
      2. Where located
      3. Documentation reference
          1. including installation
   6. Jira
      1. Used for
      2. Where located
      3. Documentation reference
   7. Python Scripts
      1. Used for
      2. Where located
      3. Documentation reference  (Python, VSCode, VSCode notebooks for Python)
          1. including installation
   8. publish.sh Bash Script
      1. Used for
      2. where located
      3. Documentation reference (Bash, Git Bash for Windows installation)
   9. Git
      1. Used for
      2. where located
      3. Documentation reference (Bash, Git Bash for Windows installation)
2. Overview of US Core publication Process
   1. Run build with current publication
   2. Run build after update to Profile
3. Publish.sh
   1. default output
      1. checks ...
   2. options explained
      1. default output
      2. checks ...
   3. common runs
      1. run build after update to markdown pages ( no change to artifacts )
      2. run build after update to artifacts ( e.g., profile or example )
      3. run build after publisher updated.
      4. run build after deleting an artifacts or example
   4. prepublishing steps
   5. troubleshooting ( when you screw up )
4. Updating the implementation guide resource using Sushi
5. Include files
6. Liquid scripts
   1. How to use with collection as data source to create page content including lists and tables
   2. How to generate narrative
7. Python Scripts
   1. How to update Collections
8. Git
   1. Pushing
      1.
   2. Pulling
      1. Pull Checking
9.  Pre-publication Checklist
   1.  Checklist
   2.  Gotchas

## IG publisher

### What It Does

The FHIR IG Publisher is a tool that takes implementation guide source content and transforms it into a complete published implementation guide, including human-readable HTML files and a machine-processable NPM package (package.tgz). It validates all resources in the IG, generates renderings for each artifact, and produces an HTML QA file with any errors encountered.

The IG Publisher's key dependencies include:

- **Java runtime** - Required to execute the publisher JAR file
- **Jekyll** - Website generation tool for producing final HTML output
- **Ruby** - Ruby requirements for Jekyll
- **SUSHI** - you need this to configure the Implementation Guide resource adn optionally to author implementation guide artifacts using the FSH Domain-Specific Language (DSL).
- **HL7 IG Templates** -  Packages referenced by the IG Publisher that control the visual styling, page structure, and navigation of published FHIR Implementation Guides.
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
  - **kramdown**- - Markdown parser that converts .md files to HTML

### Documentation

#### Jekyll Include files

A feature that is used extensively in US Core pages is Jekyll Include files.  Jekyll Include files allow reusable content fragments to be defined once and inserted into multiple pages using the {% include filename %} syntax. This promotes consistency across the IG by ensuring common elements (like navigation, boilerplate text, or repeated guidance) remain synchronized, and simplifies maintenance since updates only need to be made in one location rather than across every page that uses the content.

The `input/includes/` directory is the standard location for Jekyll include files

Syntax:

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

👉👉👉 Note that the "Intro/notes" fragments are defined in the `input/intro-notes/` directory and the file naming syntax is "[artifact file name]" + "intro|notes" + ".md". For example, for the introduction to the US Core Patient Profile: `input/intro-notes/StructureDefinition-us-core-patient-intro.md`) These fragments are included into artifact pages (e.g., US Core Patient Profile) by the HL7 templates and not directly included using the above syntax.  👈👈👈

#### Jekyll Collections

Another feature that is used extensively in US Core pages is Jekyll Collections.  Jekyll Collections allow grouping related content (such as profiles metadata) into named sets that can be iterated over and rendered programmatically using liquid scripts (see below). This enables IG authors to generate consistent pages for similar artifacts automatically, such as creating a summary table listing data, without manually maintaining each entry.

The `input/data/` directory is the standard location to *add and edit* US Core authored collections. The IG Publisher also generates collections and these and the US Core authored collections are *accessed* in the `temp/pages/_data` directory.  Managing collections and using collection in liquid scripts are covered in there respective sections below.

####  Jekyll Documentation (including installation)

For a comprehensive documentation of static website creation using Jekyll and installation instructions.

https://jekyllrb.com/

## Jekyll Liquid

### What It Does

Jekyll/Shopify Liquid is a templating language that enables dynamic content generation within static web pages using tags ({% %}) for logic and output ({{ }}) for variables. It allows IG authors to insert dynamic values (like {{ site.data.fhir.version }}), create conditional content, loop through collections, and apply filters to transform data—all at build time rather than runtime. This enables FHIR IGs to maintain consistency across pages, automatically reflect dependency versions, and generate repetitive content programmatically while still producing fast, static HTML output.

### Documentation

Jekyll Liquid scripts is used extensively in US Core pages to create page content including lists and tables with collections.  Managing collections and using collection in liquid scripts are covered in detail in a following section.

Liquid is a Ruby Gem that is installed as a dependency when you install Jekyll.  For documentation on using Liquid with Jekyll see:

https://jekyllrb.com/docs/liquid/

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


## Jira

### What It Does

The HL7 Jira (hosted at jira.hl7.org) is the official issue tracking and change management system used by Health Level Seven International to manage feedback, bug reports, change requests, and proposals across all HL7 standards—including FHIR. HL7 Jira is tightly integrated into the Implementation Guide development lifecycle, serving as the central hub for feedback, change management, and community collaboration.

### Documentation

The IG Publisher automatically generates "Propose a Change" links on every page of a published IG. In addition, Jira is prepopulated with the ig context (page URL, IG version, etc.) that allows readers to submit feedback without having navigating Jira and manually enter all the data.  This is configured for this and any IG Based on the JIRA-Spec-Artifacts repository. It documentation is at:

https://github.com/HL7/JIRA-Spec-Artifacts

This is typically done *right before* final publication and takes 1 to 2 days for the updates to be applied.

## US Core Python Scripts

### What They Do

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

The US Core PageContent file or include documents the Collection's contents and whether it is manually updated or a uses python script to update and the location of the Python Scripts that modifies it. Similarly each Python Scripts documents what is does and how to use it.  The Collections that use Python scripts are listed below:

PageContent/includes file|US Core Collection|Python Script
---|---|---|
input/includes/ms-target-table-generator.md|input/data/ms_refs.csv|https://github.com/Healthedata1/MyNotebooks/blob/master/CapStatement/target_profile-tabler.ipynb
input/includes/ms-target-table-generator.md|input/data/ms_choice_refs.csv|https://github.com/Healthedata1/MyNotebooks/blob/master/CapStatement/target_profile-tabler.ipynb
input/includes/ms-target-table-generator.md|input/data/addl_uscdi_refs.csv|https://github.com/Healthedata1/MyNotebooks/blob/master/CapStatement/target_profile-tabler.ipynb
input/includes/ms-target-table-generator.md|input/data/addl_uscdi_choice_refs.csv|https://github.com/Healthedata1/MyNotebooks/blob/master/CapStatement/target_profile-tabler.ipynb
input/pagecontent/must-support.md|input/data/additional-uscdi-requirements.csv|https://github.com/Healthedata1/MyNotebooks/blob/master/CapStatement/addl-uscdi-tabler.ipynb
\*input/pagecontent/vsacname-fhiruri-map.md|input/data/vsacname-fhiruri-map.csv|https://github.com/Healthedata1/MyNotebooks/blob/master/bash_scripts/vsacname_fhiruri_mapper.ipynb

*TODO move script to the publish.sh script as an option


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

### Key Points

- US Core uses Python scripts to update Jekyll Collection data because the logic is too complex to handle inline.
- Running the scripts requires Python 3.7+, VS Code with the Python and Jupyter extensions, and Python packages including `jupyter`, `ipykernel`, and `PyYAML`.
- Each Python script and its associated PageContent/include file documents what collection it modifies and how to use it.














