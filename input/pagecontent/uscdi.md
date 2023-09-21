<!-- to make the USCDI table

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
   1. icons (png images) are in the `input/images` are named using the "kebab case" USCDI class names. -->

The US Core Profiles were originally designed to meet the 2015 Edition certification criterion for Patient Selection 170.315(g)(7) and Application Access – Data Category Request 170.315(g)(8). They were created for each item in the [2015 Edition Common Clinical Data Set (CCDS)]. The Location, Organization, and Practitioner Profiles are not called out specifically in the certification criteria but are included because other profiles directly reference them. The US Core Profiles are informed by the prior [Data Access Framework] and the [Argonaut Data Query] Implementation Guides. However, the profiles here are stand-alone and include requirements from the [U.S. Core Data for Interoperability (USCDI) v4].

The table below lists the US Core Profile and FHIR Resources used for the corresponding USCDI Data elements. This information is also available as a [csv](uscdi-table.csv) or [excel](uscdi-table.xlsx) file:

{% include uscdi-uscore-map.html %}



{% include link-list.md %}





   
