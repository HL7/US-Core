#9 For a brief hx -see how US Core has grown - we started with 17 profiles in Argo DSTU2 (2015) which has grown to 27 in US Core 3.1.1 (2020) and 35 in most recent version we recently ballotted  (ver 4.0.0)

#10 2 Main components to US core :  Profiles  and  Search

** Overall Goal for the GUIDE is to be permissive - and prescribe a minimal  set of requirements for interoperability.

1. Lots of focus on the US Core Profiles - define the structure and Content
  -  what is required
  - what codes to use
  - US specific extensions to add US specific content to the FHIR core specification - things like race and ethnicity.

2. Search - Interactions between Client and Servers to access
  Uses the basic FHIR RESTful search API
  Defines a set of required and recommended ways to search for information.

As a Result this guide can be used in a couple of ways ...

1. Use the Profile only - in other words the adopt the content model.

Example:  Bulk data EHR systems that support the US Core Data for Interoperability exports all resources needed for the US Core Data for Interoperability, as profiled by Argonaut.

2. Use the Profile only and "Conform" to the Search API that is defined for it. These expectations are formally defined in the CapabilityStatements.

Example: System that certifies to 2015 Cures Update for Standardized API.

Both 1 and 2 use the Profiles 


# 12 -15  technically don't need to profile for fhir.  Could use the base spec "out of the box"  Using the approach on this slide

BUT the FHIR resource are loaded with data elements and unconstrained in a way that makes very difficult to interoperate.  and we found it not to be true and why profiles matter

What do I mean by interoperate : A patient should have a reasonable expectation that the types of information they get is the same no matter which provider it is from different providers.

#18 US Core Patient profile - example of extension for Race and Ethnicity

Define the key elements for representing patient

Where US Core Ahead of USCDI?

USCore was Provenance, Encounter, Clinical Notes

lot of stuff, and value set is just an example

FYI...

# 30 SVAP - USCDI - final in JULY - set of recommendation
 and then ONC can choose to add to SVAP can name new version of US core.

# 31 ONC Ondec for submission of new data for consideration

# 32 examples Provenance, Clinical Notes

# 36-39 FYI on Inferno , cert, community, validation edition
  their talk is ...
