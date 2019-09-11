---
slug: about-nldi
title: Hydro-Network Linked Data Index
description: Information about the Hydro-Network Linked Data Index.
keywords:
  - Hydro-Network
  - Data Index
image: /static/nldi/RioGrandeStreamGage.jpg
---

A very common question that we get from users of Water Data for the Nation is that we should make it easy to see the monitoring locations that are upstream and downstream of the monitoring location that they are looking at.  We agree! The good news is that the USGS has a remarkable dataset called the National Hydrologic Dataset (NHD) that is capable of answering just this question.  The challenge is that the National Hydrologic Dataset has its origins as a cartographic tool, and its is primary audience were cartographers and GIS analysts.  The NLDI is a first step toward making the data behind the NHD more accessible and useable for a larger audience, by building a RESTful API in front of it. The Hydro-Network Linked Data Index (NLDI)  is a system that can index data to [NHDPlus V2](http://www.horizon-systems.com/NHDPlus/V2NationalData.php) catchments and offers a search service to discover indexed information. The NLDI is a first step toward making the data behind the NHD more accessible and useable for a larger audience, by building a RESTful API in front of it.

So what does this MEAN?  That with just a little code, any web developer can start to ask and answer questions, such as

* What other stream gages are upstream or downstream of me?
* Where does the water go?
* How big or small is the upstream basin for a location?
* What ocean does this river flow into?

{{< figure src="/static/nldi/downstream.png" caption="A screenshot of all Water Quality Portal sites upstream and downstream of NWIS site 08279500, [Rio Grande at Embudo, NM](https://waterdata.usgs.gov/monitoring-location/08279500/)" >}}

You can try out the NLDI by looking at the [Swagger Docs](/api/nldi/swagger-ui.html) which is a view of the API based on the [OpenAPI specification](https://www.openapis.org/).  

You can also see the NLDI in action at the [Water Quality Portal](https://www.waterqualitydata.us/portal/#nldiurl=https%3A%2F%2Fcida.usgs.gov%2Fnldi%2Fnwissite%2FUSGS-05428500%2Fnavigate%2FUT%2Fwqp%3Fdistance%3D&mimeType=csv), where it is possible to download data by using upstream and downstream queries, based on the NLDI.

To learn more about the NLDI, please check out [this extensive blog post that goes over the basic features of NLDI](https://waterdata.usgs.gov/blog/nldi-intro/).  There will be more coming about the NLDI soon.

Try it out and [contact us](https://water.usgs.gov/contact/gsanswers?pemail=gs-w_water_data_for_the_nation&subject=Water%20Data%20for%20the%20Nation%20Labs%20Feedback&viewnote=%3CH1%3EUSGS+NLDI+Feedback%3C/H1%3E)about how it works for you.
