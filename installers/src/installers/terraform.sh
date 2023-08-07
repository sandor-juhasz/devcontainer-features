#!/bin/bash
###############################################################################
#
# Installs Terraform CLI
#
###############################################################################

source lib/common.sh

# Installing prerequisites
apt_install ca-certificates curl gnupg lsb-release

# Installing Terraforms's official GPG key
mkdir -p /etc/apt/keyrings
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/hashicorp-archive-keyring.gpg

# Setting up the repository
echo "deb [signed-by=/etc/apt/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

apt_clear_package_index
apt_install terraform
