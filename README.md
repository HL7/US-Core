
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
   2. Jekyll
      1. Used for
      1. Documentation reference
            1. including installation
      2. HL7 templates
         1. Used for
         2. Where located
      3. Include files
         1. Used for
         2. Where located
      4. Collections
         1. Used for
         2. Where located
   3. Liquid
      1. Used for
      2. Documentation reference(s)
   4. Sushi
      1. Used for
      2. Where located
      3. Documentation reference
          1. including installation
   5. Jira
      1. Used for
      2. Where located
      3. Documentation reference
   6. Python Scripts
      1. Used for
      2. Where located
      3. Documentation reference  (Python, VSCode, VSCode notebooks for Python)
          1. including installation
   7. publish.sh Bash Script
      1. Used for
      2. where located
      3. Documentation reference (Bash, Git Bash for Windows installation)
   8. Git
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
9. Pre-publication Checklist
   1.  Checklist
   2.  Gotchas
