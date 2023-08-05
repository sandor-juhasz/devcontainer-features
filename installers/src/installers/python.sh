#!/bin/bash
###############################################################################
#
# Installs a given Python environment under the specified user using pyenv.
#
# Environment:
#    USERNAME   The user for which pyenv is configured.
#    PYTHON_VERSION
###############################################################################

source lib/common.sh

USERNAME=${1:$(id -un)}         # install python for current user by default.
PYTHON_VERSION=${2:-3.11.4}

if [[ "${PYTHON_VERSION}" == "system" ]]; then
    echo "Configuring System python as default..."
    apt_install python3-pip
    as_user "pyenv global system"
    as_user "mkdir -p ~/.local/bin"
else
    echo "Installing Python $PYTHON_VERSION for $USERNAME..."

    as_user "pyenv install $PYTHON_VERSION && pyenv global $PYTHON_VERSION && pip install --upgrade pip"
    as_user "mkdir -p ~/.local/bin"
fi