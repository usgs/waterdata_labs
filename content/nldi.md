---
date: 2020-12-31
draft: true
slug: about-nldi
title: Hydro-Network Linked Data Index
description: Information about the Hydro-Network Linked Data Index.
keywords:
  - Hydro-Network
  - Data Index
image: /static/nldi/RioGrandeStreamGage.jpg
---

Users of USGS Water data products often want to know about relationships between a single monitoring location and the broader world, asking questions such as 

* What other stream gages are upstream or downstream of this one? 
* Where does the water at this location come from?
* How big or small is the upstream basin for a location?
* Where does the water from this location go?


The good news is that the USGS and other federal agencies have worked for decades to produce, maintain, and expand the [the National Hydrolography Dataset (NHD)](https://www.usgs.gov/core-science-systems/ngp/national-hydrography), a data set that is capable of answering just these kinds of questions.  The challenge is that the NHD has its origins as a cartographic tool, and its primary audience historically has been cartographers and GIS analysts.  Our goal in the water data team is to make the data in the NHD available to new audiences so that it can be part of a larger [National Hydrography Infrastructure](https://www.usgs.gov/core-science-systems/ngp/national-hydrography/national-hydrography-infrastructure-working-group), and as a first step, we have developed the Hydro Network Linked Data Index (NLDI), which puts a restful Application Programming Interface (API) in front of the NHD dataset. Now, instead of needing to be a GIS professional, any web developer can build tools against the core data in the NHD in a scalable, workable way.  

To learn more about the NLDI, please check read the FAQs below and check out [this extensive blog post that goes over the basic features of NLDI](https://waterdata.usgs.gov/blog/nldi-intro/).  There will be more coming about the NLDI soon.

You can also see the NLDI in action at the [Water Quality Portal](https://www.waterqualitydata.us/portal/#nldiurl=https%3A%2F%2Fcida.usgs.gov%2Fnldi%2Fnwissite%2FUSGS-05428500%2Fnavigate%2FUT%2Fwqp%3Fdistance%3D&mimeType=csv), where it is possible to download data by using upstream and downstream queries, based on the NLDI.

Try it out and [contact us](https://water.usgs.gov/contact/gsanswers?pemail=gs-w_water_data_for_the_nation&subject=Water%20Data%20for%20the%20Nation%20Labs%20Feedback&viewnote=%3CH1%3EUSGS+NLDI+Feedback%3C/H1%3E) about how it works for you.


What is the Network-Linked Data Index?
--------------------------------------

The Network-Linked Data Index (NLDI) is a system that can index spatial and river network-linked data and navigate the river network to allow discovery of indexed information.

Four components make up the system:

*   A core river network and inter-node catchment dataset from the NHDPlus.
*   A network navigation capability that traverses the river network data.
*   Multiple indexing capabilities that can crawl registered sources and add them to the index.
*   Navigation services that provide programmers access to the navigation capabilities and indexed content.

The public face of the NLDI is a search service that takes a watershed identifier as a starting point, a navigation mode to perform, and the type of data desired in response to the request.

*   The watershed identifier starting point can be an NHDPlus comid or an identifier of one of the indexed data sources.
*   Navigation modes include upstream with tributaries, downstream with diversions, and up or downstream on the main stem. The navigation mode can also be limited with a distance to navigate.
*   River network flow line data or sites or other data from indexed sources that were found on the network can be requested.


How is the NLDI service structured?
-----------------------------------------------------------------------

See the swagger documentation here: [https://labs.waterdata.usgs.gov/api/nldi/swagger-ui.html](https://labs.waterdata.usgs.gov/api/nldi/swagger-ui.html)

*   A query to the [base of the linked-data NLDI services](https://labs.waterdata.usgs.gov/api/nldi/linked-data) returns the identifier types that are available as navigation starting points.
*   A query for an identifier type and identifier from that source returns the navigation options available from that starting point.
*   A query to navigate with one of the options returns the response types available for that navigation mode
*   A fully qualified query returns a GeoJSON representation of the resource and may include other optional representations in the future.

How is the NLDI being developed?:
-------------------------------------------

The NLDI is being developed as an open source project on github. Most of the project code and open issues are housed in the [NLDI-Services repository at:](https://github.com/ACWI-SSWD/nldi-services) The crawler code and database code is housed with other [spatial water data repositories on Github](https://github.com/ACWI-SSWD) The project is built and tested using the [Travis continuous integration service](https://travis-ci.org/ACWI-SSWD/nldi-services) . Anyone interested in adding new functionality is encouraged to fork the repository, let others who follow the repository know you are working on one of the existing issues or a new one, and submit new functionality via pull request.  

What are some example service requests:
-------------------------

[https://labs.waterdata.usgs.gov/api/nldi/linked-data](https://labs.waterdata.usgs.gov/api/nldi/linked-data) returns a list of data sources available from the NLDI.  
  
A feature source ID needs to be found via other means, such as a map of known features.  
  
For our example, we'll use a USGS stream gage: [http://waterdata.usgs.gov/monitoring-location/05430175/](http://waterdata.usgs.gov/monitoring-location/05430175/)  
Once a feature source id is found, it can be retrieved like:  
[https://labs.waterdata.usgs.gov/api/nldi/linked-data/nwissite/USGS-05429700](https://labs.waterdata.usgs.gov/api/nldi/linked-data/nwissite/USGS-05429700)  
  
This response includes a navigation url like:  
[https://labs.waterdata.usgs.gov/api/nldi/linked-data/nwissite/USGS-05429700/navigate](https://labs.waterdata.usgs.gov/api/nldi/linked-data/nwissite/USGS-05429700/navigate)  
  
This URL returns navigation options. Choosing one, we can get the associated flow lines like:  
[https://labs.waterdata.usgs.gov/api/nldi/linked-data/nwissite/USGS-05429700/navigate/UT](https://labs.waterdata.usgs.gov/api/nldi/linked-data/nwissite/USGS-05429700/navigate/UT) for upstream with tributaries.  
  
If another source feature type is desired, it can be accessed like:  
[https://labs.waterdata.usgs.gov/api/nldi/linked-data/nwissite/USGS-05429700/navigate/UT/wqp](https://labs.waterdata.usgs.gov/api/nldi/linked-data/nwissite/USGS-05429700/navigate/UT/wqp) for water quality portal sites.  
  
An additional function that is available on NLDI is basin boundaries. If we add `/basin/` to the end of a given NLDI feature URL, the upstream basin of the feature is returned. 
[https://labs.waterdata.usgs.gov/api/nldi/linked-data/nwissite/USGS-05429700/basin/](https://labs.waterdata.usgs.gov/api/nldi/linked-data/nwissite/USGS-05429700/basin/)

How to contribute network-linked content
----------------------------------------

Content to be added to the NLDI needs to be available as a shapefile, which can be served to the NLDI crawler via [https://sciencebase.gov](https://sciencebase.gov/) , or as a web-accessible file containing geojson points. Required attributes include: 1) an ID suitable for use in a url, 2) a descriptive name, and 3) a url that can be used to access information about each feature. The url is not explicitly required but is strongly recommended. Given this information, the NLDI crawler code will match each point to an NHDPlus catchment and the data will be available via NLDI search services. Contact [dblodgett@usgs.gov](mailto:dblodgett@usgs.gov) to coordinate addition of data sources.