#!/bin/bash
###############################################################################
#
# Installs the `pyenv` application.
#
# Environment:
#    USERNAME   The user for which pyenv is configured.
###############################################################################

source lib/common.sh

export DEBIAN_FRONTEND=noninteractive

if [[ "${INSTALL_CPYTHON_DEPENDENCIES}" == "true" ]]; then
    apt_install build-essential libssl-dev zlib1g-dev \
                libbz2-dev libreadline-dev libsqlite3-dev curl \
                libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev \
                git curl ca-certificates --no-install-recommends
fi

echo "Installing pyenv for $USERNAME..."

as_user "rm -rf ~/.pyenv"
as_user "cd /home/developer; echo $HOME; curl https://pyenv.run | bash"

cat <<'EOF' >"/home/$USERNAME/.bash_profile"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Restart your shell for the changes to take effect.

# Load pyenv-virtualenv automatically by adding
# the following to ~/.bashrc:

eval "$(pyenv virtualenv-init -)"
EOF
