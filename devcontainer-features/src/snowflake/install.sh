#!/bin/bash
set -e

export INSTALL_SNOWSQL="${INSTALLSNOWSQL:-"true"}"
export SNOWSQL_VERSION="${SNOWSQLVERSION:-"1.3.1"}"
export INSTALL_SNOWFLAKE_CLI="${INSTALLSNOWFLAKECLI:-"false"}"
export SNOWFLAKE_CLI_VERSION="${SNOWFLAKECLIVERSION:-"3.14.0"}"
cd installers
./install snowflake-development-tools
