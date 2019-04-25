waterdata
------------

*Landing page for Water Data for the Nation related projects*

# Welcome to the experimental space of waterdata.usgs.gov!

    ---
labs.waterdata.usgs.gov is where the development team that is putting together the new face of waterdata.usgs.gov will be hosting new services and sometimes user interfaces that, while production grade, may not be the final form that we want to support for a long time.  These services may change or go away at any time.  

# Build and develop with Docker

A Dockerfile and Docker Compose configuration is provided that is capable of running a development server and building the deployable static site.

## Local development

Using `docker-compose`, you may run a development server on http://localhost:1313:

```bash
docker-compose up
```

The default server instance will include draft articles.


To test without docker, you must have Hugo and node.js installed. Then, from the terminal you can run:

Only need to do once to get node.js running:
In the "wdfn_theme" directory:
```bash
cd themes/wdfn_theme/
npm install
npm run build
```

In the home directory:
```bash
export HUGO_BASEURL="blog/"
hugo server --theme=wdfn_theme --buildDrafts
```

## Build static site

Using `docker-compose`, the site may be built using the `build` command provided by the container:

```bash
docker-compose run hugo build
```

The base URL is specified with the `HUGO_BASEURL` environment variable:

```bash
docker-compose run -e HUGO_BASEURL=http://dev-owi.usgs.gov/blog/ hugo build
```

Additional arguments may be passed to the [**Hugo**](https://gohugo.io/) binary as the last argument:

```bash
docker-compose run hugo build --buildDrafts
```

## Debugging the container

If the need arises, you may run arbitrary commands in the container, such as a bash shell:

```bash
docker-compose run hugo bash -l
```





Disclaimer
----------
This software is preliminary or provisional and is subject to revision. It is being provided to meet the need for timely best science. The software has not received final approval by the U.S. Geological Survey (USGS). No warranty, expressed or implied, is made by the USGS or the U.S. Government as to the functionality of the software and related material nor shall the fact of release constitute any such warranty. The software is provided on the condition that neither the USGS nor the U.S. Government shall be held liable for any damages resulting from the authorized or unauthorized use of the software.
