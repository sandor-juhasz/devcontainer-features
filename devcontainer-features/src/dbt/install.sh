#!/bin/bash
set -e

export INSTALL_DBT_CORE="${INSTALLDBTCORE:-"true"}"
export DBT_CORE_PLUGINS="${DBTCOREPLUGINS:-""}"

cd installers
./install dbt-development-tools
