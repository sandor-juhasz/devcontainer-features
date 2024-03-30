#!/bin/bash
set -e

export INSTALL_PSQL="${INSTALLPLSQL:-true}"

cd installers
./install postgresql-development-tools
