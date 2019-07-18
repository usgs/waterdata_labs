# Changelog
All notable changes to this project will be documented in this file.

## [Unreleased]
### Added
- Created the initial Hugo site and setup Docker containerization  and Jenkins tiered build and deploy to AWS.

### Fixed
- Fixed the server hugo command to explicitly build the npm assets prior to starting the hugo server.
- Set environment variable HUGO_BASE_URL so that static urls are no longer relative.
