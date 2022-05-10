---
date: 2020-01-14
slug: about-nldi
title: Hydro-Network Linked Data Index
description: The Hydro Network Linked Data Index (NLDI) puts a restful application programming interface (API) in front of the National Hydrolography dataset. Now, instead of needing to be a GIS professional, any web developer can build tools against the core data in the NHD in a scalable, workable way.
thumbnail_path: "./static/nldi/nldi_tar_river_thumb.png"
thumbnail_alt: "thumbnail showing the upstream basin of a location the the tar river as a grey outline overlaid on a map, with and upstream flowline as dark blue, and a downstream flowline as light blue."
keywords:
  - Hydro-Network
  - Data Index
image: /static/nldi/RioGrandeStreamGage.jpg
containerclass: grid-container
---

Users of USGS Water data products are often looking to find answers to questions such as:

- What stream gages are upstream or downstream of this one?
- Where does the water at this location come from?
- How big or small is the upstream basin for a location?
- Where does the water from this location go?

The good news is that the USGS and other federal agencies have worked for decades to produce, maintain, and expand the [National Hydrography Dataset (NHD)](https://www.usgs.gov/core-science-systems/ngp/national-hydrography), a data set that is capable of answering just these kinds of questions. The challenge is that the NHD has its origins as a cartographic tool, and its primary audience historically has been cartographers and GIS analysts. Our goal in the water data team is to make the data in the NHD available to new audiences so that it can be part of a larger [National Hydrography Infrastructure](https://www.usgs.gov/core-science-systems/ngp/national-hydrography/national-hydrography-infrastructure-working-group). As a first step towards this goal, we have developed the Hydro Network Linked Data Index (NLDI), which puts a restful _application programming interface (API)_ in front of the NHD dataset. Now, instead of needing to be a GIS professional, any web developer can build tools against the core data in the NHD in a scalable, workable way.

To learn more about the NLDI, please check out [this blog post that goes over the basic features of NLDI](https://waterdata.usgs.gov/blog/nldi-intro/), [this update](https://waterdata.usgs.gov/blog/nldi_update/), this summary of how the [NLDI will work](https://waterdata.usgs.gov/blog/nldi-geoconnex/) with [geoconnex.us](https://geoconnex.us/) and read the FAQs below.

The Water Data for the Nation development team is using the NLDI to show gages that are upstream and downstream of an existing gage, as seen below.
{{< figure src="/static/nldi/up_down_09380000.png" alt="A map showing gages as orange dots, upstream lines as dark blue, and downstream lines as light blue. There is a text pop-up noting the name and number of the next upstream site" caption="Map showing the gages 200 miles upstream and downstream on the main stream of the Colorado River from monitoring location 09380000, [Colorado River at Lee's Ferry, AZ](https://waterdata.usgs.gov/monitoring-location/09380000/)" >}}

You can also see the NLDI in action at the [Water Quality Portal](https://www.waterqualitydata.us/portal/#nldiurl=https%3A%2F%2Fcida.usgs.gov%2Fnldi%2Fnwissite%2FUSGS-05428500%2Fnavigate%2FUT%2Fwqp%3Fdistance%3D&mimeType=csv), where it is possible to download data by using upstream and downstream queries, based on the NLDI.

The NLDI is also available from the [nhdplusTools](https://usgs-r.github.io/nhdplusTools/) and [dataRetrieval](http://usgs-r.github.io/dataRetrieval/) R packages and the [HyRiver](https://hyriver.readthedocs.io/en/latest/) Python package.

Try it out and [contact us](https://water.usgs.gov/contact/gsanswers?pemail=gs-w_water_data_for_the_nation&subject=Water%20Data%20for%20the%20Nation%20Labs%20Feedback&viewnote=%3CH1%3EUSGS+NLDI+Feedback%3C/H1%3E) about how it works for you.

## What is the Network-Linked Data Index?

The hydro Network-Linked Data Index (NLDI) is a system that can index spatial and river network-linked data and navigate the river network to allow discovery of indexed information.

Four components make up the system:

- A core river network and inter-node catchment dataset from the NHDPlus.
- A network navigation capability that traverses the river network data.
- Multiple indexing capabilities that can crawl registered sources and add them to the index.
- Navigation services that provide programmers access to the navigation capabilities and indexed content.

The public face of the NLDI is a search service that takes a watershed identifier as a starting point, a navigation mode to perform, and the type of data desired in response to the request.

- The watershed identifier starting point can be an NHDPlus comid or an identifier of one of the indexed data sources.
- Navigation modes include upstream with tributaries, downstream with diversions, and up or downstream on the main stem. The navigation mode can also be limited with a distance to navigate.
- River network flow line data, sites, or other data from indexed sources that were found on the network can be requested.

## How is the NLDI service structured?

NOTE: {featureSource}, {featureID}, and {dataSource} are variables that must be provided as shown in the example requests further down.

- `https://labs.waterdata.usgs.gov/api/nldi/linked-data` returns indexed feature sources.
- `https://labs.waterdata.usgs.gov/api/nldi/linked-data/{featureSource}/{featureID}/navigation` returns the navigation options for that feature ID from the given feature source.
- `https://labs.waterdata.usgs.gov/api/nldi/linked-data/{featureSource}/{featureID}/navigation/mode/{dataSource}` returns the data derived from a navigation with the provided mode for the requested data source.
- `https://labs.waterdata.usgs.gov/api/nldi/linked-data/{featureSource}/{featureID}/basin` returns a basin boundary upstream of that feature ID.

<figure>
<img src='/static/nldi/nldi-api.png' title='Network Linked Data Index API Diagram' alt='Diagram showing the overall Network Linked Data Index API' >
<figcaption>NLDI API Summary Diagram</figcaption>
</figure>

For more details, see standard swagger API documentation here: [https://labs.waterdata.usgs.gov/api/nldi/swagger-ui.html](https://labs.waterdata.usgs.gov/api/nldi/swagger-ui.html)

## What are some example service requests?

Return a list of data sources available from the NLDI.  
[https://labs.waterdata.usgs.gov/api/nldi/linked-data](https://labs.waterdata.usgs.gov/api/nldi/linked-data)

Access a hydrologic location using the hydrolocation end point.  
[https://labs.waterdata.usgs.gov/api/nldi/linked-data/hydrolocation?f=json&coords=POINT(-89.35 43.0864)](<https://labs.waterdata.usgs.gov/api/nldi/linked-data/hydrolocation?coords=POINT(-89.35%2043.0864)>)

Access all features in a feature source at the feature source end point. This is a large geojson file that can be used for mapping.  
[https://labs.waterdata.usgs.gov/api/nldi/linked-data/huc12pp](https://labs.waterdata.usgs.gov/api/nldi/linked-data/huc12pp)

Discover a starting network id (`comid`) with the "position" function.  
[https://labs.waterdata.usgs.gov/api/nldi/linked-data/comid/position?coords=POINT(-89.35 43.0864)](<https://labs.waterdata.usgs.gov/api/nldi/linked-data/comid/position?coords=POINT(-89.35%2043.0864)>)

Retrieve a feature source id once it is found.  
[https://labs.waterdata.usgs.gov/api/nldi/linked-data/nwissite/USGS-05429700](https://labs.waterdata.usgs.gov/api/nldi/linked-data/nwissite/USGS-05429700)

Find the navigation URL in the feature source response.  
[https://labs.waterdata.usgs.gov/api/nldi/linked-data/nwissite/USGS-05429700/navigation](https://labs.waterdata.usgs.gov/api/nldi/linked-data/nwissite/USGS-05429700/navigation)

Get available data sources by choosing from the list returned by one of the navigation options.  
[https://labs.waterdata.usgs.gov/api/nldi/linked-data/nwissite/USGS-05429700/navigation/UT](https://labs.waterdata.usgs.gov/api/nldi/linked-data/nwissite/USGS-05429700/navigation/UT)

Return flowlines along the navigation by selecting flowlines and adding a distance to the last URL.  
[https://labs.waterdata.usgs.gov/api/nldi/linked-data/nwissite/USGS-05429700/navigation/UT/flowlines?distance=10](https://labs.waterdata.usgs.gov/api/nldi/linked-data/nwissite/USGS-05429700/navigation/UT/flowlines?distance=10)

Access another source feature type is desired.  
[https://labs.waterdata.usgs.gov/api/nldi/linked-data/nwissite/USGS-05429700/navigate/UT/wqp?distance=100](https://labs.waterdata.usgs.gov/api/nldi/linked-data/nwissite/USGS-05429700/navigate/UT/wqp?distance=100) for water quality portal sites.

Return the upstream basin of a feature by adding `/basin/` to the end of a given NLDI feature URL.
[https://labs.waterdata.usgs.gov/api/nldi/linked-data/nwissite/USGS-05429700/basin/](https://labs.waterdata.usgs.gov/api/nldi/linked-data/nwissite/USGS-05429700/basin/)

Return landscape characteristics for local or total upstream areas.  
[https://labs.waterdata.usgs.gov/api/nldi/linked-data/nwissite/USGS-05429700/local](https://labs.waterdata.usgs.gov/api/nldi/linked-data/nwissite/USGS-05429700/local) or  
[https://labs.waterdata.usgs.gov/api/nldi/linked-data/nwissite/USGS-05429700/tot](https://labs.waterdata.usgs.gov/api/nldi/linked-data/nwissite/USGS-05429700/tot)

Access all characteristic metadata.  
[https://labs.waterdata.usgs.gov/api/nldi/lookups/](https://labs.waterdata.usgs.gov/api/nldi/lookups/)

## How to contribute network-linked content

Content to be added to the NLDI needs to be available as GeoJSON accessible via a public URL. Required attributes include: 1) an ID suitable for use in a URL, 2) a descriptive name, and 3) a URL that can be used to access information about each feature. The url is not explicitly required but is strongly recommended. Given this information, the NLDI crawler code will match each point to an NHDPlus catchment and the data will be available via NLDI search services. More information is available [here.](https://github.com/internetofwater/nldi-crawler) or contact [dblodgett@usgs.gov](mailto:dblodgett@usgs.gov) to coordinate addition of data sources.

## How is the NLDI being developed?

The NLDI is being developed as an open source project on github. Most of the project code and open issues are housed in the [NLDI-Services repository](https://github.com/internetofwater/nldi-services). The crawler code and database code is housed with other [spatial water data repositories on Github](https://github.com/internetofwater) Anyone interested in adding new functionality is encouraged to fork the repository, let others who follow the repository know you are working on one of the existing issues or a new one, and submit new functionality via pull request.
