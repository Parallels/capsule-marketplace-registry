# Changelog - Capsule Marketplace Registry

All notable changes to the Capsule Marketplace Registry module will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.26] - 2026-02-11

- Fixed an issue with the volumes not being able to be set
- Added global network and volumes to the configuration tab
- fixes an issue with the combo box
- updates some UI related to the services
- Added some extra capsules
- Fixed an issue where the technical feedback was going to the wrong channel

## [0.1.25] - 2026-02-11

- Added better logs to the capsules-hub
- Added the root password for the marketplace
- Improved the push of the feedback

## [0.1.24] - 2026-02-11

- fixed an issue with the missing variable in the prepare vm script
- Fixed an issue with the modal focus in the application
- Fixed an issue with the database
- Added the webhook to the registry

## [0.1.23] - 2026-02-11



## [0.1.22] - 2026-02-10



## [0.1.21] - 2026-02-09

- Added a new dialog for confirming why we are asking for passwords
- Fixed an issue where we requested too many times for the root password
- Updated the updater to use channels
- Updated the capsule agent and updater install scripts
- Moved the capsule updater to also use the registry update endpoint  

## [0.1.20] - 2026-02-06



## [0.1.19] - 2026-02-05

- Renamed some of the telemety
- Added new telemetry to the public license endpoint
- Added new feedback for the request application
- Improved the search telemetry endpoint
- Fixed the capsules-marketplace version endpoint
- Fixed an issue where we could not save the lxc capsules
- Fixed an issue where we were not able to disable https and the negeration of the app

## [0.1.18] - 2026-01-30



## [0.1.17] - 2026-01-29

## [0.1.16] - 2026-01-29

## [0.1.15] - 2026-01-29

- added a recovery method to allow users to recover the licenses from the capsules-hub - fixes #146
- Added the button to the public marketplace, fixes #140

## [0.1.14] - 2026-01-28

- Added a channel selection to the settings to decide the update channel
- Added a dynamic updater mechanism, fixes #142
- Removed the checkbox in the end of the technical feedback, fixes #138
- Fixed an issue with the notification polling using the wrong url
- Fixed an error on the app-feedback using the wrong type
- fixed an error where the technical report woul not use the right endpoint

## [0.1.12] - 2026-01-20

- Reworked DNS resolver
- Further improvements in the Marketplace
- Fixed a bug where you were not able to install a application that you had searched in the apps
- Further stabilisation of the system
- Added extra fields for the capsules blueprint
- Improved some UI changes for the marketplace
- Added the new dns-resolver to the list of modules in attempt to fix dns issues
- Other fixes

## [0.1.11] - 2026-01-15

- Improved the way we deal with user feedback
- Added extra fields to the Capsules #118
- Added the new marketplace application #116
- Added a recovery for DNS issues with dnsmasq
- Added a new wait for the app to be ready
- Added better usage of urls when opening the page
- Added the new links to the marketplace

## [0.1.10] - 2025-12-19

- Added initial scafolding and POC for the Capsule Marketplace, fix #112
- Added some extra endpoints and logic for the new Capsule Marketplace in the API
- Fixed some templates

## [0.1.9] - 2025-12-11

- Fixed an issue where Onboarding would failed for users that had used old capsules app
- Fixed an issue where the marketplace would crash if two users had an empty email
- Fixed issues with the users database constrains
- Updated install scripts to not overwrite the existing .env file

## [0.1.8] - 2025-12-10

## [0.1.7] - 2025-12-03

- Removed some duplicated go routines
- Improved stability on the monitoring
- Fix some issues with telemetry
- Fixed some memory leaks

## [0.1.6] - 2025-11-25

- Fixed the issue where the update for the application hub would receive the wrong repo

## [0.1.5] - 2025-10-28

- Added discord service for reporting
- Added the feedback endpoint for the marketplace url

## [0.1.4] - 2025-10-21

- Added a switch between the normal database search and AI search for the marketplace registry #60
- Modified release-capsule-marketplace-registry.yml to change environment descriptions and suffixes for canary and beta.
- Updated release-common-cleanup.yml to reflect new environment handling.
- Adjusted release-coordinator.yml to include canary and beta as options.
- Enhanced set-build-env.sh to propagate IS_CANARY and IS_BETA environment variables.
- Updated build.rs to embed IS_CANARY and IS_BETA into the build.
- Modified backend_manager.rs to handle service port dynamically and adjust health check URLs.
- Enhanced main.rs to set application configurations for canary and beta environments.
- Updated AppConfig interface to include isCanary and isBeta flags.
- Adjusted ConfigService to manage environment checks for canary and beta.
- Updated Makefiles for capsule-agent and capsule-agent-updater to include IS_BETA and IS_CANARY build flags.
- Enhanced telemetry to include environment and channel information.
- Added reset-application-hub.sh script for clearing user data and caches.
- Addressed a bug that could have stopped the way we started the app at first run
- Added a script to reset the application to the default to allow debugging

## [0.1.3] - 2025-10-16

- Added Dockerfile for building the service
- Created Makefile for build, test, and deployment commands
- Implemented README.md with setup instructions and usage examples
- Introduced .dockerignore to exclude unnecessary files from Docker context
- Established CHANGELOG.md for tracking changes
- Set up docker-compose.yml for service orchestration
- Developed main application logic in main.go
- Implemented telemetry events for monitoring
- Created installation script for easy deployment on Linux
- Added version management with VERSION file
- Configured health checks and logging
- Integrated PostgreSQL as the database backend
- Update codeowners
- Enhance markdownlint configuration
- Improve telemetry event naming
- Fixed missing telemetry from capsule-agent-updater
- Enhance issue templates and workflows to extract changelog content for releases #38
- Small Update for the makefiel
- change the description of the readme to test pipelines

## [0.0.0] - 2024-08-26

- Initial release of Capsule Marketplace Registry
