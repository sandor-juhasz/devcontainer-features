# Contributor's Guidelines

This document describes the standards to develop devcontainer features.

- Options
  - The option name is camelcase. 
  - For installation options, use the `installToolName` convention.

- Install scripts
  - All install scripts are bash scripts.
  - The scripts set the `-e` flag with `set -e` right at the beginning of the script.
  - Installers run with superuser privileges.
  

