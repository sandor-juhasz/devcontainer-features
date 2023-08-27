#!/bin/bash
###############################################################################
#
# Installs Terraform CLI
#
###############################################################################

source lib/common.sh

apt_install_prerequisites
apt_add_source -n hashicorp \
    -d -k "https://apt.releases.hashicorp.com/gpg" \
    -r "https://apt.releases.hashicorp.com" \
    -- "$(lsb_release -cs) main"

apt_install terraform
