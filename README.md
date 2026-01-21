
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


### IG publisher

#### What It Does

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


#### Documentation

##### IG Publisher CLI (including installation)

This document describes specific options available for running the FHIR IG Publisher command-line tool and installation instructions.

https://confluence.hl7.org/spaces/FHIR/pages/175618322/IG+Publisher+CLI

##### IG Publisher Documentation

Other details of the publishing process are also available in the IG Publisher Documentation page.

https://confluence.hl7.org/spaces/FHIR/pages/35718627/IG+Publisher+Documentation

### HL7 Templates

#### What It Does

HL7 IG Templates are packages referenced by the IG Publisher that control the visual styling, page structure, and navigation of published FHIR Implementation Guides. They define how FHIR resources are rendered as pages and provide a framework into which authors integrate their narrative content.

#### Documentation (including installation)

The HL7 IG Templates is reference in the `ig.ini` with the key-value pair "template = hl7.fhir.template#[version]"  where "[version]" is the template's version:

```ini
# Use a specific version
template = hl7.fhir.template#1.0.0

# Use the current CI build version
template = hl7.fhir.template#current

# If no version specified, defaults to latest release
template = hl7.fhir.template
```

- "#current" refers to the *Continuous Integration Build* (latest in version control) maintained on build.fhir.org.  The "#current" version is useful during development,but **for official HL7 publications use a specific released version** (e.g., "#1.0.0")

These documents provides more details describing how to specify and use templates.

  - https://build.fhir.org/ig/FHIR/ig-guidance/using-templates.html
  - https://build.fhir.org/ig/FHIR/ig-guidance/template.html


### Jekyll

#### What It Does

Jekyll serves as the website generation tool that takes the processed FHIR artifacts, templates, and page content produced by the IG Publisher and compiles them into the final static HTML output that forms the publishable Implementation Guide. It also makes IG metadata (version, canonical URL, dependencies, etc.) available through data variables that can be referenced in page templates.

The Jekyll's key dependencies include:

- **Ruby** (version 2.7.0+; 3.1.3+ recommended)
- **RubyGems** - Ruby's package manager including...
  - **liquid** - Templating engine for dynamic content (e.g., `{{ site.data.fhir.version }}`)
  - **kramdown**- - Markdown parser that converts .md files to HTML

#### Documentation (including installation)

Dtails of static website creation using Jekyll and installation instructions.

https://jekyllrb.com/







