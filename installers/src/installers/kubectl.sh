#!/bin/bash
###############################################################################
#
# Installs the latest Kubectl.
#
# Installation steps from 
# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
###############################################################################

set -e

USERNAME=${1:-$(id -un)}

source lib/common.sh

echo "Installing Kubectl..."

apt_install_prerequisites

apt_add_source kubernetes \
    "https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key" \
    "https://pkgs.k8s.io/core:/stable:/v1.28/deb/" \
    "/"

apt_install kubectl

# TODO: Add shell completion.