#!/bin/bash
set -e

export INSTALL_DBT_CORE="${INSTALLDBTCORE:-"true"}"
export DBT_CORE_PLUGINS="${DBTCOREPLUGINS:-""}"


export INSTALL_DBT_CLOUD_CLI="${INSTALL_DBT_CLOUD_CLI:-"false"}"
export DBT_CLOUD_CLI_VERSION="${DBT_CLOUD_CLI_VERSION:-"0.38.10"}"
export DBT_CLOUD_CLI_ALIAS="${DBT_CLOUD_CLI_ALIAS:-"dbt"}"

cd installers
./install dbt-development-tools
