---
title:    ...UNDER CONSTRUCTION...DSTU2 to R4 Conversion
layout: default
---

{:.no_toc}

<!-- TOC  the css styling for this is \pages\assets\css\project.css under 'markdown-toc'-->

* Do not remove this line (it will not be displayed)
{:toc}


<!-- end TOC -->



### Introduction

#### Endpoint discoverability

- will all endpoint URLs be the same except for switching the "DSTU2" path component to “R4" NO

- Will the resource IDs be the same on both DSTU-2 and R4 servers? No

- Will the R4 endpoint give access to the same resources as the DSTU-2 endpoint does, plus the new types?

#### Refresh tokens

- should we require maintaining the same auth server for both endpoints so that the refresh token is valid for the R4 endpoint as well (thus avoiding reauthentication, if possible)?

#### Adding scopes

- the new endpoint will bring additional data types. What is the most elegant way for users to add scopes to their existing authorization? Or will it always require that the user log in anew?
Others…?
