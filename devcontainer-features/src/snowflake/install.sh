#!/bin/bash
set -e

export INSTALL_SNOWSQL="${INSTALLSNOWSQL:-"true"}"
export SNOWSQL_VERSION="${SNOWSQLVERSION:-"1.3.1"}"
export INSTALL_SNOWFLAKE_CLI="${INSTALLSNOWFLAKECLI:-"false"}"

cd installers
./install snowflake-development-tools
