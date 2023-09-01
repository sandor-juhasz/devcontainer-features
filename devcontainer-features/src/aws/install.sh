#!/bin/bash
set -e

export INSTALL_AWS_CDK="${INSTALLAWSCDK:-"false"}"
export INSTALL_AWS_SAM_CLI="${INSTALLAWSSAMCLI:-"false"}"

cd installers
./install aws-development-tools
