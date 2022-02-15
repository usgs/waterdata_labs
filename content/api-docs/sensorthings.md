---
date: '2021-11-01T21:24:48.688Z'
slug: about-sensorthings-api
title: Sensorthings API
description: 'The sensorthings API is a new, standards-compliant way to access USGS real-time water data'
thumbnail_path: 'https://labs.waterdata.usgs.gov/api/graph-images/monitoring-location/09380000/?parameterCode=00060&width=300&period=P7D'
thumbnail_alt: 'A line graph showing 7 days of hydrological data.  The line is orange, with black axes'
keywords:
  - Graph
  - Image
  - API
image: 'https://labs.waterdata.usgs.gov/api/graph-images/monitoring-location/09380000/?parameterCode=00060&width=300&period=P7D'
containerclass: grid-container
draft: false
---


USGS Instantaneous data values are the most heavily accessed data types- over 90% of data that is downloaded from USGS systems is instantaneous values data- typically collected every 15 minutes from over 14,000 monitoring locations across the United States.  The systems that make this data available however, have not substantially changed since they were first released many years ago.

The first product to be released publicly to make instantaneous values data available- but still as a beta- is an implementation of the OGC Sensorthings standard at https://labs.waterdata.usgs.gov/sta/v1.1/

What does this mean? Lets explore this new tool.

* Lets start with the root, where we see a list of a number of different endpoints.  The USGS WMA is not taking advatage of all of the components of Sensorthings- we will get there, but we are not there yet.  We are currently focused on `Datastreams`, `Locations`, `Observations`, `ObservedProperties`, and `Things`. 
{{<  highlight json "hl_lines=4 20 24 28 36" >}}
{
  "value": [
    {
      "name": "Datastreams",
      "url": "https://labs.waterdata.usgs.gov/sta/v1.1/Datastreams"
    },
    {
      "name": "MultiDatastreams",
      "url": "https://labs.waterdata.usgs.gov/sta/v1.1/MultiDatastreams"
    },
    {
      "name": "FeaturesOfInterest",
      "url": "https://labs.waterdata.usgs.gov/sta/v1.1/FeaturesOfInterest"
    },
    {
      "name": "HistoricalLocations",
      "url": "https://labs.waterdata.usgs.gov/sta/v1.1/HistoricalLocations"
    },
    {
      "name": "Locations",
      "url": "https://labs.waterdata.usgs.gov/sta/v1.1/Locations"
    },
    {
      "name": "Observations",
      "url": "https://labs.waterdata.usgs.gov/sta/v1.1/Observations"
    },
    {
      "name": "ObservedProperties",
      "url": "https://labs.waterdata.usgs.gov/sta/v1.1/ObservedProperties"
    },
    {
      "name": "Sensors",
      "url": "https://labs.waterdata.usgs.gov/sta/v1.1/Sensors"
    },
    {
      "name": "Things",
      "url": "https://labs.waterdata.usgs.gov/sta/v1.1/Things"
    }
  ],
  "serverSettings": {
    "conformance": [
      "http://www.opengis.net/spec/iot_sensing/1.1/req/batch-request/batch-request",
      "http://www.opengis.net/spec/iot_sensing/1.1/req/create-update-delete",
      "http://www.opengis.net/spec/iot_sensing/1.1/req/data-array/data-array",
      "http://www.opengis.net/spec/iot_sensing/1.1/req/datamodel",
      "http://www.opengis.net/spec/iot_sensing/1.1/req/multi-datastream",
      "http://www.opengis.net/spec/iot_sensing/1.1/req/request-data",
      "http://www.opengis.net/spec/iot_sensing/1.1/req/resource-path/resource-path-to-entities",
      "https://fraunhoferiosb.github.io/FROST-Server/extensions/DeepSelect.html",
      "https://fraunhoferiosb.github.io/FROST-Server/extensions/GeoJSON-ResultFormat.html",
      "https://fraunhoferiosb.github.io/FROST-Server/extensions/JsonBatchRequest.html",
      "https://fraunhoferiosb.github.io/FROST-Server/extensions/ResponseMetadata.html",
      "https://fraunhoferiosb.github.io/FROST-Server/extensions/SelectDistinct.html",
      "https://github.com/INSIDE-information-systems/SensorThingsAPI/blob/master/CSV-ResultFormat/CSV-ResultFormat.md"
    ]
  }
}
{{< / highlight >}}

