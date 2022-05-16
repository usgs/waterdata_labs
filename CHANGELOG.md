# Changelog
All notable changes to this project will be documented in this file.

# 10-May-2022
### Changed
- Added GDP, Geoserver, Cloud Optimized Data Access, and Pygeoapi projects to home page
- Have the index.html Link look to the slug to allow external links

# 21-April-2022
### Changed
- Updated development roadmap
- Removed National Integrated Water Availability Assessments-Concept Map

# 17-April-2022
### Added
- Header links for WMA home page and the Water Dashboard.
- Footer links for social media.

### Changed
- NLDI landing page updated

# 29-June-2020
### Added
- Development roadmap

### Changed
- Created USWDS Cards for the Homepage

# 12-May-2020
### Changed
- Updated to use build guidance from USWDS version 2.6.0 and use wdfn-viz 1.5.0
- Updated graph-image-api description to include new openAPI documentation

## 20-Dec-2019
### Changed
- updated graph-images content
- added link to water availability viz

## 12-Dec-2019
### Changed
- Updated the hugo version used and node version to the latest LTS.


## 11-Sep-2019
### Added
- Added a content page for the NWISWeb Tableau Data Connector
- Updated content of all pages
- cleaned up figures


## 25-Jul-2019
### Added
- Created the initial Hugo site and setup Docker containerization  and Jenkins tiered build and deploy to AWS.
- Added an about page
- Updated to the latest wdfn-viz package which uses USWDS 2.0.x
- Added a separate docker-compose service to separate building the base from running the hugo command.

### Changed
- Removed unused layouts and simplified wdfn_theme style sheets by eliminating unused styles

### Fixed
- Fixed the server hugo command to explicitly build the npm assets prior to starting the hugo server.
- Set environment variable HUGO_BASE_URL so that static urls are no longer relative.
