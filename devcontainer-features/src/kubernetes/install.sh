#!/bin/bash
set -e

# export INSTALL_K3S="${INSTALLK3S:-"false"}"
# export INSTALL_MINIKUBE="${INSTALLMINIKUBE:-"false"}"
# export INSTALL_K3D="${INSTALLK3D:-"false"}"
export INSTALL_KUBECTL="${INSTALLKUBECTL:-"true"}"
export INSTALL_KUBECTX="${INSTALLKUBECTX:-"true"}"
export INSTALL_HELM="${INSTALLHELM:-"true"}"

cd installers
./install kubernetes-development-tools
