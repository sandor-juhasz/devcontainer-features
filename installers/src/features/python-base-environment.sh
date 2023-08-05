# shellcheck shell=bash
#
# Installs a base python environment in a user's home directory.
#
# The specified C Python versions are installed using pyenv in the user's home
# directory. This Python runtime is configures as the default for the user.
# The pipx application is set up using the default Python runtime.
#
# Environment:
#    USERNAME                The user name of the user for which the feature is installed.
#    DEFAULT_PYTHON_VERSION  The default python version to be installed for the user.
#

function install() {
    installers/pyenv.sh "${USERNAME}"
    installers/python.sh "${USERNAME}" "${DEFAULT_PYTHON_VERSION}" "${INSTALL_CPYTHON_DEPENDENCIES}"
    installers/pipx.sh "${USERNAME}"
}

install