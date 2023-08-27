#!/bin/bash
###############################################################################
#
# Installs Helm from the Debian repo.
#
###############################################################################

set -e

USERNAME=${1:-$(id -un)}

source lib/common.sh

echo "Installing the latest Helm..."

apt_install_prerequisites
apt_add_source helm \
    "https://baltocdn.com/helm/signing.asc" \
    "https://baltocdn.com/helm/stable/debian/" \
    "all main"

apt_install helm
