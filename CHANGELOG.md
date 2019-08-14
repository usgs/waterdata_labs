# Changelog
All notable changes to this project will be documented in this file.

## Unreleased
### Added
- Added a content page for the NWISWeb Tableau Data Connector
- Updated content of all pages



## 25-Jul-2019
### Added
- Created the initial Hugo site and setup Docker containerization  and Jenkins tiered build and deploy to AWS.
- Added an about page
- Updated to the latest wdfn-viz package which uses USWDS 2.0.x
- Added a separate docker-compose service to separate building the base from running the hugo command.

## Changed
- Removed unused layouts and simplified wdfn_theme style sheets by eliminating unused styles

### Fixed
- Fixed the server hugo command to explicitly build the npm assets prior to starting the hugo server.
- Set environment variable HUGO_BASE_URL so that static urls are no longer relative.
