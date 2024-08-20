#!/bin/bash
set -e

export INSTALL_DBT_CORE="${INSTALLDBTCORE:-"true"}"
export DBT_CORE_PLUGINS="${DBTCOREPLUGINS:-""}"
export DBT_CORE_INSTALL_METHOD="${DBTCOREINSTALLMETHOD:-"pyenv-virtualenv"}"

export INSTALL_DBT_CLOUD_CLI="${INSTALLDBTCLOUDCLI:-"false"}"
export DBT_CLOUD_CLI_VERSION="${DBTCLOUDCLIVERSION:-"0.38.10"}"
export DBT_CLOUD_CLI_ALIAS="${DBTCLOUDCLIALIAS:-"dbt"}"

cd installers
./install dbt-development-tools
