#!/bin/bash
set -e

export INSTALL_INSTANTCLIENT="${INSTALLINSTANTCLIENT:-true}"
export INSTANTCLIENT_TYPE="${INSTANTCLIENTTYPE:-basic-light}"   # "basic" or "basic-light"
export INSTALL_SQLPLUS="${INSTALLSQLPLUS:-true}"
export INSTALL_TOOLS="${INSTALLINSTANTCLIENTTOOLS:-true}"
export INSTALL_SDK="${INSTALLINSTANTCLIENTSDK:-false}"
export INSTALL_JDBC="${INSTALLINSTANTCLIENTJDBC:-false}"
export INSTALL_ODBC="${INSTALLINSTANTCLIENTODBC:-false}"
export INSTALL_SQLCL="${INSTALLSQLCL:-false}"

cd installers
./install oracle-development-tools
