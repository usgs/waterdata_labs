---
date: 2019-12-19
slug: about-nldi
title: Hydro-Network Linked Data Index
description: Information about the Hydro-Network Linked Data Index.
keywords:
  - Hydro-Network
  - Data Index
image: /static/nldi/RioGrandeStreamGage.jpg
---

A very common question that we get from users of Water Data for the Nation is that we should make it easy to see the monitoring locations that are upstream and downstream of the monitoring location that they are looking at.  We agree! The good news is that the USGS has a remarkable dataset called the National Hydrologic Dataset (NHD) that is capable of answering just this question.  The challenge is that the National Hydrologic Dataset has its origins as a cartographic tool, and its is primary audience were cartographers and GIS analysts.  The NLDI is a first step toward making the data behind the NHD more accessible and useable for a larger audience, by building a RESTful API in front of it.

So what does this MEAN?  That with just a little code, any web developer can start to ask and answer questions, such as

* What other stream gages are upstream or downstream of me?
* Where does the water go?
* How big or small is the upstream basin for a location?
* What ocean does this river flow into?

The Hydro-Network Linked Data Index (NLDI)  is a system that can index data to [NHDPlus V2](http://www.horizon-systems.com/NHDPlus/V2NationalData.php) catchments and offers a search service to discover indexed information.

To learn more about the NLDI, please check out [this extensive blog post that goes over the basic features of NLDI](https://waterdata.usgs.gov/blog/nldi-intro/).  There will be more coming about the NLDI soon.

Try it out and let us know how it works for you.
