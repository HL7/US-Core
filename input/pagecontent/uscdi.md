<!-- {% raw %} to make the USCDI table

need 

source CSV file = `input/data/uscdi-table.csv`
markdown page file = `input/pagecontent/uscdi.md`
liquid template files = `input/includes/uscdi-uscore-map.html`,`input/includes/sd_link.html`
icons (png files) = `input/images/<"kebab case" USCDI class names>.png`

1. create the source CSV file with all the same column names
    - FHIRPath column is not used for rendering so can replace with template name or whatever
    - this file lives in the `input/data` folder
    - It is copied to the `input/images` folder as both a csv and convert to excel file using a bash/python script.
2. The pagecontent/uscdi.md page is where the table is rendered
3. the liquid template tag "{% include uscdi-uscore-map.html %}" references `includes/uscdi-uscore-map.html` which does the rendering
   - this file depends on another liquid template {% include sd_link.html title = title  %} which refererence `includes/sd_link.html` to get the profile page link.
   1. icons (png images) are in the `input/images` are named using the "kebab case" USCDI class names.{% endraw %} -->



The US Core Profiles were initially designed to meet the 2015 Edition certification criterion for Patient Selection 170.315(g)(7) and Application Access – Data Category Request 170.315(g)(8). US Core Editors have updated the guide annually to meet subsequent [U.S. Core Data for Interoperability (USCDI)] requirements: 

{% include uscdi-uscore-version-table.md %}


ASTP's USCDI and FHIR US Core are complementary initiatives, with USCDI defining high-level data requirements and FHIR US Core providing detailed FHIR-based profiles for meeting those requirements. Mapping between them is necessary for achieving interoperability and consistency in healthcare data exchange within the United States. However, to make USCDI implementable in FHIR, an interpretation of USCDI is necessary. For information about what US Core Profile elements and US Core transactions are in scope for ASTP Health IT Certification, see the US Core [Conformance] pages.

Note that:
-  USCDI Data Classes and Element names may differ from the FHIR US Core resource names and element names.
-  Not every USCDI Data Class and Element is mapped to a single profile.
-  Many US Core Profile elements do not map to a USCDI Data Classes and Element because US Core's usage is broader than certification and because additional US Core elements are required to make FHIR implementable.

Updates to US Core depend upon community input, and we encourage our audience to submit questions and feedback to US Core specifications by clicking on the *Propose a change* link in the footer of every page. In addition, we encourage our audience to request any necessary clarifications to USCDI through the [USCDI ONDEC process] that will help inform future updates to FHIR US Core.

The table below defines the relationship between the USCDI Data Classes and Elements and USCore profiles. It lists the US Core Profile used for the corresponding Data Classes and Elements. This information and [FHIRPath] expressions to USCDI Data Classes and Elements are available as a [csv](tables/uscdi-table.csv) or [excel](tables/uscdi-table.xlsx) file:

{% include uscdi-uscore-map.html %}

{% include link-list.md %}





   