* [Things](https://labs.waterdata.usgs.gov/sta/v1.1/Things) are one of the most important components, and can be mapped to USGS Monitoring locations.  The identifer is tied to core USGS metadata for leach location- the agnecy code and identifier.  For example, here is the response for `USGS-09380000`, Colorado River at Lee's Ferry (https://labs.waterdata.usgs.gov/sta/v1.1/Things('USGS-09380000')), returns the following json object:
{{< highlight json "hl_lines=4 " >}}
{
  "description": "Stream",
  "@iot.id": "USGS-09380000",
  "name": "USGS-09380000",
  "properties": {
    "state": "Arizona",
    "active": true,
    "agency": "U.S. Geological Survey",
    "county": "Coconino County",
    "country": "US",
    "district": "Arizona",
    "stateFIPS": "US:04",
    "agencyCode": "USGS",
    "countyFIPS": "US:04:005",
    "countryFIPS": "US",
    "districtCode": "04",
    "altitudeDatum": "North American Vertical Datum of 1988",
    "altitudeMethod": "Interpolated from Digital Elevation Model",
    "hydrologicUnit": "140700061105",
    "altitudeAccuracy": "4.3",
    "monitoringLocationUrl": "https://waterdata.usgs.gov/monitoring-location/09380000",
    "monitoringLocationName": "COLORADO RIVER AT LEES FERRY, AZ",
    "monitoringLocationType": "Stream",
    "monitoringLocationNumber": "09380000",
    "monitoringLocationAltitudeLandSurface": "3083"
  },
  "@iot.selfLink": "https://labs.waterdata.usgs.gov/sta/v1.1/Things('USGS-09380000')",
  "Datastreams@iot.navigationLink": "https://labs.waterdata.usgs.gov/sta/v1.1/Things('USGS-09380000')/Datastreams",
  "MultiDatastreams@iot.navigationLink": "https://labs.waterdata.usgs.gov/sta/v1.1/Things('USGS-09380000')/MultiDatastreams",
  "Locations@iot.navigationLink": "https://labs.waterdata.usgs.gov/sta/v1.1/Things('USGS-09380000')/Locations",
  "HistoricalLocations@iot.navigationLink": "https://labs.waterdata.usgs.gov/sta/v1.1/Things('USGS-09380000')/HistoricalLocations",
  "TaskingCapabilities@iot.navigationLink": "https://labs.waterdata.usgs.gov/sta/v1.1/Things('USGS-09380000')/TaskingCapabilities"
}
{{< / highlight >}}
In addition to location metadata in `properties` tag, the two most important links are Datastreams (https://labs.waterdata.usgs.gov/sta/v1.1/Things('USGS-09380000')/Datastreams) and Locations (https://labs.waterdata.usgs.gov/sta/v1.1/Things('USGS-07144100')/Locations).  
  Locations, returns a JSON response that includes the actual location of the monitoring location.  In our case, the monitoring location has not moved, so there is a `1:1` relationship between `thing` and `location`.
  {{< highlight json "hl_lines=9-11" >}}
{
  "value": [
    {
      "description": "Stream",
      "encodingType": "application/vnd.geo+json",
      "@iot.id": "86198c4c-1b1f-11ec-8d88-eb98218dab50",
      "location": {
        "type": "Point",
        "coordinates": [
          -111.5878722,
          36.8643333
        ]
      },
      "name": "USGS-09380000",
      "@iot.selfLink": "https://labs.waterdata.usgs.gov/sta/v1.1/Locations('86198c4c-1b1f-11ec-8d88-eb98218dab50')",
      "HistoricalLocations@iot.navigationLink": "https://labs.waterdata.usgs.gov/sta/v1.1/Locations('86198c4c-1b1f-11ec-8d88-eb98218dab50')/HistoricalLocations",
      "Things@iot.navigationLink": "https://labs.waterdata.usgs.gov/sta/v1.1/Locations('86198c4c-1b1f-11ec-8d88-eb98218dab50')/Things"
    }
  ]
}
  {{< / highlight >}}
whereas the datastreams response gives us back the exact data that we are interested in- the time series that are available at this location.  OK, so then what data is collected at this location?  




  {{< highlight json "hl_lines=4 63 120" >}}
{
  "value": [
    {
      "description": "Gage height / USGS-09380000-3f656973c0054ef696bb2192c2947e58",
      "@iot.id": "3f656973c0054ef696bb2192c2947e58",
      "name": "3f656973c0054ef696bb2192c2947e58",
      "observationType": "Instantaneous",
      "observedArea": {
        "type": "Point",
        "coordinates": [
          -111.5878722,
          36.8643333
        ]
      },
      "phenomenonTime": "2021-09-21T06:00:00.000Z/2021-10-04T21:00:00.000Z",
      "properties": {
        "Thresholds": [
          {
            "Name": "Operational limit (minimum) Near PZF.",
            "Type": "ThresholdBelow",
            "Periods": [
              {
                "EndTime": "9999-12-31T23:59:59.9999999+00:00",
                "StartTime": "2017-04-04T00:00:00.0000000-07:00",
                "SuppressData": true,
                "ReferenceValue": 5,
                "ReferenceValueToTriggerDisplay": 5
              }
            ],
            "ReferenceCode": "Operational limit - low-Public"
          },
          {
            "Name": "Operational limit (maximum) In gage house.",
            "Type": "ThresholdAbove",
            "Periods": [
              {
                "EndTime": "9999-12-31T23:59:59.9999999+00:00",
                "StartTime": "2017-04-04T00:00:00.0000000-07:00",
                "SuppressData": true,
                "ReferenceValue": 20,
                "ReferenceValueToTriggerDisplay": 18
              }
            ],
            "ReferenceCode": "Operational limit - high-Public"
          }
        ],
        "ParameterCode": "00065",
        "StatisticCode": "00011"
      },
      "resultTime": null,
      "@iot.selfLink": "https://labs.waterdata.usgs.gov/sta/v1.1/Datastreams('3f656973c0054ef696bb2192c2947e58')",
      "unitOfMeasurement": {
        "name": "Feet",
        "symbol": "ft",
        "definition": ""
      },
      "Thing@iot.navigationLink": "https://labs.waterdata.usgs.gov/sta/v1.1/Datastreams('3f656973c0054ef696bb2192c2947e58')/Thing",
      "Sensor@iot.navigationLink": "https://labs.waterdata.usgs.gov/sta/v1.1/Datastreams('3f656973c0054ef696bb2192c2947e58')/Sensor",
      "Observations@iot.navigationLink": "https://labs.waterdata.usgs.gov/sta/v1.1/Datastreams('3f656973c0054ef696bb2192c2947e58')/Observations",
      "ObservedProperty@iot.navigationLink": "https://labs.waterdata.usgs.gov/sta/v1.1/Datastreams('3f656973c0054ef696bb2192c2947e58')/ObservedProperty"
    },
    {
      "description": "Specific cond at 25C / USGS-09380000-9d24cf50257a4f60b76b92e38f286cde",
      "@iot.id": "9d24cf50257a4f60b76b92e38f286cde",
      "name": "9d24cf50257a4f60b76b92e38f286cde",
      "observationType": "Instantaneous",
      "observedArea": {
        "type": "Point",
        "coordinates": [
          -111.5878722,
          36.8643333
        ]
      },
      "phenomenonTime": "2021-09-21T06:00:00.000Z/2021-10-04T21:00:00.000Z",
      "properties": {
        "Thresholds": [
          {
            "Name": "HIGH SC THRESHOLD",
            "Type": "ThresholdAbove",
            "Periods": [
              {
                "EndTime": "9999-12-31T23:59:59.9999999+00:00",
                "StartTime": "2018-01-10T01:00:00.0000000-07:00",
                "SuppressData": true,
                "ReferenceValue": 1200
              }
            ],
            "ReferenceCode": "Operational limit - high-Public"
          },
          {
            "Name": "LOW SC THRESHOLD",
            "Type": "ThresholdBelow",
            "Periods": [
              {
                "EndTime": "9999-12-31T23:59:59.9999999+00:00",
                "StartTime": "2018-01-10T01:00:00.0000000-07:00",
                "SuppressData": true,
                "ReferenceValue": 400
              }
            ],
            "ReferenceCode": "Operational limit - low-Public"
          }
        ],
        "ParameterCode": "00095",
        "StatisticCode": "00011"
      },
      "resultTime": null,
      "@iot.selfLink": "https://labs.waterdata.usgs.gov/sta/v1.1/Datastreams('9d24cf50257a4f60b76b92e38f286cde')",
      "unitOfMeasurement": {
        "name": "uS/cm",
        "symbol": "uS/cm",
        "definition": ""
      },
      "Thing@iot.navigationLink": "https://labs.waterdata.usgs.gov/sta/v1.1/Datastreams('9d24cf50257a4f60b76b92e38f286cde')/Thing",
      "Sensor@iot.navigationLink": "https://labs.waterdata.usgs.gov/sta/v1.1/Datastreams('9d24cf50257a4f60b76b92e38f286cde')/Sensor",
      "Observations@iot.navigationLink": "https://labs.waterdata.usgs.gov/sta/v1.1/Datastreams('9d24cf50257a4f60b76b92e38f286cde')/Observations",
      "ObservedProperty@iot.navigationLink": "https://labs.waterdata.usgs.gov/sta/v1.1/Datastreams('9d24cf50257a4f60b76b92e38f286cde')/ObservedProperty"
    },
    {
      "description": "Discharge / USGS-09380000-a62122d8ff094125b63bb2f73410b2b4",
      "@iot.id": "a62122d8ff094125b63bb2f73410b2b4",
      "name": "a62122d8ff094125b63bb2f73410b2b4",
      "observationType": "Instantaneous",
      "observedArea": {
        "type": "Point",
        "coordinates": [
          -111.5878722,
          36.8643333
        ]
      },
      "phenomenonTime": "2021-09-21T06:00:00.000Z/2021-10-04T21:00:00.000Z",
      "properties": {
        "ParameterCode": "00060",
        "StatisticCode": "00011"
      },
      "resultTime": null,
      "@iot.selfLink": "https://labs.waterdata.usgs.gov/sta/v1.1/Datastreams('a62122d8ff094125b63bb2f73410b2b4')",
      "unitOfMeasurement": {
        "name": "Cubic Feet per Second",
        "symbol": "ft^3/s",
        "definition": ""
      },
      "Thing@iot.navigationLink": "https://labs.waterdata.usgs.gov/sta/v1.1/Datastreams('a62122d8ff094125b63bb2f73410b2b4')/Thing",
      "Sensor@iot.navigationLink": "https://labs.waterdata.usgs.gov/sta/v1.1/Datastreams('a62122d8ff094125b63bb2f73410b2b4')/Sensor",
      "Observations@iot.navigationLink": "https://labs.waterdata.usgs.gov/sta/v1.1/Datastreams('a62122d8ff094125b63bb2f73410b2b4')/Observations",
      "ObservedProperty@iot.navigationLink": "https://labs.waterdata.usgs.gov/sta/v1.1/Datastreams('a62122d8ff094125b63bb2f73410b2b4')/ObservedProperty"
    },
    {
      "description": "Temperature, water / USGS-09380000-b3c374548a8d4553868046dd9fda2582",
      "@iot.id": "b3c374548a8d4553868046dd9fda2582",
      "name": "b3c374548a8d4553868046dd9fda2582",
      "observationType": "Instantaneous",
      "observedArea": {
        "type": "Point",
        "coordinates": [
          -111.5878722,
          36.8643333
        ]
      },
      "phenomenonTime": "2021-09-21T06:00:00.000Z/2021-10-04T21:00:00.000Z",
      "properties": {
        "ParameterCode": "00010",
        "StatisticCode": "00011"
      },
      "resultTime": null,
      "@iot.selfLink": "https://labs.waterdata.usgs.gov/sta/v1.1/Datastreams('b3c374548a8d4553868046dd9fda2582')",
      "unitOfMeasurement": {
        "name": "Degrees Centigrade",
        "symbol": "degC",
        "definition": ""
      },
      "Thing@iot.navigationLink": "https://labs.waterdata.usgs.gov/sta/v1.1/Datastreams('b3c374548a8d4553868046dd9fda2582')/Thing",
      "Sensor@iot.navigationLink": "https://labs.waterdata.usgs.gov/sta/v1.1/Datastreams('b3c374548a8d4553868046dd9fda2582')/Sensor",
      "Observations@iot.navigationLink": "https://labs.waterdata.usgs.gov/sta/v1.1/Datastreams('b3c374548a8d4553868046dd9fda2582')/Observations",
      "ObservedProperty@iot.navigationLink": "https://labs.waterdata.usgs.gov/sta/v1.1/Datastreams('b3c374548a8d4553868046dd9fda2582')/ObservedProperty"
    }
  ]
}
  {{< / highlight >}}
    {{< highlight json "hl_lines=28 30" >}}
  {{< / highlight >}}
