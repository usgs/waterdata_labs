Water Data Labs
---------------

*Landing page for Water Data for the Nation related projects*

# Welcome to the experimental space of waterdata.usgs.gov!

labs.waterdata.usgs.gov is where the development team that is putting together the new face of waterdata.usgs.gov will 
be hosting new services and sometimes user interfaces that, while production grade, may not be the final form that we
 want to support for a long time.  These services may change or go away at any time.  

# Create with Hugo
The 'landing page' for labs.waterdata.usgs.gov is created with the use of the static website generation tool
[**Hugo**](https://gohugo.io/).
Modification to site contents is accomplished by following standard Hugo procedures. 

# Build and develop with Docker

A Dockerfile and Docker Compose configuration is provided that is capable of running a Hugo development server and
building the static site which may deployed to Amazon Web Services through a task on a Jenkins job runner.

## Local development

Using `docker-compose`, you may run a Hugo development server on http://localhost:1313:

```bash
docker-compose build hugo_base
docker-compose up hugo
```

The default Hugo server instance will include draft articles.

## Build static site

If you only want to build the hugo static files execute the following commands

```bash
docker-compose up hugo_base buildDeploy.sh build --buildDrafts 
```

## Debugging the container

If the need arises, you may run arbitrary commands in the container, such as a bash shell:

```bash
docker-compose run hugo bash -l
```

# Build and develop on your local machine

In order to do this you need to install hugo on your machine (see https://gohugo.io/getting-started/installing/)

You will also need to have the version of node the project is using which is currently 12.x.x. To build the static files
required by the application execute the following commands:
```bash
% cd themes/wdfn_theme
% rm -rf node_modules
% npm install
% npm build
```

You will then need to return to the project root directory and then execute:
```bash
% hugo server -D
```
Disclaimer
----------
This software is preliminary or provisional and is subject to revision. It is being provided to meet the need for
timely best science. The software has not received final approval by the U.S. Geological Survey (USGS). No warranty,
expressed or implied, is made by the USGS or the U.S. Government as to the functionality of the software and
related material nor shall the fact of release constitute any such warranty. The software is provided on the
condition that neither the USGS nor the U.S. Government shall be held liable for any damages resulting from
the authorized or unauthorized use of the software.
