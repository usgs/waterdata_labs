---
date: 2019-04-25
slug: graph-image-api
type: post
title: Graph Image API
categories:
  - Graph Image API
description: Information about the Graph Image API.
keywords:
  - Graph
  - Image
  - API
image: /static/graph-images/api_graph_image.png
---

One of the most common pieces of feedback that we received about the hydrograph on the new monitoring location pages was that users wanted a way to save an image of a given hydrograph.  In the classic pages, these graphs are already images, and it was easy enough to expose the endpoint that generated those images:

https://waterdata.usgs.gov/nwisweb/graph?agency_cd=USGS&site_no=09380000&parm_cd=00060&period=7
![Legacy Graph Image](/static/graph-images/legacy_graph_image.png)

However, the new graphs are not so easy to generate, as they are dynamic, and generated in the web browser using a tool called D3.  Replicating the environment of a browser was a non-trivial task, but with the major advances in automated browser testing with tools like [puppeteer](https://developers.google.com/web/tools/puppeteer/), we were able to generate a reasonable solution.
![Graph API Image](/static/graph-images/api_graph_image.png)


https://labs.waterdata.usgs.gov/graph-images/monitoring-location/09380000/?parameterCode=00060 

There is still quite a bit of work to do before we release a stable version of the graph image project, but this is a start.  Try it out!


Questions
==========
Questions or comments about the Water for the Nation Projects? [here.](https://water.usgs.gov/contact/gsanswers?pemail=gs-w-ks_NWISWeb_Data_Inquiries&subject=Site+Number%3A+07144100&viewnote=%3CH1%3EUSGS+NWIS+Feedback+Request%3C%2FH1%3E%3Cp%3E%3Cb%3EPlease+enter+a+subject+in+the+form+below+that+briefly+summarizes+your+request%3C%2Fb%3E%3C%2Fp%3E) 

http://localhost:1313/static/graphImageAPI/legacy_graph_image.png