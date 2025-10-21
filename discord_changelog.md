## What's Changed in capsule-marketplace-registry v0.1.4-canary

Base version (stripped): 0.1.4
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

### Installation

Download the appropriate package for your platform from the [release assets](https://github.com/Parallels/capsule-marketplace-registry/releases/tag/v0.1.4-canary).

### Links
- **Public Repository**: [github.com/Parallels/capsule-marketplace-registry](https://github.com/Parallels/capsule-marketplace-registry)
- **Monorepo Release**: [capsule-marketplace-registry-v0.1.4-canary](https://github.com/Parallels-Corp/capsule-manager/releases/tag/capsule-marketplace-registry-v0.1.4-canary)
